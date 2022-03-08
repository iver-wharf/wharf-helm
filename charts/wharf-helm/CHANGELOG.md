# Chart wharf-helm changes

This chart tries to follow [SemVer 2.0.0](https://semver.org/).

<!--
	When composing new changes to this list, try to follow convention.

	Since PR #6 we no longer specify WIP or date per version, in contrast to how
	we operate in our other iver-wharf repos. All changes are published as soon
	as they hit the master branch.

	A good source on conventions can be found here:
	https://changelog.md/
-->

## v3.1.1

- Changed image version of `api` from v5.0.0 to v5.1.2. (#32)

## v3.1.0

- Added OIDC config values for Web via the new `web.oidcEnabled` and
  `web.oidc.*` values. (#31)

## v3.0.0

- BREAKING: Removes support for wharf-api v4.x.x and older.

- BREAKING: Changed image version of `api` from v4.2.0 to v5.0.0. (#27)

  See the changes on the release page [v5.0.0 wharf-api](https://github.com/iver-wharf/wharf-api/releases/tag/v5.0.0)
  to list all breaking changes.

- Removed all `api.rabbitmq.*` values, as wharf-api v5.0.0 dropped support for
  RabbitMQ. (#27)

- Removed all old environment variable mappings for the `api`, which were
  marked as deprecated in wharf-helm v2.1.0: (#27)

  - `WHARF_INSTANCE`
  - `CI_URL`
  - `CI_TOKEN`
  - `BASIC_AUTH`
  - `BASIC_AUTH`
  - `BIND_ADDRESS`
  - `DBLOG`
  - `DBLOG`
  - `DBDRIVER`
  - `DBNAME`
  - `DBUSER`
  - `DBPASS`
  - `DBPORT`
  - `DBHOST`
  - `DBMAXIDLECONNS`
  - `DBMAXOPENCONNS`
  - `DBMAXCONNLIFETIME`

## v2.1.4

- Changed image version of `web` from v1.5.0 to v1.5.1. (#26)
- Added ArtifactHub annotations to Chart.yaml. (#26)

## v2.1.3

- Changed image version of provider `gitlab` from v1.2.0 to v1.3.0. (#25)

## v2.1.2

- Changed image version of `web` from v1.4.0 to v1.5.0. (#24)

## v2.1.1

- Fixed issue where `api.bindAddress` value was applied to both
  `WHARF_HTTP_BINDADDRESS` and `WHARF_HTTP_BASICAUTH`. (#23)

## v2.1.0

- Added new environment variable mappings. The old ones are still applied. (#22)

  - `api.ciUrl`: `WHARF_CI_TRIGGERURL` (was `CI_URL`)
  - `api.ciToken`: `WHARF_CI_TRIGGERTOKEN` (was `CI_TOKEN`)
  - `api.http.basicAuth`: `WHARF_HTTP_BASICAUTH` (was `BASIC_AUTH`)
  - `api.http.bindAddress`: `WHARF_HTTP_BINDADDRESS` (was `BIND_ADDRESS`)
  - `api.db.driver`: `WHARF_DB_DRIVER` (was `DBDRIVER`)
  - `api.db.name`: `WHARF_DB_NAME` (was `DBNAME`)
  - `api.db.username`: `WHARF_DB_USERNAME` (was `DBUSER`)
  - `api.db.password`: `WHARF_DB_PASSWORD` (was `DBPASS`)
  - `api.db.host`: `WHARF_DB_HOST` (was `DBHOST`)
  - `api.db.port`: `WHARF_DB_PORT` (was `DBPORT`)
  - `api.rabbitmq.enabled`: `WHARF_MQ_ENABLED` (was `RABBITMQENABLED`)
  - `api.rabbitmq.username`: `WHARF_MQ_USERNAME` (was `RABBITMQUSER`)
  - `api.rabbitmq.password`: `WHARF_MQ_PASSWORD` (was `RABBITMQPASS`)
  - `api.rabbitmq.host`: `WHARF_MQ_HOST` (was `RABBITMQHOST`)
  - `api.rabbitmq.port`: `WHARF_MQ_PORT` (was `RABBITMQPORT`)
  - `api.rabbitmq.vHost`: `WHARF_MQ_VHOST` (was `RABBITMQVHOST`)
  - `api.rabbitmq.name`: `WHARF_MQ_NAME` (was `RABBITMQNAME`)
  - `api.rabbitmq.connAttempts`: `WHARF_MQ_CONNATTEMPTS` (was `RABBITMQCONNATTEMPTS`)

- Added more environment variables for the Wharf API: (#22)

  - `.Values.api.db.maxIdleConns`: `DBMAXIDLECONNS` & `WHARF_DB_MAXIDLECONNS`
  - `.Values.api.db.maxOpenConns`: `DBMAXOPENCONNS` & `WHARF_DB_MAXOPENCONNS`
  - `.Values.api.db.maxConnLifetime`: `DBMAXCONNLIFETIME` & `WHARF_DB_MAXCONNLIFETIME`

- Added `WHARF_DB_LOG=false` environment variable to wharf-api service when
  `.Values.global.isProduction` is set, which will suppress debug logs. (#22)

## v2.0.0

- BREAKING: Changed image version of `providers.azuredevops` from v1.2.0 to
  v2.0.1. (#20)

  See the changes on the release page [v2.0.0 wharf-provider-azuredevops](https://github.com/iver-wharf/wharf-provider-azuredevops/releases/tag/v2.0.0)
  to list all breaking changes.

- Changed image version of `web` from v1.3.3 to v1.4.0. (#20)

- Changed image version of `api` from v4.1.1 to v4.2.0. (#20)

## v1.2.1

- Changed image version of `web` from v1.3.1 to v1.3.3. (#18)
- Changed image version of `api` from v4.1.0 to v4.1.1. (#18)
- Changed image version of `providers.github` from v1.1.1 to v2.0.0. (#18)
- Changed image version of `providers.gitlab` from v1.1.1 to v1.2.0. (#18)
- Changed image version of `providers.azuredevops` from v1.1.1 to v1.2.0. (#18)

## v1.2.0

- Added more environment variables for the Wharf API: (#17)

  - `.Values.api.http.basicAuth`: `BASIC_AUTH`
  - `.Values.api.http.bindAddress`: `BIND_ADDRESS`

- Added more environment variables for the Wharf providers: (#17)

  - `.Values.provider.X.http.bindAddress`: `BIND_ADDRESS`
  - `.Values.provider.X.urlOverride`: `WHARF_URL`
  - `.Values.provider.X.apiUrlOverride`: `WHARF_API_URL`

## v1.1.6

- Changed image version of `web` from v1.3.0 to v1.3.1. (#16)
- Changed image version of `api` from v4.0.0 to v4.1.0. (#16)

## v1.1.5

- Changed image version of `web` from v1.2.0 to v1.3.0. (#15)

- Added `GIN_MODE=release` environment variable to all API services when
  `.Values.global.isProduction` is set, which will suppress debug logs. (#15)

## v1.1.2-v1.1.4

- Changed documentation. Nothing major. (#12, #13, #14)

## v1.1.1

- Changed to use real [Quay.io images](https://quay.io/organization/iver-wharf)
  instead of our temporary fake images in the `values.yaml` file. (#11)

- Fixed web to use correct livenessProbe & readinessProbe. Accidentally used
  the probe configs for the API on both the API and the web. (#11)

## v1.1.0

- Added `livenessProbe` and `readinessProbe` configs to `.Values.api` and
  to `.Values.web`. (#8)

- Added `.Values.ingressRoute.extraRoutes` and `.Values.ingress.extraPaths` to
  define routes/paths in addition to the existing routes added for the
  web (`/`), provider APIs (`/import/*`), and the main API (`/api`). (#6)

- Fixed error with `.Values.web.imagePullPolicy` in `web.yaml`. (#6)

- Fixed missing `service.port` -> `servicePort` translations. (#6)

- Fixed missing ports on providers in Ingress and IngressRoute when leaving
  values unset. (#6)

## v1.0.0 (2021-05-24)

- BREAKING: Changed `.Values.ingressRoute` structure a lot. Check the
  `values.yaml` for reference. (!13)

- BREAKING: Moved a lot of settings around. (!17, !19, !20)

  | Old value (0.8.0 and lower)      | New value (1.0.0 and higher)
  | ---------------------------      | ----------------------------
  | `.Values.X.image.pullPolicy`     | `.Values.providers.X.imagePullPolicy`
  | `.Values.X.image.repository`     | `.Values.providers.X.image`
  | `.Values.X.image.version`        | *merged with `.Values.providers.X.image`*
  | `.Values.X.securityContext`      | `.Values.providers.X.containerSecurityContext`
  | `.Values.X.service.port`         | `.Values.providers.X.servicePort`
  | `.Values.X.service.type`         | `.Values.providers.X.serviceType`
  | `.Values.api.env`                | `.Values.api.extraEnvs`
  | `.Values.api.image.pullPolicy`   | `.Values.providers.api.imagePullPolicy`
  | `.Values.api.image.repository`   | `.Values.providers.api.image`
  | `.Values.api.image.version`      | *merged with `.Values.providers.api.image`*
  | `.Values.api.securityContext`    | `.Values.providers.api.containerSecurityContext`
  | `.Values.api.service.port`       | `.Values.api.servicePort`
  | `.Values.api.service.type`       | `.Values.api.serviceType`
  | `.Values.postgres`               | *removed*
  | `.Values.webNg.image.pullPolicy` | `.Values.web.imagePullPolicy`
  | `.Values.webNg.image.repository` | `.Values.web.image`
  | `.Values.webNg.image.version`    | *merged with `.Values.web.image`*
  | `.Values.webNg.service.port`     | `.Values.web.servicePort`
  | `.Values.webNg.service.type`     | `.Values.web.serviceType`
  | `.Values.webNg`                  | `.Values.web`

- BREAKING: Changed provider pods labels from `component={providerName}` to
  `wharf.iver.com/provider={providerName}`. (!17)

- BREAKING: Added new `.Values.providers` map, replacing the old
  `.Values.gitlab`, `.Values.azuredevops`, `.Values.github`. (!19)

- BREAKING: Removed the `.Values.gitlab`, `.Values.github`, and
  `.Values.azuredevops` maps. Please use `.Values.providers.gitlab` (etc.)
  instead. Please note that some properties in the provider settings have been
  renamed. (!17)

- BREAKING: Renamed the web pods from `web-ng` and settings from `webNg` to
  both just `web`. (!20)

- BREAKING: Removed Postgres provisioning via `.Values.postgres`. You now
  have to deploy Postgres through a different Chart or deployment. (!19)

- Added `.Values.api.containerPort` to change the port on the container. This
  needs to map with the port that the Wharf API image listens on. (!19)

- Added environment variable `WHARF_PROVIDER_URL_BASE` to provider pods,
  with a value of `/import/{.Values.providers.X.name}`. (!17)

- Added `.Values.global.instanceId` that sets the `WHARF_INSTANCE`
  environment variable on the Wharf API and the `wharf.iver.com/instance`
  label throughout. (!21)

- Added settings in the Helm values file that are applied as environment
  variables to the Wharf API: (!19, !21, !22)

  - `.Values.api.db.driver`: `DBDRIVER`
  - `.Values.api.db.name`: `DBNAME`
  - `.Values.api.db.username`: `DBUSER`
  - `.Values.api.db.password`: `DBPASS`
  - `.Values.api.db.host`: `DBHOST`
  - `.Values.api.db.port`: `DBPORT`
  - `.Values.global.instanceId`: `WHARF_INSTANCE`
  - `.Values.api.ciUrl`: `CI_URL`
  - `.Values.api.ciToken`: `CI_TOKEN`
  - `.Values.api.rabbitmq.enabled`: `RABBITMQENABLED`
  - `.Values.api.rabbitmq.username`: `RABBITMQUSER`
  - `.Values.api.rabbitmq.password`: `RABBITMQPASS`
  - `.Values.api.rabbitmq.host`: `RABBITMQHOST`
  - `.Values.api.rabbitmq.port`: `RABBITMQPORT`
  - `.Values.api.rabbitmq.vHost`: `RABBITMQVHOST`
  - `.Values.api.rabbitmq.name`: `RABBITMQNAME`
  - `.Values.api.rabbitmq.connAttempts`: `RABBITMQCONNATTEMPTS`

- Changed so Ingress and IngressRoute now uses `.Values.global.url` instead of
  its own hosts definition. (!13)

- Removed `.Values.global.environment`. Please use `.Values.global.instanceId`
  instead. (!21)

- Removed `IdentityServer` property from the Wharf web ConfigMap as it's
  unused. (!20)

- Changed Docker image versions of Wharf's components: (!24)

  - Web: v0.7.12 -> v1.1.0
  - API: v0.7.9 -> v3.0.0
  - GitLab provider: 0.7.1 -> v1.1.0
  - GitHub provider: 0.7.1 -> v1.1.0
  - Azure DevOps provider: 0.7.1 -> v1.1.0

## v0.8.0 (2020-11-02)

- Added Traefik IngressRoute config under `.Values.ingressRoute`. (!11, !12)
- Added Postgres via KubeDB config under `.Values.postgres`. (!11, !12)

## v0.7.7 (2020-10-21)

- BREAKING: Deprecated old `.Values.web` in favor of new `.Values.webNg`. (!7)

## v0.7.6 (2020-04-30)

- Fixed invalid JSON syntax in web-ng deployment of ConfigMap that was
  introduced in v0.7.3. (!6)

## v0.7.5 (2020-04-29)

- Fixed invalid placement of pod `volumes` definition in the web-ng deployment
  that was introduced in v0.7.3. (!5)

## v0.7.4 (2020-04-28)

- Fixed invalid Helm `with` statement usage in the web-ng deployment that was
  introduced in v0.7.3. (!4)

## v0.7.3 (2020-04-23)

- Added web-ng deployment, configured via `.Values.webNg`. (!3)

## v0.7.2 (2020-03-11)

- BREAKING: Changed from using `.Chart.AppVersion` for image versions and
  instead use `.Values.api.image.version`, `.Values.github.image.version`,
  *and so on*, as the services was changed to have independant versioning. (!2)

- Changed readiness/liveness probe paths from `/` to `/health` for the api
  deployment. (!1)

## v0.7.1 (2020-02-21)

- Changed `appVersion` in `Chart.yaml` from v0.5.5 to v0.7.0. (56657f70)

## v0.7.0 (2020-02-03)

- BREAKING: Changed `JENKINS_URL` and `JENKINS_TOKEN` environment variables to
  `CI_URL` and `CI_TOKEN`, respectively, to reflect the changes in the main API
  v0.6.0.  (434a5458)

## v0.1.9 (2020-01-28)

- BREAKING: Added deployments for the split and separate import services,
  removing the old "import" deployment in the process for the new "github",
  "gitlab", and "tfs" deployments. (022bc181)

## v0.1.8 (2020-01-23)

- Changed `appVersion` in `Chart.yaml` to be prefixed with a "v". (91c36332)
- Fixed repository paths for Docker images as they've moved. (e21d5a23)

## v0.1.7 (2020-01-22)

- Added `.wharf-ci.yml` to `wharf-helm` directory. (5873cc5e)
- Changed `appVersion` field in `Chart.yaml` from 0.5.2 to 0.5.5. (9eb87007)

## v0.1.6 (2019-11-05)

- Fixed api service using port 80, while the service actually uses port 8080.
  (3ac19d02)

## v0.1.5 (2019-11-05)

- Changed `version` and `appVersion` fields in `Chart.yaml`. (73b37861)
  - version from 0.1.0 to 0.1.1
  - appVersion from 0.5.1 to 0.5.2

## v0.1.4 (2019-11-05)

- Fixed web service using port 80, while the service actually uses port 8080.
  (d40bc297)

## v0.1.3 (2019-11-05)

- Added emptyDir volume mounts to web for nginx's caching. (fd083ea2)

## v0.1.2 (2019-11-05)

- Fixed missing `$fullName` definition. (0d039bf8)

## v0.1.1 (2019-11-05)

- Added `WHARF_API_URL` environment variable to import service. (fbb9411b)

## v0.1.0 (2019-11-05)

- Added deployments of the web, api, and import services.
  (fba2cb83, f0dd6c52, b701a06c, 0f14229f)

- Added basic values maps for different services: (e49ec2a4)
  - `.Values.web`
  - `.Values.api`
  - `.Values.import`

- Added `.wharf-ci.yml`. (d50049e8)

- Added basic templates. (95ffaa05)
