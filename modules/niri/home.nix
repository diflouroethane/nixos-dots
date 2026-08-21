{pkgs, config, user, ...}:
{
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/.dotfiles/modules/niri/niri.kdl";

  services.swayosd = {
    enable = true;
    topMargin = 0.9;
  };
#   programs.niri.enable = true;
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
}
