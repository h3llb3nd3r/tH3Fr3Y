#! /bin/bash
### BEGIN INIT INFO
# Provides:          nexchange-miner
# Required-Start:
# Required-Stop:     nexchange-miner
# Default-Start:
# Default-Stop:      0 6
# Short-Description: START STATUS AND STOP.
# Description:
### END INIT INFO

do_stop () {
TOTAL=`ps -ef|grep minerd|grep -v grep |wc -l`;
T=0;

if (( ${TOTAL} > ${T} )); then
echo "There are a total amount of $TOTAL processes running related to NexChange Mining on this server which will be terminated.";
ps -ef|grep minerd|awk -F" " '{print $2}'|xargs kill -9;
else
echo "The NexChange Miner processes are already terminated";
fi
}

do_start () {
TOTAL=`ps -ef|grep minerd|grep -v grep |wc -l`;
T=0;

if (( ${TOTAL} > ${T} )); then
echo "There are already a total amount of $TOTAL processes running related to NexChange Mining on this server.";
else
/opt/miner/cpuminer-multi/minerd -t 3 -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u <user> -p <pass> -D &
fi
}

do_status () {
TOTAL=`ps -ef|grep minerd|grep -v grep |wc -l`;
T=0;

if (( ${TOTAL} > ${T} )); then
echo "The total amount of NexChange Mining processes are $TOTAL";
else
echo "There arent any processes related to NexChange Mining on this server. Please check back with Oleg";
fi
}

case "$1" in
  start)
        do_start
        ;;
  status)
        do_status
        ;;
  stop)
        do_stop
        ;;
  *)
        echo "Usage: $0 start|stop|status nexchange-miner" >&2
        exit 3
        ;;
esac
:
