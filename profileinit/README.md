# profileinit

NetBSD-style service manager for small environments.

`profileinit` allows service management in places where:

* can't use native `init` (e.g. `chroot`)
* native `init` is a pain (e.g. `systemd`, Windows)
* want to manage simple services as a user 

I mainly use it to manage services on systems where I need to deal with
`systemd` and on Windows without admin privileges using BusyBox.

## Installing

```sh
make install
```

## Usage

1. Install all required services in `etc/rc.d`. Service need to be executables
that accept at least 4 arguments: start, stop, restart and status.
2. Define the services to be started in `etc/rc.conf`. To enable
`example-service`, add `example-service=YES`.
3. Start all services with `bin/profileinit`. If you want services to start on
login on chroots or similar:

```
echo profileinit >> "$HOME/.profile"
```

Services can be operated with:

* `profilectl start   example-service`
* `profilectl stop    example-service`
* `profilectl restart example-service`
* `profilectl enable  example-service`
* `profilectl disable example-service`

Or alternatively with `etc/rc.d/example-service [COMMAND]`

All running services can be stopped with `profileshutdown`.

## What it doesn't do and will never do

* Restart failed services
* Dependencies (scripts in `rc.d` will always run serially in alphabetical
order, you can play with that)

