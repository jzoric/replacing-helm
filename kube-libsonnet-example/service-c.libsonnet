local kube = import "kube-libsonnet/kube.libsonnet";

local sc = {

  name:: 'service-c',
  namespace:: 'nginx',

  ns : kube.Namespace($.namespace) {},

  deployment: kube.Deployment($.name) {  
    metadata+: {namespace: $.namespace},
    spec+: {
      local my_spec = self,
      replicas: 1,
      template+: {
        spec+: {
          containers_+: {
            main: kube.Container("main") {
              image: "nginx:1.16.0",
              resources: { requests: { cpu: "100m", memory: "100Mi" } },
              env_+: {
                PD_CONF: "true",
              },
              ports_+: { http: { containerPort: 80 } },
  }}}}}},

  service: kube.Service($.name) {
    target_pod: $.deployment.spec.template,
    metadata+: {namespace: $.namespace},
    },
};

kube.List() {
  items_+: sc,
}
