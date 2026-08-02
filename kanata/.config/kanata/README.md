# Kanata — Keyboard Remapper (Fedora)

Kanata is a software keyboard remapper that intercepts your keyboard at the
kernel level and applies custom layouts/layers. It runs as a **system service**
so the remap is active from boot — even at the login screen.

## Files

| Path | Purpose |
|---|---|
| `~/.config/kanata/kanata.kbd` | **The config** — this is the file you edit |
| `~/.config/kanata/README.md` | This file |
| `/usr/local/bin/kanata` | The kanata binary (v1.12.0) |
| `/etc/systemd/system/kanata.service` | System service unit |

## Commands you need

### Restart kanata (after editing the config)

```bash
sudo systemctl restart kanata
```

### Start / Stop / Status

```bash
sudo systemctl start kanata      # start now
sudo systemctl stop kanata       # stop now (keyboard back to normal)
sudo systemctl status kanata     # check if running + recent logs
```

### Boot behavior

```bash
sudo systemctl enable kanata     # start at every boot (default)
sudo systemctl disable kanata    # don't start at boot
```

### Validate the config before applying (IMPORTANT)

```bash
kanata -c ~/.config/kanata/kanata.kbd --check
```

Run this after ANY edit. If it says `config file is valid` — safe to restart.
If it shows an error, fix it first; kanata will refuse to start with a broken
config.

### Watch live logs

```bash
sudo journalctl -u kanata -f
```

## Config cheat-sheet

- `(defsrc ...)` — physical keys you're remapping (layout of your actual keyboard)
- `(defalias ...)` — named actions you can reuse with `@name`
- `(deflayer name ...)` — a layer; the first one is the default
- `@alias` — use an alias in a layer
- `S-<key>` — Shift + key (e.g. `S-;` = `:`). **Bare form only inside aliases** — `(S-x)` is invalid there
- `(tap-hold 150 300 a lsft)` — tap = `a`, hold = Shift
- `_` — pass-through (key does its normal thing)

## Known facts / gotchas

1. **After editing config**: always `kanata -c ~/.config/kanata/kanata.kbd --check` first, then `sudo systemctl restart kanata`
2. kanata grabs ALL keyboards at boot — the remap applies in driftwm, KDE, and the SDDM login screen
3. The `defsrc` row must match your physical keyboard layout exactly — duplicate keys in `defsrc` are an error
4. Backups of older configs live as `kanata.kbd.bak-*` in this folder

## Troubleshooting

- **Keyboard doing nothing weird / feels dead** → `sudo systemctl stop kanata` — instant restore to normal
- **Config error after edit** → check with `--check`, fix, restart
- **Not grabbing keyboard** → `sudo journalctl -u kanata -f` and look for `registering` lines; if `Permission denied` on uinput, re-login or reboot
