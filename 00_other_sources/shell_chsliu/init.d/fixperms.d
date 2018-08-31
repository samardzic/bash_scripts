#!/bin/sh
### BEGIN INIT INFO
# Provides:          fixperms
# Required-Start:    
# Required-Stop:     
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Description:       fix dir permissions
### END INIT INFO

SCRIPT=/home/sita/script/pve/fixperms
RUNAS=root

PIDFILE=/var/run/fixperms.pid
LOGFILE=/var/log/fixperms.log

start() {
  if [ -f /var/run/$APP.pid ] && kill -0 $(cat /var/run/$APP.pid); then
    echo -e 'Service already running' >&2
    return 1
  fi
  echo -e 'Starting service…' >&2
  local CMD="$SCRIPT &> \"$LOGFILE\" & echo -e \$!"
  su -c "$CMD" $RUNAS > "$PIDFILE"
  echo -e 'Service started' >&2
}

stop() {
  if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
    echo -e 'Service not running' >&2
    return 1
  fi
  echo -e 'Stopping service…' >&2
  kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
  echo -e 'Service stopped' >&2
}

uninstall() {
  echo -e -n "Are you really sure you want to uninstall this service? That cannot be undone. [yes|No] "
  local SURE
  read SURE
  if [ "$SURE" = "yes" ]; then
    stop
    rm -f "$PIDFILE"
    echo -e "Notice: log file is not be removed: '$LOGFILE'" >&2
    update-rc.d -f fixperms remove
    rm -fv "$0"
  fi
}

case "$1" in
  start)
    start
    ;;
  stop)
    # stop
    ;;
  uninstall)
    uninstall
    ;;
  restart)
    # stop
    # start
    ;;
  *)
    echo -e "Usage: $0 {start|stop|restart|uninstall}"
esac
