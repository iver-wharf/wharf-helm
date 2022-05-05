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
