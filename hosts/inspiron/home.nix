{config, pkgs, inputs, ...}: let

pkgsold = inputs.nixpkgsnew.legacyPackages.x86_64-linux;
user = "ethan"

in {
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  #home.pointerCursor = "Vanilla-DMZ"; 
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
  imports = [
    #inputs.noctalia.homeModules.default
    ../../common/nvf.nix
    ../../common/niri/waybar.nix
  ]; 
#  home.file.".bashrc".source = ./.bashrc;

  home.packages = with pkgs; [
    fastfetch
    nnn
    eza
    ncdu
    lazygit
    
    libnotify

    btop

    brightnessctl
    killall
    feh
    
    playerctl
    pavucontrol

    gnomeExtensions.paperwm
    swaybg
    xwayland-satellite    
    #font-awesome_4    
    pkgsold.gnomeExtensions.raccoon-launcher
    #neovim
    
    wakatime-cli
    
    prismlauncher

    localsend
    godot_4_7

    zip
    xz
    unzip
    
    networkmanagerapplet

    pciutils
    usbutils
  ];
  
  home.file.".wallpapers".source = ./wallpapers;

    
  xdg.enable = true;
  

  
  xdg.configFile."niri/config.kdl".source = ./config/niri/niri.kdl;
  #xdg.configFile."waybar/config.jsonc".source = ./config/waybar.jsonc;
 # xdg.configFile."waybar/style.css".source = ./config/style.css;
  #xdg.configFile."niri/config.kdl".force = true;
  
  services.swayosd = {
    enable = true;
    topMargin = 0.9;
  };


  programs.ghostty = {

    enable = true;
    package = pkgs.ghostty;
    enableBashIntegration = true;
  };
  
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    extensions = with pkgs.vscode-extensions; [
      wakatime.vscode-wakatime
      bbenoist.nix
    ];
  };

  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      paperwm.extensionUuid
      pkgsold.gnomeExtensions.raccoon-launcher.extensionUuid
    ];
  };

  dconf.settings."org/gnome/desktop/input-sources" = {
    xkb-options = ["caps:escape"];
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
    shellAliases = {
      ls = "eza -la";
      lock = "swaylock";
    };
  };

# FOR NIRI
  programs.alacritty.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      screenshots = true;
      clock = true;
      indicator = true;
      effect-blur = "4x5";
    };
  }; 

  services.mako.enable = true;
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;


  home.stateVersion = "26.05";
}
