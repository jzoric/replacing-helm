
{ 
  apiVersion: 'apps/v1',
  kind: 'Deployment',
  metadata: {
    name: 'service-d',
    labels: {
      app: 'service-d',
    }
  },
  spec: {
    replicas: 1,
    selector: {
      matchLabels: {
        app: 'service-d'
      },
    },
    template: {
      metadata: {
        labels: {
          app: 'service-d'
        },
      },
      spec: {
        securityContext: {},
        containers: [
          {
            name: 'service-d',
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
