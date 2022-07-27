{pkgs, ...}:
{
  programs.rofi = {
    enable = true;
    configPath = "~/nixos/system/applications/config.rasi";
  };
}
