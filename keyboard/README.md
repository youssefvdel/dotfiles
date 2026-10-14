# ⌨️ keyboard — Halmak via Kanata

Three configs, one per machine situation. Pick the row that matches where
you are sitting, run kanata with that file, type Halmak.

| File | When to use | What it does |
|---|---|---|
| `labs-qwerty-to-halmak.kbd` | **Uni labs** — stock QWERTY Windows, no admin, can't install a layout | Full remap QWERTY → Halmak **plus** layers |
| `halmak-software-layers.kbd` | **Own PC** — Halmak installed as software layout | Keeps Halmak, adds home-row mods + symbol layer |
| `halmak-hardware-layers.kbd` | **Custom keyboard** — Halmak lives in the keyboard firmware | Keeps Halmak, adds home-row mods + symbol layer |

The two `halmak-*` files are identical except key positions and tap-hold
timing (software: 275 ms, hardware: 200 ms). Same symbol layer everywhere.

## Shared layers (all three files)

- **Base** — letters + home-row mods (tap = letter, hold = mod).
  GACS order: Meta, Alt, Ctrl, Shift, mirrored on both hands.
- **`layer_1`** (hold `caps`) — symbols + navigation:
  arrows, `[](){}` `<>` `=+-_*/` `!@#`, `esc`, `del`, `pgup/pgdn` (tap) =
  `home/end` (hold), `ret` on space position.

## Run it

No install needed — kanata is a portable exe, which is exactly why it
works on locked-down lab machines:

```powershell
# one-time: grab the exe (any folder you can write to, e.g. Downloads)
# https://github.com/jtroo/kanata/releases (kanata.exe for Windows)

# labs machine (QWERTY hardware + QWERTY Windows)
.\kanata.exe --cfg labs-qwerty-to-halmak.kbd

# own machine (Halmak software layout installed)
.\kanata.exe --cfg halmak-software-layers.kbd

# custom keyboard (Halmak in firmware)
.\kanata.exe --cfg halmak-hardware-layers.kbd
```

Keep the terminal open while you type — closing it stops the remap.
The exe itself is intentionally **not** stored in this repo; download it
fresh per machine so you always run the latest release.
