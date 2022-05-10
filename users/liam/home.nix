{ config, pkgs, ... }:

{
  home.username = "liam";
  home.homeDirectory = "/home/liam";
  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    gimp
    libreoffice-fresh
    transmission-gtk
    audacity
    crawl
  ];

  imports = [
    ../../system/dotfiles/vim.nix
    ../../system/dotfiles/tmux.nix
    ../../system/dotfiles/bash.nix
    ../../system/dotfiles/git.nix
  ];
}
