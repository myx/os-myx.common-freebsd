# os-myx.common-freebsd

MDSC myx.distro package. Not needed to use myx.common standalone.

Implements no commands — all myx.common command logic, including the
FreeBSD `os/*` implementations, lives in `os-myx.common` itself. This
package is a supplementary, install-only placeholder: it registers
`os-myx.common-freebsd` in the myx.distro-* package index and exports
`sh-scripts/install-myx.common-freebsd.sh`, giving FreeBSD its own install
entry point/URL.

Files:
- `project.inf` — MDSC package metadata (`Requires: os-myx.common`,
  `Provides: deploy-export:...` exporting the install script's raw URL)
- `sh-scripts/install-myx.common-freebsd.sh` — root-only bootstrap: ensures
  `pkg`/`ca_root_nss`, fetches the `os-myx.common` tarball, extracts it to
  `/usr/local/`, and chowns/chmods `bin/myx.common` + `share/myx.common/bin`
  to `root:wheel` 755
