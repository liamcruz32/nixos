{pkgs, ...}:
{
  programs.bash = {
    enable=true;
    shellAliases = {
      ls="ls -CF --color";
      la="ls -A --color";
      ll="ls -lhA --color";
      ".."="cd ..";
      mkdir="mkdir -pv";
      wget="wget -c";
      mv="mv -v";
      cp="cp -v";

      crawls="TERM=xterm-256color ssh -C -l joshua crawl.akrasiac.org";
    };
    bashrcExtra = ''
export PS1="\[\033[0;37m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200")[\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h\[\033[0;37m\]]\342\224\200[\[\033[0;37m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
      export VISUAL=vim
      export EDITOR="$VISUAL"
    '';
  };
}
