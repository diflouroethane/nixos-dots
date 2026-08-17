{config, lib, pkgs, inputs, ...}:

{
    networking.hostName = "otabello";

    imports = 
    [
        ./hardware-configuration.nix
        ../../modules/gnome
        (import ../../common/config.nix {inherit pkgs;})
    ];

    #not EFI, so use this instead
    boot.loader.grub.device = "/dev/sda";
    #CHANGE THIS IF NECESSARY ^^

    users.users.user = {
        isNormalUser = true;
        home = "/home/user";
        extraGroups = [
            "wheel"
            "networkmanager"
            "input"
        ];
        packages = with pkgs; [
            tree
            axel
        ];
    }

    home-manager.users.user = import ./home.nix;

    system.stateVersion = "26.05";
}