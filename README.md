# Docker Alpine Base Image

![Maintenance](https://img.shields.io/maintenance/yes/2020?style=plastic) [![Drone Status](https://img.shields.io/drone/build/fabiodcorreia/docker-base-alpine?style=plastic)](https://cloud.drone.io/fabiodcorreia/docker-base-alpine) [![Latest Release](https://img.shields.io/github/v/release/fabiodcorreia/docker-base-alpine?style=plastic)](https://github.com/fabiodcorreia/docker-base-alpine/releases/latest) [![GitHub Licence](https://img.shields.io/github/license/fabiodcorreia/docker-base-alpine?style=plastic)](https://github.com/fabiodcorreia/docker-base-alpine/blob/master/LICENSE)


![MicroBadger Layers](https://img.shields.io/microbadger/layers/fabiodcorreia/base-alpine?style=plastic) [![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/fabiodcorreia/base-alpine?style=plastic)](https://hub.docker.com/r/fabiodcorreia/base-alpine) [![Docker Pulls](https://img.shields.io/docker/pulls/fabiodcorreia/base-alpine?style=plastic)](https://hub.docker.com/r/fabiodcorreia/base-alpine) ![Docker Image Version (latest semver)](https://img.shields.io/docker/v/fabiodcorreia/base-alpine?sort=semver&style=plastic)

A custom base image built with Alpine Linux and S6 overlay.

## Base Packages

- bash
- ca-certificates
- coreutils
- procps
- s6-overlay
- shadow
- tzdata

## Versioning

This image follows the [Semantic Versioning](https://semver.org/) pattern.

- **MAJOR** version - Changes on the Alpine version (3.11 to 3.12)
- **MINOR** version - Changes on the S6 Overlay (2.0.0 to 2.0.1)
- **PATCH** version - Package updates and other non breaking changes on the image
- **DRAFT** version - Unstable build for review (Optional)

### Version Mapping

| Version    | 1.0     | 1.1     | 2.0     |
| :----:     | ---     | ---     | ----    |
| Alpine     | 3.12    | 3.12    | 3.13    |
| S6 overlay | 2.0.0.1 | 2.0.0.2 | 2.0.0.1 |

When Alpine Linux gets upgraded the major version is incremented, when S6 overlay gets upgraded they minor version is incremented.

## Tags

| Tag | Description |
| :----: | --- |
| latest | Latest version |
| 1.0.0 | Specific patch version |
| 1.0 | Specific minor version |
| 1 | Specific major version |
| 1.0.0-`arch` | Specific patch version to that `arch` |
| 1.0-`arch` | Specific minor version to that `arch` |
| 1-`arch` | Specific major version to that `arch` |
| test | Branch version - **DO NOT USE** |

The version tags are the same as the repository versioning tags but without the `v`. The `test` version is only for build purposes, it should not be pulled.

The `arch` can be one of the supported architectures described below.

## Supported Architectures

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64 |
| arm64 | arm64v8 |
| armhf | arm32v7 |


## Environment Variables

| Name | Description |
| :----: | --- |
| PUID | Set the UserID - [Details](#userid--groupid) |
| PGID | Set the GroupID - [Details](#userid--groupid) |
| TZ | Set the system timezone - [Options](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) |

## UserID / GroupID

To avoid having permission issue when mounting volumes between the container and the host it's allowed to specify the user `PUID` and group `PGID`.

If the user exists on the host and has permissions to read and write on the host directory where the volume is mounted will solve this kind of issues.

Create for example a user `dockeruser` on the host it's possible to get the uid and gid for that user with the following command

``` bash
id dockeruser
```
this command will return something like `uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)`, with this information we can set the `PUID=1000` and `PGID=1000`.




