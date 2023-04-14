{ config, pkgs, ... }:

{
  system.stateVersion = "22.11"; # Did you read the comment?
  # # nix.nixPath = [ 
  # #   "nixos-config=/home/liamcruz/nixos/configuration.nix"
  # #   "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
  # ];

  imports =
    [ 
      ./hardware-configuration.nix

      ./modules/desktop.nix
      ./modules/system.nix
      ./modules/themes.nix
    ];

  users.users.liamcruz = {
    isNormalUser = true;
    home = "/home/liamcruz";
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
  };

}
