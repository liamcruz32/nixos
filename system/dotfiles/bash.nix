{pkgs, ...}:
{
  programs.bash = {
    enable=true;
    shellAliases = {
      ls="ls -CF --color";
      la="ls -A --color";
      ll="ls -lha --color";
      ".."="cd ..";
      mkdir="mkdir -pv";
      wget="wget -c";
      mv="mv -v";
      cp="cp -v";
    };
    bashrcExtra = ''
      PS1="\[\033[m\]|\[\033[1;31m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;34m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;33m\][\W]> \[\e[0m\]"
      export VISUAL=vim
      export EDITOR="$VISUAL"
    '';
  };
}
