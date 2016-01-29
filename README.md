# redis

Template for running a mojolicious container.

# Installation

You need oc (cli tool) locally installed

###Create a new project
```sh
oc new-project redis \
    --description="Mojolicious on openshift" \
    --display-name="Mojolicious"
```
###Clone the repository
```sh
git clone https://github.com/ure/redis.git
```

###Build Mojolicious app

```sh
oc create -f BuildConfig.yaml
oc create -f DeploymentConfig.yaml
oc new-app https://github.com/ure/redis.git
oc start-build redis
```

###Build a dynamic Route
```sh
oc create -f Route.yaml
```

###Build a static Route
(for production and optionally delete the development route)
```sh
oc delete -f Route.yaml
oc create -f ProductionRoute.yaml
```

#Optionally for deployments from a private repository
###Create a new repository

###Modify sources to your repository name
```sh
perl -i -pe 's/redis/yourreponame/g' *
```

###Generate BuildConfig
```sh
rm -f BuildConfig.yaml
./genwebhooksecret.sh
```
edit BuildConfig.yaml & DeploymentConfig.yaml and modify you repository location

###Create an ssh deploy key without passphrase
```sh
ssh-keygen -f ~/.ssh/redis
cat ~/.ssh/redis.pub
```
add output to the deployment keys on your private repository

###Add your secrets to your project
```sh
oc secrets new-sshauth redis --ssh-privatekey=/home/joeri/.ssh/redis
oc secrets add serviceaccount/builder secrets/redis
```
###Deploy from private git repository
```sh
oc new-app .
```
