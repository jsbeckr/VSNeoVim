vim.cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

if has('persistent_undo')
  let target_path = expand('~/.config/vim-persisted-undo/')
  if !isdirectory(target_path)
      call system('mkdir -p ' . target_path)
  endif
  let &undodir = target_path
  set undofile
endif
]])
