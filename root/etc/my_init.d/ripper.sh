#!/bin/bash

echo "Using this daily? Please sponsor me at https://github.com/sponsors/rix1337 - any amount counts!"

mkdir -p /config

# copy default script
if [[ ! -f /config/ripper.sh ]]; then
    cp /ripper/ripper.sh /config/ripper.sh
fi

# copy blueray_ripper script
if [[ ! -f /config/blueray_ripper.sh ]]; then
    cp /ripper/blueray_ripper.sh /config/blueray_ripper.sh
fi
# copy blueray_transcoder script
if [[ ! -f /config/blueray_transcoder.sh ]]; then
    cp /ripper/blueray_transcoder.sh /config/blueray_transcoder.sh
fi

# copy dvd_ripper script
if [[ ! -f /config/dvd_ripper.sh ]]; then
    cp /ripper/dvd_ripper.sh /config/dvd_ripper.sh
fi

# copy dvd_transcoder script
if [[ ! -f /config/dvd_transcoder.sh ]]; then
    cp /ripper/dvd_transcoder.sh /config/dvd_transcoder.sh
fi

# copy default settings
if [[ ! -f /config/settings.conf ]] && [[ ! -f /config/enter-your-key-then-rename-to.settings.conf ]]; then
    cp -f /ripper/settings.conf /config/
    mv /config/settings.conf /config/enter-your-key-then-rename-to.settings.conf
fi

# move settings.conf, if found
mkdir -p /root/.MakeMKV
if [[ -f /config/settings.conf ]]; then
    echo "Found settings.conf. Replacing beta key file."
    cp -f /config/settings.conf /root/.MakeMKV/
elif [ -n $KEY ]; then
    # fetching MakeMKV beta key
    KEY=$(curl --silent 'https://forum.makemkv.com/forum/viewtopic.php?f=5&t=1053' | grep -oP 'T-[\w\d@]{66}')
    echo "Using MakeMKV beta key: $KEY"
    echo app_Key = "\"$KEY"\" >/root/.MakeMKV/settings.conf
fi

makemkvcon reg

# move abcde.conf, if found
if [[ -f /config/abcde.conf ]]; then
    echo "Found abcde.conf."
    cp -f /ripper/abcde.conf /config/abcde.conf
fi

# copy default default.mmcp.xml
if [[ ! -f /config/default.mmcp.xml ]]; then
    cp -f /ripper/default.mmcp.xml /config/default.mmcp.xml
fi

# permissions
chown -R nobody:users /config
chmod -R g+rw /config

chmod +x /config/ripper.sh
chmod +x /config/blueray_ripper.sh
chmod +x /config/blueray_transcoder.sh
chmod +x /config/dvd_ripper.sh
chmod +x /config/dvd_transcoder.sh

/config/ripper.sh &