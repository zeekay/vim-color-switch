if !exists("g:bebop_loaded")
    let g:bebop_loaded = 1
else
    finish
endif

if !exists('g:colors_dir')
    let g:colors_dir = '~/.vim/colors'
endif

let g:colors_list = []
func! s:SwitchColor(direction)
  let len = len(g:colors_list)
  if len == 0
    let g:colors_list = split(system('ls '.g:colors_dir))
    let len = len(g:colors_list)
  endif

  let idx = index(g:colors_list, g:colors_name.'.vim')

  if a:direction == 'up'
    let next = idx+1
  elseif a:direction == 'down'
    let next = idx-1
  endif

  if next == len
    let next = 0
  elseif next < 0
    let next = len-1
  endif

  exe 'colorscheme '.strpart(g:colors_list[next], 0, len(g:colors_list[next])-4)
  echo g:colors_name
endfunc

command! ColorNext call s:SwitchColor('up')
command! ColorPrev call s:SwitchColor('down')
