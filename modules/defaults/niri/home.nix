{pkgs, config, user, ...}: {
    imports = [
        ../../nvf.nix
        ../../niri/waybar.nix
        (import ../../niri/home.nix {inherit pkgs config user;})
        (import ../../common/home.nix {inherit pkgs;})
    ];
}
