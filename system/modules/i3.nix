{ config, pkgs, callPackage, ... }: 

{
  programs = {
    nm-applet.enable = true;
    thunar.plugins = with pkgs; [ xfce.thunar-volman xfce.thunar-archive-plugin ];
  };

  environment = {
    pathsToLink = [ "/libexec" ];
    systemPackages = with pkgs; [
      playerctl lxappearance acpi rofi
      pavucontrol nitrogen firefox
      xfce.thunar xorg.xrandr arandr 
      xarchive dmenu networkmanager_dmenu
    ];
  };

  services = {
    picom = {
      enable = true;
      inactiveOpacity = 0.85;
    };
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      desktopManager.xterm.enable = false;

      resolutions = [
        {
          x = 1280;
          y = 720;
        }
      ];
      windowManager.i3 = {
        enable = true;
        configFile = ../applications/i3.conf;
        package = pkgs.i3-gaps; 
        extraPackages = with pkgs; [
          i3status
          i3lock
          i3blocks
        ];
      };
    };
  };
}  

