local k = import "ksonnet-util/kausal.libsonnet";


(import "./config.libsonnet")+
{

  local conf = $.config,

  local deployment = k.apps.v1.deployment,
  local container = k.core.v1.container,
  local port = k.core.v1.containerPort,
  local service = k.core.v1.service,

  service_e: {
      deployment: deployment.new(
        name=conf.name,
        replicas=conf.replicas,
        containers=[
          container.new("main", conf.container_image)
          + container.withPorts([port.new("http", 80)]),
        ]
      ),
      service: k.util.serviceFor(self.deployment),
    }
}

