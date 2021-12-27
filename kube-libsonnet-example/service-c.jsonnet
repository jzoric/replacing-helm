local service_c = import 'service-c.libsonnet';

function(name, namespace='dev')
  service_c {
    items_+: {
      name: name,
      namespace: namespace,
    },
  }
