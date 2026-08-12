{config, pkgs, inputs, ...}: let

pkgsold = inputs.nixpkgsnew.legacyPackages.x86_64-linux;

in {
  home.username = "ethan";
  home.homeDirectory = "/home/ethan";
  #home.pointerCursor = "Vanilla-DMZ"; 
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
  imports = [
    #inputs.noctalia.homeModules.default
    ./config/nvf.nix
  ]; 
#  home.file.".bashrc".source = ./.bashrc;

  home.packages = with pkgs; [
    fastfetch
    nnn
    eza
    ncdu
    lazygit
    
    btop

    brightnessctl
    killall
    feh

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
    
    pciutils
    usbutils
  ];
  
  home.file.".wallpapers".source = ./wallpapers;

    
  xdg.enable = true;
  

  
  xdg.configFile."niri/config.kdl".source = ./config/config.kdl;
  #xdg.configFile."waybar/config.jsonc".source = ./config/waybar.jsonc;
 # xdg.configFile."waybar/style.css".source = ./config/style.css;
  #xdg.configFile."niri/config.kdl".force = true;
  
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
    };
  };

# FOR NIRI
  programs.alacritty.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 5;
        height = 30;
        output = [
          "eDP-1"
        ];
        modules-left = [ "niri/workspaces" "wlr/taskbar" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "temperature" "pulseaudio" "battery" ];
        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-muted = "";
          on-click = "pavucontrol";
          format-icons = {
            headphone = " ";
            default = [" "  " "];
          };
        };
        "temperature" = {
          format = "{temperatureC}  ";
          format-alt = "{temperatureF}  ";
        };
        "clock" = {
          format-alt = "{:%Y-%m-%d}";
        };
        "battery" = {
          bat = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };

          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰃨 ";
          format-plugged = "{capacity}%  ";
          format-critical = "!!! {capactiy}% !!!";
          format-icons = [" " " " " " " " " "];
        };

        "niri/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "niri/window" = {
          max-length = 50;
        };
        "custom/hello-from-waybar" = {
          format = "hello {}";
          max-length = 40;
          interval = "once";
          exec = pkgs.writeShellScript "hello-from-waybar" ''
            echo "from within waybar"
          '';
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", "FontAwesome";
      }
      window#waybar {
        background: #16191C;
        color: #AAB2BF;
      }
      #workspaces button {
        padding: 0 5px;
      }

    '';
  };

  services.mako.enable = true;
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;


  home.stateVersion = "26.05";
}
