#! /bin/sh
# author: kazuya kawaguchi

set -e
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DESC="nginx deamon"
NAME=nginx
DEAMON=/usr/local/sbin/$NAME
SCRIPTNAME=/etc/init.d/$NAME

# if deamon file cannot find, exit script.
test -x $DEAMON || exit 0

d_start() {
  $DEAMON || echo -n " already running"
}

d_stop() {
  $DEAMON -s quit || echo -n " not running"
}

d_reload() {
  $DEAMON -s reload || echo -n " could not reload"
}

case "$1" in
  start)
    echo -n "Starting $DESC: $NAME"
    d_start
    echo "."
  ;;
  stop)
    echo -n "Stopping $DESC: $NAME"
    d_stop
    echo "."
  ;;
  reload)
    echo -n "Reloading $DESC configuration..."
    d_reload
    echo "reloaded."
  ;;
  restart)
    echo -n "Restarting $DESC: $NAME"
    d_stop
    sleep 2
    d_start
    echo "."
  ;;
  *)
    echo "Usage: $SCRIPTNAME {start|stop|restart|reload}" > $2
    exit 3
  ;;
esac

exit 0

