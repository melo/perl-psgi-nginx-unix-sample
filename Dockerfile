FROM alpine:edge

WORKDIR /app

### For Dancer2 support
#RUN apk add build-base tzdata perl-dev perl-app-cpanminus wget curl unit unit-perl
#RUN cpanm --mirror https://cpan.perl.pt --notest Dancer2


### Just for runtime
RUN apk --no-cache add tzdata perl curl unit unit-perl

## Our app and config file
COPY . /app/

## Configure unit and save the configuration for runtime use
RUN unitd     \
 && sleep 1   \
 && curl -X PUT --data-binary @unit.json --unix-socket /var/run/control.unit.sock http://localhost/config/ \
 && kill `cat /var/run/unit.pid`

## Start unit...
CMD ["/usr/sbin/unitd", "--no-daemon"]
