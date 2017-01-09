# runescape-launcher
A Docker container that provides the RuneScape NXT Client. It uses Ubuntu 14.04 as its base Docker container. To more easily launch this program, merely move the `runescape-launcher` script in this repository to `/usr/local/bin` (or `/usr/bin`, depending on your preference). Then you can launch RuneScape's NXT Client by running `runescape-launcher`.

To launch it without this script run:

```bash
xhost+
docker run \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=:0 \
  -v ${HOME}/.runescape:/home/runescape/.runescape \
  -v ${HOME}/Jagex:/home/runescape/Jagex \
fusion809/runescape-launcher /usr/bin/runescape-launcher
```
