# Chart wharf-cmd changes

This chart tries to follow [SemVer 2.0.0](https://semver.org/).

<!--
	When composing new changes to this list, try to follow convention.

	Since PR #6 we no longer specify WIP or date per version, in contrast to how
	we operate in our other iver-wharf repos. All changes are published as soon
	as they hit the master branch.

	A good source on conventions can be found here:
	https://changelog.md/
-->

## v0.3.2

- Fixed templating of wharf-cmd-provisioner's config of ConfigMap name to
  mount into wharf-cmd-worker. (#50)

## v0.3.1

- Changed version of wharf-cmd image from latest to v0.8.0. (#49)

## v0.3.0

- Added values to set wharf-cmd-worker configs as well: (#48)

  - `.Values.worker.config`
  - `.Values.worker.extraArgs`
  - `.Values.worker.extraEnvs`
  - `.Values.worker.imagePullPolicy`
  - `.Values.worker.imagePullSecrets`
  - `.Values.worker.image`

- Added values to set built-in variables: (#48)

  - `.Values.worker.vars`

## v0.2.1

- Changed documentation of Helm repo from
  `https://iver-wharf.github.io/wharf-helm` to
  `https://wharf.iver.com/wharf-helm` (#41)

## v0.2.0

- Added values to set configs via: (#36)

  - `.Values.common.config`
  - `.Values.aggregator.config`
  - `.Values.provisioner.config`
  - `.Values.watchdog.config`

- Added values to add additional command line arguments: (#36)

  - *no `.Values.common` variant*
  - `.Values.aggregator.extraArgs`
  - `.Values.provisioner.extraArgs`
  - `.Values.watchdog.extraArgs`

- Added values to set imagePullPolicy: (#36)

  - `.Values.common.imagePullPolicy`
  - `.Values.aggregator.imagePullPolicy`
  - `.Values.provisioner.imagePullPolicy`
  - `.Values.watchdog.imagePullPolicy`

- Added values to set imagePullSecrets: (#36)

  - `.Values.common.imagePullSecrets`
  - `.Values.aggregator.imagePullSecrets`
  - `.Values.provisioner.imagePullSecrets`
  - `.Values.watchdog.imagePullSecrets`

## v0.1.0

- Initial release, based on wharf-cmd v0.8.0-rc.1. (#34)
