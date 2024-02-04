#!/bin/bash

printf "%s : BluRay detected: Saving MKV\n" "$(date "+%d.%m.%Y %T")"
debug_log "Saving BluRay as MKV."
makemkvcon --profile=/config/default.mmcp.xml -r --decrypt --minlength=600 mkv disc:"$1" all "$2"