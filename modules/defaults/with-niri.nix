{pkgs, ...}: {
    imports = [
        ../../modules/nvf.nix
        ../../modules/niri/waybar.nix
        (import ../../modules/niri/home.nix {inherit pkgs;})
        (import ../../modules/common/home.nix {inherit pkgs;})
    ];
}