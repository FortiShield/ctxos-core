FROM debian:bookworm-slim

LABEL maintainer="CtxOS Team <team@ctxos.local>"
LABEL description="CtxOS Core build environment"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    debhelper \
    devscripts \
    dpkg-dev \
    pandoc \
    shellcheck \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY . .

RUN make clean all

CMD ["debuild", "-us", "-uc"]
