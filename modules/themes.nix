{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arc-theme
    nordic
    paper-icon-theme
    papirus-icon-theme
  ];

  fonts.fonts = with pkgs; [
    font-awesome
    noto-fonts
    liberation_ttf
    (nerdfonts.override { fonts = [ "Mononoki" "DroidSansMono" ]; })
  ];
}
