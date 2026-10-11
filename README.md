# os-myx.common-freebsd

The FreeBSD install entry point for `myx.common`. It carries no commands of its
own — all `myx.common` command logic, FreeBSD implementations included, lives in
[os-myx.common](https://github.com/myx/os-myx.common).

## Requirements

- FreeBSD, and a root shell. The script stops with an error when it is not run as root.
- Network access to `raw.githubusercontent.com` and `github.com`. The script downloads with `fetch`, which is part of the base system.

## Install

Run as root:

	fetch https://raw.githubusercontent.com/myx/os-myx.common-freebsd/master/sh-scripts/install-myx.common-freebsd.sh -o - | sh -e

Or, with no network access to this file, paste the script instead. Run this as
root, paste the whole script text, then press CTRL+D:

	sh -c 'eval "`cat`"'

The installer bootstraps `pkg` and installs `ca_root_nss` if needed, unpacks
`os-myx.common` into `/usr/local/`, then sets `/usr/local/bin/myx.common` and
`/usr/local/share/myx.common/bin` to `root:wheel` mode 755.

## This script or the auto-detecting installer

Both unpack the same `os-myx.common` master tarball into `/usr/local/`.

- The [auto-detecting installer](https://github.com/myx/os-myx.common/blob/master/docs/installation.md) checks the OS first and picks its steps.
- This script runs the FreeBSD steps with no OS check.
- Run as root on an OS it does not recognise, the auto-detecting installer prints this script's command.

## Next step

	myx.common help

## Upgrade and uninstall

- Upgrade: run the install command again. It unpacks the current `master` over the installed files.
- Reinstall or uninstall with `myx.common` itself. See [Installation](https://github.com/myx/os-myx.common/blob/master/docs/installation.md).

## Related packages

- [os-myx.common](https://github.com/myx/os-myx.common) — the commands themselves.
- [os-myx.common-macosx](https://github.com/myx/os-myx.common-macosx) — macOS install script.
- [os-myx.common-ubuntu](https://github.com/myx/os-myx.common-ubuntu) — Ubuntu and Debian install script.
