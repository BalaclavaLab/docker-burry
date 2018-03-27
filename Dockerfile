FROM golang:1.10-alpine3.7

RUN apk add --no-cache git \
    && go get github.com/mhausenblas/burry.sh

FROM alpine:3.7
COPY --from=0 /go/bin/burry.sh /usr/local/bin/burry

ENTRYPOINT [ "/usr/local/bin/burry" ]
CMD [ "--help" ]