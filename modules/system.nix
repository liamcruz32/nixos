{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  systemd.services.systemd-user-sessions.enable = false;
  
  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
    useDHCP = false;
    interfaces = {
      enp0s25.useDHCP = false;
      wlp3s0.useDHCP = true;
    };
  };


  time.timeZone = "America/Denver";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

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
      extraConfig = "load-module module-switch-on-connect";
    };
  };

  services = {
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gnupg git gnumake wget curl acpi
    tmux spacevim p7zip lynx ctags htop file
  ];

  programs = {
    vim.defaultEditor = true;
    light.enable = true;
  };
}
