{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{ .Values.coreapi.name }}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "app.fullname" -}}
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
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Generate basic labels */}}
{{- define "app.Labels" }}
app: {{ .Values.coreapi.name }}
env: {{ .Values.namespace }}
{{- end }}

{{- define "postit.Labels" }}
app: {{ .Values.postit.name }}
env: {{ .Values.namespace }}
{{- end }}

{{- define "sqs.Labels" }}
app: {{ .Values.sqs.name }}
env: {{ .Values.namespace }}
{{- end }}

{{- define "dashboard.Labels" }}
app: {{ .Values.dashboard.name }}
env: {{ .Values.namespace }}
{{- end }}

{{- define "truefill.Labels" }}
app: {{ .Values.truefill.name }}
env: {{ .Values.namespace }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "app.selectorLabels" -}}
app: {{ .Values.coreapi.name }}
{{- end -}}

{{- define "app.postitselectorLabels" -}}
app: {{ .Values.postit.name }}
{{- end -}}

{{- define "app.sqsselectorLabels" -}}
app: {{ .Values.sqs.name }}
{{- end -}}

{{- define "app.dashboardselectorLabels" -}}
app: {{ .Values.dashboard.name }}
{{- end -}}

{{- define "app.truefillselectorLabels" -}}
app: {{ .Values.truefill.name }}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "app.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

