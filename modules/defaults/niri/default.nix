{pkgs, ...}: {
    imports = [
        (import ../../common/config.nix {inherit pkgs;})
        ../../niri/niri.nix
    ];
}