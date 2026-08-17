{config, lib, pkgs, inputs, ...}:

{
    boot.zfs.forceImportRoot = false;

    nixpkgs.hostPlatform = "x86_64-linux";
    imports = [
        ../../modules/gnome #import and turn on gnome
        ../../modules/common/config.nix
    ];
    
    networking.hostName = "iso";
    
    users.users.johndoe = {
        isNormalUser = true;
        extraGroups = ["wheel"];
        initialPassword = "nixos";
    };

    system.stateVersion = "26.05";
}