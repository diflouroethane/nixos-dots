{config, pkgs, inputs, lib, ...}: let

user = "dfe";

in {
    home.username = "${user}";
    home.homeDirectory = "/home/${dfe}";

    imports = [
        (import ../../modules/defaults/niri/home.nix {inherit pkgs config;})
    ];

    home.packages = with pkgs; [
        prismlauncher
        localsend
        godot_4_7
        networkmanagerapplet
    ];

    xdg.enable = true;

    home.stateVersion = "26.05";
}