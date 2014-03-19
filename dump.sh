#!/bin/bash
source ~/.heroku-postgres-ngrok
APP=$SRC_APP
echo "Create DB dump as $(heroku auth:whoami) for app $APP? <Ctrl-C> or <ENTER>"
read
heroku addons:add pgbackups -a $APP 
heroku pgbackups:capture -a $APP 
curl -o $DUMPFILE $(heroku pgbackups:url -a $APP) && echo "Created dumpfile at $DUMPFILE"
