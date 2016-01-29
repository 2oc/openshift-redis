# redis

Template for running a mojolicious container.

# Installation (easy!)

You need oc (cli tool) locally installed

```sh
> oc new-app https://github.com/ure/openshift-redis.git --name=redis
```

# Scaling

Create additional redis services with another naming scheme like

```sh
> oc new-app https://github.com/ure/openshift-redis.git --name=redis0
> oc new-app https://github.com/ure/openshift-redis.git --name=redis1
```
