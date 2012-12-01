# vim-color-switch

Rapidly switch between colorschemes with `ColorNext` and `ColorPrev` commands.

## Install
Set `g:colors_dir` to point to the collection of colorschemes you want to be able to cycle quickly through.

## Supported colorschemes
Only colorschemes wwhich set the `g:colors_name` variable are supported. It should exactly match the filename of the colorscheme. If you need to add it to your favorite colorscheme, you can use the below:

```
let g:colors_name = expand("<sfile>:t:r")
```
