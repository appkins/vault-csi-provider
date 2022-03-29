# This Dockerfile contains multiple targets.
# Use 'docker build --target=<name> .' to build one.

# devbuild compiles the binary
# -----------------------------------

FROM docker.mirror.hashicorp.services/golang:1.17.6-windowsservercore AS devbuild
ENV CGO_ENABLED=0
# Leave the GOPATH
WORKDIR /build
COPY . ./
RUN go build -o vault-csi-provider

# dev runs the binary from devbuild
# -----------------------------------
FROM mcr.microsoft.com/windows/servercore:1809 AS dev
COPY --from=devbuild /build/vault-csi-provider.exe /vault-csi-provider.exe
ENTRYPOINT [ "/vault-csi-provider.exe" ]

# Default release image.
# -----------------------------------
FROM mcr.microsoft.com/windows/servercore:1809 AS default

ARG PRODUCT_VERSION
ARG PRODUCT_REVISION
ARG PRODUCT_NAME=vault-csi-provider
ARG TARGETOS TARGETARCH

LABEL version=$PRODUCT_VERSION
LABEL revision=$PRODUCT_REVISION

COPY dist/$TARGETOS/$TARGETARCH/vault-csi-provider.exe /vault-csi-provider.exe
ENTRYPOINT [ "/vault-csi-provider.exe" ]

# ===================================
# 
#   Set default target to 'dev'.
#
# ===================================
FROM dev
