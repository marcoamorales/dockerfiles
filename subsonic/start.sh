#! /bin/sh

set -e

  sed -i "s/\${JAVA}/sudo -u xmedia \${JAVA}/" /usr/share/subsonic/subsonic.sh
fi

/usr/share/subsonic/subsonic.sh
