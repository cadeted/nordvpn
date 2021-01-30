FROM alpine:latest

#install required packages
ARG VERSION=3.7.4
RUN apk --no-cache --no-progress add curl wget && \
       wget -O /tmp/nordrepo.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb && \
       apk --no-cache --no-progress add /tmp/nordrepo.deb && \
       apk update && \
       apk --no-cache --no-progress add nordvpn=$VERSION

#copy over pia profiles to docker FS
#COPY ./profiles /nord/profiles
#WORKDIR /nord

#connection script to handle env variables and openvpn arguments
#COPY connect.sh /nord/connect.sh

#default vpnm config to use if not part of docker creation
#ENV REGION="us_east"

#healthcheck for vpn tunnel up
#HEALTHCHECK --interval=5m --timeout=15s CMD curl -L 'https://api.ipify.org'

ENTRYPOINT ["/sbin/init"]
#ENTRYPOINT ["/bin/sh","/pia/connect.sh"]
