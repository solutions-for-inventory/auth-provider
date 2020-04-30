FROM centos:latest
RUN mkdir -p /opt/auth-provider/
# ARG BINARY_PATH
WORKDIR /opt/auth-provider
RUN dnf clean all && rm -r /var/cache/dnf  && dnf upgrade -y && dnf update -y && dnf install -y \
  ca-certificates \
  postgresql-devel
COPY target /opt/auth-provider
COPY config /opt/auth-provider/config
COPY webroot /opt/auth-provider/webroot
CMD ["/opt/auth-provider/auth-provider"]
