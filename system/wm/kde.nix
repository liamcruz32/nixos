{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    kde-gtk-config
    adapta-gtk-theme
    paper-gtk-theme
    vimix-gtk-theme
    orchis-theme
    gruvbox-dark-gtk
    luna-icons
    zafiro-icons
  ];
}
