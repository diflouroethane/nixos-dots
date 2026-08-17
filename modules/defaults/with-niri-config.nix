{pkgs, ...}: {
    imports = [
        (import ../common/config.nix {inherit pkgs inputs;})
        ../niri/niri.nix
    ];
}