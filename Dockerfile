FROM debian

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y -q && \
    apt-get install -y -q --no-install-recommends\
    fail2ban \
    iptables \
    exim4 \
    bsd-mailx \
    whois \
    && rm -rf /var/lib/apt/lists/*

COPY filter.d/ /etc/fail2ban/filter.d/
COPY action.d/ /etc/fail2ban/action.d/
COPY jail.local /etc/fail2ban/

CMD ["fail2ban-server", "-f"]

RUN mkdir /var/run/fail2ban
