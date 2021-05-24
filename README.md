# Wharf Helm chart

Download helm from: <https://github.com/helm/helm/releases>, unpack and move
binaries to most convenient place for you.

For more information surf to install guide: <https://helm.sh/docs/intro/install/>

On windows add helm path to PATH in environment variables.

Do a test render into stdout using helm template:

```sh
# helm v2
helm template wharf-helm
# helm v3
helm template wharf-helm --generate-name
```

Test for common errors using `helm lint`:

```sh
helm lint wharf-helm
```

To install the chart on kubernetes cluster use command:

Locally

```sh
helm install wharf --namespace wharf ./wharf
```

Repo

```sh
helm repo add wharf https://<url_when_public>/wharf-charts
helm repo update
helm install wharf --namespace wharf wharf/wharf
```

Use -f values.yaml and point it to a modified values.yaml file to overrride
default values.

## Publishing

1. Add a merge request to set the date of the deployment in the chart's
   "Changes" section of the `wharf-helm/README.md` file.

   ```diff
   diff --git a/wharf-helm/README.md b/wharf-helm/README.md
   index 050b39f..68ff38f 100644
   --- a/wharf-helm/README.md
   +++ b/wharf-helm/README.md
   @@ -2,7 +2,7 @@
   
    ## Changes
   
    -### 1.0.0 (WIP)
    +### 1.0.0 (2021-02-12)
   
     - BREAKING: Changed `.Values.postgres` to `.Values.postgresKubeDB`
   ```

2. Doublecheck that the version in `Chart.yaml` is correct for the chart.

3. Run a build in Wharf to build the stage that packages the chart.

4. Tag the latest commit on `master` with the version, prefixed with "v":

   ```sh
   git checkout master

   git pull

   git tag v1.0.0 -m "wharf-helm v1.0.0"
   ```

5. Done!

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](./LICENSE).
