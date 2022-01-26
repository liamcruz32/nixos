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
    gnomeExtensions.arcmenu
    gnomeExtensions.workspace-indicator
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.coverflow-alt-tab
    orchis-theme
    zafiro-icons
  ];
  environment.gnome.excludePackages = with pkgs; [ 
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
