{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.dash-to-dock
    gnomeExtensions.vitals
    gnomeExtensions.workspace-indicator
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.worksets
    gnomeExtensions.coverflow-alt-tab
  ];
  environment.gnome.excludePackages = with pkgs; [ 
    gnome-photos
    gnome.gnome-music
    gnome.gnome-terminal
    epiphany
    gnome.gnome-characters
    gnome.totem
    gnome.tali
    gnome.iagno
    gnome.hitori
    gnome.atomix
    gnome-tour 
    gnome.geary
  ];
}
