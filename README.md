# My dotfiles!
---
## my first time using nixos :tada:

## how do i use this???

you simply git clone it into your desired dotfiles directory, like so:

```bash
git clone git@github.com:diflouroethane/nixos-dots.git ~/.dotfiles
```
(i use ~/.dotfiles in my case)

then run `sudo nixos-rebuild switch --flake .#inspiron`

(inspiron is the hostname that i have chosen. if you want to change it, go into configuration and do that.)
