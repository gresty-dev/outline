# ARG FROM_IMAGE
# ARG CA_ROOT
FROM outlinewiki/outline:0.75.0
USER root
RUN apk --no-cache add ca-certificates
COPY ${CA_ROOT} /opt/outline/${CA_ROOT}
COPY ${CA_ROOT} /usr/local/share/ca-certificates
RUN update-ca-certificates && chmod 644 /opt/outline/${CA_ROOT}
USER node
ENV NODE_EXTRA_CA_CERTS=/opt/outline/${CA_ROOT}
