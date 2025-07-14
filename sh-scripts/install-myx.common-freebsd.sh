#!/bin/sh -e

# There are two ways:
#
# 1) fetch https://raw.githubusercontent.com/myx/os-myx.common-freebsd/master/sh-scripts/install-myx.common-freebsd.sh -o - | sh -e
# or
# 2) To execute this as a script, run:
#		sh -c 'eval "`cat`"'
# on the target machine under the 'root' user, paste whole text from this file, then press CTRL+D.
#

echo "myx.common FreeBSD Installer started..." >&2
test `id -u` != 0 && echo '⛔ ERROR: Must be root!' >&2 && exit 1

pkg bootstrap -y ; [ -n "$( pkg info | grep ca_root )" ] || pkg install -y ca_root_nss

fetch https://github.com/myx/os-myx.common/archive/master.tar.gz -o - | \
		tar zxvf - -C "/usr/local/" --include "*/host/tarball/*" --strip-components 3
		
chown root:wheel "/usr/local/bin/myx.common"
chmod 755 "/usr/local/bin/myx.common"

chown -R root:wheel "/usr/local/share/myx.common/bin"
chmod -R 755 "/usr/local/share/myx.common/bin"

echo "myx.common: installed, run 'myx.common help' for more info."