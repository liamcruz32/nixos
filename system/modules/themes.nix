{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    orchis-theme
    ant-theme
    paper-gtk-theme
    nordic
    adapta-gtk-theme
    paper-icon-theme
    zafiro-icons
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    liberation_ttf
    (nerdfonts.override { fonts = [ "Mononoki" "DroidSansMono" ]; })
  ];
}
