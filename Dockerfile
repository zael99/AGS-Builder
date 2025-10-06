# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY ./src/build /

FROM archlinux:latest

COPY ./src/scripts /usr

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

COPY ./src/config /root
