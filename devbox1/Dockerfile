FROM ubuntu:latest

ARG USERNAME=mayank
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && usermod --shell /bin/bash mayank \
    #
    # Add sudo support
    && apt-get update \
    && apt-get install -y sudo build-essential git golang-go\
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

RUN mkdir ~/script_tmp
WORKDIR /home/mayank/script_tmp


