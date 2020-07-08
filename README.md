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

This image follows the [Semantic Versioning](https://semver.org/) pattern, with some modifications that helps to identify the Operating System version.

- **MAJOR** version - Alpine major version
- **MINOR** version - Alpine minor version
- **PATCH** version - Package updates and other non breaking changes on the image
- **DRAFT** version - Unstable build for testing (Optional)

An example of a stable version would be `v3.12.1` which represents Alpine Linux 3.12 with docker-base-alpine patch 1, for draft versions they can be represented like `v3.12.1-rc.1`
where `v3.12.1` has the same meaning as before but `rc.1` shows that this is a release candidate version 1 for that stable version.

## Tags

| Tag | Description |
| :----: | --- |
| latest | Latest version |
| 3.12.1 | Specific patch version |
| 3.12 | Specific minor version |
| 3 | Specific major version |
| 3.12.1-`arch` | Specific patch version to that `arch` |
| 3.12-`arch` | Specific minor version to that `arch` |
| 3-`arch` | Specific major version to that `arch` |
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
| PUID | Set the UserID - [Details](##UserID-/-GroupID) |
| PGID | Set the GroupID - [Details](##UserID-/-GroupID) |
| TZ | Set the system timezone - [Options](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) |

## UserID / GroupID

To avoid having permission issue when mounting volumes between the container and the host it's allowed to specify the user `PUID` and group `PGID`.

If the user exists on the host and has permissions to read and write on the host directory where the volume is mounted will solve this kind of issues.

Create for example a user `dockeruser` on the host it's possible to get the uid and gid for that user with the following command

``` bash
id dockeruser
```
this command will return something like `uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)`, with this information we can set the `PUID=1000` and `PGID=1000`.




