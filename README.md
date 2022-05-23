# Wharf Helm chart

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/6d3504733d1844c49a8678633b1a78f8)](https://www.codacy.com/gh/iver-wharf/wharf-helm/dashboard?utm_source=github.com\&utm_medium=referral\&utm_content=iver-wharf/wharf-helm\&utm_campaign=Badge_Grade)

Repository of Wharf's [Helm](https://helm.sh/) charts.

## Helm charts in this repo

<!--lint disable maximum-line-length -->

| Chart | Description |
| ----- | ----------- |
| [wharf-helm](charts/wharf-helm/README.md) | Deploy Wharf to Kubernetes using Helm |
| [wharf-cmd](charts/wharf-cmd/README.md)   | Deploy wharf-cmd, Wharf's execution engine, to Kubernetes |
| [wharf-aino](charts/wharf-aino/README.md) | All-in-One Wharf deployment, including Postgres |

<!--lint enable maximum-line-length -->

To start using, add the Wharf Helm chart repository:

```sh
helm repo add iver-wharf https://wharf.iver.com/wharf-helm
```

## Generating `charts/*/README.md`

The `README.md` files in each chart is generated using
[norwoodj/helm-docs](https://github.com/norwoodj/helm-docs).

1. Install `helm-docs`. Installation instructions can be found at:
   <https://github.com/norwoodj/helm-docs#installation>

   If you have Go installed, you may run:

   ```sh
   go install github.com/norwoodj/helm-docs/cmd/helm-docs@v1.9.1
   ```

2. Run `helm-docs`, preferrably before you create your pull requests:

   ```sh
   helm-docs
   ```

3. Commit the changes on the `README.md` files.

## Publishing

The charts in this repository are published automatically using
[helm/chart-releaser](https://github.com/helm/chart-releaser). No further
action is required except getting your change into the `master` branch.

If you need to group changes into a single release, it's suggested to instead
follow git-flow and create a release branch, like so:

```sh
git checkout master

git pull

git checkout -b release/wharf-helm/v1.2.0
```

Then target all your grouped changes and PRs to that release branch.
Once you're ready to deploy it you create a pull request from that release
branch over to `master`, where it will be published automatically as soon as
it's merged.

## Linting

```sh
make deps # download linting dependencies

make lint

make lint-helm # only lint Helm charts
make lint-md # only lint Markdown files
```

Some errors can be fixed automatically. Keep in mind that this updates the
files in place.

```sh
make lint-fix

#make lint-fix-helm # Helm linter does not support fixes
make lint-fix-md # only lint and fix Markdown files
```

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](./LICENSE).
