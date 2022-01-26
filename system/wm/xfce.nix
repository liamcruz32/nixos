{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
      desktopManager.xterm.enable = false;
    };
  };
  environment.systemPackages = with pkgs; [
    adapta-gtk-theme
    paper-gtk-theme
    vimix-gtk-themes
    orchis-theme
    gruvbox-dark-gtk
    luna-icons
    zafiro-icons
  ];
}
