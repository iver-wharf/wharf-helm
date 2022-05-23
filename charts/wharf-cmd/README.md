# Wharf Helm chart

![Version: 0.3.2](https://img.shields.io/badge/Version-0.3.2-informational?style=flat-square) 
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://github.com/iver-wharf/wharf-helm/blob/master/charts/wharf-cmd>

## Prerequisites

- Wharf API, for wharf-cmd-watchdog and wharf-cmd-aggregator to
  communicate with.

## Installing the Chart

To install the chart with the release name `my-release`:

```sh
helm repo add iver-wharf https://wharf.iver.com/wharf-helm
helm install wharf-cmd iver-wharf/wharf-cmd
```

## Default images

| GitHub repository | Quay.io version | Image
| ----------------- | --------------- | -----
| [iver-wharf/wharf-cmd](https://github.com/iver-wharf/wharf-cmd) | [![Version: v0.8.2](https://img.shields.io/badge/Version-v0.8.2-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-cmd) |`"quay.io/iver-wharf/wharf-cmd:v0.8.2"`

## Configs disclaimer

The chart allows you to set YAML configs for the different components.

Please note that wharf-cmd does not support hot-reloading configs, so if you
do a Helm upgrade with only configs changes, then Kubernetes only updates
the ConfigMaps and will not restart the services for you.

To restart the services manually, you can delete the pods, and let the
Deployment recreate them, like so:

```console
$ kubectl delete pod -l app.kubernetes.io/name=wharf-cmd
pod "wharf-cmd-stage-aggregator-857b7d4949-4dgnk" deleted
pod "wharf-cmd-stage-provisioner-8b5b5f85c-b4fqj" deleted
pod "wharf-cmd-stage-watchdog-67d468df7f-278xn" deleted
```

Or delete only one of the components:

```console
$ kubectl delete pod -l app.kubernetes.io/name=wharf-cmd,component=aggregator
pod "wharf-cmd-stage-aggregator-857b7d4949-4dgnk" deleted

$ kubectl delete pod -l app.kubernetes.io/name=wharf-cmd,component=provisioner
pod "wharf-cmd-stage-provisioner-8b5b5f85c-b4fqj" deleted

$ kubectl delete pod -l app.kubernetes.io/name=wharf-cmd,component=watchdog
pod "wharf-cmd-stage-watchdog-67d468df7f-278xn" deleted
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| aggregator.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| aggregator.config | object | common.config | Configuration for wharf-cmd added only to the aggregator component. This is merged with `common.config`, where values here take precedence. [Read more (pkg.go.dev/github.com/iver-wharf/wharf-cmd)](https://pkg.go.dev/github.com/iver-wharf/wharf-cmd/pkg/config) |
| aggregator.enabled | bool | `true` | Enable the wharf-cmd-aggregator component. |
| aggregator.extraArgs | list | `[]` | Arguments to add to the container. E.g `[ "--another-arg", "value" ]` |
| aggregator.extraEnvs | list | `[]` | Environment variables to add to the container. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| aggregator.image | string | common.image | Docker image of wharf-cmd-aggregator. |
| aggregator.imagePullPolicy | string | common.imagePullPolicy | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images) |
| aggregator.imagePullSecrets | list | common.imagePullSecrets | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| aggregator.loglevel | string | `nil` | Logging level for wharf-cmd-aggregator. Possible values: `debug`, `info`, `warn`, `error`, and `panic`. |
| aggregator.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Selects which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| aggregator.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| common.config | object | `{}` | Default configuration for all components. This is later merged with each per-component configs, where their config values take precedence. [Read more (pkg.go.dev/github.com/iver-wharf/wharf-cmd)](https://pkg.go.dev/github.com/iver-wharf/wharf-cmd/pkg/config) |
| common.image | string | `"quay.io/iver-wharf/wharf-cmd:v0.8.2"` | Default Docker image for all components. The same image can be used for all wharf-cmd components as it uses the same binary to perform the different tasks. |
| common.imagePullPolicy | string | `""` | Default imagePullPolicy for all components. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images) |
| common.imagePullSecrets | list | `[]` | Default imagePullSecrets for all components. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| common.loglevel | string | `"debug"` | Default logging level for all components. Possible values: `debug`, `info`, `warn`, `error`, and `panic`. |
| fullnameOverride | string | `""` | String to fully override the pod and service names. If set, deployments, services, ingresses, *etc*, will use this name, and `nameOverride` will be ignored. |
| global.instanceId | string | `"dev"` | Used by Wharf to differentiate between installations in the same namespace. |
| nameOverride | string | `""` | String to partially override the pod and service names. Will maintain the release name. |
| provisioner.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| provisioner.config | object | common.config | Configuration for wharf-cmd added only to the provisioner component. This is merged with `common.config`, where values here take precedence. [Read more (pkg.go.dev/github.com/iver-wharf/wharf-cmd)](https://pkg.go.dev/github.com/iver-wharf/wharf-cmd/pkg/config) |
| provisioner.containerPort | int | `5009` | Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| provisioner.enabled | bool | `true` | Enable the wharf-cmd-provisioner component. |
| provisioner.extraArgs | list | `[]` | Arguments to add to the container. E.g `[ "--another-arg", "value" ]` |
| provisioner.extraEnvs | list | `[]` | Environment variables to add to the container. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| provisioner.image | string | common.image | Docker image of wharf-cmd-provisioner. |
| provisioner.imagePullPolicy | string | common.imagePullPolicy | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images) |
| provisioner.imagePullSecrets | list | common.imagePullSecrets | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| provisioner.loglevel | string | `nil` | Logging level for wharf-cmd-provisioner. Possible values: `debug`, `info`, `warn`, `error`, and `panic`. |
| provisioner.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Selects which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| provisioner.servicePort | int | `80` | Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| provisioner.serviceType | string | `"ClusterIP"` | Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| provisioner.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| watchdog.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| watchdog.config | object | common.config | Configuration for wharf-cmd added only to the watchdog component. This is merged with `common.config`, where values here take precedence. [Read more (pkg.go.dev/github.com/iver-wharf/wharf-cmd)](https://pkg.go.dev/github.com/iver-wharf/wharf-cmd/pkg/config) |
| watchdog.enabled | bool | `false` | Enable the wharf-cmd-watchdog component. |
| watchdog.extraArgs | list | `[]` | Arguments to add to the container. E.g `[ "--another-arg", "value" ]` |
| watchdog.extraEnvs | list | `[]` | Environment variables to add to the container. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| watchdog.image | string | common.image | Docker image of wharf-cmd-watchdog. |
| watchdog.imagePullPolicy | string | common.imagePullPolicy | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images) |
| watchdog.imagePullSecrets | list | common.imagePullSecrets | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| watchdog.loglevel | string | `nil` | Logging level for wharf-cmd-watchdog. Possible values: `debug`, `info`, `warn`, `error`, and `panic`. |
| watchdog.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Selects which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| watchdog.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| worker.config | object | common.config | Configuration for wharf-cmd added only to the worker component. This is merged with `common.config`, where values here take precedence. [Read more (pkg.go.dev/github.com/iver-wharf/wharf-cmd)](https://pkg.go.dev/github.com/iver-wharf/wharf-cmd/pkg/config) |
| worker.extraArgs | list | `[]` | Arguments to add to the container. E.g `[ "--another-arg", "value" ]` |
| worker.extraEnvs | list | `[]` | Environment variables to add to the container. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| worker.image | string | common.image | Docker image of wharf-cmd-worker. |
| worker.imagePullPolicy | string | common.imagePullPolicy | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/containers/images/#updating-images) |
| worker.imagePullSecrets | list | common.imagePullSecrets | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| worker.vars | object | `{}` | Wharf built-in variables to use in a build. Each key-value pair will be available to all builds. |

## Changes

See the [CHANGELOG.md](./CHANGELOG.md) file inside this Helm chart.

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](https://github.com/iver-wharf/wharf-helm/blob/master/LICENSE).
