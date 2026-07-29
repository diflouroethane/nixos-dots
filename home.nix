{config, pkgs, inputs, ...}: let

pkgsold = inputs.nixpkgsnew.legacyPackages.x86_64-linux;

in {
  home.username = "ethan";
  home.homeDirectory = "/home/ethan";
  
  home.file.".wakatime.cfg".source = ./.wakatime.cfg

  home.packages = with pkgs; [
    fastfetch
    nnn
    eza
    gnomeExtensions.paperwm
    #swaybg
    #xwayland-satellite    
    #font-awesome    
    pkgsold.gnomeExtensions.raccoon-launcher
    neovim
    
    wakatime-cli

    localsend
    godot

    zip
    xz
    unzip
    
    pciutils
    usbutils
  ];

  imports = [
    #inputs.noctalia.homeModules.default
  ];

  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    enableBashIntegration = true;
  };
  
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      paperwm.extensionUuid
      pkgsold.gnomeExtensions.raccoon-launcher.extensionUuid
    ];
  };

#  programs.noctalia = {
#    enable = true;
#
#    settings = {
#      theme = {
#       mode = "dark";
#       source = "builtin";
#       builtin = "Catppuccin";
#      };    
#    };
#  };

  programs.git = {
    enable = true;
    userName = "Ethan Francis";
    userEmail = "ethanfrancis577@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
        aws.disabled = true;
        gcloud.disabled = true;
    };
  };

 # programs.noctalia = {
 #   enable = true;
#  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

# FOR NIRI
#  programs.alacritty.enable = true;
#  programs.fuzzel.enable = true;
#  programs.swaylock.enable = true;
#  programs.waybar.enable = true;
#  services.mako.enable = true;
#  services.swayidle.enable = true;
#  services.polkit-gnome.enable = true;


  home.stateVersion = "26.05";
}
