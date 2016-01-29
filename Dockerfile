FROM redis:alpine
MAINTAINER Joeri van Dooren

COPY redis.conf /usr/local/etc/redis/redis.conf

USER 997
EXPOSE 6379

CMD [ "/usr/local/bin/redis-server", "/usr/local/etc/redis/redis.conf" ]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Redis" \
      io.k8s.display-name="Redis Alpine" \
      io.openshift.expose-services="6379:tcp" \
      io.openshift.tags="redis" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
