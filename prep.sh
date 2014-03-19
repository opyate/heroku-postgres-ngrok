#!/bin/bash
source ~/.heroku-postgres-ngrok
if [ ! -e ngrok.zip ]; then
  curl -L -o ngrok.zip https://dl.ngrok.com/linux_386/ngrok.zip
  unzip ngrok.zip
fi
echo "Run this in another terminal, but in this directory:"
echo "    python -m SimpleHTTPServer" 
echo "And then"
echo "    ./restore <ngrok-server-url>"
echo "<Ctrl-C> or <ENTER>"
read
./ngrok -authtoken $NGROK_AUTHTOKEN 8000
