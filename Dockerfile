FROM ruby:2.6.5-alpine3.10

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql yarn vim" \
    CHROME_PACKAGES="chromium-chromedriver zlib-dev chromium xvfb wait4ports xorg-server dbus ttf-freefont mesa-dri-swrast udev fontconfig" \
    BUILD_PACKAGES="build-base curl" \
    ROOT="/myapp" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR ${ROOT}
COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --no-cache ${CHROME_PACKAGES} && \
    apk add --virtual build-packages --no-cache ${BUILD_PACKAGES} && \
    curl -O https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip && \
    mkdir -p /usr/share/fonts/NotoSansCJKjp && \
    unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/NotoSansCJKjp/ && \
    rm NotoSansCJKjp-hinted.zip && \
    fc-cache -fv && \
    bundle install && \
    apk del build-packages

COPY . ${ROOT}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
