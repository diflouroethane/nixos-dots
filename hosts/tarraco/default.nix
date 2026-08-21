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
    boot.initrd.luks.devices."luks-a83d6c13-43c6-4be2-ae4d-12f24f3e4530".device = "/dev/disk/by-uuid/a83d6c13-43c6-4be2-ae4d-12f24f3e4530";


    environment.systemPackages = with pkgs; [
        nvtopPackages.full
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
     
    services.pipewire = {
	alsa.enable = true;
        alsa.support32Bit = true;
    };

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };


    system.stateVersion = "26.05";
}
