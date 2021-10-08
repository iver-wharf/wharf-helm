{{/*
Expand the name of the chart.
*/}}
{{- define "wharf-helm.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wharf-helm.fullname" -}}
  {{- if .Values.fullnameOverride -}}
    {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- if contains $name .Release.Name -}}
      {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
      {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wharf-helm.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "wharf-helm.labels" -}}
helm.sh/chart: {{ include "wharf-helm.chart" . }}
{{ include "wharf-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "wharf-helm.selectorLabels" -}}
wharf.iver.com/instance: {{ .Values.global.instanceId | default "" | quote }}
app.kubernetes.io/name: {{ include "wharf-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "wharf-helm.serviceAccountName" -}}
  {{- if .Values.serviceAccount.create -}}
    {{ default (include "wharf-helm.fullname" .) .Values.serviceAccount.name }}
  {{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
  {{- end -}}
{{- end -}}

{{/*
Environment variable mapping.
If used in an environment variable object/map, then both of these:

  foo: bar

  foo:
    value: bar

...are synonymous and semantically identical, and will generate:

  - name: FOO_ENV
    value: bar

This allows other custom syntax such as:

  foo:
    valueFrom:
      secretKeyRef:
        name: my-secret-name
        key: foo

Which will generate:

  - name: FOO_ENV
    valueFrom:
      secretKeyRef:
        name: my-secret-name
        key: foo
*/}}
{{- define "wharf-helm.environmentValue" -}}
  {{- if not . -}}
    value: ""
  {{- else if eq (kindOf .) "map" -}}
    {{- toYaml . -}}
  {{- else -}}
    value: {{ toYaml . -}}
  {{- end -}}
{{- end -}}

{{/*
Environment variable mapping.
Takes a list as argument, where the first value is the environment value passed
on to wharf-helm.environmentValue, while the rest are the environment names.

Given the value:

  host: exampleValue

And the templating usage:

  {{- list .host "DBHOST" "WHARF_DB_HOST" | include "wharf-helm.environment" | nindent 12 }}

Which will generate:

  - name: DBHOST
    value: exampleValue
  - name: WHARF_DB_HOST
    value: exampleValue

*/}}
{{- define "wharf-helm.environment" -}}
  {{- $value := first . -}}
  {{- range $i, $envName := rest . -}}
    {{- if gt $i 0 -}}
      {{- printf "\n" -}}
    {{- end -}}
    - name: {{ $envName | quote }}
    {{- $value | include "wharf-helm.environmentValue" | nindent 2 }}
  {{- end -}}
{{- end -}}
