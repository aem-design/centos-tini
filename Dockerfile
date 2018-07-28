FROM       centos:latest

MAINTAINER devops <devops@aem.design>

LABEL   os.version="centos" \
        container.description="centos with tini"

ARG TINI_VERSION="v0.18.0"
ARG TINI_KEY="595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7"
ARG TINI_URL="https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static-amd64"

RUN curl -fsSL ${TINI_URL} -o /bin/tini && curl -fsSL ${TINI_URL}.asc -o /bin/tini.asc && gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys ${TINI_KEY} && gpg --verify /bin/tini.asc && chmod +x /bin/tini

ENTRYPOINT ["/bin/tini", "--"]