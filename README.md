![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/apptower/angularcli)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/apptower/angularcli)
![Docker Pulls](https://img.shields.io/docker/pulls/apptower/angularcli?color=00e68a)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/AppTower/AngularCLI?label=latest&sort=semver&color=cc99ff)

# What is this

A typical containerized development environment for Angular CLI.

# How to use this image

### Start an instance

```
$ docker run -d -t apptower/angularcli
```

### Publish ports if you need to test your application outside of the docker host.

```
$ docker run -d -t apptower/angularcli -p 8080:4200
```

### Connect into container

This image has an administrator user, `node`, with defaut password, `node`. You can login into it via SSH.

```
$ ssh node@[Container's IP]
```

### Test your web application after `ng build`

To test an angular application, you must publish a port when starting the container instance.
Let's assume that you had passed the parameter, `-p 8080:4200`, while creating this container instance.

```
$ ng serve --host 0.0.0.0 --port 4200
```

Now you can open the browser and view it on `http://[Docker Host's IP]:8088`.

# Environment Variables

When you start the `apptower/angularcli` image, you can adjust the configuration of the instance by passing one or more environment variables.

`ADMIN_PASSWORD`

This variable is optional and allows you to specify the password of administrator.

```
$ docker run -d -t -e ADMIN_PASSWORD=1234 apptower/angularcli
```

# Image Variants

### `apptower/angularcli` or `apptower/angularcli:latest`

The latest version of Angular CLI.

### `apptower/angularcli:<Major Releases>`

This is the latest version on a specific major number release.

### `apptower/angularcli:<Major Releases>.<Minor Releases>.<Patch releases>`

This image point to a specific version of Angular CLI.

# Source

- https://github.com/AppTower/AngularCLI

# Reference

- [Angular Versioning and Releases](https://angular.io/guide/releases)
- [Angular Version Table](https://www.npmjs.com/package/@angular/cli?activeTab=versions)
