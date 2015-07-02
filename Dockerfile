FROM node:0.12.5-slim
MAINTAINER Junxiang Wei <junxiang.wei@nodeunify.com>

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get install -y curl

# Add scripts to install opencv
ADD ./scripts /scripts

RUN ./scripts/install.sh
