{ config, pkgs, callPackage, ... }: 

{
  environment = {
    pathsToLink = [ "/libexec" ];
    systemPackages = with pkgs; [
      polybarFull rofi dunst picom
      lxappearance pavucontrol nitrogen arandr
      xfce.thunar xarchive alacritty
      gimp libreoffice-fresh gthumb qgis
    ];
  };

  programs = {
    nm-applet.enable = true;
    thunar.plugins = with pkgs; [ xfce.thunar-volman xfce.thunar-archive-plugin ];
    firefox = {
      enable = true;
    };
  };

  services = {
    blueman.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      displayManager.lightdm.enable = true;
      windowManager.herbstluftwm.enable = true;
      desktopManager.xterm.enable = false;
      resolutions = [
        {
          x = 1280;
          y = 720;
        }
      ];
    };
  };
}  

