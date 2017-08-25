#include <string>

#include "envoy/registry/registry.h"
#include "envoy/server/filter_config.h"

#include "common/filter/original_dst.h"

namespace Envoy {
namespace Server {
namespace Configuration {

/**
 * Config registration for the original dst filter. @see NamedNetworkFilterConfigFactory.
 */
class OriginalDstConfigFactory : public NamedListenerFilterConfigFactory {
public:
  // NamedListenerFilterConfigFactory
  ListenerFilterFactoryCb createFilterFactory(const Json::Object&, FactoryContext&) override {
    return [](Network::ListenerFilterManager& filter_manager) -> void {
      filter_manager.addAcceptFilter(Network::ListenerFilterSharedPtr{new Filter::OriginalDst()});
    };
  }

  std::string name() override { return "original_dst"; }
  ListenerFilterType type() override { return ListenerFilterType::Accept; }
};

/**
 * Static registration for the original dst filter. @see RegisterFactory.
 */
static Registry::RegisterFactory<OriginalDstConfigFactory, NamedListenerFilterConfigFactory>
    registered_;

} // namespace Configuration
} // namespace Server
} // namespace Envoy
