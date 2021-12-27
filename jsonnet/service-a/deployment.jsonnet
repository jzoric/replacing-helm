{ 
  apiVersion: 'apps/v1',
  kind: 'Deployment',
  metadata: {
    name: 'service-a',
    labels: {
      app: 'service-a',
    }
  },
  spec: {
    replicas: 1,
    selector: {
      matchLabels: {
        app: 'service-a'
      },
    },
    template: {
      metadata: {
        labels: {
          app: 'service-a'
        },
      },
      spec: {
        securityContext: {},
        containers: [
          {
            name: 'service-a',
            securityContext: {},
            image: 'nginx:1.16.0',
            imagePullPolicy: 'IfNotPresent',
            ports: [
              {
                name: 'http',
                containerPort: 80,
                protocol: 'TCP',
              },
            ],
            livenessProbe: {
              httpGet: {
                path: '/',
                port: 'http',
              },
            },
            readinessProbe: {
              httpGet: {
                path: '/',
                port: 'http',
              },
            },
            resources: {},
          },
        ],
      },
    },
  },
}
