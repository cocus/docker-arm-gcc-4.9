# docker-arm-gcc-4.9

Dockerfile with arm-none-eabi toolchain version 4.9 from Ubuntu 16.04. Also includes make.

# Image build

When building the image, you can specifiy the username for the build with the build arg `USERNAME_TO_USE`:
```bash
docker build --build-arg USER_NAME_TO_USE=cocus  -t my-gcc-builder .
```

Also, the UID and GID of the user used inside the build container can be specified with `USER_ID` and `GROUP_ID` build args:
```bash
docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t my-gcc-builder .
```
Defaults to UID and GID to 1000.

This is useful since the source is shared between the host and the container, so you can seamlessly use the same permissions as on your host.

# Usage

After the image build, you can run a build with the following commands:
```bash
docker run -it --rm /home/cocus/source:/opt/build my-gcc-builder make -j4
```

Note that you'll need a buildable source on the `/home/cocus/source` directory (or whatever path you decide to use). Also note that the build command is specified on the last part of the commandline.
`/opt/build` is the working dir and the shared volume for the builder. The specified build command will be executed from within that directory.
