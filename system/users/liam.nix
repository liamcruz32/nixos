{config, pkgs, ...}:
{
  users.users.liam = {
    isNormalUser = true;
    home = "/home/liam";
    extraGroups = ["networkmanager"];
  };
  
  
  programs = {
    steam.enable = true;
    };

  home-manager.useGlobalPkgs = true;
  home-manager.users.liam = {pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      firefox inkscape libreoffice-fresh
      transmission-gtk zoom-us audacity
      crawl brogue ctags
    ];

    programs.gh = {
      enable = true;
    };
    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        nerdtree
        syntastic
        taglist-vim
        lightline-vim
        auto-pairs
        vim-commentary
        vim-fugitive
        vim-nix
        fzf-vim
        papercolor-theme
      ];
      settings = {
        expandtab = true;
        ignorecase = true;
        smartcase = true;
        number = true;
        relativenumber = true;
      };
      extraConfig = ''
        let mapleader = " "
        set noshowmode
        set smarttab
        set tabstop=4
        set softtabstop=4
        set noeb vb t_vb=
        au GUIEnter * set vb t_vb

        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
        autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

        nnoremap <leader>/ :Lines<CR>
        nnoremap ff :NERDTreeToggle<CR>
        nnoremap <leader>pp :TlistToggle<CR>

        set foldmethod=indent
        set foldlevel=99

        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>

        set splitbelow
        set splitright

        let g:lightline = {
            \ 'colorscheme': 'PaperColor',
            \}
      '';
    };
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
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      clock24 = true;
      disableConfirmationPrompt = true;
      keyMode = "vi";
      prefix = "M-a";
      extraConfig = ''
        set-option -g default-command bash

        set -g prefix M-a
        set -g base-index 1
        set -g pane-base-index 1
        set -g status-keys vi
        set -g default-terminal "screen-256color"
        
        bind -n M-n new-window
        bind -n M-q kill-pane
        bind -n M-Q kill-window
        
        bind -n M-enter split-window -h
        bind -n M-h select-pane -L
        bind -n M-l select-pane -R
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U
        
        bind -n M-H previous-window
        bind -n M-L next-window

        set -gq status-fg "#FCFDFE"
        set -gq status-bg "#5E8D87"
        set -gq status-attr "none"

        set -gq window-status-format " #I:#W "
        set -gq window-status-separator ""
        set -gq status-justify centre

        set -gq window-status-current-style "fg=#5E8D87,bold,bg=#FCFDFE"
        set -gq window-status-current-format " #I:#W "
        set -gq pane-active-border-style "fg=#5E8D87, bg=#FCFDFE"

        set -gq pane-border-style "fg=#444444,bg=#FCFDFE"
        set -gq pane-active-border-style "fg=#5E8D87,bg=#eeeeec"
        set -gq display-panes-colour "#444444"
        set -gq display-panes-active-colour "#5E8D87"
      '';
    };
    programs.urxvt = {
      enable = true;
      fonts = ["xft:mononoki Nerd Font Mono:style=Regular:size=13"];
      scroll.bar.enable = false;
      extraConfig = {
        internalBorder = 5;
      };
    };
    xresources.extraConfig = ''
      !! Colorscheme
      *foreground: #eeffff
      *background: #111111
      !
      ! ! black
      *color0: #111111
      *color8: #444444
      ! ! red
      *color1:#A54242
      *color9: #CC6666
      ! ! green
      *color2: #AAFFAA
      *color10:#55BB55
      
      ! ! yellow
      *color3: #DE935F
      *color11: #F0C674
      ! ! blue
      *color4: #1188AA
      *color12: #1188AA
      ! ! magenta
      *color5: #85678F
      *color13: #B294BB
      ! ! cyan
      *color6: #5E8D87
      *color14: #8ABEB7
      ! ! white
      *color7: #ffffff
      *color15: #eeffff
    '';
  };
}
