# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.195.0/containers/cpp/.devcontainer/base.Dockerfile
# [Choice] Debian / Ubuntu version (use Debian 11/9, Ubuntu 18.04/21.04 on local arm64/Apple Silicon): debian-11, debian-10, debian-9, ubuntu-21.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT=debian-11
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>


# Install atcoder-tools
RUN sudo apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && sudo apt-get -y install --no-install-recommends python3-distutils
RUN curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && rm get-pip.py
RUN pip3 install atcoder-tools

# atcoder-tools configuration
ARG HOME="/home/vscode/"
COPY ./conf/.atcodertools.toml $HOME

# atcoder-tools aliases and function
ARG BASHRC_PATH=$HOME".bashrc"
ARG TMP_BASHRC_PATH=$HOME".bashrc.tmp"
COPY ./conf/.bashrc ${TMP_BASHRC_PATH}
RUN echo >> ${BASHRC_PATH}
RUN cat ${TMP_BASHRC_PATH} >> ${BASHRC_PATH} && rm ${TMP_BASHRC_PATH}
