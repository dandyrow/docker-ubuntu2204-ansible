FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ansible \
    apt-utils \
    locales \
    systemd \
    systemd-cron \
    sudo \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_GB.UTF-8

RUN mkdir -p /etc/ansible \
    && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

CMD ["/lib/systemd/systemd"]