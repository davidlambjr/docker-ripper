#!/bin/bash

echo "Using this daily? Please sponsor me at https://github.com/sponsors/rix1337 - any amount counts!"

mkdir -p /out/Ripper/config

# copy blueray_ripper script
if [[ ! -f /out/Ripper/config/blueray_ripper.sh ]]; then
    cp /ripper/blueray_ripper.sh /out/Ripper/config/blueray_ripper.sh
fi
# copy blueray_transcoder script
if [[ ! -f /out/Ripper/config/blueray_transcoder.sh ]]; then
    cp /ripper/blueray_transcoder.sh /out/Ripper/config/blueray_transcoder.sh
fi

# copy dvd_ripper script
if [[ ! -f /out/Ripper/config/dvd_ripper.sh ]]; then
    cp /ripper/dvd_ripper.sh /out/Ripper/config/dvd_ripper.sh
fi

# copy dvd_transcoder script
if [[ ! -f /out/Ripper/config/dvd_transcoder.sh ]]; then
    cp /ripper/dvd_transcoder.sh /out/Ripper/config/dvd_transcoder.sh
fi

# copy default settings
#if [[ ! -f /out/Ripper/config/settings.conf ]] && [[ ! -f /out/Ripper/config/enter-your-key-then-rename-to.settings.conf ]]; then
#    cp -f /ripper/settings.conf /out/Ripper/config/
#    mv /out/Ripper/config/settings.conf /out/Ripper/config/enter-your-key-then-rename-to.settings.conf
#fi

# move settings.conf, if found
mkdir -p /root/.MakeMKV
if [[ -f /out/Ripper/config/settings.conf ]]; then
    echo "Found settings.conf."
    cat /out/Ripper/config/settings.conf > /root/.MakeMKV/settings.conf
elif [ -n $KEY ]; then
    # fetching MakeMKV beta key
    KEY=$(curl --silent 'https://forum.makemkv.com/forum/viewtopic.php?f=5&t=1053' | grep -oP 'T-[\w\d@]{66}')
    echo "Using MakeMKV beta key: $KEY"
    echo app_Key = "\"$KEY"\" >/root/.MakeMKV/settings.conf
fi

#makemkvcon reg

# copy default abcde.conf
if [[ ! -f /out/Ripper/config/abcde.conf ]]; then
    cp -f /ripper/abcde.conf /out/Ripper/config/abcde.conf
fi

# copy default default.mmcp.xml
if [[ ! -f /out/Ripper/config/default.mmcp.xml ]]; then
    cp -f /ripper/default.mmcp.xml /out/Ripper/config/default.mmcp.xml
fi

# permissions
chown -R nobody:users /out/Ripper/config
chmod -R g+rw /out/Ripper/config

chmod +x /ripper/ripper.sh
chmod +x /out/Ripper/config/blueray_ripper.sh
chmod +x /out/Ripper/config/blueray_transcoder.sh
chmod +x /out/Ripper/config/dvd_ripper.sh
chmod +x /out/Ripper/config/dvd_transcoder.sh

/ripper/ripper.sh &