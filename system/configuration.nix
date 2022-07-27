{ config, pkgs, ... }:

{
  system.stateVersion = "20.09"; 

  imports =
    [ 
      ./enableFlakes.nix
      ./hardware-configuration.nix

      ./modules/core.nix
      ./modules/i3.nix
      ./modules/hardware.nix
      ./modules/themes.nix
    ];

  users.users.liam = {
    isNormalUser = true;
    home = "/home/liam";
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
  };

}
