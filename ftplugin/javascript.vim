if executable('eslint_d') || executable('eslint')
  let syntastic_javascript_checkers = ['eslint']
endif

" Run ESLint as a server/daemon, much faster (no start-up penalty).
" https://github.com/mantoni/eslint_d.js
if executable('eslint_d')
  let syntastic_javascript_eslint_exec = 'eslint_d'
endif

" vim-javascript
" Enable Flow and JSDoc syntax support.
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" vim-jsx
" Enable JSX syntax highlighting in normal `.js` files.
let g:jsx_ext_required = 0
