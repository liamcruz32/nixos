{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    gnupg git gnumake wget curl
    tmux vim p7zip rxvt-unicode
  ];

}

