local utils = import 'utils.libsonnet';
{

  name:: error 'Name required',
  namespace:: error 'Namespace required',

  env:: if $.namespace != 'dev' then error 'env must be set' else 'europe-west4',

  apiVersion: 'apps/v1',
  kind: 'Deployment',
  metadata: {
    name: $.name,
    namespace: $.namespace,
    labels: {
      'app-name': $.name,
      'hashed': utils.hashed($.name),
    }
  },
  spec: {
    replicas: 1,
    selector: {
      matchLabels: {
        'app-name': $.name,
      },
    },
    template: {
      metadata: {
        labels: {
         env: $.env,
         'app-name': $.name,
        },
      },
      spec: {
        securityContext: {},
        containers: [
          {
            name: $.name,
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
