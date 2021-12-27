(import 'service_e/service-e.libsonnet') +
{
  config+:: {
      replicas: 1,
      container_image: 'nginx',
    }
}
{
  service_e+: {
    deployment+: {
      spec+: {
        template+: {
          spec+: {
            containers: [
              super.containers[0] {
                imagePullPolicy: 'Always',
              },
            ],
          },
        },
      },
    },
  },
}
