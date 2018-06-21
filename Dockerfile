FROM phusion/baseimage:0.10.1

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# install duplicity
RUN DEBIAN_FRONTEND=noninteractive apt-add-repository -y ppa:duplicity-team/ppa
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install duplicity nano

VOLUME /root/.cache/duplicity /source

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
