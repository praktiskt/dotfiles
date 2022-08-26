# dotfiles

Here there be dotfiles.

## Usage

```sh
# Collect all current dotfiles into current catalog.
bash collect.sh
```

## Current list

### Aliases

A list of aliases.

### Alacritty

A terminal.

- [Link](https://github.com/alacritty/alacritty)

### Regolith

Desktop environment + i3.

- [Link](https://regolith-desktop.com/) (nit: 2.x+)

### Fusuma

Multi-touch gestures.

- [Link](https://github.com/iberianpig/fusuma)

### Oh my zsh

Custom theme, modified from `gitster`.

- [Link](https://ohmyz.sh/)

### Other fixes

#### i3 borders on Nautilus

On Ubuntu (21.10, 22.04), borders do not display on Nautilus. This can be fixed by adding below to `/etc/regolith/i3/config`;

```sh
for_window [class=.*] border pixel 2
```
