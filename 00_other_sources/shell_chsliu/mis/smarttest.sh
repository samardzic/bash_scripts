# Script by Meliorator. irc://irc.freenode.net/Meliorator
# modified by Ranpha
[ ! "$@" ] && echo -e "Usage: $0 type [type] [type]"

[ ! -e smart-logs ] && mkdir smart-logs
[ ! -d smart-logs ] && Can not create smart-logs dir && exit 1

a=0

for t in "$@"; do

        case "$t" in
                offline)  l=error;;
                short|long)  l=selftest;;
                *) echo -e $t is an unrecognised test type. Skipping... && continue
        esac

       for hd in  /dev/disk/by-id/ata*; do
                r=$(( $(smartctl -t $t -d ata $hd | grep 'Please wait' | awk '{print $3}') ))
                echo -e Check $hd - $t test in $r minutes
                [ $r -gt $a ] && a=$r
       done
     echo -e "Waiting $a minutes for all tests to complete"
                sleep $(($a))m

        for hd in /dev/disk/by-id/ata*; do
                smartctl -l $l -d ata $hd 2>&1 >> smart-logs/smart-${t}-${hd##*/}.log
        done

        
done

for i in {1..10}; do
        sleep .01
        echo -e -n -e \\a
done

echo -e "All tests have completed"
