# Wharf All-in-One chart

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) 
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://github.com/iver-wharf/wharf-helm/blob/master/charts/wharf-aino>

## Installing the Chart

To install the chart with the release name `my-release`:

```sh
helm repo add iver-wharf https://wharf.iver.com/wharf-helm
helm install wharf-aino iver-wharf/wharf-aino
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.instanceId | string | `"dev"` | Used in RabbitMQ & Jenkins to multiplex jobs and messages on the same instances while keeping track of their origin. |
| global.isProduction | bool | `false` | This flag is forwarded to the frontend where it can be used to show slightly different styling depending on if it's for production or not. |
| global.url | string | `"wharf.example.org"` | URL of this Wharf instance. Mostly only used in the `ingress` and `ingressRoute` settings to route the appropriate requests, but also in Wharf's API so it can properly refer to itself. |
| postgresql.auth.database | string | `"wharf"` |  |
| postgresql.auth.postgresPassword | string | `""` |  |
| postgresql.auth.username | string | `"postgres"` |  |
| postgresql.enabled | bool | `true` | If set to false, the Bitnami PostgreSQL subchart is skipped. |
| postgresql.fullnameOverride | string | `"wharf-aino-db"` |  |
| wharf-cmd.aggregator.config.aggregator.wharfApiUrl | string | `"http://wharf-aino-api:80"` |  |
| wharf-cmd.enabled | bool | `true` | If set to false, the wharf-cmd subchart (containing Wharf's execution engine) is skipped. |
| wharf-cmd.fullnameOverride | string | `"wharf-aino-cmd"` |  |
| wharf-cmd.watchdog.config.watchdog.provisionerUrl | string | `"http://wharf-aino-cmd-provisioner:80"` |  |
| wharf-cmd.watchdog.config.watchdog.wharfApiUrl | string | `"http://wharf-aino-api:80"` |  |
| wharf-cmd.watchdog.enabled | bool | `true` |  |
| wharf-helm.api.ciToken | string | `""` |  |
| wharf-helm.api.ciUrl | string | `""` |  |
| wharf-helm.api.db.host | string | `"wharf-aino-db"` |  |
| wharf-helm.api.db.name | string | `"wharf"` |  |
| wharf-helm.api.db.password.valueFrom.secretKeyRef.key | string | `"postgres-password"` |  |
| wharf-helm.api.db.password.valueFrom.secretKeyRef.name | string | `"wharf-aino-db"` |  |
| wharf-helm.api.db.username | string | `"postgres"` |  |
| wharf-helm.api.extraEnvs[0].name | string | `"WHARF_CI_ENGINE_NAME"` |  |
| wharf-helm.api.extraEnvs[0].value | string | `"wharf-cmd"` |  |
| wharf-helm.api.extraEnvs[1].name | string | `"WHARF_CI_ENGINE_ID"` |  |
| wharf-helm.api.extraEnvs[1].value | string | `"wharf-cmd"` |  |
| wharf-helm.api.extraEnvs[2].name | string | `"WHARF_CI_ENGINE_URL"` |  |
| wharf-helm.api.extraEnvs[2].value | string | `"http://wharf-aino-cmd-provisioner:80/api/worker"` |  |
| wharf-helm.api.extraEnvs[3].name | string | `"WHARF_CI_ENGINE_API"` |  |
| wharf-helm.api.extraEnvs[3].value | string | `"wharf-cmd.v1"` |  |
| wharf-helm.enabled | bool | `true` | If set to false, the wharf-helm subchart (containing wharf-api, wharf-web, and providers) is skipped. |
| wharf-helm.fullnameOverride | string | `"wharf-aino"` |  |
| wharf-helm.ingress.enabled | bool | `false` | Enables deploying a preconfigured Kubernetes Ingress to route traffic to the different Wharf services, using `global.url` as host name. |
| wharf-helm.ingressRoute.enabled | bool | `false` | Enables deploying a preconfigured Traefik IngressRoute to route traffic to the different Wharf services, using `global.url` as host name. |

## Changes

See the [CHANGELOG.md](./CHANGELOG.md) file inside this Helm chart.

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](https://github.com/iver-wharf/wharf-helm/blob/master/LICENSE).
