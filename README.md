# runescape-launcher
A Docker container that provides the RuneScape NXT Client. It uses Ubuntu 14.04 as its base Docker container. To more easily launch this program, merely move the `runescape-launcher` script in this repository to `/usr/local/bin` (or `/usr/bin`, depending on your preference). Then you can launch RuneScape's NXT Client by running `runescape-launcher`.

To launch it without this script run (beware, however, this is without audio, I do not know how to run this Docker image with audio so if you find out how to, please do tell me via an issue or via its [Reddit thread](https://redd.it/5ohxs7)):

```bash
xhost+
docker run --rm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=:0 \
  -v ${HOME}/.runescape:/home/runescape/.runescape \
  -v ${HOME}/Jagex:/home/runescape/Jagex \
fusion809/runescape-launcher /usr/bin/runescape-launcher
```

while to install the `runescape-launcher` script, along with the desktop configuration file for this app run:

```bash
bash -c "$(wget -cqO- https://git.io/vM8FF)"
```

or:

```bash
bash -c "$(curl -sL https://git.io/vM8FF)"
```
