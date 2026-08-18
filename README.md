# My dotfiles!

## how do i use this???

you simply git clone it into your desired dotfiles directory, like so:

```bash
git clone git@github.com:diflouroethane/nixos-dots.git ~/.dotfiles
```
(i use ~/.dotfiles in my case)

then run `sudo nixos-rebuild switch --flake .#inspiron`

(inspiron is the hostname that i have chosen. if you want to change it, go into configuration and do that.)

## whao this is pretty modular,

### why???
why not? and also, because then i don't have to take nearly as long to configure a new system when i am adding it to my configuration :)

### how??
heavily using the `imports = [];` stuff in each nix file

### documentation, please?
uhhh maybe someday. right now, just know that `common/` is the stuff i don't feel like splitting up into different categories, `nvf.nix` is the config for `nvf` obviously, and `gaming.nix` just turns on steam, maybe others (like wine!!) soon. both the `gnome/` and `niri/`  directories have (for both) a home.nix and a config (or default.nix) for the respectable files.




# Credits
the wallpapers in my `wallpapers/` directory come from both https://perfecthue.com and https://mechalove.me . they are not mine. if you use them, please maybe get them from the actual site. thanks.


