FROM alpine:3.8

MAINTAINER ragetti

RUN apk --no-cache add openssl

CMD ["/usr/bin/openssl","help"]


