{ config, pkgs, callPackage, ... }: 

{
  programs = {
    nm-applet.enable = true;
  };

  environment = {
    pathsToLink = [ "/libexec" ];
    systemPackages = with pkgs; [
      playerctl lxappearance acpi dunst
      rofi pavucontrol nitrogen firefox
      xfce.thunar alacritty
    ];
  };

  services = {
    picom.enable = true;
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
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

