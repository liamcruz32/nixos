{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      displayManager.defaultSession = "xfce+openbox";
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          enableXfwm = false;
        };
      };
      windowManager.openbox.enable = true;
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
    openbox-menu
    obconf
    tint2
    nitrogen
    lxappearance
    rofi
    eww
  ];
}
