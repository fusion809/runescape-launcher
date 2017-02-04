# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Mordeth http://services.runescape.com/m=forum/c=BayWIRvWZa8/users.ws?searchname=Mordeth&lookup=view
FROM ubuntu:14.04

RUN apt-get update && apt-get install -y --no-install-recommends \
          apt-transport-https \
          wget \
          libcurl4-openssl-dev \
          xserver-xorg-video-intel \
          libcanberra-gtk-module \
          alsa-utils \
          libasound2-plugins \
          libcanberra-pulse \
          gvfs \
          ca-certificates \
          libgtk2.0-0 \
          libxtst6 \
          libnss3 \
          libgconf-2-4 \
          libasound2 \
          fakeroot \
          gconf2 \
          gconf-service \
          libcap2 \
          libnotify4 \
          libxtst6 \
          libnss3 \
          gvfs-bin \
          xdg-utils \
          python

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O - https://content.runescape.com/downloads/ubuntu/runescape.gpg.key | apt-key add - && \
    mkdir -p /etc/apt/sources.list.d && \
    echo "deb https://content.runescape.com/downloads/ubuntu trusty non-free" > /etc/apt/sources.list.d/runescape.list && \
    apt-get update && \
    apt-get install -y runescape-launcher

ENV HOME /home/runescape
RUN useradd --create-home --home-dir $HOME runescape \
    && gpasswd -a runescape audio \
    && chown -R runescape:runescape $HOME
WORKDIR $HOME
USER runescape

CMD /usr/bin/runescape-launcher
