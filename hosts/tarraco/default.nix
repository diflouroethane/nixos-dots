{config, lib, pkgs, inputs, ...}:

{
    networking.hostName = "tarraco";

    imports =
    [
        ./hardware-configuration.nix
        (import ../../modules/defaults/niri {inherit pkgs;})
        ../../modules/gaming.nix
        (import ../../modules/nvidia/laptop.nix {inherit pkgs config;})
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    environment.systemPackages = with pkgs; [
        # nothing yet
    ];

    users.users.dfe = {
        isNormalUser = true;
        home = "/home/dfe";
        extraGroups = [
            "wheel"
            "networkmanager"
            "input"
        ];
        
    };

    system.stateVersion = "26.05";
}