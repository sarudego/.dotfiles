 .dotfiles
==========

![prompt](https://s3-eu-west-1.amazonaws.com/sarudego/console1.png)

This repo will contain all the configuration of my .dotfiles, its installation with dotbot, and will also contain ssh hardening scripts among other utils scripts.

It is in progress.

## Motivation


## Built With

* [Dotbot](https://github.com/anishathalye/dotbot) - Dotfiles automation tool used

## Getting Started

The installation of the dotfiles is done by automation with dotbot.

If you want to use the ssh script, install and configure fail2ban and ssh in addition to creating a new user, so it is recommended to use it on the first access, or skip the unwanted steps.

## Prerequisites

What things you need to install the software and how to install them.


```bash
ln -s /etc/ca-certificates/extracted/ca-bundle.trust.crt /etc/ssl/certs/ca-certificates.crt
  (just if you get a certificate error when clone this repo)
pip install enum34
```

## Installing

Steps for install .dotfiles and configure hardening ssh.

```bash
./init.sh
```

This step makes a backup of your current .dotfiles, identifies the OS and starts the appropriate script.


## Install on Server
This feature install and configure zsh, nvim, and other things on your server, at the same time
what install and configure ssh, fail2ban and other packages for securize it.

All you need is use this command inside your server with privileges.

```bash
curl -sSL https://raw.githubusercontent.com/sarudego/.dotfiles/master/prepare_server.sh | bash
```

## Others functionalities

```bash
./utils/init_secure.sh
```

This step install and configure fail2ban and ssh for hardening the ssh access.

## Authors

* **Sarudego** - *Initial work* - [Sarudego](https://github.com/sarudego)


