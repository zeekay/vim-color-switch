if !exists("g:bebop_loaded")
    let g:bebop_loaded = 1
else
    finish
endif

if !exists('g:colors_dir')
    " Default to ~/.vim/colors because that's where I stick my colorschemes ^_^
    let g:colors_dir = '~/.vim/colors'
endif

let g:colors_list = []
func! s:SwitchColor(direction)
    " Get full list of colors available
    let len = len(g:colors_list)
    if len == 0
        let colors = system('ls '.g:colors_dir)
        if colors =~ 'No such file or directory' || colors == ''
            echoerr 'g:colors_dir set to invalid directory'
            return
        endif
        let g:colors_list = split(colors)
        let len = len(g:colors_list)
    endif

    " Get index of current colorscheme in list of colors
    let idx = index(g:colors_list, g:colors_name.'.vim')

    " Get index of next colorscheme
    if a:direction == 'up'
        let next = idx+1
    elseif a:direction == 'down'
        let next = idx-1
    endif

    " Wrap around if necessary
    if next == len
        let next = 0
    elseif next < 0
        let next = len-1
    endif

    " Clear, change colors, and echo name
    echo
    exe 'colorscheme '.strpart(g:colors_list[next], 0, len(g:colors_list[next])-4)
    redraw!
    echo g:colors_name
endfunc

command! ColorNext call s:SwitchColor('up')
command! ColorPrev call s:SwitchColor('down')
