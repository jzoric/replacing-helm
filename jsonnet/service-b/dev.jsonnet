local deployment  = import "deployment.jsonnet";

deployment {
  name: 'my-service-b',
  namespace: 'dev',
}

