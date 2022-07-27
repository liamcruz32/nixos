{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "liam";
  home.homeDirectory = "/home/liam";
  home.stateVersion = "20.09";

  home.packages = with pkgs; [
    # Applications
    gimp libreoffice-fresh
    protonvpn-cli transmission-gtk
    signal-desktop xfce.xfce4-terminal

    # Games
    crawl angband
  ];

  imports = [
    ../../system/applications/vim.nix
    ../../system/applications/tmux.nix
    ../../system/applications/bash.nix
    ../../system/applications/git.nix
    ../../system/applications/alacritty.nix
    ../../system/applications/dunst.nix
    ../../system/applications/rofi.nix
  ];
}
