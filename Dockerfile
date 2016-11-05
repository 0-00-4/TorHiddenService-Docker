# We need to use Alpine's "edge" branch since it seems to be
# the only one that currently provides Tor via APK.

FROM alpine:edge
MAINTAINER Alex Haydock <alex@alexhaydock.co.uk>

ENV HOME /var/lib/tor

RUN apk --no-cache add \
	tor

# Copy in our torrc file
ADD torrc /etc/tor/torrc

# Copy in our hidden service keys
ADD hostname /var/lib/tor/hidden_service/hostname
ADD private_key /var/lib/tor/hidden_service/private_key

# Set correct permissions
RUN chown -R tor /etc/tor
RUN chown -R tor /var/lib/tor
RUN chmod -R 700 /var/lib/tor

USER tor

CMD [ "tor" ]
