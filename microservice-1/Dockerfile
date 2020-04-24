FROM alpine:latest

LABEL maintainer="ramesh.hanumanthappa@orbit.de"

ARG JMETER_VERSION="5.2.1"

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin
ENV MIRROR_HOST http://mirrors.ocf.berkeley.edu/apache/jmeter
ENV JMETER_DOWNLOAD_URL ${MIRROR_HOST}/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_PLUGINS_DOWNLOAD_URL https://repo1.maven.org/maven2/kg/apc
ENV JMETER_PLUGINS_FOLDER ${JMETER_HOME}/lib/ext/

RUN    apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
            && apk add --update openjdk8-jre tzdata curl unzip bash \
            && cp /usr/share/zoneinfo/Europe/Rome /etc/localtime \
            && echo "Europe/Rome" >  /etc/timezone \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies  \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /opt  \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
	&& rm -rf /tmp/dependencies

RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-casutg/2.8/jmeter-plugins-casutg-2.8.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-casutg-2.8.jar
RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-dummy/0.4/jmeter-plugins-dummy-0.4.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-dummy-0.4.jar
RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-cmn-jmeter/0.6/jmeter-plugins-cmn-jmeter-0.6.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-cmn-jmeter-0.6.jar
RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-csvars/0.1/jmeter-plugins-csvars-0.1.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-csvars-0.1.jar

ENV PATH $PATH:$JMETER_BIN

COPY launch.sh /

WORKDIR ${JMETER_HOME}

ENTRYPOINT ["/launch.sh"]
