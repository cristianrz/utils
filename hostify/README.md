# hostify 🏠

Scans a networks for hosts and compares them against your known hosts.

## Usage

```terminal
$ hostify 
ping sweeping...
found known IP 192.168.100.1 (red-pc)
found new IP 192.168.100.226, do you want to add it to the db? (name/N): orange-pc
found known IP 192.168.100.220 (green-pc)
```

the `hostify.db` file then can be used as a hosts file or just to keep track of
known IPs.

## Install

Edit `Makefile` to set your `$PREFIX` then

```sh
make
make install
```

Config file will be in `$PREFIX/etc/hostify.conf` and database in
`$PREFIX/share/hostify/hostify.db`


