# Intro

This: https://devcenter.heroku.com/articles/heroku-postgres-import-export

But without the S3 URL. We're using [ngrok](https://ngrok.com) instead.

# Requirements

This file:

    ~/.heroku-postgres-ngrok

It must contain this:

    NGROK_AUTHTOKEN="<your-ngrok-auth-token>"
    # in keeping with Heroku naming, but please use your own
    SRC_APP="superfluous-jamtarts-1337"
    DEST_APP="gratuitous-teacakes-1337"
    DUMPFILE="latest.dump"

# How

The commands are split into 3 to allow switching between Heroku accounts with ```heroku auth:logout/login```

    ./dump.sh

This dumps from the src DB.

    ./prep.sh

This asks you to run ```python -m SimpleHTTPServer``` where the dump resides.
It then starts an ngrok for you, and you're to note the ngrok Forwarding URL.

    ./restore.sh <the-ngrok-url>

This creates <the-ngrok-url>/the-dump-file which is now made available to the public using ngrok magic, via the local Python web server you created earlier.


