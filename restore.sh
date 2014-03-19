#!/bin/bash
NGROK_URL=$1
source ~/.heroku-postgres-ngrok
if [ "x$NGROK_URL" == "x" ] ; then
  echo "Error: need ngrok tunnel URL"
  exit 1
fi
DUMPURL="$NGROK_URL/$DUMPFILE"
source ~/.heroku-postgres-ngrok
APP=$DEST_APP
echo "Restore $DUMPURL as $(heroku auth:whoami) for app $APP? <Ctrl-C> or <ENTER>"
read
heroku addons:add pgbackups -a $APP
DB_COLOUR_URL=$(heroku config -a $APP | grep POSTGRESQL | cut -d':' -f1)
heroku pgbackups:restore $DB_COLOUR_URL -a $APP "$1/$DUMPFILE"
