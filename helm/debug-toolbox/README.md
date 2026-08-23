# debug-toolbox

The debug toolbox is a collection of tools that can be used to debug issues in a Kubernetes cluster.

**Homepage:** <https://github.com/giantswarm/debug-toolbox>

## Source Code

* <https://github.com/giantswarm/debug-toolbox>
* <https://raw.githubusercontent.com/giantswarm/debug-toolbox/v1.0.0/README.md>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.podSecurityStandards.enforced | bool | `true` |  |
| global.podSecurityStandards.extraRules | list | `[]` |  |
| affinity | object | `{}` |  |
| extraHostPaths | list | `[]` |  |
| hostNetwork | bool | `false` |  |
| hostPID | bool | `false` |  |
| hostIPC | bool | `false` |  |
| image.registry | string | `"gsoci.azurecr.io"` |  |
| image.debugContainerImage.name | string | `"giantswarm/debug-toolbox"` |  |
| image.debugContainerImage.tag | string | `"1.0.0"` |  |
| image.pauseContainerImage.name | string | `"giantswarm/pause-amd64"` |  |
| image.pauseContainerImage.tag | float | `3.3` |  |
| policyExceptionNamespace | string | `"policy-exceptions"` |  |
| masterOnly | bool | `false` |  |
| nodeSelector | object | `{}` |  |
| priorityClassName | string | `"system-node-critical"` |  |
| rbac.rules[0].apiGroup[0] | string | `""` |  |
| rbac.rules[0].resource[0] | string | `"nodes"` |  |
| rbac.rules[0].verbs[0] | string | `"update"` |  |
| rbac.rules[0].verbs[1] | string | `"patch"` |  |
| rbac.rules[0].verbs[2] | string | `"get"` |  |
| rbac.rules[0].verbs[3] | string | `"list"` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"100Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"100Mi"` |  |
| securityContext.runAsUser | int | `0` |  |
| securityContext.runAsGroup | int | `0` |  |
| securityContext.allowPrivilegeEscalation | bool | `true` |  |
| securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| securityContext.capabilities.add[1] | string | `"SYS_TIME"` |  |
| securityContext.capabilities.add[2] | string | `"NET_RAW"` |  |
| tolerations | list | `[]` |  |
