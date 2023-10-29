" Function to update the ~/.config/nvim repo
function! UpdateRepoDotFiles()
  exe '! cd ~/.config/nvim && git pull origin $(git rev-parse --abbrev-ref HEAD)'
endfunction

function! PlayReprobado(file)
  call asyncrun#run('!', '' ,  'ogg123 '.a:file)
endfunction

command! Reprobado silent!call PlayReprobado('~/.config/nvim/Reprobado.ogg')

command! Reprobada silent!call PlayReprobado('~/.config/nvim/Reprobada.ogg')

command! UpdateDotFiles call UpdateRepoDotFiles()

function! CleanUpReactFile()
  let save_cursor = getpos(".")
  %s/ \{2,}/ /g
  %s/{/{ /g
  %s/}/ }/g
  %s/ \{2,}/ /g
  execute "normal! \gg \<S-v> \<S-g>="
  call setpos('.', save_cursor)
endfunction

function! FormatHashes()
  :silent! %s/:\([^ ]*\)\(\s*\)=>/\1: /g
  :silent! %s/}, {/},\r {/g
  :silent! %s/"\([^"]*\)"/'\1'/g
  " call setpos('.', save_cursor)
  execute "normal! \gg \<Sv> \<S-g>="
endfunction

function! FormatCss()
  let save_cursor = getpos(".")
  :silent! %s/[{;}]/&\r/g|norm! =gg
  call setpos('.', save_cursor)
endfunction

function! FormatXMLFn()
  :silent %s/\\"/"/g
  :silent! %s/\\n//g
  :silent! %!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
endfunction

" Converts old ruby hashes to the new syntax.
function! UpdateRubyHashes()
  :%s/:\([^ ]*\)\(\s*\)=>/\1:/g
endfunction

" Strip trailing whitespace for code files on save
function! CleanUp()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

function! RemoveExtraEmptyLinesFn()
  let save_cursor = getpos(".")
  :%!cat -s
  call setpos('.', save_cursor)
endfunction

function! ToggleGitHubTableMode()
  if g:table_mode_corner == '|'
    let g:table_mode_corner = '+'
  else
    let g:table_mode_corner='|'
  endif
endfunction

function! ReloadConfigFile()
  :source $MYVIMRC
endfunction

command! Reload silent!call ReloadConfigFile()

function! EditConfigurationFile()
  :e $MYVIMRC
endfunction

command! OpenConfig silent!call EditConfigurationFile()

set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)

function! JsxHotfix()
    setlocal matchpairs=(:),{:},[:],<:>
    let b:match_words = '<\@<=\([^/][^ \t>]*\)\g{hlend}[^>]*\%(/\@<!>\|$\):<\@<=/\1>'
endfunction

function! MkDir()
   if !isdirectory(expand("<afile>:p:h"))
      let confirmation=confirm("Create a new directory?", "&Yes\n&No")
      if confirmation == 1
         call mkdir(expand("<afile>:p:h"), "p")
         lcd %:p:h
         saveas %:t
         echom "Created a new directory:" expand("<afile>:p:h")
         let buf_del = bufnr("$")
         exe "bd" . buf_del
      endif
      redraw
   endif
endfunction

function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

function! LspInstallServers()
  :!npm install -g typescript 
        \ typescript-language-server 
        \ stylelint-lsp 
        \ vscode-langservers-extracted 
        \ @emacs-grammarly/unofficial-grammarly-language-server
        \ sql-language-server

  if filereadable('./Gemfile')
    :!gem install solargraph
  endif
endfunction

function! ConfigItalicFonts() abort
  if exists("g:enable_italic_font") && g:enable_italic_font == 1
    hi Comment gui=italic
    hi Constant gui=italic
    hi PreProc gui=italic
    hi Special gui=italic
    hi Statement gui=italic
    hi Type gui=italic
    hi Keyword gui=italic
    hi jsImport gui=italic
    hi jsThis gui=italic
    hi jsSuper gui=italic
    hi cucumberWhen gui=italic
    hi cucumberThen gui=italic
    hi GruvboxAqua gui=italic
    hi GruvboxOrange gui=italic
  endif
endfunction

