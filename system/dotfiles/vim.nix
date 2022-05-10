{pkgs, ...}:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nerdtree
      syntastic
      taglist-vim
      lightline-vim
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
}
