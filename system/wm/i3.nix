{ config, pkgs, callPackage, ... }: 

{
  programs.nm-applet.enable = true;
  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [
    pulseaudio-ctl
    pavucontrol
    playerctl
    lxappearance
    parted
    acpi
    rofi
    amixer
    nitrogen
  ];

  services = {
    picom.enable = true;
    xserver = {
      desktopManager.xterm.enable = false;
      resolutions = [
        {
          x = 1368;
          y = 768;
        }
      ];
      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          enable = true;
          background = "/home/liam/Pictures/Wallpapers/LakeWallpaper.jpg";
          greeters.gtk.theme.name = "Adwaita-dark";
          };
        };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps; 
        extraPackages = with pkgs; [
          i3status
          i3lock
          i3blocks
        ];
        config = {
          modifier = "Mod4";
          bars = [ ];
          window.border = 0;

          # gaps = {
          #   inner = 15;
          #   outer = 5;
          # };

          keybindings = {
            "XF86AudioMute" = "exec amixer set Master toggle";
            "XF86AudioLowerVolume" = "exec amixer set Master 4%-";
            "XF86AudioRaiseVolume" = "exec amixer set Master 4%+";
            "XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
            "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";
            "Mod4+Return" = "exec ${pkgs.rxvt-unicode}/bin/rxvt-unicode";
            "Mod4+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
            "Mod4+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
            "Mod4+b" = "exec ${pkgs.firefox}/bin/firefox";
            "Mod4+Shift+x" = "exec systemctl suspend";
          };
        };
      };
    };
  };
}

