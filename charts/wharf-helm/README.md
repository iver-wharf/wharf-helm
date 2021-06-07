# Wharf Helm chart

![Version: 1.1.2](https://img.shields.io/badge/Version-1.1.2-informational?style=flat-square)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

**Homepage:** <https://github.com/iver-wharf/wharf-helm/blob/master/charts/wharf-helm>

## Prerequisites

- Postgres database. Could be deployed anywhere, as long as Wharf can reach it.

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

## Values

### (object) `api.affinity`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

Default: `{}`

### (string) `api.ciToken`

Description: Jenkins webhook secret token used when starting new builds. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"changeit"`

### (string) `api.ciUrl`

Description: Jenkins webhook endpoint used when starting new builds. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"http://jenkins.example.com/generic-webhook-trigger/invoke"`

### (int) `api.containerPort`

Description: Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

Default: `8080`

### (object) `api.containerSecurityContext`

Description: Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container)

Default: `{}`

### (string) `api.db.driver`

Description: Currently only `"postgres"` is a valid value here. Set to `null` or empty string `""` if you wish to populate the `DBHOST`, `DBPORT`, `DBUSER`, `DBPASS` environment variables yourself via `api.extraEnvs` Sets `DBDRIVER` environment variable. Does not support ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"postgres"`

### (string) `api.db.host`

Description: Database hostname used when connecting to the database. Sets `DBHOST` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"wharf-db"`

### (string) `api.db.name`

Description: Name of the database (or "schema" in MySQL terms) holding all the tables. Sets `DBNAME` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"wharf"`

### (string) `api.db.password`

Description: Password used when connecting to the database. Sets `DBPASS` environment variable. Recommended to pull this from a secret. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"changeit"`

### (string) `api.db.port`

Description: Database port used when connecting to the database. Sets `DBPORT` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"5432"`

### (string) `api.db.username`

Description: Username used when connecting to the database. Sets `DBUSER` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"postgres"`

### (list) `api.extraEnvs`

Description: If `api.db.driver` is unset, then you must populate your own database connection here. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)

Default: `[]`

### (string) `api.image`

Description: Docker image that runs the frontend/web

Default: `"quay.io/iver-wharf/wharf-api:v4.0.0"`

### (string) `api.imagePullPolicy`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images)

Default: `""`

### (object) `api.livenessProbe`

Description: Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

Default: `{"httpGet":{"path":"/health","port":"http"}}`

### (object) `api.nodeSelector`

Description: Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/)

Default: `{"kubernetes.io/os":"linux"}`

### (object) `api.podSecurityContext`

Description: Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod)

Default: `{}`

### (string) `api.rabbitmq.connAttempts`

Description: When the Wharf API starts up, how many times should it attempt to connect to the RabbitMQ instance before giving up and restarting? Sets `RABBITMQCONNATTEMPTS` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"10"`

### (bool) `api.rabbitmq.enabled`

Description: `true` to enable RabbitMQ integration, `false` to disable it. All other `api.rabbitmq...` settings are ignored if RabbitMQ has been disabled. Does not support ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `false`

### (string) `api.rabbitmq.host`

Description:

Default: `"rabbitmq.local"`

### (string) `api.rabbitmq.name`

Description: RabbitMQ queue name to push RabbitMQ messages into. Sets `RABBITMQNAME` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"wharf_queue"`

### (string) `api.rabbitmq.password`

Description: Password used by Wharf to authenticate with RabbitMQ. Sets `RABBITMQPASS` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"changeit"`

### (string) `api.rabbitmq.port`

Description: Host port used by Wharf to connect to RabbitMQ. Sets `RABBITMQPORT` environment variable. ***(Integers must be quoted!)*** Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"5672"`

### (string) `api.rabbitmq.username`

