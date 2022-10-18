#!/bin/sh

i=1
while [ $i -lt 6 ]
do
    echo "Test Run $i"
    sysbench fileio --threads=16 --file-total-size=3G --time=30 --file-test-mode=rndrw prepare
    sysbench fileio --threads=16 --file-total-size=3G --time=30 --file-test-mode=rndrww run
    sleep 100
    sysbench fileio --threads=16 --file-total-size=3G --time=30 --file-test-mode=rndrw cleanup
    i=`expr $i + 1`
done