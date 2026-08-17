{config, pkgs, inputs, lib, ...}: let

pkgsold = inputs.nixpkgsnew.legacyPackages.x86_64-linux;
user = "ethan";

in {
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  #home.pointerCursor = "Vanilla-DMZ"; 
  
  imports = [
    #inputs.noctalia.homeModules.default
    (import ../../modules/defaults/with-niri-home.nix {inherit pkgs;})
    # ../../modules/nvf.nix
    # ../../modules/niri/waybar.nix
    # (import ../../modules/niri/home.nix {inherit pkgs;})
    # (import ../../modules/common/home.nix {inherit pkgs;})
    
    
  ]; 
#  home.file.".bashrc".source = ./.bashrc;

  #define unique packages you want. defaults are in ../../modules/common/home.nix.
  home.packages = with pkgs; [
    # fastfetch
    nnn
    prismlauncher

    localsend
    godot_4_7
    # eza
    # ncdu
    # lazygit
    
    # libnotify

    # btop

    # brightnessctl
    # killall
    # feh
    
    # playerctl
    # pavucontrol

    # gnomeExtensions.paperwm
    # swaybg
    # xwayland-satellite    
    #font-awesome_4    
    # pkgsold.gnomeExtensions.raccoon-launcher
    #neovim
    
    # wakatime-cli
    

    # zip
    # xz
    # unzip
    
    networkmanagerapplet

    # pciutils
    # usbutils
  ];
  

    
  xdg.enable = true;
  
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

  home.stateVersion = "26.05";
  
  # xdg.configFile."niri/config.kdl".source = ../../modules/niri/niri.kdl;
  #xdg.configFile."waybar/config.jsonc".source = ./config/waybar.jsonc;
 # xdg.configFile."waybar/style.css".source = ./config/style.css;
  #xdg.configFile."niri/config.kdl".force = true;
  
  # services.swayosd = {
  #   enable = true;
  #   topMargin = 0.9;
  # };


  # programs.ghostty = {
  #   enable = true;
  #   package = pkgs.ghostty;
  #   enableBashIntegration = true;
  # };
  
  # programs.direnv = {
  #   enable = true;
  #   enableBashIntegration = true;
  #   nix-direnv.enable = true;
  # };


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

#   programs.git = {
#     enable = true;
#     userName = "Ethan Francis";
#     userEmail = "ethanfrancis577@gmail.com";
#   };

#   programs.starship = {
#     enable = true;
#     settings = {
#         aws.disabled = true;
#         gcloud.disabled = true;
#     };
#   };

#  # programs.noctalia = {
#  #   enable = true;
# #  };

  # programs.bash = {
  #   enable = true;
  #   enableCompletion = true;
  #   shellAliases = {
  #     ls = lib.mkForce "eza -la --icons";
  #     lock = "swaylock";
  #   };
  # };

# FOR NIRI
  # programs.alacritty.enable = true;
  # programs.fuzzel.enable = true;
  # programs.swaylock = {
  #   enable = true;
  #   package = pkgs.swaylock-effects;
  #   settings = {
  #     screenshots = true;
  #     clock = true;
  #     indicator = true;
  #     effect-blur = "4x5";
  #   };
  # }; 

  # services.mako.enable = true;
  # services.swayidle.enable = true;
  # services.polkit-gnome.enable = true;


}
