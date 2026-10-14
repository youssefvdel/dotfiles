# 🍚 dotfiles — all my setups in one place

One repo for everything I configure. Two halves, two install methods —
the README tells you which half you need in 10 seconds.

## Map

| Folder | For | Deploys via | Contents |
|---|---|---|---|
| `zsh/` | Linux shells (WSL included) | `stow zsh` | `.zshrc`, `.p10k.zsh` (zsh4humans + Powerlevel10k) |
| `kanata/` | Linux desktop (systemd service) | `stow kanata` + systemctl | Full-remap Halmak service config, see `kanata/.config/kanata/README.md` |
| `driftwm/` | Linux desktop (dormant) | `stow driftwm` | Wayland compositor config — unused since Windows became main |
| `noctalia/` | Linux desktop (dormant) | `stow noctalia` | Desktop shell config — same as above |
| `environment/` | Linux session | `stow environment` | `qt.conf`, session env vars |
| `windows/` | Windows 11 terminal | copy-paste (paths below) | Ghostty/Noctty config, Oh My Posh `p10k-rainbow` theme, PowerShell profile, WSL `.wslconfig` |
| `keyboard/` | Portable Halmak on Windows | `kanata.exe --cfg <file>` | 3 configs, one per situation — start at [`keyboard/README.md`](keyboard/README.md) |

```text
├── zsh/            stow → ~                     (.zshrc, .p10k.zsh)
├── kanata/         stow → ~/.config/kanata      (linux service variant)
├── driftwm/        stow → ~/.config/driftwm     (dormant)
├── noctalia/       stow → ~/.config/noctalia    (dormant)
├── environment/    stow → ~/.config/environment.d
├── windows/
│   ├── ghostty/        config.ghostty (Catppuccin Mocha, JetBrainsMono NF)
│   ├── oh-my-posh/     p10k-rainbow.omp.json (Powerlevel10k clone for pwsh)
│   ├── powershell/     Microsoft.PowerShell_profile.ps1
│   └── wsl/            .wslconfig (mirrored networking)
└── keyboard/
    ├── README.md                       (which config when + how to run)
    ├── labs-qwerty-to-halmak.kbd       (uni labs: QWERTY machine → Halmak)
    ├── halmak-software-layers.kbd      (Halmak installed as software + layers)
    └── halmak-hardware-layers.kbd      (Halmak in keyboard firmware + layers)
```

## Linux / WSL setup (stow)

```bash
sudo dnf install -y stow        # or: sudo apt install -y stow
git clone git@github.com:youssefvdel/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh kanata environment      # add driftwm/noctalia only on a linux desktop
```

After editing a stowed config: `git add -A && git commit -m "update" && git push`.

Kanata service commands: `kanata -c ~/.config/kanata/kanata.kbd --check`
first, then `sudo systemctl restart kanata`. Full guide in
`kanata/.config/kanata/README.md`.

## Windows setup (copy)

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
Copy-Item windows/oh-my-posh/p10k-rainbow.omp.json "$HOME\Documents\oh-my-posh\themes\"
Copy-Item windows/powershell/Microsoft.PowerShell_profile.ps1 "$HOME\Documents\WindowsPowerShell\"
Copy-Item windows/powershell/Microsoft.PowerShell_profile.ps1 "$HOME\Documents\PowerShell\"
# ghostty: windows/ghostty/config.ghostty -> %LOCALAPPDATA%\ghostty\ (or noctty\)
# wsl:     windows/wsl/.wslconfig -> %USERPROFILE%\.wslconfig, then wsl --shutdown
```

Keyboard on Windows (portable, no admin needed):
`kanata.exe --cfg keyboard/<one-of-the-three>.kbd` — details in
[`keyboard/README.md`](keyboard/README.md).
