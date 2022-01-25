{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # Utilities
    ############
    gnupg git gnumake xorg.xev wget pulseaudio pavucontrol

    # Tools
    ########
    tmux vim neofetch p7zip rxvt-unicode
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "ffmpeg-3.4.8"
  ];

}

