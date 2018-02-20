FROM openjdk:8u131-jdk-alpine

EXPOSE 8080

LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
      io.s2i.scripts-url=image:///usr/libexec/s2i

RUN apk --update add \
    bash \
    && rm -rf /var/lib/apt/lists/* \
    && rm /var/cache/apk/*

RUN mkdir -p /usr/libexec/s2i
ENV STI_SCRIPTS_URL=image:///usr/libexec/s2i
ENV STI_SCRIPTS_PATH=/usr/libexec/s2i
COPY ./s2i/bin/ /usr/libexec/s2i

RUN mkdir -p /opt/app-root/src
ENV APP_ROOT=/opt/app-root
ENV HOME=/opt/app-root/src
WORKDIR /opt/app-root/src

CMD $STI_SCRIPTS_PATH/usage
