# Wharf All-in-One chart

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

**Homepage:** <https://github.com/iver-wharf/wharf-helm/blob/master/charts/wharf-aino>

## Installing the Chart

To install the chart with the release name `my-release`:

```sh
helm repo add iver-wharf https://iver-wharf.github.io/wharf-aino
helm install wharf-aino iver-wharf/wharf-aino
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.instanceId | string | `"dev"` | Used in RabbitMQ & Jenkins to multiplex jobs and messages on the same instances while keeping track of their origin. |
| global.isProduction | bool | `false` | This flag is forwarded to the frontend where it can be used to show slightly different styling depending on if it's for production or not. |
| global.url | string | `"wharf.example.org"` | URL of this Wharf instance. Mostly only used in the `ingress` and `ingressRoute` settings to route the appropriate requests, but also in Wharf's API so it can properly refer to itself. |
| postgresql.auth.database | string | `"wharf"` |  |
| postgresql.enabled | bool | `true` |  |
| wharf-cmd.aggregator.config.aggregator.wharfApiUrl | string | `"http://wharf-aino-wharf-helm-api:80"` |  |
| wharf-cmd.enabled | bool | `true` |  |
| wharf-cmd.watchdog.config.watchdog.provisionerUrl | string | `"http://wharf-aino-wharf-cmd-provisioner:80"` |  |
| wharf-cmd.watchdog.config.watchdog.wharfApiUrl | string | `"http://wharf-aino-wharf-helm-api:80"` |  |
| wharf-cmd.watchdog.enabled | bool | `true` |  |
| wharf-helm.api.ciToken | string | `""` |  |
| wharf-helm.api.ciUrl | string | `""` |  |
| wharf-helm.api.db.host | string | `"wharf-aino-postgresql"` |  |
| wharf-helm.api.db.name | string | `"wharf"` |  |
| wharf-helm.api.db.password.valueFrom.secretKeyRef.key | string | `"postgres-password"` |  |
| wharf-helm.api.db.password.valueFrom.secretKeyRef.name | string | `"wharf-aino-postgresql"` |  |
| wharf-helm.api.db.username | string | `"postgres"` |  |
| wharf-helm.api.extraEnvs[0].name | string | `"WHARF_CI_ENGINE_NAME"` |  |
| wharf-helm.api.extraEnvs[0].value | string | `"wharf-cmd"` |  |
| wharf-helm.api.extraEnvs[1].name | string | `"WHARF_CI_ENGINE_ID"` |  |
| wharf-helm.api.extraEnvs[1].value | string | `"wharf-cmd"` |  |
| wharf-helm.api.extraEnvs[2].name | string | `"WHARF_CI_ENGINE_URL"` |  |
| wharf-helm.api.extraEnvs[2].value | string | `"http://wharf-aino-wharf-cmd-provisioner:80/api/worker"` |  |
| wharf-helm.api.extraEnvs[3].name | string | `"WHARF_CI_ENGINE_API"` |  |
| wharf-helm.api.extraEnvs[3].value | string | `"wharf-cmd.v1"` |  |
| wharf-helm.enabled | bool | `true` |  |
| wharf-helm.ingress.enabled | bool | `false` | Enables deploying a preconfigured Kubernetes Ingress to route traffic to the different Wharf services, using `global.url` as host name. |
| wharf-helm.ingressRoute.enabled | bool | `false` | Enables deploying a preconfigured Traefik IngressRoute to route traffic to the different Wharf services, using `global.url` as host name. |

## Changes

See the [CHANGELOG.md](./CHANGELOG.md) file inside this Helm chart.

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](https://github.com/iver-wharf/wharf-helm/blob/master/LICENSE).