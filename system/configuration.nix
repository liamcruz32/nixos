{ config, pkgs, ... }:

{
  # Imports
  ###########
  imports =
    [ 
      ./hardware-configuration.nix
      ./systempackages.nix
      #<home-manager/nixos>
     
      # WM Nixfiles
      ##############
      ./wm/gnome.nix
      # ./wm/xfce.nix
      # ./wm/i3.nix

      # User Accounts
      ################
      ./users/admin.nix
      ./users/liam.nix

    ];

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Boot settings
  #################
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # Services
  ############
  services = {
    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
    };
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  system.stateVersion = "20.09"; 

  # Hardware
  ############
  nixpkgs.config.allowUnfree = true;
  hardware = {
    enableAllFirmware = true;
    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [
        vaapiIntel
      ];
    };
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      extraConfig = "load-module module-switch-on-connect";
    };
  };

  # Programs
  ############
  programs = {
    vim.defaultEditor = true;
    light.enable = true;
  };

  # Fonts
  ########
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    (nerdfonts.override { fonts = [ "Mononoki" "DroidSansMono" ]; })
  ];


  # Network Settings
  ####################
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = false;
  networking.interfaces.wlp3s0.useDHCP = true;


  # Time Zone
  #############
  time.timeZone = "America/Denver";


  # Internationalisation properties
  ###################################
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
