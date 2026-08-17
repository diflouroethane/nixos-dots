{pkgs, ...}: {
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
  home.packages = with pkgs; [
    fastfetch
    # nnn
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

    # gnomeExtensions.paperwm
    swaybg
    xwayland-satellite    
    #font-awesome_4    
    # pkgsold.gnomeExtensions.raccoon-launcher
    #neovim
    
    wakatime-cli
    
    # prismlauncher

    # localsend
    # godot_4_7

    zip
    xz
    unzip
    
    # networkmanagerapplet

    pciutils
    usbutils
  ];
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

#   programs.vscode = {
#     enable = true;
#     package = pkgs.vscode.fhs;
#     extensions = with pkgs.vscode-extensions; [
#       wakatime.vscode-wakatime
#       bbenoist.nix
#     ];
#   };

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

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza -la";
      lock = "swaylock";
    };
  };

 # programs.noctalia = {
 #   enable = true;
#  };
}