{pkgs, ...}: {
    imports = [
        ../nvf.nix
        ../niri/waybar.nix
        (import ../niri/home.nix {inherit pkgs;})
        (import ../common/home.nix {inherit pkgs;})
    ];
}