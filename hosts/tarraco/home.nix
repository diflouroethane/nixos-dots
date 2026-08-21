{config, pkgs, inputs, lib, ...}: let

user = "dfe";

in {
    home.username = "${user}";
    home.homeDirectory = "/home/${user}";

    imports = [
        (import ../../modules/defaults/niri/home.nix {inherit pkgs config user;})
    ];

    home.packages = with pkgs; [
        prismlauncher
        localsend
        godot_4_7
        networkmanagerapplet
        aseprite
    ];
    
    programs.waybar.settings.mainBar."battery".bat = lib.mkForce "BAT1";

    xdg.enable = true;
    # xdg.configFile."niri/config.kdl".source = lib.mkForce {config.lib.file.mkOutOfStoreSymlink "/home/dfe/.dotfiles/modules/niri/niri.kdl";}

    home.stateVersion = "26.05";
}
