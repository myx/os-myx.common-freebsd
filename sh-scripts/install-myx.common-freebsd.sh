#!/bin/sh -e

# There are two ways:
#
# 1) fetch https://raw.githubusercontent.com/myx/os-myx.common-freebsd/master/sh-scripts/install-myx.common-freebsd.sh -o - | sh -e
# or
# 2) To execute this as a script, run:
#		sh -c 'eval "`cat`"'
# on the target machine under the 'root' user, paste whole text from this file, then press CTRL+D.
#


echo 'myx.common BSD Installer started...'

#
# Check user
#
test `id -u` != 0 && echo 'ERROR: Must be root!' && exit 1

fetch https://github.com/myx/os-myx.common-freebsd/archive/master.zip -o - | tar zxvf - --cd "/usr/local/" --include "*/host/tarball/*" --strip-components 3

MYX_COMMON_COMMAND="/usr/local/bin/myx.common"
chown root:wheel "$MYX_COMMON_COMMAND"
chmod 755 "$MYX_COMMON_COMMAND"

MYX_COMMON_DIR="/usr/local/share/myx.common"
chown -R root:wheel "$MYX_COMMON_DIR/bin"
chmod -R 750 "$MYX_COMMON_DIR/bin"

# ETC_DIR="/usr/local/etc"
# chown root:wheel "$ETC_DIR/periodic/daily/403.myx.common"
# chmod 555 "$ETC_DIR/periodic/daily/403.myx.common"

# exec "$MYX_COMMON_DIR/bin/reinstall"

# completion for root in bash
# myx.common setup/console
# myx.common setup/server
