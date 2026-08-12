{
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
}
