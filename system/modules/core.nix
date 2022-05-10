{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    gnupg git gnumake wget curl
    tmux vim p7zip lynx ctags htop
  ];
  programs = {
    vim.defaultEditor = true;
    light.enable = true;
  };
}
