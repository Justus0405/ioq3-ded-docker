<p align="left">
    <!-- Discord Badge -->
    <a href="https://discord.justus0405.com/"><img src="https://img.shields.io/discord/1370519315400495234?logo=Discord&colorA=1e1e2e&colorB=a6e3a1&style=for-the-badge"></a>
    <!-- Version Badge -->
    <a href="https://github.com/Justus0405/ioq3-ded-docker/blob/main/Dockerfile"><img src="https://img.shields.io/badge/Version-1.0-blue?colorA=1e1e2e&colorB=cdd6f4&style=for-the-badge"></a>
</p>

<p align="left">
    <!-- Stars Badge -->
	<a href="https://github.com/Justus0405/ioq3-ded-docker/stargazers"><img src="https://img.shields.io/github/stars/Justus0405/ioq3-ded-docker?colorA=1e1e2e&colorB=b7bdf8&style=for-the-badge"></a>
    <!-- Issues Badge -->
	<a href="https://github.com/Justus0405/ioq3-ded-docker/issues"><img src="https://img.shields.io/github/issues/Justus0405/ioq3-ded-docker?colorA=1e1e2e&colorB=f5a97f&style=for-the-badge"></a>
    <!-- Contributors Badge -->
	<a href="https://github.com/Justus0405/ioq3-ded-docker/contributors"><img src="https://img.shields.io/github/contributors/Justus0405/ioq3-ded-docker?colorA=1e1e2e&colorB=a6da95&style=for-the-badge"></a>
</p>

# ioq3-ded-docker

A minimal and optimized Docker image for building and hosting the ioq3 dedicated server.
Designed to be small, fast, declarative, and easy to run anywhere.

## Features

#### Compiled for your host machine.

The image builds ioq3-ded on your system for optimal performance.

#### Declarative configuration.

All server settings (map, downloads, memory, hostname, bots, etc.) can be set cleanly inside `docker-compose.yml`.

#### Small image size.

Built with a multi-stage pipeline that separates build and runtime layers, removing all unnecessary dependencies and keeping the final image as minimal as possible.

## Getting Started

1. Clone the repository:

```shell
git clone --depth 1 https://github.com/Justus0405/ioq3-ded-docker.git
```

2. Navigate to the directory:

```shell
cd ioq3-ded-docker
```

3. Create the baseq3 directory:

```shell
mkdir baseq3
```

4. Copy your pk3 files to the baseq3 directory:

```shell
cp -r ~/.config/Quake3/baseq3/ ./
```

5. Build an run with docker:

```shell
docker-compose up -d --build
```

## FAQ

### How can I access the console?

- Simply do `docker attach ioq3-ded` and type your commands
- For eg. `map Q3DM1`

> [!TIP]
> To exit the console without stopping the server, press:
> Ctrl + p, Ctrl + q

### Where do I place mods or custom maps?

Place all `.pk3` files into:

```
baseq3/
```

These will be mounted into the container automatically.

### How do I enable bots?

You can do this declaratively:

```yaml
command: >
  +set dedicated 0
  +set sv_allowDownload 1
  +set com_hunkmegs 64
  +set bot_enable 1
  +set bot_minplayers 6
  +map q3dm17
```

### How do I restart the server?

```shell
docker-compose restart
```

## Maps

- Q3DM17 (Default)
- Q3DM1
- Q3DM14
- Q3TOURNEY6
- Q3DM6
- Q3DM15
- Q3DM10
- Q3TOURNEY2

Just switch the map via console or add it in your compose file

## Declarative Server Configuration

One advantage of this image is that you can set all options for `q3config_server.cfg` and the launch command directly in `docker-compose.yml`.

Example launch command:

```yaml
command: >
  +set dedicated 2
  +set sv_allowDownload 1
  +set com_hunkmegs 64
  +set sv_hostname "My Quake Server"
  +map q3dm17
```

Example for `q3config_server.cfg` settings:

```yaml
environment:
  TZ: "Europe/Berlin"
  sv_hostname: "My Quake Server"
```

#

<p align="center">
	Copyright &copy; 2025-present <a href="https://github.com/Justus0405" target="_blank">Justus0405</a>
</p>

<p align="center">
	<a href="https://github.com/Justus0405/ioq3-ded-docker/blob/main/LICENSE"><img src="https://img.shields.io/github/license/Justus0405/ioq3-ded-docker?logo=Github&colorA=1e1e2e&colorB=cba6f7&style=for-the-badge"></a>
</p>
