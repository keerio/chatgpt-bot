#!/bin/bash

#set -e

# Run joplin config -v
joplin config -v &
## Install variables 

joplin config sync.target 9 \
joplin config clipperServer.autoStart = true \
joplin config sync.9.path $SYNCPATH \
joplin config sync.9.username $SYNCNAME \
joplin config sync.9.password $SYNCPASSWORD

# Export token
export JO_API_TOKEN=$(joplin config api.token)

joplin sync &

joplin server start &

socat -d -d tcp-listen:41900,reuseaddr,fork tcp:localhost:41184 &