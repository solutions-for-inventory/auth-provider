##Auth provider

A Haskell implementation of [OpenID Connect](http://openid.net/connect/).

####Prerequisites
Instasll Haskell [stack](https://docs.haskellstack.org/en/stable/README/#how-to-install)

####Building
```
$ git clone https://github.com/solutions-for-inventory/auth-provider.git
$ cd auth-provider
```
Do stack setup only the first time
```
$ stack setup
```
Build the project
```
$ stack build
```
Or
```
$ stack build --copy-bins --local-bin-path target
```
#####Run
```
$ stack exec auth-provider
```
####Build Docker Image and push
```
$ docker build -t auth-provider ./
$ docker tag auth-provider docker.pkg.github.com/solutions-for-inventory/auth-provider/auth-provider:1.0
$ docker push docker.pkg.github.com/solutions-for-inventory/auth-provider/auth-provider:1.0
```

####Build Docker Image and push
```
$ docker run -it --env DB_HOST=192.168.99.100 -p 4200:4200 auth-provider
$ docker run -it --rm  --env DB_HOST=192.168.99.100 -p 4200:4200 auth-provider
```

####Test Example
http://localhost:3000/oauth/authorize?client_id=app&state=state_code&response_type=code&redirect_uri=http%3A%2F%2Flocalhost:8080/app

