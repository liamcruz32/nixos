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
    adapta-gtk-theme
    paper-gtk-theme
    vimix-gtk-themes
    orchis-theme
    gruvbox-dark-gtk
    luna-icons
    zafiro-icons
    material-icons
    vimix-icon-theme
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
