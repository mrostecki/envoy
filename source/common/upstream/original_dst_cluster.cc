#include "common/upstream/original_dst_cluster.h"

#include <chrono>
#include <list>
#include <string>
#include <vector>

#include "common/network/address_impl.h"
#include "common/network/utility.h"

namespace Envoy {
namespace Upstream {

OriginalDstCluster::OriginalDstCluster(const Json::Object& config, Runtime::Loader& runtime,
                                       Stats::Store& stats, Ssl::ContextManager& ssl_context_manager)
    : ClusterImplBase(config, runtime, stats, ssl_context_manager) {

  // The logical hosts are only used in /clusters admin output.
  logical_host_.reset(
      new LogicalHost(info_, info_->name(), Network::Utility::getIpv4AnyAddress(), *this));

  HostVectorSharedPtr new_hosts(new std::vector<HostSharedPtr>());
  new_hosts->emplace_back(logical_host_);
  updateHosts(new_hosts, createHealthyHostList(*new_hosts), empty_host_lists_,
	      empty_host_lists_, *new_hosts, {});
}

HostSharedPtr
OriginalDstCluster::LogicalHost::getRealHost(const LoadBalancerContext* context) const {
  if (context) {
    auto connection = context->downstreamConnection();
    // Verify that we are not looping back to ourselves!
    if (connection && connection->usingOriginalDst()) {
      auto localIP = connection->localAddress().ip();

      if (localIP) {
	if (localIP->version() == Network::Address::IpVersion::v4) {
	  return HostSharedPtr{
	    new RealHost(Network::Address::InstanceConstSharedPtr{new Network::Address::Ipv4Instance(localIP->addressAsString(), localIP->port())},
			 shared_from_this())};
	} else if (localIP->version() == Network::Address::IpVersion::v6) {
	  return HostSharedPtr{
	    new RealHost(Network::Address::InstanceConstSharedPtr{new Network::Address::Ipv6Instance(localIP->addressAsString(), localIP->port())},
			 shared_from_this())};
	}
      }
    }
  }

  // May happen due to misconfiguration, log something meaningful as upstream connections will not succeed.
  LOG(warn, "original_dns cluster: No downstream connection or no original_dst. Is listener set up with \"use_original_dst\"?");
  return nullptr;
}

Host::CreateConnectionData
OriginalDstCluster::RealHost::createConnection(Event::Dispatcher& dispatcher) const {
  // This block adapted from HostImpl::createConnection()
  Host::CreateConnectionData connectionData{
    cluster().sslContext() ? dispatcher.createSslClientConnection(*cluster().sslContext(), address_)
                           : dispatcher.createClientConnection(address_), shared_from_this()};
  connectionData.connection_->setReadBufferLimit(cluster().perConnectionBufferLimitBytes());

  return connectionData;
}

} // Upstream
} // Envoy
