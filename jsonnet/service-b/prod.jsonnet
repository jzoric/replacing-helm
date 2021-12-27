local deployment  = import "deployment.jsonnet";

deployment {
  name: 'service-b',
  namespace: 'prod',
  // env: 'us-central1',
  metadata+: {
    labels+:{
        my:'pd',
      }
  },
}
