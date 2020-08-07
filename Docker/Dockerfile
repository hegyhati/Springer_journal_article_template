FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
  make \
  texlive-science \
  texlive-font-utils \
  ghostscript \
&& rm -rf /var/lib/apt/lists/*
