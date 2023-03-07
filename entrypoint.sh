#!/bin/bash

set -e

# Run joplin config -v
#joplin config -v &

export JO_API_TOKEN=$(joplin config api.token)

socat -d -d tcp-listen:41900,reuseaddr,fork tcp:localhost:41184 &

## Install variables 


#joplin config clipperServer.autoStart = true \
joplin config sync.9.path $SYNCPATH
joplin config sync.9.username $SYNCNAME
joplin config sync.9.password $SYNCPASSWORD
joplin config sync.target 9 \

joplin sync 9

joplin server start &

socat -d -d tcp-listen:41900,reuseaddr,fork tcp:localhost:41184 &
