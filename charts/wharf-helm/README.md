# Wharf Helm chart

![Version: 1.1.1](https://img.shields.io/badge/Version-1.1.1-informational?style=flat-square)
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

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| api.ciToken | string | `"changeit"` |  |
| api.ciUrl | string | `"http://jenkins.example.com/generic-webhook-trigger/invoke"` |  |
| api.containerPort | int | `8080` |  |
| api.db.driver | string | `"postgres"` |  |
| api.db.host | string | `"wharf-db"` |  |
| api.db.name | string | `"wharf"` |  |
| api.db.password | string | `"changeit"` |  |
| api.db.port | string | `"5432"` |  |
| api.db.username | string | `"postgres"` |  |
| api.extraEnvs | string | `nil` |  |
| api.image | string | `"quay.io/iver-wharf/wharf-api:v4.0.0"` |  |
| api.livenessProbe.httpGet.path | string | `"/health"` |  |
| api.livenessProbe.httpGet.port | string | `"http"` |  |
| api.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| api.rabbitmq.connAttempts | string | `"10"` |  |
| api.rabbitmq.enabled | bool | `false` |  |
| api.rabbitmq.host | string | `"rabbitmq.local"` |  |
| api.rabbitmq.name | string | `"wharf_queue"` |  |
| api.rabbitmq.password | string | `"changeit"` |  |
| api.rabbitmq.port | string | `"5672"` |  |
| api.rabbitmq.username | string | `"user"` |  |
| api.rabbitmq.vHost | string | `"/"` |  |
| api.readinessProbe.httpGet.path | string | `"/health"` |  |
| api.readinessProbe.httpGet.port | string | `"http"` |  |
| api.replicaCount | int | `1` |  |
| api.servicePort | int | `80` |  |
| api.serviceType | string | `"ClusterIP"` |  |
| fullnameOverride | string | `""` |  |
| global.instanceId | string | `"dev"` |  |
| global.isProduction | bool | `false` |  |
| global.url | string | `"wharf.example.org"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.apiVersion | string | `"networking.k8s.io/v1beta1"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.tls | object | `{}` |  |
| ingressRoute.apiVersion | string | `"traefik.containo.us/v1alpha1"` |  |
| ingressRoute.enabled | bool | `false` |  |
| ingressRoute.entries[0].entryPoints[0] | string | `"web"` |  |
| ingressRoute.entries[0].name | string | `"http"` |  |
| ingressRoute.entries[1].entryPoints[0] | string | `"websecure"` |  |
| ingressRoute.entries[1].name | string | `"https"` |  |
| ingressRoute.entries[1].tls.secretName | string | `"wharf-example-tls"` |  |
| nameOverride | string | `""` |  |
| providers.azuredevops.enabled | bool | `true` |  |
| providers.azuredevops.image | string | `"quay.io/iver-wharf/wharf-provider-azuredevops:v1.1.1"` |  |
| providers.azuredevops.imagePullPolicy | string | `"IfNotPresent"` |  |
| providers.azuredevops.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| providers.azuredevops.resources.limits.cpu | string | `"100m"` |  |
| providers.azuredevops.resources.limits.memory | string | `"128Mi"` |  |
| providers.azuredevops.resources.requests.cpu | string | `"100m"` |  |
| providers.azuredevops.resources.requests.memory | string | `"128Mi"` |  |
| providers.github.enabled | bool | `true` |  |
| providers.github.image | string | `"quay.io/iver-wharf/wharf-provider-github:v1.1.1"` |  |
| providers.github.imagePullPolicy | string | `"IfNotPresent"` |  |
| providers.github.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| providers.github.resources.limits.cpu | string | `"100m"` |  |
| providers.github.resources.limits.memory | string | `"128Mi"` |  |
| providers.github.resources.requests.cpu | string | `"100m"` |  |
| providers.github.resources.requests.memory | string | `"128Mi"` |  |
| providers.gitlab.enabled | bool | `true` |  |
| providers.gitlab.image | string | `"quay.io/iver-wharf/wharf-provider-gitlab:v1.1.1"` |  |
| providers.gitlab.imagePullPolicy | string | `"IfNotPresent"` |  |
| providers.gitlab.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| providers.gitlab.resources.limits.cpu | string | `"100m"` |  |
| providers.gitlab.resources.limits.memory | string | `"128Mi"` |  |
| providers.gitlab.resources.requests.cpu | string | `"100m"` |  |
| providers.gitlab.resources.requests.memory | string | `"128Mi"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| web.containerPort | int | `8080` |  |
| web.image | string | `"quay.io/iver-wharf/wharf-web:v1.2.0"` |  |
| web.livenessProbe.httpGet.path | string | `"/"` |  |
| web.livenessProbe.httpGet.port | string | `"http"` |  |
| web.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| web.readinessProbe.httpGet.path | string | `"/"` |  |
| web.readinessProbe.httpGet.port | string | `"http"` |  |
| web.replicaCount | int | `1` |  |
| web.servicePort | int | `80` |  |
| web.serviceType | string | `"ClusterIP"` |  |
| web.volumeMounts[0].mountPath | string | `"/var/cache/nginx"` |  |
| web.volumeMounts[0].name | string | `"cache"` |  |
| web.volumeMounts[1].mountPath | string | `"/run"` |  |
| web.volumeMounts[1].name | string | `"run"` |  |
| web.volumes[0].emptyDir | object | `{}` |  |
| web.volumes[0].name | string | `"cache"` |  |
| web.volumes[1].emptyDir | object | `{}` |  |
| web.volumes[1].name | string | `"run"` |  |

## Changes

See the [CHANGELOG.md](./CHANGELOG.md) file inside this Helm chart.

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](https://github.com/iver-wharf/wharf-helm/blob/master/LICENSE).
