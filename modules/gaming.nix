{pkgs, ...}: {
  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    # package = pkgs.steam.override { runtime = "sniper"; };
  };
}
