# os-myx.common-freebsd

The FreeBSD install entry point for `myx.common`. It carries no commands of its
own — all `myx.common` command logic, FreeBSD implementations included, lives in
[os-myx.common](https://github.com/myx/os-myx.common).

## Install

Run as root:

	fetch https://raw.githubusercontent.com/myx/os-myx.common-freebsd/master/sh-scripts/install-myx.common-freebsd.sh -o - | sh -e

Or, with no network access to this file, paste the script instead. Run this as
root, paste the whole script text, then press CTRL+D:

	sh -c 'eval "`cat`"'

The installer bootstraps `pkg` and installs `ca_root_nss` if needed, unpacks
`os-myx.common` into `/usr/local/`, then sets `/usr/local/bin/myx.common` and
`/usr/local/share/myx.common/bin` to `root:wheel` mode 755.

## Next step

	myx.common help

## Related packages

- [os-myx.common](https://github.com/myx/os-myx.common) — the commands themselves.
- [os-myx.common-macosx](https://github.com/myx/os-myx.common-macosx) — macOS install script.
- [os-myx.common-ubuntu](https://github.com/myx/os-myx.common-ubuntu) — Ubuntu and Debian install script.
