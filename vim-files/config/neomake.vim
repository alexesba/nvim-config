let g:neomake_javascript_eslint_exe = g:eslint_exe
let g:neomake_ruby_exe = g:ruby_rubocop_exe
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascriptreact_enabled_makers = ['eslint']
let g:neomake_open_list = 0
let g:neomake_place_signs = 1
let g:neomake_error_sign = {
         \ 'text': '☠',
         \ 'texthl': 'NeomakeErrorSign',
         \ }
     let g:neomake_warning_sign = {
         \   'text': '⚡',
         \   'texthl': 'NeomakeWarningSign',
         \ }

     let g:neomake_message_sign = {
          \   'text': '➤',
          \   'texthl': 'NeomakeMessageSign',
          \ }
     let g:neomake_info_sign = {
          \ 'text': '➜',
          \ 'texthl': 'NeomakeInfoSign'
          \ }

autocmd! BufWritePost,BufEnter,InsertLeave *.rb,*.jsx,*.js,*.rb,*.arb Neomake
