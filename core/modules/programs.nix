{ config, pkgs, ... }: 

{
  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    steam.enable = true;
    fuzzel.enable = true;
    
    tmux = {
      enable = true;
      escapeTime = 0;
      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.resurrect
        tmuxPlugins.continuum
        tmuxPlugins.onedark-theme
        ];
      
      extraConfig = ''
        set -g default-terminal "xterm-256color"
        set -g prefix C-a
        unbind C-b
        bind-key C-a send-prefix

        unbind %
        bind | split-window -h

        unbind '"'
        bind - split-window -v

        unbind r
        bind r source-file ~/.tmux.conf

        bind -r j resize-pane -D 5
        bind -r k resize-pane -U 5
        bind -r l resize-pane -R 5
        bind -r h resize-pane -L 5

        bind -r m resize-pane -Z

        set -g mouse on

        set-window-option -g mode-keys vi


        # Copy mode vi
        bind-key -T copy-mode-vi 'v' send -X begin-selection
        bind-key -T copy-mode-vi 'y' send -X copy-selection

        unbind -T copy-mode-vi MouseDragEnd1Pane

     '';
    };
 };
}
