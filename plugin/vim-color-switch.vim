if !exists('g:color_switch_loaded')
    let g:color_switch_loaded = 1
else
    finish
endif

func! s:get_colorschemes()
    let paths = split(globpath(&rtp, 'colors/*.vim'), '\n')
    let schemes = {}

    for path in paths
        let file = split(path, '/')[-1]
        let name = strpart(file, 0, len(file)-4)
        exe 'let schemes["'.name.'"] = 1'
    endfor

    return sort(keys(schemes))
endf

func! s:switch_color(direction)
    if !exists('g:color_switch_schemes')
        let g:color_switch_schemes = s:get_colorschemes()
    endif

    let num_colorschemes = len(g:color_switch_schemes)

    " Get index of current colorscheme in list of colorschemes
    let idx = index(g:color_switch_schemes, g:colors_name)

    " Get index of next colorscheme
    if a:direction == 'up'
        let next = idx + 1
    elseif a:direction == 'down'
        let next = idx - 1
    endif

    " Wrap around if necessary
    if next == num_colorschemes
        let next = 0
    endif

    " Clear, change colors, and echo name
    echo
    exe 'colorscheme '.g:color_switch_schemes[next]
    redraw!
    echo g:colors_name
endfunc

command! ColorNext call s:switch_color('up')
command! ColorPrev call s:switch_color('down')
