# Custom `mkdocs-material` CI image

Builds on Alpine edge, mostly used by @ajhalili2006 to deploy builds over GitLab CI.

## CI Status

| Webhook Event | Badge | Frequency |
| --- | --- | --- |
| After push | [![Docker CI](https://github.com/ajhalili2006/website/actions/workflows/docker.yml/badge.svg?event=push)](https://github.com/ajhalili2006/website/actions/workflows/docker.yml) | As commits are mirrored to GitHub, either manually or asynchorously run in GitLab CI |
| Nightly Builds | [![Docker CI](https://github.com/ajhalili2006/website/actions/workflows/docker.yml/badge.svg?event=schedule)](https://github.com/ajhalili2006/website/actions/workflows/docker.yml) | Runs every 22:30 UTC (6:30 PHT)

## Usage

See the tags list on [GitHub][ghcr] or [Red Hat Quay Container Registry Cloud][quay]

[ghcr]: https://github.com/ajhalili2006/website/pkgs/container/website%2Fbuild-ci/versions
[quay]: https://quay.io/repository/ajhalili2006/mkdocs-material-build-ci?tab=tags

```yaml
# in GitLab CI config...
image:
  name: quay.io/ajhalili2006/mkdocs-material-build-ci:latest
```

```dockerfile
# ...or via your custom Docker image
FROM ghcr.io/ajhalili2006/website/build-ci:latest
```

## Build from source

Run the `build.sh` script to generate a local build of the image. To overridethe default image tag, set `IMAGE_TAG` shell variable before running.
If used as part of your CI, add any value to `DEPLOY` variable to run `docker push` for you.
