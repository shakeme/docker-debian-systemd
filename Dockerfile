FROM debian:10-slim

LABEL maintainer="Robert Schneider <shakemedev@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends \
        locales \
        python-apt \
        systemd systemd-sysv \
    && apt-get clean \
    && rm -rf /tmp/* \
              /var/lib/apt/lists/* \
              /var/tmp/* \
    && rm -rf /usr/share/doc && rm -Rf /usr/share/man \
    && rm -f /etc/systemd/system/*.wants/* \
             /lib/systemd/system/local-fs.target.wants/* \
             /lib/systemd/system/multi-user.target.wants/* \
             /lib/systemd/system/sockets.target.wants/*udev* \
             /lib/systemd/system/sockets.target.wants/*initctl* \
             /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
             /lib/systemd/system/systemd-update-utmp*

RUN locale-gen en_US.UTF-8

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]