Description: Username used by Wharf to authenticate with RabbitMQ. Sets `RABBITMQUSER` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"user"`

### (string) `api.rabbitmq.vHost`

Description: RabbitMQ virtual host to push RabbitMQ messages into. Sets `RABBITMQVHOST` environment variable. Supports ["Smart environment fields"](./README.md#smart-environment-fields)

Default: `"/"`

### (object) `api.readinessProbe`

Description: Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

Default: `{"httpGet":{"path":"/health","port":"http"}}`

### (int) `api.replicaCount`

Description: Number of deployment replicas.

Default: `1`

### (object) `api.resources`

Description: Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

Default: `{}`

### (int) `api.servicePort`

Description: Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

Default: `80`

### (string) `api.serviceType`

Description: Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

Default: `"ClusterIP"`

### (list) `api.tolerations`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

Default: `[]`

### (string) `fullnameOverride`

Description: String to fully override the pod and service names. If set, deployments, services, ingresses, *et.al*, will use this name, and `nameOverride` will be ignored.

Default: `""`

### (string) `global.instanceId`

Description: Used in RabbitMQ & Jenkins to multiplex jobs and messages on the same instances while keeping track of their origin.

Default: `"dev"`

### (bool) `global.isProduction`

Description: This flag is forwarded to the frontend where it can be used to show slightly different styling depending on if it's for production or not.

Default: `false`

### (string) `global.url`

Description: URL of this Wharf instance. Mostly only used in the `ingress` and `ingressRoute` settings to route the appropriate requests, but also in Wharf's API so it can properly refer to itself.

Default: `"wharf.example.org"`

### (list) `imagePullSecrets`

Description:

Default: `[]`

### (object) `ingress.annotations`

Description:

Default: `{}`

### (string) `ingress.apiVersion`

Description:

Default: `"networking.k8s.io/v1beta1"`

### (bool) `ingress.enabled`

Description: Enables deploying a preconfigured Kubernetes Ingress to route traffic to the different Wharf services, using `global.url` as host name.

Default: `false`

### (list) `ingress.extraPaths`

Description: Optionally add additional paths that will be added on top of the routes for the web `/`, main API `/api`, and the provider APIs `/import/*`

Default: `[]`

### (object) `ingress.tls`

Description:

Default: `{}`

### (string) `ingressRoute.apiVersion`

Description:

Default: `"traefik.containo.us/v1alpha1"`

### (bool) `ingressRoute.enabled`

Description: Enables deploying a preconfigured Traefik IngressRoute to route traffic to the different Wharf services, using `global.url` as host name.

Default: `false`

### (object) `ingressRoute.entries[0].annotations`

Description:

Default: `{}`

### (list) `ingressRoute.entries[0].entryPoints`

Description: Sample Traefik entrypoint that could be for `:80` traffic

Default: `["web"]`

### (list) `ingressRoute.entries[0].middlewares`

Description: Good idea is to hook up the RedirectScheme to redirect http->https

Default: `[]`

### (string) `ingressRoute.entries[0].name`

Description: Only used in the IngressRoute object names

Default: `"http"`

### (object) `ingressRoute.entries[0].tls`

Description:

Default: `{}`

### (object) `ingressRoute.entries[1].annotations`

Description:

Default: `{}`

### (list) `ingressRoute.entries[1].entryPoints`

Description: Sample Traefik entrypoint that could be for `:443` traffic

Default: `["websecure"]`

### (list) `ingressRoute.entries[1].middlewares`

Description:

Default: `[]`

### (string) `ingressRoute.entries[1].name`

Description: Only used in the IngressRoute object names

Default: `"https"`

### (string) `ingressRoute.entries[1].tls.secretName`

Description:

Default: `"wharf-example-tls"`

### (list) `ingressRoute.extraRoutes`

Description: Optionally add additional routes that will be added on top of the routes for the web `/`, main API `/api`, and the provider APIs `/import/*`

Default: `[]`

### (string) `nameOverride`

Description: String to partially override the pod and service names. Will maintain the release name.

Default: `""`

### (bool) `providers.azuredevops.enabled`

Description: There are far more settings available. Take a look at the `providers.exampleProvider.*` settings for a comparison.

Default: `true`

### (string) `providers.azuredevops.image`

Description: Default image used in the `azuredevops` provider

Default: `"quay.io/iver-wharf/wharf-provider-azuredevops:v1.1.1"`

### (string) `providers.azuredevops.imagePullPolicy`

Description: Default image pull policy used in the `azuredevops` provider

Default: `"IfNotPresent"`

### (object) `providers.azuredevops.nodeSelector`

Description: Default node selector for the `azuredevops` provider

Default: `{"kubernetes.io/os":"linux"}`

### (object) `providers.azuredevops.resources`

Description: Default resources requested by the `azuredevops` provider

Default: `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}`

### (object) `providers.example.affinity`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

Default: `{}`

### (object) `providers.example.annotations`

Description: Additional annotations to add to this provider's deployment

Default: `{}`

### (int) `providers.example.containerPort`

Description: Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

Default: `8080`

### (object) `providers.example.containerSecurityContext`

Description: Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container)

Default: `{}`

### (bool) `providers.example.enabled`

Description: If this is `false` or unset then this provider will be ignored.

Default: `false`

### (list) `providers.example.extraEnvs`

Description: This chart adds `WHARF_API_URL` and `WHARF_PROVIDER_URL_BASE` environment variables, but you are free to add additional environment variables here. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)

Default: `[]`

### (string) `providers.example.image`

Description: Docker image that runs the provider API

Default: `"ubuntu:latest"`

### (string) `providers.example.imagePullPolicy`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images)

Default: `""`

### (list) `providers.example.imagePullSecrets`

Description:

Default: `[]`

### (object) `providers.example.labels`

Description: Additional labels to add to this provider's deployment

Default: `{}`

### (object) `providers.example.livenessProbe`

Description: Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

Default: `{"httpGet":{"path":"/","port":"http"}}`

### (string) `providers.example.nameOverride`

Description: The provider name affects the pod name, service name, URL base, et.al. If left unset, it will default to name of `providers.*` map/directory key (ex: `providers.example` => `"example"`)

Default: `"example-provider"`

### (object) `providers.example.nodeSelector`

Description: Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/)

Default: `{}`

### (object) `providers.example.podAnnotations`

Description:

Default: `{}`

### (object) `providers.example.podLabels`

Description: Additional labels to add to this provider's pod

Default: `{}`

### (object) `providers.example.podSecurityContext`

Description: Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod)

Default: `{}`

### (object) `providers.example.readinessProbe`

Description: Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

Default: `{"httpGet":{"path":"/","port":"http"}}`

### (int) `providers.example.replicaCount`

Description: Number of deployment replicas.

Default: `1`

### (object) `providers.example.resources`

Description: Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

Default: `{}`

### (int) `providers.example.servicePort`

Description: Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

Default: `80`

### (string) `providers.example.serviceType`

Description: Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

Default: `"ClusterIP"`

### (list) `providers.example.tolerations`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

Default: `[]`

### (string) `providers.example.urlBaseOverride`

Description: Overrides URL base path If left unset, it will default to `"/import/"` followed by name of provider (ex: `"/import/example-provider"`). Default is affected by the `providers.*.nameOverride` setting.

Default: `"/import/my-example-provider"`

### (bool) `providers.github.enabled`

Description: There are far more settings available. Take a look at the `providers.exampleProvider.*` settings for a comparison.

Default: `true`

### (string) `providers.github.image`

Description: Default image used in the `github` provider

Default: `"quay.io/iver-wharf/wharf-provider-github:v1.1.1"`

### (string) `providers.github.imagePullPolicy`

Description: Default image pull policy used in the `github` provider

Default: `"IfNotPresent"`

### (object) `providers.github.nodeSelector`

Description: Default node selector for the `github` provider

Default: `{"kubernetes.io/os":"linux"}`

### (object) `providers.github.resources`

Description: Default resources requested by the `github` provider

Default: `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}`

### (bool) `providers.gitlab.enabled`

Description: There are far more settings available. Take a look at the `providers.exampleProvider.*` settings for a comparison.

Default: `true`

### (string) `providers.gitlab.image`

Description: Default image used in the `gitlab` provider

Default: `"quay.io/iver-wharf/wharf-provider-gitlab:v1.1.1"`

### (string) `providers.gitlab.imagePullPolicy`

Description: Default image pull policy used in the `gitlab` provider

Default: `"IfNotPresent"`

### (object) `providers.gitlab.nodeSelector`

Description: Default node selector for the `gitlab` provider

Default: `{"kubernetes.io/os":"linux"}`

### (object) `providers.gitlab.resources`

Description: Default resources requested by the GitLab provider

Default: `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}`

### (bool) `serviceAccount.create`

Description: Specifies whether a service account should be created

Default: `true`

### (string) `serviceAccount.name`

Description: The name of the service account to use. If not set and `serviceAccount.create` is `true`, a name is generated using the fullname template

Default: `""`

### (object) `web.affinity`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

Default: `{}`

### (int) `web.containerPort`

Description: Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

Default: `8080`

### (object) `web.containerSecurityContext`

Description: Security context inside the container. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-capabilities-for-a-container)

Default: `{}`

### (string) `web.image`

Description: Docker image that runs the frontend/web

Default: `"quay.io/iver-wharf/wharf-web:v1.2.0"`

### (string) `web.imagePullPolicy`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images)

Default: `""`

### (object) `web.livenessProbe`

Description: Unhealthy liveness probes makes pod restart. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

Default: `{"httpGet":{"path":"/","port":"http"}}`

### (object) `web.nodeSelector`

Description: Select which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/)

Default: `{"kubernetes.io/os":"linux"}`

### (object) `web.podSecurityContext`

Description: Security context on the pod level. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod)

Default: `{}`

### (object) `web.readinessProbe`

Description: Unhealthy readiness probes makes pod never recieve network traffic. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

Default: `{"httpGet":{"path":"/","port":"http"}}`

### (int) `web.replicaCount`

Description: Number of deployment replicas.

Default: `1`

### (object) `web.resources`

Description: Resource requests and limits. It's best practice to apply some appropriate values here [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)

Default: `{}`

### (int) `web.servicePort`

Description: Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

Default: `80`

### (string) `web.serviceType`

Description: Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

Default: `"ClusterIP"`

### (list) `web.tolerations`

Description: [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

Default: `[]`

### (list) `web.volumeMounts`

Description: Recommended to add `emptyDir` volumes for nginx to have faster and more flexible caching.

Default: `[{"mountPath":"/var/cache/nginx","name":"cache"},{"mountPath":"/run","name":"run"}]`

### (list) `web.volumes`

Description: Recommended to add `emptyDir` volumes for nginx to have faster and more flexible caching.

Default: `[{"emptyDir":{},"name":"cache"},{"emptyDir":{},"name":"run"}]`

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
