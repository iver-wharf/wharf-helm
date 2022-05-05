# Wharf Helm chart

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

**Homepage:** <https://github.com/iver-wharf/wharf-helm/blob/master/charts/wharf-cmd>

## Prerequisites

- Wharf API, for wharf-cmd-watchdog and wharf-cmd-aggregator to
  communicate with.

## Installing the Chart

To install the chart with the release name `my-release`:

```sh
helm repo add iver-wharf https://iver-wharf.github.io/wharf-helm
helm install wharf-cmd iver-wharf/wharf-cmd
```

## Default images

| GitHub repository | Quay.io version | Image
| ----------------- | --------------- | -----
| [iver-wharf/wharf-cmd](https://github.com/iver-wharf/wharf-cmd) | [![Version: latest](https://img.shields.io/badge/Version-latest-informational?style=flat-square)](https://quay.io/repository/iver-wharf/wharf-cmd) |`"quay.io/iver-wharf/wharf-cmd:latest"`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| aggregator.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| aggregator.enabled | bool | `true` | Enable the wharf-cmd-aggregator component. |
| aggregator.extraArgs | list | `[]` | (string[]) Arguments to add to the container. E.g `[ "--another-arg", "value" ]` |
| aggregator.extraEnvs | list | `[]` | Environment variables to add to the container. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| aggregator.image | string | common.image | Docker image of wharf-cmd-provisioner. |
| aggregator.loglevel | string | common.loglevel | Logging level for wharf-cmd-provisioner. Possible values: `debug`, `info`, `warn`, `error`, and `panic`. |
| aggregator.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Selects which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| aggregator.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| common.image | string | `"quay.io/iver-wharf/wharf-cmd:latest"` | Default Docker image for all components. The same image can be used for all wharf-cmd components as it uses the same binary to perform the different tasks. |
| common.loglevel | string | `"debug"` | Default logging level for all components. Possible values: `debug`, `info`, `warn`, `error`, and `panic`. |
| fullnameOverride | string | `""` | String to fully override the pod and service names. If set, deployments, services, ingresses, *etc*, will use this name, and `nameOverride` will be ignored. |
| global.instanceId | string | `"dev"` | Used by Wharf to differentiate between installations in the same namespace. |
| nameOverride | string | `""` | String to partially override the pod and service names. Will maintain the release name. |
| provisioner.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| provisioner.containerPort | int | `5009` | Container port. This needs to correlate to the port that the application listens on. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| provisioner.enabled | bool | `true` | Enable the wharf-cmd-provisioner component. |
| provisioner.extraArgs | list | `[]` | (string[]) Arguments to add to the container. E.g `[ "--another-arg", "value" ]` |
| provisioner.extraEnvs | list | `[]` | Environment variables to add to the container. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| provisioner.image | string | common.image | Docker image of wharf-cmd-provisioner. |
| provisioner.loglevel | string | common.loglevel | Logging level for wharf-cmd-provisioner. Possible values: `debug`, `info`, `warn`, `error`, and `panic`. |
| provisioner.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Selects which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| provisioner.servicePort | int | `80` | Service port. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service) |
| provisioner.serviceType | string | `"ClusterIP"` | Service type. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| provisioner.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| watchdog.affinity | object | `{}` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| watchdog.enabled | bool | `false` | Enable the wharf-cmd-watchdog component. |
| watchdog.extraArgs | list | `[]` | (string[]) Arguments to add to the container. E.g `[ "--another-arg", "value" ]` |
| watchdog.extraEnvs | list | `[]` | Environment variables to add to the container. [Read more (kubernetes.io)](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) |
| watchdog.image | string | common.image | Docker image of wharf-cmd-provisioner. |
| watchdog.loglevel | string | common.loglevel | Logging level for wharf-cmd-provisioner. Possible values: `debug`, `info`, `warn`, `error`, and `panic`. |
| watchdog.nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Selects which node to run on, based on node labels. [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/) |
| watchdog.tolerations | list | `[]` | [Read more (kubernetes.io/docs)](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |

## Changes

See the [CHANGELOG.md](./CHANGELOG.md) file inside this Helm chart.

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](https://github.com/iver-wharf/wharf-helm/blob/master/LICENSE).
