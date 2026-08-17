{pkgs, pkgsold, ...}: {
  home.packages = with pkgs; [
    gnomeExtensions.paperwm
    pkgsold.gnomeExtensions.raccoon-launcher
  ]

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
}