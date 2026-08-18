{config, pkgs, inputs, lib, ...}:
let
user = "user";
in {
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  
  imports = [
    ../../modules/nvf.nix
    (import ../../modules/gnome/home.nix {inherit pkgs;})
    (import ../../modules/common/home.nix {inherit pkgs;})
  ];

  

  home.stateVersion = "26.05";
}