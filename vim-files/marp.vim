if exists('g:loaded_VimMarp')
  finish
endif
let g:loaded_VimMarp = 1

if !exists(":VimMarp")
  let s:toggle = 1
  function s:BeginMarp()
    if s:toggle
      if &filetype == 'markdown'
        " AsyncRun -mode=term -rows=5 -focus=0 marp "%:p" -w && open "%:p:r.html" && marp "%:p" -w
        AsyncRun marp "%"  && open "%:r".html && marp "%"  --watch
        let s:toggle = 0
      else
        echo 'Filetype is not markdown'
      endif
    else
      AsyncStop
      echo 'Rendering stopped'
      let s:toggle = 1
    endif
  endfunction
  command VimMarp :call s:BeginMarp()
endif
