ARG FROM_IMAGE
FROM ${FROM_IMAGE}
ARG CA_ROOT
USER root
RUN apt update && apt install -y ca-certificates
COPY ${CA_ROOT} /opt/outline/${CA_ROOT}
COPY ${CA_ROOT} /usr/local/share/ca-certificates
RUN update-ca-certificates && chmod 644 /opt/outline/${CA_ROOT}
USER nodejs
ENV NODE_EXTRA_CA_CERTS=/opt/outline/${CA_ROOT}
