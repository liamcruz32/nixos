{ config, pkgs, callPackage, ... }: 

{
  programs.nm-applet.enable = true;
  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [
    playerctl
    lxappearance
    parted
    acpi
    rofi
    pulseaudio
    pavucontrol
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

