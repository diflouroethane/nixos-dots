{pkgs, config, ...}: {
    imports = [
        ../../nvf.nix
        ../../niri/waybar.nix
        (import ../../niri/home.nix {inherit pkgs config;})
        (import ../../common/home.nix {inherit pkgs;})
    ];
}