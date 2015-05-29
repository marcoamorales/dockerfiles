#! /bin/sh

set -e

SUBSONIC_USER=subsonic
SUBSONIC_USER_UID=2001

if [ $SUBSONIC_USER ]; then
  if [ $SUBSONIC_USER_UID ]; then
    useradd -u $SUBSONIC_USER_UID $SUBSONIC_USER
  else
    useradd $SUBSONIC_USER
  fi

  sed -i "s/\${JAVA}/sudo -u $SUBSONIC_USER \${JAVA}/" /usr/share/subsonic/subsonic.sh
fi

/usr/share/subsonic/subsonic.sh
