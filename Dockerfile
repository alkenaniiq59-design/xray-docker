FROM alpine:latest
RUN apk add --no-cache ca-certificates tzdata curl
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    apk add --no-cache unzip && \
    unzip /tmp/xray.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/xray && \
    rm -rf /tmp/xray.zip /usr/local/bin/geoip.dat /usr/local/bin/geosite.dat

COPY config.json /etc/xray/config.json

ENTRYPOINT ["/usr/local/bin/xray", "-config", "/etc/xray/config.json"]
