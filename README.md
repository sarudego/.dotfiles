# .dotfiles

This script will contain all the configuration of my .dotfiles, its installation with dotbot, and will also contain ssh hardening scripts among other utils scripts.

It is in progress.

## Getting Started

The installation of the dotfiles is done by automation with dotbot.

If you want to use the ssh script, install and configure fail2ban and ssh in addition to creating a new user, so it is recommended to use it on the first access, or skip the unwanted steps.

### Prerequisites

What things you need to install the software and how to install them.


```
ln -s /etc/ca-certificates/extracted/ca-bundle.trust.crt /etc/ssl/certs/ca-certificates.crt
  (just if you get a certificate error when clone this repo)
pip install enum34
```

### Installing

Steps for install .dotfiles and configure hardening ssh.

```
./init.sh
```

This step makes a backup of your current .dotfiles, identifies the OS and starts the appropriate script.


```
./utils/init_secure.sh
```

This step install and configure fail2ban and ssh for hardening the ssh access.


## Built With

* [Dotbot](https://github.com/anishathalye/dotbot) - Dotfiles automation tool used


## Authors

* **Sarudego** - *Initial work* - [Sarudego](https://github.com/sarudego)


