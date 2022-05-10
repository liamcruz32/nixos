{ pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "liamcruz32";
    userEmail = "liamcruz@protonmail.ch";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      color = {
        ui = "auto";
      };
    };
  };
}
