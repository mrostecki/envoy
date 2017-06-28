#pragma once

#include <chrono>
#include <cstdint>
#include <functional>
#include <string>

#include "envoy/thread_local/thread_local.h"

#include "common/common/empty_string.h"
#include "common/common/logger.h"
#include "common/upstream/upstream_impl.h"

namespace Envoy {
namespace Upstream {

/**
 * The OriginalDstCluster is a type of cluster that creates a single
 * logical host that allows upstream connections to be opened to
 * arbitrary IP destinations, as directed by metadata made available
 * earlier in the filter pipeline.  Connection requests to the logical
 * host itself will be denied.
 *
 * A new 'real host' is created for each destination, but currently
 * stats and other state refers to the logical host.
 */
class OriginalDstCluster : public ClusterImplBase {
public:
  OriginalDstCluster(const Json::Object& config, Runtime::Loader& runtime, Stats::Store& stats,
                     Ssl::ContextManager& ssl_context_manager);

  ~OriginalDstCluster() {}

  // Upstream::Cluster
  void initialize() override {}
  InitializePhase initializePhase() const override { return InitializePhase::Primary; }
  void setInitializedCb(std::function<void()> callback) override { callback(); }

private:
  struct LogicalHost : public HostImpl,
                       protected Logger::Loggable<Logger::Id::upstream> {
    LogicalHost(ClusterInfoConstSharedPtr cluster, const std::string& hostname,
		Network::Address::InstanceConstSharedPtr address, OriginalDstCluster& parent)
      : HostImpl(cluster, hostname, address, false, 1, ""), parent_(parent) {
    }

    // Upstream::Host
    CreateConnectionData createConnection(Event::Dispatcher& dispatcher) const override {
      // Connection to 0.0.0.0 will fail, but callers do not check for { nullptr, nullptr }.
      return HostImpl::createConnection(dispatcher);
    }
    HostSharedPtr getRealHost(const LoadBalancerContext* context) const override;

    OriginalDstCluster& parent_;
  };

  struct RealHost : public Host,
                    public std::enable_shared_from_this<RealHost> {
    RealHost(Network::Address::InstanceConstSharedPtr address,
	     HostConstSharedPtr logical_host)
        : address_(address), logical_host_(logical_host) {}

    // Upstream::HostDescription
    bool canary() const override { return false; }
    const ClusterInfo& cluster() const override { return logical_host_->cluster(); }
    Outlier::DetectorHostSink& outlierDetector() const override {
      return logical_host_->outlierDetector();
    }
    const HostStats& stats() const override { return logical_host_->stats(); }
    const std::string& hostname() const override { return logical_host_->hostname(); }
    Network::Address::InstanceConstSharedPtr address() const override { return address_; }
    const std::string& zone() const override { return EMPTY_STRING; }

    // Upstream::Host
    std::list<Stats::CounterSharedPtr> counters() const override { return logical_host_->counters(); }
    CreateConnectionData createConnection(Event::Dispatcher& dispatcher) const override;

    std::list<Stats::GaugeSharedPtr> gauges() const override { return logical_host_->gauges(); }
    void healthFlagClear(HealthFlag) override {}
    bool healthFlagGet(HealthFlag flag) const override { return logical_host_->healthFlagGet(flag); }
    void healthFlagSet(HealthFlag) override {}
    bool healthy() const override { return logical_host_->healthy(); }
    void setOutlierDetector(Outlier::DetectorHostSinkPtr&& /* outlier_detector */) override {}
    uint32_t weight() const override { return logical_host_->weight(); }
    void weight(uint32_t /* new_weight */) override {}
    HostSharedPtr getRealHost(const LoadBalancerContext*) const override { return nullptr; };
    
    Network::Address::InstanceConstSharedPtr address_;
    HostConstSharedPtr logical_host_;
  };

  HostSharedPtr logical_host_;
};

} // Upstream
} // Envoy
