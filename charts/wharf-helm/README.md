# Wharf Helm chart

![Version: 1.1.3](https://img.shields.io/badge/Version-1.1.3-informational?style=flat-square)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

**Homepage:** <https://github.com/iver-wharf/wharf-helm/blob/master/charts/wharf-helm>

## Prerequisites

- Postgres database. Could be deployed anywhere, as long as Wharf can reach it.
  By default, it's expected on the host `"wharf-db"` and
  port `"5432"`.

  To deploy it on "bare metal", we recommend going through their official
  documentation: <https://www.postgresql.org/docs/current/installation.html>

  To deploy in Kubernetes, you may use the [Bitnami's
  Postgres Helm chart](https://github.com/bitnami/charts/tree/master/bitnami/postgresql),
  [Zalando's Postgres operator](https://postgres-operator.readthedocs.io/en/latest/),
  or [KubeDB](https://kubedb.com/docs/latest/guides/postgres/), for example.

## Installing the Chart

To install the chart with the release name `my-release`:

```sh
helm repo add iver-wharf https://iver-wharf.github.io/wharf-helm
helm install my-release iver-wharf/wharf-helm
```

## Default images

| GitHub repository | Quay.io version | Image
| ----------------- | --------------- | -----
| [iver-wharf/wharf-api](https://github.com/iver-wharf/wharf-api) | [![Version: v4.0.0](https://img.shields.io/badge/Version-v4.0.0-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-api) |`"quay.io/iver-wharf/wharf-api:v4.0.0"`
| [iver-wharf/wharf-web](https://github.com/iver-wharf/wharf-web) | [![Version: v1.2.0](https://img.shields.io/badge/Version-v1.2.0-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-web) |`"quay.io/iver-wharf/wharf-web:v1.2.0"`
| [iver-wharf/wharf-provider-github](https://github.com/iver-wharf/wharf-provider-github) | [![Version: v1.1.1](https://img.shields.io/badge/Version-v1.1.1-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-provider-github) |`"quay.io/iver-wharf/wharf-provider-github:v1.1.1"`
| [iver-wharf/wharf-provider-gitlab](https://github.com/iver-wharf/wharf-provider-gitlab) | [![Version: v1.1.1](https://img.shields.io/badge/Version-v1.1.1-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-provider-gitlab) |`"quay.io/iver-wharf/wharf-provider-gitlab:v1.1.1"`
| [iver-wharf/wharf-provider-azuredevops](https://github.com/iver-wharf/wharf-provider-azuredevops) | [![Version: v1.1.1](https://img.shields.io/badge/Version-v1.1.1-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-provider-azuredevops) |`"quay.io/iver-wharf/wharf-provider-azuredevops:v1.1.1"`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| api.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| api.ciToken | string | `"changeit"` | Jenkins webhook secret token used when starting new builds. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.ciUrl | string | `"http://jenkins.example.com/generic-webhook-trigger/invoke"` | Jenkins webhook endpoint used when starting new builds. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.containerPort | int | `8080` | Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| api.containerSecurityContext | object | `{}` | Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container) |
| api.db.driver | string | `"postgres"` | Currently only `"postgres"` is a valid value here. Set to `null` or empty string `""` if you wish to populate the `DBHOST`, `DBPORT`, `DBUSER`, `DBPASS` environment variables yourself via `api.extraEnvs` Sets `DBDRIVER` environment variable. Does not support ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.db.host | string | `"wharf-db"` | Database hostname used when connecting to the database. Sets `DBHOST` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.db.name | string | `"wharf"` | Name of the database (or "schema" in MySQL terms) holding all the tables. Sets `DBNAME` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.db.password | string | `"changeit"` | Password used when connecting to the database. Sets `DBPASS` environment variable. Recommended to pull this from a secret. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.db.port | string | `"5432"` | Database port used when connecting to the database. Sets `DBPORT` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.db.username | string | `"postgres"` | Username used when connecting to the database. Sets `DBUSER` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.extraEnvs | list | `[]` | If `api.db.driver` is unset, then you must populate your own database connection here. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| api.image | string | `"quay.io/iver-wharf/wharf-api:v4.0.0"` | Docker image that runs the frontend/web |
| api.imagePullPolicy | string | `""` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images) |
| api.livenessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) |
| api.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| api.podSecurityContext | object | `{}` | Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| api.rabbitmq.connAttempts | string | `"10"` | When the Wharf API starts up, how many times should it attempt to connect to the RabbitMQ instance before giving up and restarting? Sets `RABBITMQCONNATTEMPTS` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.rabbitmq.enabled | bool | `false` | `true` to enable RabbitMQ integration, `false` to disable it. All other `api.rabbitmq...` settings are ignored if RabbitMQ has been disabled. Does not support ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.rabbitmq.host | string | `"rabbitmq.local"` |  |
| api.rabbitmq.name | string | `"wharf_queue"` | RabbitMQ queue name to push RabbitMQ messages into. Sets `RABBITMQNAME` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.rabbitmq.password | string | `"changeit"` | Password used by Wharf to authenticate with RabbitMQ. Sets `RABBITMQPASS` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.rabbitmq.port | string | `"5672"` | Host port used by Wharf to connect to RabbitMQ. Sets `RABBITMQPORT` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.rabbitmq.username | string | `"user"` | Username used by Wharf to authenticate with RabbitMQ. Sets `RABBITMQUSER` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.rabbitmq.vHost | string | `"/"` | RabbitMQ virtual host to push RabbitMQ messages into. Sets `RABBITMQVHOST` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields) |
| api.readinessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) |
| api.replicaCount | int | `1` | Number of deployment replicas. |
| api.resources | object | `{}` | Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| api.servicePort | int | `80` | Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| api.serviceType | string | `"ClusterIP"` | Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| api.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| fullnameOverride | string | `""` | String to fully override the pod and service names. If set, deployments, services, ingresses, *et.al*, will use this name, and `nameOverride` will be ignored. |
| global.instanceId | string | `"dev"` | Used in RabbitMQ & Jenkins to multiplex jobs and messages on the same instances while keeping track of their origin. |
| global.isProduction | bool | `false` | This flag is forwarded to the frontend where it can be used to show slightly different styling depending on if it's for production or not. |
| global.url | string | `"wharf.example.org"` | URL of this Wharf instance. Mostly only used in the `ingress` and `ingressRoute` settings to route the appropriate requests, but also in Wharf's API so it can properly refer to itself. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.apiVersion | string | `"networking.k8s.io/v1beta1"` |  |
| ingress.enabled | bool | `false` | Enables deploying a preconfigured Kubernetes Ingress to route traffic to the different Wharf services, using `global.url` as host name. |
| ingress.extraPaths | list | `[]` | Optionally add additional paths that will be added on top of the routes for the web `/`, main API `/api`, and the provider APIs `/import/*` |
| ingress.tls | object | `{}` |  |
| ingressRoute.apiVersion | string | `"traefik.containo.us/v1alpha1"` |  |
| ingressRoute.enabled | bool | `false` | Enables deploying a preconfigured Traefik IngressRoute to route traffic to the different Wharf services, using `global.url` as host name. |
| ingressRoute.entries[0].annotations | object | `{}` |  |
| ingressRoute.entries[0].entryPoints | list | `["web"]` | Sample Traefik entrypoint that could be for `:80` traffic |
| ingressRoute.entries[0].middlewares | list | `[]` | Good idea is to hook up the RedirectScheme to redirect http->https |
| ingressRoute.entries[0].name | string | `"http"` | Only used in the IngressRoute object names |
| ingressRoute.entries[0].tls | object | `{}` |  |
| ingressRoute.entries[1].annotations | object | `{}` |  |
| ingressRoute.entries[1].entryPoints | list | `["websecure"]` | Sample Traefik entrypoint that could be for `:443` traffic |
| ingressRoute.entries[1].middlewares | list | `[]` |  |
| ingressRoute.entries[1].name | string | `"https"` | Only used in the IngressRoute object names |
| ingressRoute.entries[1].tls.secretName | string | `"wharf-example-tls"` |  |
| ingressRoute.extraRoutes | list | `[]` | Optionally add additional routes that will be added on top of the routes for the web `/`, main API `/api`, and the provider APIs `/import/*` |
| nameOverride | string | `""` | String to partially override the pod and service names. Will maintain the release name. |
| providers.azuredevops.enabled | bool | `true` | There are far more settings available. Take a look at the `providers.exampleProvider.*` settings for a comparison. |
| providers.azuredevops.image | string | `"quay.io/iver-wharf/wharf-provider-azuredevops:v1.1.1"` | Default image used in the `azuredevops` provider |
| providers.azuredevops.imagePullPolicy | string | `"IfNotPresent"` | Default image pull policy used in the `azuredevops` provider |
| providers.azuredevops.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Default node selector for the `azuredevops` provider |
| providers.azuredevops.resources | object | `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Default resources requested by the `azuredevops` provider |
| providers.exampleProvider.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| providers.exampleProvider.annotations | object | `{}` | Additional annotations to add to this provider's deployment |
| providers.exampleProvider.containerPort | int | `8080` | Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| providers.exampleProvider.containerSecurityContext | object | `{}` | Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container) |
| providers.exampleProvider.enabled | bool | `false` | If this is `false` or unset then this provider will be ignored. |
| providers.exampleProvider.extraEnvs | list | `[]` | This chart adds `WHARF_API_URL` and `WHARF_PROVIDER_URL_BASE` environment variables, but you are free to add additional environment variables here. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| providers.exampleProvider.image | string | `"ubuntu:latest"` | Docker image that runs the provider API |
| providers.exampleProvider.imagePullPolicy | string | `""` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images) |
| providers.exampleProvider.imagePullSecrets | list | `[]` |  |
| providers.exampleProvider.labels | object | `{}` | Additional labels to add to this provider's deployment |
| providers.exampleProvider.livenessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) |
| providers.exampleProvider.nameOverride | string | `"example-provider"` | The provider name affects the pod name, service name, URL base, et.al. If left unset, it will default to name of `providers.*` map/directory key (ex: `providers.exampleProvider` => `"exampleProvider"`) |
| providers.exampleProvider.nodeSelector | object | `{}` | Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| providers.exampleProvider.podAnnotations | object | `{}` |  |
| providers.exampleProvider.podLabels | object | `{}` | Additional labels to add to this provider's pod |
| providers.exampleProvider.podSecurityContext | object | `{}` | Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| providers.exampleProvider.readinessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) |
| providers.exampleProvider.replicaCount | int | `1` | Number of deployment replicas. |
| providers.exampleProvider.resources | object | `{}` | Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| providers.exampleProvider.servicePort | int | `80` | Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| providers.exampleProvider.serviceType | string | `"ClusterIP"` | Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| providers.exampleProvider.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| providers.exampleProvider.urlBaseOverride | string | `"/import/my-example-provider"` | Overrides URL base path If left unset, it will default to `"/import/"` followed by name of provider (ex: `"/import/example-provider"`). Default is affected by the `providers.*.nameOverride` setting. |
| providers.github.enabled | bool | `true` | There are far more settings available. Take a look at the `providers.exampleProvider.*` settings for a comparison. |
| providers.github.image | string | `"quay.io/iver-wharf/wharf-provider-github:v1.1.1"` | Default image used in the `github` provider |
| providers.github.imagePullPolicy | string | `"IfNotPresent"` | Default image pull policy used in the `github` provider |
| providers.github.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Default node selector for the `github` provider |
| providers.github.resources | object | `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Default resources requested by the `github` provider |
| providers.gitlab.enabled | bool | `true` | There are far more settings available. Take a look at the `providers.exampleProvider.*` settings for a comparison. |
| providers.gitlab.image | string | `"quay.io/iver-wharf/wharf-provider-gitlab:v1.1.1"` | Default image used in the `gitlab` provider |
| providers.gitlab.imagePullPolicy | string | `"IfNotPresent"` | Default image pull policy used in the `gitlab` provider |
| providers.gitlab.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Default node selector for the `gitlab` provider |
| providers.gitlab.resources | object | `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Default resources requested by the GitLab provider |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and `serviceAccount.create` is `true`, a name is generated using the fullname template |
| web.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| web.containerPort | int | `8080` | Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| web.containerSecurityContext | object | `{}` | Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container) |
| web.image | string | `"quay.io/iver-wharf/wharf-web:v1.2.0"` | Docker image that runs the frontend/web |
| web.imagePullPolicy | string | `""` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images) |
| web.livenessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) |
| web.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| web.podSecurityContext | object | `{}` | Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| web.readinessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) |
| web.replicaCount | int | `1` | Number of deployment replicas. |
| web.resources | object | `{}` | Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| web.servicePort | int | `80` | Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| web.serviceType | string | `"ClusterIP"` | Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| web.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| web.volumeMounts | list | `[{"mountPath":"/var/cache/nginx","name":"cache"},{"mountPath":"/run","name":"run"}]` | Recommended to add `emptyDir` volumes for nginx to have faster and more flexible caching. |
| web.volumes | list | `[{"emptyDir":{},"name":"cache"},{"emptyDir":{},"name":"run"}]` | Recommended to add `emptyDir` volumes for nginx to have faster and more flexible caching. |

## Smart environment fields

This chart uses a trick to let you more consicely specify environment variable
values. Normally to specify a Kubernetes environment variable, you have a
setting such as:

```yaml
env:
  - name: "DBHOST"
    value: "my value"

  - name: "DBHOST"
    valueFrom:
      secretKeyRef:
        name: my-secret
        key: my-key-in-the-secret
```

Any setting that specifies it supports "Smart environment field", such as the
`api.db.host` setting, allows these values except the `name` field.

But there's also a shorthand. If the value of the setting is just simply a
`string`, then it translates to a `value: ...` setting.

The following three samples of setting `api.db.host` are all valid:

```yaml
api:
  db:
    host:
      value: "my value"
    # Would be added to the Pod's environment variables as:
    #env:
    #  - name: DBHOST
    #    value: "my value"

    host:
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: my-key-in-the-secret
    # Would be added to the Pod's environment variables as:
    #env:
    #  - name: DBHOST
    #    valueFrom:
    #      secretKeyRef:
    #        name: my-secret
    #        key: my-key-in-the-secret

    host: "my value"
    # Would be added to the Pod's environment variables as:
    #env:
    #  - name: DBHOST
    #    value: "my value"
```

The object fields available, such as the `value` and `valueFrom`, can be found
over at: <https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets-as-environment-variables>

## Changes

See the [CHANGELOG.md](./CHANGELOG.md) file inside this Helm chart.

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](https://github.com/iver-wharf/wharf-helm/blob/master/LICENSE).
