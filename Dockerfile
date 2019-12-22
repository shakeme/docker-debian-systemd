FROM debian:10-slim

LABEL maintainer="Robert Schneider <shakemedev@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt-get update \
    && apt-get install --assume-yes --no-recommends \
        systemd systemd-sysv \
        net-tools \
    && apt-get clean \
    && rm -rf /tmp/* \
              /var/lib/apt/lists/* \
              /var/tmp/* \
    && rm -f /etc/systemd/system/*.wants/* \
             /lib/systemd/system/local-fs.target.wants/* \
             /lib/systemd/system/multi-user.target.wants/* \
             /lib/systemd/system/sockets.target.wants/*udev* \
             /lib/systemd/system/sockets.target.wants/*initctl* \
             /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
             /lib/systemd/system/systemd-update-utmp*

CMD ["/lib/systemd/systemd"]
