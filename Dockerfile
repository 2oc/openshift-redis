FROM redis:alpine
MAINTAINER Joeri van Dooren

COPY redis.conf /usr/local/etc/redis/redis.conf

USER 997
EXPOSE 6379

CMD [ "/usr/local/bin/redis-server", "/usr/local/etc/redis/redis.conf" ]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description                Redis
LABEL io.openshift.tags                 redis
LABEL io.k8s.display-name               Redis Alpine
LABEL io.openshift.expose-services      6379
LABEL io.openshift.non-scalable         true
#LABEL io.openshift.min-memory          8Gi
#LABEL io.openshift.min-cpu             4
