# Wharf Helm chart

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square)
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
| [iver-wharf/wharf-api](https://github.com/iver-wharf/wharf-api) | [![Version: v4.2.0](https://img.shields.io/badge/Version-v4.2.0-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-api) |`"quay.io/iver-wharf/wharf-api:v4.2.0"`
| [iver-wharf/wharf-web](https://github.com/iver-wharf/wharf-web) | [![Version: v1.4.0](https://img.shields.io/badge/Version-v1.4.0-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-web) |`"quay.io/iver-wharf/wharf-web:v1.4.0"`
| [iver-wharf/wharf-provider-github](https://github.com/iver-wharf/wharf-provider-github) | [![Version: v2.0.0](https://img.shields.io/badge/Version-v2.0.0-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-provider-github) |`"quay.io/iver-wharf/wharf-provider-github:v2.0.0"`
| [iver-wharf/wharf-provider-gitlab](https://github.com/iver-wharf/wharf-provider-gitlab) | [![Version: v1.2.0](https://img.shields.io/badge/Version-v1.2.0-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-provider-gitlab) |`"quay.io/iver-wharf/wharf-provider-gitlab:v1.2.0"`
| [iver-wharf/wharf-provider-azuredevops](https://github.com/iver-wharf/wharf-provider-azuredevops) | [![Version: v2.0.1](https://img.shields.io/badge/Version-v2.0.1-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-provider-azuredevops) |`"quay.io/iver-wharf/wharf-provider-azuredevops:v2.0.1"`

## Values

### `api.affinity`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

*Type:* `object`\
*Default:* `{}`

### `api.ciToken`

> Jenkins webhook secret token used when starting new builds. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"changeit"`

### `api.ciUrl`

> Jenkins webhook endpoint used when starting new builds. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"http://jenkins.example.com/generic-webhook-trigger/invoke"`

### `api.containerPort`

> Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

*Type:* `int`\
*Default:* `8080`

### `api.containerSecurityContext`

> Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container)

*Type:* `object`\
*Default:* `{}`

### `api.db.driver`

> Currently only `"postgres"` is a valid value here. Set to `null` or empty string `""` if you wish to populate the `DBHOST`, `DBPORT`, `DBUSER`, `DBPASS` environment variables yourself via `api.extraEnvs` Sets `DBDRIVER` environment variable. Does not support ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"postgres"`

### `api.db.host`

> Database hostname used when connecting to the database. Sets `DBHOST` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"wharf-db"`

### `api.db.name`

> Name of the database (or "schema" in MySQL terms) holding all the tables. Sets `DBNAME` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"wharf"`

### `api.db.password`

> Password used when connecting to the database. Sets `DBPASS` environment variable. Recommended to pull this from a secret. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"changeit"`

### `api.db.port`

> Database port used when connecting to the database. Sets `DBPORT` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"5432"`

### `api.db.username`

> Username used when connecting to the database. Sets `DBUSER` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"postgres"`

### `api.extraEnvs`

> If `api.db.driver` is unset, then you must populate your own database connection here. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)

*Type:* `list`\
*Default:* `[]`

### `api.http.basicAuth`

> Adds BasicAuth to the API. This is expiermental and is not automatically applied to the web, but only applied to the API. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `""`

### `api.http.bindAddress`

> Sets the IP address and port to bind the API server to. Sets `BIND_ADDRESS` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"0.0.0.0:8080"`

### `api.image`

> Docker image that runs the frontend/web

*Type:* `string`\
*Default:* `"quay.io/iver-wharf/wharf-api:v4.2.0"`

### `api.imagePullPolicy`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images)

*Type:* `string`\
*Default:* `""`

### `api.livenessProbe`

> Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

*Type:* `object`\
*Default:* `{"httpGet":{"path":"/health","port":"http"}}`

### `api.nodeSelector`

> Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/)

*Type:* `object`\
*Default:* `{"kubernetes.io/os":"linux"}`

### `api.podSecurityContext`

> Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod)

*Type:* `object`\
*Default:* `{}`

### `api.rabbitmq.connAttempts`

> When the Wharf API starts up, how many times should it attempt to connect to the RabbitMQ instance before giving up and restarting? Sets `RABBITMQCONNATTEMPTS` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"10"`

### `api.rabbitmq.enabled`

> `true` to enable RabbitMQ integration, `false` to disable it. All other `api.rabbitmq...` settings are ignored if RabbitMQ has been disabled. Does not support ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `bool`\
*Default:* `false`

### `api.rabbitmq.host`

>

*Type:* `string`\
*Default:* `"rabbitmq.local"`

### `api.rabbitmq.name`

> RabbitMQ queue name to push RabbitMQ messages into. Sets `RABBITMQNAME` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"wharf_queue"`

### `api.rabbitmq.password`

> Password used by Wharf to authenticate with RabbitMQ. Sets `RABBITMQPASS` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"changeit"`

### `api.rabbitmq.port`

> Host port used by Wharf to connect to RabbitMQ. Sets `RABBITMQPORT` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"5672"`

### `api.rabbitmq.username`

> Username used by Wharf to authenticate with RabbitMQ. Sets `RABBITMQUSER` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"user"`

### `api.rabbitmq.vHost`

> RabbitMQ virtual host to push RabbitMQ messages into. Sets `RABBITMQVHOST` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"/"`

### `api.readinessProbe`

> Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

*Type:* `object`\
*Default:* `{"httpGet":{"path":"/health","port":"http"}}`

### `api.replicaCount`

> Number of deployment replicas.

*Type:* `int`\
*Default:* `1`

### `api.resources`

> Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

*Type:* `object`\
*Default:* `{}`

### `api.servicePort`

> Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

*Type:* `int`\
*Default:* `80`

### `api.serviceType`

> Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

*Type:* `string`\
*Default:* `"ClusterIP"`

### `api.tolerations`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

*Type:* `list`\
*Default:* `[]`

### `fullnameOverride`

> String to fully override the pod and service names. If set, deployments, services, ingresses, *et.al*, will use this name, and `nameOverride` will be ignored.

*Type:* `string`\
*Default:* `""`

### `global.instanceId`

> Used in RabbitMQ & Jenkins to multiplex jobs and messages on the same instances while keeping track of their origin.

*Type:* `string`\
*Default:* `"dev"`

### `global.isProduction`

> This flag is forwarded to the frontend where it can be used to show slightly different styling depending on if it's for production or not.

*Type:* `bool`\
*Default:* `false`

### `global.url`

> URL of this Wharf instance. Mostly only used in the `ingress` and `ingressRoute` settings to route the appropriate requests, but also in Wharf's API so it can properly refer to itself.

*Type:* `string`\
*Default:* `"wharf.example.org"`

### `imagePullSecrets`

>

*Type:* `list`\
*Default:* `[]`

### `ingress.annotations`

>

*Type:* `object`\
*Default:* `{}`

### `ingress.apiVersion`

>

*Type:* `string`\
*Default:* `"networking.k8s.io/v1beta1"`

### `ingress.enabled`

> Enables deploying a preconfigured Kubernetes Ingress to route traffic to the different Wharf services, using `global.url` as host name.

*Type:* `bool`\
*Default:* `false`

### `ingress.extraPaths`

> Optionally add additional paths that will be added on top of the routes for the web `/`, main API `/api`, and the provider APIs `/import/*`

*Type:* `list`\
*Default:* `[]`

### `ingress.tls`

>

*Type:* `object`\
*Default:* `{}`

### `ingressRoute.apiVersion`

>

*Type:* `string`\
*Default:* `"traefik.containo.us/v1alpha1"`

### `ingressRoute.enabled`

> Enables deploying a preconfigured Traefik IngressRoute to route traffic to the different Wharf services, using `global.url` as host name.

*Type:* `bool`\
*Default:* `false`

### `ingressRoute.entries[0].annotations`

>

*Type:* `object`\
*Default:* `{}`

### `ingressRoute.entries[0].entryPoints`

> Sample Traefik entrypoint that could be for `:80` traffic

*Type:* `list`\
*Default:* `["web"]`

### `ingressRoute.entries[0].middlewares`

> Good idea is to hook up the RedirectScheme to redirect http->https

*Type:* `list`\
*Default:* `[]`

### `ingressRoute.entries[0].name`

> Only used in the IngressRoute object names

*Type:* `string`\
*Default:* `"http"`

### `ingressRoute.entries[0].tls`

>

*Type:* `object`\
*Default:* `{}`

### `ingressRoute.entries[1].annotations`

>

*Type:* `object`\
*Default:* `{}`

### `ingressRoute.entries[1].entryPoints`

> Sample Traefik entrypoint that could be for `:443` traffic

*Type:* `list`\
*Default:* `["websecure"]`

### `ingressRoute.entries[1].middlewares`

>

*Type:* `list`\
*Default:* `[]`

### `ingressRoute.entries[1].name`

> Only used in the IngressRoute object names

*Type:* `string`\
*Default:* `"https"`

### `ingressRoute.entries[1].tls.secretName`

>

*Type:* `string`\
*Default:* `"wharf-example-tls"`

### `ingressRoute.extraRoutes`

> Optionally add additional routes that will be added on top of the routes for the web `/`, main API `/api`, and the provider APIs `/import/*`

*Type:* `list`\
*Default:* `[]`

### `nameOverride`

> String to partially override the pod and service names. Will maintain the release name.

*Type:* `string`\
*Default:* `""`

### `providers.azuredevops.enabled`

> There are far more settings available. Take a look at the `providers.example.*` settings for a comparison.

*Type:* `bool`\
*Default:* `true`

### `providers.azuredevops.image`

> Default image used in the `azuredevops` provider

*Type:* `string`\
*Default:* `"quay.io/iver-wharf/wharf-provider-azuredevops:v2.0.1"`

### `providers.azuredevops.imagePullPolicy`

> Default image pull policy used in the `azuredevops` provider

*Type:* `string`\
*Default:* `"IfNotPresent"`

### `providers.azuredevops.nodeSelector`

> Default node selector for the `azuredevops` provider

*Type:* `object`\
*Default:* `{"kubernetes.io/os":"linux"}`

### `providers.azuredevops.resources`

> Default resources requested by the `azuredevops` provider

*Type:* `object`\
*Default:* `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}`

### `providers.example.affinity`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

*Type:* `object`\
*Default:* `{}`

### `providers.example.annotations`

> Additional annotations to add to this provider's deployment

*Type:* `object`\
*Default:* `{}`

### `providers.example.apiUrlOverride`

> Overrides URL used to connect to the Wharf API. Sets `WHARF_API_URL` environment variable. Defaults to the full release name suffixed with "-api", to target the Wharf API Kubernetes service, when left unset. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"http://my-custom-wharf-api-service"`

### `providers.example.containerPort`

> Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

*Type:* `int`\
*Default:* `8080`

### `providers.example.containerSecurityContext`

> Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container)

*Type:* `object`\
*Default:* `{}`

### `providers.example.enabled`

> If this is `false` or unset then this provider will be ignored.

*Type:* `bool`\
*Default:* `false`

### `providers.example.extraEnvs`

> This chart adds `WHARF_API_URL` and `WHARF_PROVIDER_URL_BASE` environment variables, but you are free to add additional environment variables here. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)

*Type:* `list`\
*Default:* `[]`

### `providers.example.http.bindAddress`

> Sets the IP address and port to bind the API server to. Sets `BIND_ADDRESS` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"0.0.0.0:8080"`

### `providers.example.image`

> Docker image that runs the provider API

*Type:* `string`\
*Default:* `"ubuntu:latest"`

### `providers.example.imagePullPolicy`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images)

*Type:* `string`\
*Default:* `""`

### `providers.example.imagePullSecrets`

>

*Type:* `list`\
*Default:* `[]`

### `providers.example.labels`

> Additional labels to add to this provider's deployment

*Type:* `object`\
*Default:* `{}`

### `providers.example.livenessProbe`

> Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

*Type:* `object`\
*Default:* `{"httpGet":{"path":"/","port":"http"}}`

### `providers.example.nameOverride`

> The provider name affects the pod name, service name, URL base, et.al. If left unset, it will default to name of `providers.*` map/directory key (ex: `providers.example` => `"example"`)

*Type:* `string`\
*Default:* `"example-provider"`

### `providers.example.nodeSelector`

> Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/)

*Type:* `object`\
*Default:* `{}`

### `providers.example.podAnnotations`

>

*Type:* `object`\
*Default:* `{}`

### `providers.example.podLabels`

> Additional labels to add to this provider's pod

*Type:* `object`\
*Default:* `{}`

### `providers.example.podSecurityContext`

> Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod)

*Type:* `object`\
*Default:* `{}`

### `providers.example.readinessProbe`

> Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

*Type:* `object`\
*Default:* `{"httpGet":{"path":"/","port":"http"}}`

### `providers.example.replicaCount`

> Number of deployment replicas.

*Type:* `int`\
*Default:* `1`

### `providers.example.resources`

> Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

*Type:* `object`\
*Default:* `{}`

### `providers.example.servicePort`

> Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

*Type:* `int`\
*Default:* `80`

### `providers.example.serviceType`

> Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

*Type:* `string`\
*Default:* `"ClusterIP"`

### `providers.example.tolerations`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

*Type:* `list`\
*Default:* `[]`

### `providers.example.urlBaseOverride`

> Overrides URL base path If left unset, it will default to `"/import/"` followed by name of provider (ex: `"/import/example-provider"`). Default is affected by the `providers.*.nameOverride` setting.

*Type:* `string`\
*Default:* `"/import/my-example-provider"`

### `providers.example.urlOverride`

> Overrides outside URL to Wharf. Sets `WHARF_URL` environment variable. Defaults to the `global.url` value when unset. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

*Type:* `string`\
*Default:* `"wharf.example.org"`

### `providers.github.enabled`

> There are far more settings available. Take a look at the `providers.example.*` settings for a comparison.

*Type:* `bool`\
*Default:* `true`

### `providers.github.image`

> Default image used in the `github` provider

*Type:* `string`\
*Default:* `"quay.io/iver-wharf/wharf-provider-github:v2.0.0"`

### `providers.github.imagePullPolicy`

> Default image pull policy used in the `github` provider

*Type:* `string`\
*Default:* `"IfNotPresent"`

### `providers.github.nodeSelector`

> Default node selector for the `github` provider

*Type:* `object`\
*Default:* `{"kubernetes.io/os":"linux"}`

### `providers.github.resources`

> Default resources requested by the `github` provider

*Type:* `object`\
*Default:* `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}`

### `providers.gitlab.enabled`

> There are far more settings available. Take a look at the `providers.example.*` settings for a comparison.

*Type:* `bool`\
*Default:* `true`

### `providers.gitlab.image`

> Default image used in the `gitlab` provider

*Type:* `string`\
*Default:* `"quay.io/iver-wharf/wharf-provider-gitlab:v1.2.0"`

### `providers.gitlab.imagePullPolicy`

> Default image pull policy used in the `gitlab` provider

*Type:* `string`\
*Default:* `"IfNotPresent"`

### `providers.gitlab.nodeSelector`

> Default node selector for the `gitlab` provider

*Type:* `object`\
*Default:* `{"kubernetes.io/os":"linux"}`

### `providers.gitlab.resources`

> Default resources requested by the GitLab provider

*Type:* `object`\
*Default:* `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}`

### `serviceAccount.create`

> Specifies whether a service account should be created

*Type:* `bool`\
*Default:* `true`

### `serviceAccount.name`

> The name of the service account to use. If not set and `serviceAccount.create` is `true`, a name is generated using the fullname template

*Type:* `string`\
*Default:* `""`

### `web.affinity`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

*Type:* `object`\
*Default:* `{}`

### `web.containerPort`

> Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

*Type:* `int`\
*Default:* `8080`

### `web.containerSecurityContext`

> Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container)

*Type:* `object`\
*Default:* `{}`

### `web.image`

> Docker image that runs the frontend/web

*Type:* `string`\
*Default:* `"quay.io/iver-wharf/wharf-web:v1.4.0"`

### `web.imagePullPolicy`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images)

*Type:* `string`\
*Default:* `""`

### `web.livenessProbe`

> Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

*Type:* `object`\
*Default:* `{"httpGet":{"path":"/","port":"http"}}`

### `web.nodeSelector`

> Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/)

*Type:* `object`\
*Default:* `{"kubernetes.io/os":"linux"}`

### `web.podSecurityContext`

> Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod)

*Type:* `object`\
*Default:* `{}`

### `web.readinessProbe`

> Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

*Type:* `object`\
*Default:* `{"httpGet":{"path":"/","port":"http"}}`

### `web.replicaCount`

> Number of deployment replicas.

*Type:* `int`\
*Default:* `1`

### `web.resources`

> Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

*Type:* `object`\
*Default:* `{}`

### `web.servicePort`

> Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

*Type:* `int`\
*Default:* `80`

### `web.serviceType`

> Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

*Type:* `string`\
*Default:* `"ClusterIP"`

### `web.tolerations`

> [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

*Type:* `list`\
*Default:* `[]`

### `web.volumeMounts`

> Recommended to add `emptyDir` volumes for nginx to have faster and more flexible caching.

*Type:* `list`\
*Default:* `[{"mountPath":"/var/cache/nginx","name":"cache"},{"mountPath":"/run","name":"run"}]`

### `web.volumes`

> Recommended to add `emptyDir` volumes for nginx to have faster and more flexible caching.

*Type:* `list`\
*Default:* `[{"emptyDir":{},"name":"cache"},{"emptyDir":{},"name":"run"}]`

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
