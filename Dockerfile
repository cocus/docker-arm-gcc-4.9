FROM ubuntu:16.04

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME_TO_USE=user

WORKDIR /

RUN apt update && \
    apt install -y gcc-arm-none-eabi make && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd --gid ${GROUP_ID} shared_group && \
    useradd -l -u ${USER_ID} -g shared_group ${USER_NAME_TO_USE} && \
    install -d -m 0755 -o ${USER_NAME_TO_USE} -g shared_group /opt/build

WORKDIR /opt/build

USER ${USER_NAME_TO_USE}

VOLUME /opt/build
