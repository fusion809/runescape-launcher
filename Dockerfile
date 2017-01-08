# This is a comment
FROM ubuntu:14.04
MAINTAINER Brenton Horne <brentonhorne77@gmail.com>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN echo keyboard-configuration keyboard-configuration/layout select 'English (US)' | debconf-set-selections;
RUN echo keyboard-configuration keyboard-configuration/layoutcode select 'us' | debconf-set-selections;
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget sudo ubuntu-gnome-desktop apt-transport-https
ENV DISPLAY=:1
RUN wget -O - https://content.runescape.com/downloads/ubuntu/runescape.gpg.key | apt-key add -
RUN mkdir -p /etc/apt/sources.list.d
RUN echo "deb https://content.runescape.com/downloads/ubuntu trusty non-free" > /etc/apt/sources.list.d/runescape.list
RUN apt-get update
RUN apt-get install -y runescape-launcher
RUN groupadd admin
RUN useradd -G admin -ms /bin/bash runescape
RUN echo 'runescape:runescape' | chpasswd
RUN echo 'runescape ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER runescape
WORKDIR /home/runescape
CMD gnome-session
