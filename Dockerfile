FROM alpine:3.8

MAINTAINER ragetti

RUN apk --no-cache add openssl

ENTRYPOINT ["/usr/bin/openssl"]
CMD ["help"]


