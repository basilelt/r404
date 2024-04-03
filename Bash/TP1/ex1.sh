while [ true ]
do
    test=1
    ping -c 1 192.168.125.214 && test=0
    if [ $test == 1 ]
    then
        echo "Ping failed"
    fi
    sleep 1
done