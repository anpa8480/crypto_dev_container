```console
VERSION=$(git describe --tags --always)
```
```console
docker build -t elektrobit/ubuntu-jammy-docker:$VERSION .
```
```console
docker tag elektrobit/ubuntu-jammy-docker:$VERSION ghcr.io/anpa8480/ubuntu-jammy-docker:$VERSION
```
```console
docker tag elektrobit/ubuntu-jammy-docker:$VERSION ghcr.io/anpa8480/ubuntu-jammy-docker:$VERSION
```
