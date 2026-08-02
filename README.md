# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Installs to | Contains |
|---|---|---|
| `zsh` | `~` | `.zshrc`, `.p10k.zsh` |
| `driftwm` | `~/.config/driftwm` | compositor config |
| `noctalia` | `~/.config/noctalia` | shell config |
| `kanata` | `~/.config/kanata` | keyboard remap config |
| `environment` | `~/.config/environment.d` | session env vars |

## Setup on a new machine

```bash
sudo dnf install -y stow
git clone git@github.com:youssefvdel/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh driftwm noctalia kanata environment
```

## Update after changing a config

```bash
# configs are symlinked — edit in place (~/.config/...), then:
cd ~/dotfiles && git add -A && git commit -m "update configs" && git push
```

## Restore from repo

```bash
cd ~/dotfiles && stow -D zsh driftwm noctalia kanata environment  # unlink
git pull                                                          # get latest
stow zsh driftwm noctalia kanata environment                      # relink
```
