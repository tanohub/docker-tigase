FROM openjdk:8-jre-slim
MAINTAINER "Tigase, Inc." <support@tigase.net>

# Create directory structure, download Tigase XMPP Server -dist-max package and unpack it
# At the same time remove setting JAVA_HOME from etc/tigase.conf as variable is already set
# and add additional parameters to GC variable to make Java aware of Docker limits
# Then move content of etc/ directory to etc.orig/ to be able to use volume to host configuration.
# Additionally we are removing docs/ and downloaded package to reduce size.
RUN mkdir /opt/tigase \
	&& cd /opt/tigase \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends wget nano vim less net-tools telnet inetutils-ping psutils lsof \
	&& wget https://github.com/tigase/tigase-server/releases/download/tigase-server-7.1.0/tigase-server-7.1.0-b4379-dist-max.tar.gz \
	&& rm -rf /var/lib/apt/lists/* \
	&& tar -zxvf tigase-server-7.1.0-b4379-dist-max.tar.gz  \
	&& ln -s `find . -name 'tigase-server-*' -maxdepth 1 -type d` tigase-server \
	&& rm -rf tigase-server/docs/ \
	&& rm -rf tigase-server-7.1.0-b4379-dist-max.tar.gz  \
	&& sed -i -e 's/JAVA_HOME/#JAVA_HOME/;/^JAVA_METASPACE=.*/a \\nGC="${GC} -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap "\n' tigase-server/etc/tigase.conf 

# Add statup scripts and make them executable
# We need custom scripts to make sure that database is upgraded
# and that Tigase will NOT be launched as background service!
ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh

# Set TIGASE_HOME variable
ENV TIGASE_HOME /opt/tigase/tigase-server

# Set ports of the container which can be exposed
#EXPOSE 5222 5223 5269 5277 5280 5281 5290 5291 8080 9050 9070

# Set possible volume (directories which can be mounted from the docker host machine)
# like etc/, conf/, certs/, logs/, data/
#VOLUME ["/opt/tigase/tigase-server/etc", "/opt/tigase/tigase-server/conf", "/opt/tigase/tigase-server/certs", "/opt/tigase/tigase-server/logs", "/opt/tigase/tigase-server/data"]

# Define script which should be executed on container startup
CMD ["/bin/bash", "/start.sh"]
