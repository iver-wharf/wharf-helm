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

- Added ability to set configs via: (#36)

  - `.Values.common.config`
  - `.Values.aggregator.config`
  - `.Values.provisioner.config`
  - `.Values.watchdog.config`

- Added ability to add additional command line arguments: (#36)

  - `.Values.aggregator.extraArgs`
  - `.Values.provisioner.extraArgs`
  - `.Values.watchdog.extraArgs`

## v0.1.0

- Initial release, based on wharf-cmd v0.8.0-rc.1. (#34)
