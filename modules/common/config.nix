{pkgs, ...}:

{
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";
  
  hardware.bluetooth.enable = true;
  
  networking.networkmanager.enable = true;
  
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  
  services.xserver.xkb.options = "caps:escape";
  services.libinput.enable = true;

  services.udisks2.enable = true;

  services.gvfs.enable = true;

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome_4
  ];

  programs.firefox.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  environment.systemPackages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    htop
  ];

  services.openssh.enable = true;

  system.copySystemConfiguration = false;
}