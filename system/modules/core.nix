{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    gnupg git gnumake wget curl busybox
    screen vim p7zip lynx ctags htop file
  ];
  programs = {
    vim.defaultEditor = true;
    light.enable = true;
  };
}
