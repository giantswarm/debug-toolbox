FROM alpine:3.24.1

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk add --no-cache curl jq

# buildx sets TARGETARCH per platform (amd64, arm64); fetch the kubectl build
# for the image's own architecture so the arm64 image does not carry an amd64
# binary. One RUN keeps the tarball out of the image layers.
ARG TARGETARCH
ARG KUBERNETES_VERSION=v1.28.3
RUN curl -fsSL "https://dl.k8s.io/${KUBERNETES_VERSION}/kubernetes-client-linux-${TARGETARCH}.tar.gz" \
      | tar -xz -C /tmp && \
    mv /tmp/kubernetes/client/bin/kubectl /usr/local/bin/kubectl && \
    rm -rf /tmp/kubernetes && \
    chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["/bin/sh"]
