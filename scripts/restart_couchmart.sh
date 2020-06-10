#!/bin/bash

echo "Running restart script"
echo "Stopping existing running python"
killall -9 python > /dev/null 2>&1

echo "Running new python"
nohup python /couchmart/web-server.py >> couchmart.log 2>&1 &
