{
  apiVersion: 'v1',
  kind: 'Service',
  metadata: {
    name: 'service-a',
  },
  spec: {
    type: 'ClusterIP',
    ports: [
      {
        port: 80,
        targetPort: 'http',
        protocol: 'TCP',
        name: 'http',
      },
    ],
    selector: {
      app: 'service-a',
    },
  },
}
