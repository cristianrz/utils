#!/bin/sh

_quiet() {
	"$@" >/dev/null 2>&1
}

_log() {
	printf '%s\n' "$*" >&2
}

_log_fatal() {
	_log "$*"
	exit 1
}

if ! _quiet type git; then
	_log_fatal "git is not installed, exiting"
fi

printf 'where do you want userinit to be installed? [$HOME/.local]: '
read -r dest

TMP="$(mktemp -d)"

case "$TMP" in
'/tmp/tmp'*) : ;;
*)
	_log_fatal "mktemp didn't work, gave me this: '$TMP'"
	;;
esac

trap 'rm -rf $TMP' EXIT
trap 'rm -rf $TMP' 2

git clone https://github.com/cristianrz/utils "$TMP"

mkdir -p "$dest"

cp -r "$TMP/profileinit/bin" "$dest"
cp -r "$TMP/profileinit/etc" "$dest"

cat <<EOF
******************************************************************************

 All done. Now you can start userinit. There are several ways to start it:    
                                                                              
   - $dest/bin/userinit will start it on the foreground and can be stopped by  
     running $dest/bin/usershutdown. This is useful if you want to supervise    
     it with, for example, systemd or run it as a background job with cron or
     Windows tasks. Userinit will try to inherit all the children of the
     services (but may not do so). This may not be useful if userinit is being
     run manually or as part of your .profile/.bashrc 
                                                                              
   - $dest/bin/rc will directly start all the services and the operating       
     system will decide who inherits the children. $dest/bin/rc.shutdown will  
     stop all the services.                                                   
                                                                              
 More information on how to configure userinit in the README on the repo.     

******************************************************************************
EOF
