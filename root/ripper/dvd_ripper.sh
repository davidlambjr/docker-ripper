#!/bin/bash

makemkvcon --profile=/out/Ripper/config/default.mmcp.xml -r --decrypt --minlength=600 mkv disc:"$1" all "$2"