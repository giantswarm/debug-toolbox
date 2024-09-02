{{- define "debug-toolbox.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "debug-toolbox.fullname" -}}
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
Common labels
*/}}
{{- define "labels.common" -}}
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | quote }}
{{- end -}}

{{- define "debug-toolbox.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "debug-toolbox.tolerations" -}}
{{- if .Values.masterOnly -}}
tolerations:
- effect: NoSchedule
  operator: "Exists"
  key: node-role.kubernetes.io/control-plane
{{- else if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end -}}
{{- end -}}

{{- define "debug-toolbox.nodeSelector" -}}
{{- if .Values.masterOnly -}}
nodeSelector:
  kubernetes.io/role: master
{{- else if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2 }}
{{- end -}}
{{- end -}}

{{- define "debug-toolbox.affinity" -}}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end -}}

{{- define "debug-toolbox.extraVolumes" -}}
{{- range .Values.extraHostPaths }}
- name: {{ .name }}
  hostPath:
    path: {{ .hostPath }}
{{- end }}
{{- end -}}

{{- define "debug-toolbox.extraVolumeMounts" -}}
{{- range .Values.extraHostPaths }}
- name: {{ .name }}
  mountPath: {{ .mountPath }}
{{- end }}
{{- end -}}


