{pkgs, ...}:
{
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
}

