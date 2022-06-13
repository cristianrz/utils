# profiled

init-like functionality for simple environments

##  Getting started

```sh
make install
```

## Usage

Put `profileinit` in your shellrc:

```
echo profileinit >> "$HOME/.profile"
```

now everytime you log in, `profiled` will run all your services inside
`$HOME/.config/rc.d`.

Services can be operated with:

* `profilectl start SERVICE`
* `profilectl stop SERVICE`
* `profilectl restart SERVICE`
* `profilectl enable SERVICE`
* `profilectl disable SERVICE`

Services can be created inside `$HOME/.config/init.d`. They should be
executables that can be called with arguments `start`, `stop`, `restart` and
`status`.

All enabled services can be stopped with `profileshutdown`.

