{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 1;
        height = 30;
        output = [
          "eDP-1"
        ];
        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "pulseaudio" "network" "backlight" "battery" ];
        "pulseaudio" = {
          format = "{icon} {volume}%";
          tooltip-format = "volume: {volume}% on {desc}";
          format-muted = "";
          on-click = "pavucontrol";
          format-icons = {
            headphone = "";
            default = ["󰕿" "󰖀" "󰕾"];
          };
        };
        "cpu" = {
          format = " {usage}%";
        };
        "memory" = {
          format = " {used}%"; 
        };
        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = ["󰃞" "󰃟" "󰃠"];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };
        "network" = {
          format-wifi = "{essid}: {ipaddr}";
          tooltip-format = "{essid} via {ifname}: {ipaddr}";
          format-disconnected = "󰤭";
          format-icons = ["󰤟" "󰤢" "󰤥" "󰤨"];
          on-click = "nm-connection-editor";
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
          format-charging = "{capacity}% 󰃨";
          format-plugged = "{capacity}% ";
          format-critical = "!!! {capactiy}% !!!";
          format-icons = ["" "" "" "" ""];
        };

        "niri/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "niri/window" = {
          max-length = 50;
        };
        #"custom/hello-from-waybar" = {
        #  format = "hello {}";
        #  max-length = 40;
        #  interval = "once";
        #  exec = pkgs.writeShellScript "hello-from-waybar" ''
        #    echo "from within waybar"
        #  '';
        #};
      };
    };
    style = ''
      @define-color black #5a5a5a;
      @define-color red #ff9a9e;
      @define-color green #b5e8a9;
      @define-color yellow #ffe6a7;
      @define-color blue #63a4ff;
      @define-color magenta #dda0dd;
      @define-color cyan #a3e8e8;
      @define-color white #ffffff;
      @define-color orange #ff8952;

      @define-color pulseaudio-color @orange;
      @define-color pulseaudio-muted-color @red;
      @define-color cpu-color @green;
      @define-color memory-color @magenta;
      @define-color battery-color @cyan;
      @define-color battery-charging-color @green;
      @define-color battery-critical-color @red;
      @define-color network-color @blue;
      @define-color network-disconnected-color @red;
      @define-color backlight-color @yellow;


      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", "FontAwesome";
        font-size: 14px;
        min-height: 0;
      }
      window#waybar {
        background: #16191C;
        color: #AAB2BF;
      }
      #workspaces button {
        padding: 0 5px;
      }

      #cpu,
      #memory,
      #battery,
      #network,
      #pulseaudio,
      #backlight {
        padding: 0 10px;
        margin: 0 2px;
        border-bottom: 2px solid transparent;
        background-color: transparent;
      }

      #cpu {
        color: @cpu-color;
        border-bottom-color: @cpu-color;
      }

      #memory {
        color: @memory-color;
        border-bottom-color: @memory-color;
      }

      #battery {
        color: @battery-color;
        border-bottom-color: @battery-color;
      }

      #battery.charging,
      #battery.plugged {
        color: @battery-charging-color;
        border-bottom-color: @battery-charging-color;
      }

      #battery.critical:not(.charging) {
        color: @battery-critical-color;
        border-bottom-color: @battery-critical-color;
      }
      
      #network {
        color: @network-color;
        border-bottom-color: @network-color;
      }

      #network.disconnected {
        color: @network-disconnected-color;
        border-bottom-color: @network-disconnected-color;
      }

      #pulseaudio {
        color: @pulseaudio-color;
        border-bottom-color: @pulseaudio-color;
      }

      #pulseaudio.muted {
        color: @pulseaudio-muted-color;
        border-bottom-color: @pulseaudio-muted-color;
      }
      

      #backlight {
        color: @backlight-color;
        border-bottom-color: @backlight-color;
      }

    '';
  };
}
