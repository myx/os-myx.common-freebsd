# MAGIC.md — os-myx.common-freebsd

Notes for maintainers. Users read [README.md](README.md).

## What this project is and is not

- An install entry point only. It never carries commands.
- Every `myx.common` command, the FreeBSD variants included, lives in `os-myx.common` as `bin/<category>/<name>.FreeBSD` or `.Common`. A new command goes there, never here.

## Where things live

- `sh-scripts/install-myx.common-freebsd.sh` — the whole installer.
- `project.inf` — the distro declaration.
- The installed files come from the `os-myx.common` master tarball, not from this repo.

## Owner group: `root:wheel`

- The script sets `/usr/local/bin/myx.common` and `/usr/local/share/myx.common/bin` to `root:wheel`, mode 755.
- `wheel` is FreeBSD's default admin group. The macOS script uses `wheel` too. The Ubuntu script uses `adm`, because Ubuntu has no `wheel` group by default.
- The main installer, `os-myx.common/sh-scripts/install-myx.common.sh`, sets the same group for FreeBSD.

## Distro role

- `Requires: os-myx.common`. Selecting this project brings in `os-myx.common`.
- `Provides: os.any os.freebsd`. All three OS siblings provide `os.any`. Only this one provides `os.freebsd`.
- `deploy-export:` maps the install script to its raw GitHub URL, the one in the README.

## Gotchas

- The unpack step depends on the layout of `os-myx.common`. It takes `*/host/tarball/*` and strips three path components. A move of `host/tarball/` in `os-myx.common` breaks this script.
- The `tar` flags are BSD `tar` syntax (`--include`). The Ubuntu script uses GNU `tar` syntax (`--wildcards`, `--strip-components=3`). Do not copy a `tar` line from one sibling to another.
