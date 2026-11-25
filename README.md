# fsw

Manage named watchexec rules on macOS and Linux. Run a rule in the foreground or register it as a launchd or systemd user service.

Install watchexec and Mike Farah’s yq v4. From this checkout run `make install PREFIX="$HOME/.local"` and put `~/.local/bin` on PATH.

Run `fsw edit` to create your registry from the bundled example. Set its directory, filters and command, then run `fsw doctor` and `fsw run NAME`. Use `fsw enable NAME` to start a persistent service and `fsw disable NAME` to remove it. Set `FSW_RULES` to select another registry.

Run `make test` to verify first-run setup under a temporary prefix.
