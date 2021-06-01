highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'nightelf'

" Functions {
function! s:generate_base_colors(base1)
  let b1 = s:RGB2HSL(s:hex2RGB(a:base1))
  let b2 = [b1[0], b1[1], b1[2]+5]
  let b3 = [b1[0], b1[1], b2[2]+10]
  let b4 = [b1[0], b1[1], b3[2]+15]
  let b5 = [b1[0], b1[1], b4[2]+20]
  return [a:base1,
        \ s:RGB2hex(s:HSL2RGB(b2)),
        \ s:RGB2hex(s:HSL2RGB(b3)),
        \ s:RGB2hex(s:HSL2RGB(b4)),
        \ s:RGB2hex(s:HSL2RGB(b5))]
endfunction

function! s:hex2RGB(hex)
  let R = printf("%d", "0x".a:hex[1:2])
  let G = printf("%d", "0x".a:hex[3:4])
  let B = printf("%d", "0x".a:hex[5:6])
  return [R,G,B]
endfunction

function! s:RGB2hex(RGB)
  return printf("#%x%x%x", a:RGB[0], a:RGB[1], a:RGB[2])
endfunction

function! s:RGB2HSL(RGB)
  let R = a:RGB[0]
  let G = a:RGB[1]
  let B = a:RGB[2]

  let MAX = max([R, G, B])
  let MIN = min([R, G, B])

  let H = MAX - MIN
  if H > 0
    if MAX == R
      let H = 60 * (G - B) / H
    elseif MAX == G
      let H = 60 * (B - R) / H + 120
    elseif MAX == B
      let H = 60 * (R - G) / H + 240
    endif
    if H < 0
      let H += 360
    endif
  endif

  let CNT = (MAX + MIN) / 2
  if CNT < 128
    let S = 100 * (MAX - MIN) / (MAX + MIN)
  else
    let S = 100 * (MAX - MIN) / (510 - MAX - MIN)
  endif

  let L = CNT * 100 / 255

  return [H,S,L]
endfunction

function! s:HSL2RGB(HSL)
  let H = a:HSL[0]
  let S = a:HSL[1]
  let L = a:HSL[2]

  if L < 50
    let MAX = 255 * (L + L*S/100) / 100
    let MIN = 255 * (L - L*S/100) / 100
  else
    let MAX = 255 * (L + (100-L)*S/100) / 100
    let MIN = 255 * (L - (100-L)*S/100) / 100
  endif

  if H < 60
    let R = MAX
    let G = H * (MAX-MIN) / 60 + MIN
    let B = MIN
  elseif H < 120
    let R = (120-H) * (MAX-MIN) / 60 + MIN
    let G = MAX
    let B = MIN
  elseif H < 180
    let R = MIN
    let G = MAX
    let B = (H-120) * (MAX-MIN) / 60 + MIN
  elseif H < 240
    let R = MIN
    let G = (240-H) * (MAX-MIN) / 60 + MIN
    let B = MAX
  elseif H < 300
    let R = (H-240) * (MAX-MIN) / 60 + MIN
    let G = MIN
    let B = MAX
  else
    let R = MAX
    let G = MIN
    let B = (360-H) * (MAX-MIN) / 60 + MIN
  endif
  return [R,G,B]
endfunction

function! s:hi(group, fg, bg, attr)
  let l:attr = a:attr
  "if g:neodark#italics == 0 && l:attr ==? 'italic'
    "let l:attr = 'none'
  "endif

  if !empty(a:fg)
    exec 'hi ' . a:group . ' guifg=' . a:fg[0] . ' ctermfg=' . a:fg[1]
  endif

  if !empty(a:bg)
    exec 'hi ' . a:group . ' guibg=' . a:bg[0] . ' ctermbg=' . a:bg[1]
  endif

  if l:attr != ''
    exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr . ' guisp=NONE'
  endif
endfun
" }


"if !exists('g:nightelf_bold')
  "let g:nightelf_bold=1
"endif

if !exists('g:nightelf_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:nightelf_italic=1
  else
    let g:nightelf_italic=0
  endif
endif

if !exists('g:nightelf_background')
  let g:nightelf_background='#363636'
endif

if !exists('g:nightelf_solid_vertsplit')
  let g:nightelf_solid_vertsplit=0
endif

" color generate begin
let bases = s:generate_base_colors(g:nightelf_background)
let s:base1 = [bases[0], 236]
let s:base2 = [bases[1], 237]
let s:base3 = [bases[2], 240]
let s:base4 = [bases[3], 245]
let s:base5 = [bases[4], 250]

let s:red        = ['#d15e64', 168]
let s:green      = ['#98c378', 108]
let s:yellow     = ['#d8aa64', 179]
let s:blue       = ['#86a6e8', 74]
let s:purple     = ['#bb88e5', 140]
let s:orange     = ['#e18254', 173]
let s:pink       = ['#e69ca0', 181]
let s:teal       = ['#6abab6', 73]
let s:beige      = ['#dfbe8d', 180]
let s:aqua       = ['#54ec8c', 50]
let s:brown      = ['#a65832', 130]


call s:hi('NE_Red',                     s:red,        '',    'none')
call s:hi('NE_Green',                   s:green,      '',    'none')
call s:hi('NE_Blue',                    s:blue,       '',    'none')
call s:hi('NE_Yellow',                  s:yellow,     '',    'none')
call s:hi('NE_Purple',                  s:purple,     '',    'none')
call s:hi('NE_Orange',                  s:orange,     '',    'none')

call s:hi('NE_RedBold',                 s:red,        '',    'bold')
call s:hi('NE_GreenBold',               s:green,      '',    'bold')

call s:hi('NE_GreenSign',               s:green,      s:base1,    'none')
call s:hi('NE_YellowSign',              s:yellow,     s:base1,    'none')
call s:hi('NE_RedSign',                 s:red,        s:base1,    'none')
call s:hi('NE_BlueSign',                s:blue,       s:base1,    'none')
" color generate end


" neovim terminal colors
if has('nvim')
  let g:terminal_color_0  = s:base1[0]
  let g:terminal_color_1  = s:red[0]
  let g:terminal_color_2  = s:green[0]
  let g:terminal_color_3  = s:yellow[0]
  let g:terminal_color_4  = s:blue[0]
  let g:terminal_color_5  = s:purple[0]
  let g:terminal_color_6  = s:orange[0]
  let g:terminal_color_7  = s:base4[0]
  let g:terminal_color_8  = s:base2[0]
  let g:terminal_color_9  = s:pink[0]
  let g:terminal_color_10 = s:teal[0]
  let g:terminal_color_11 = s:beige[0]
  let g:terminal_color_12 = s:aqua[0]
  let g:terminal_color_13 = s:base3[0]
  let g:terminal_color_14 = s:brown[0]
  let g:terminal_color_15 = s:base5[0]
endif

" vim terminal colors
let g:terminal_ansi_colors = [s:base1[0], s:red[0], s:green[0], s:yellow[0],
      \ s:blue[0], s:purple[0], s:orange[0], s:base4[0], s:base2[0], s:pink[0],
      \ s:teal[0], s:beige[0], s:aqua[0], s:base3[0], s:brown[0], s:base5[0]]



"coloring Editor begin
call s:hi('NonText',                   s:base4,      '',         'none')
call s:hi('Normal',                    s:base5,      s:base1,    'none')
call s:hi('ColorColumn',               '',           s:base2,    '')
call s:hi('Cursor',                    s:base2,      s:base5,    '')
call s:hi('CursorColumn',              '',           s:base2,    '')
call s:hi('CursorLine',                '',           s:base2,    'none')
call s:hi('CursorLineNr',              s:blue,       s:base1,    'none')
call s:hi('LineNr',                    s:base3,      '',         '')
call s:hi('DiffAdd',                   s:green,      s:base1,    'none')
call s:hi('DiffChange',                s:yellow,     s:base1,    'none')
call s:hi('DiffDelete',                s:red,        s:base1,    'none')
call s:hi('DiffText',                  s:blue,       s:base1,    'none')
call s:hi('FoldColumn',                s:base4,      s:base2,    '')
call s:hi('Folded',                    s:base3,      s:base1,    '')
call s:hi('IncSearch',                 s:beige,      '',         '')
call s:hi('Search',                    s:base1,      s:beige,    '')
call s:hi('MatchParen',                s:aqua,       s:base2,    'underline,bold')
call s:hi('Pmenu',                     s:base5,      s:base2,    '')
call s:hi('PmenuSbar',                 '',           s:base3,    '')
call s:hi('PmenuSel',                  s:base2,      s:green,    '')
call s:hi('PmenuThumb',                '',           s:base1,    '')
call s:hi('SignColumn',                s:base5,      s:base1,    '')
call s:hi('SpecialKey',                s:base4,      '',         '')
call s:hi('SpellBad',                  s:red,        s:base1,    'underline')
call s:hi('SpellCap',                  s:brown,      s:base1,    'none')
call s:hi('SpellRare',                 s:brown,      s:base1,    'none')
call s:hi('SpellLocal',                s:brown,      s:base1,    'none')
call s:hi('StatusLine',                s:base5,      s:base3,    'none')
call s:hi('StatusLineNC',              s:base2,      s:base4,    '')
call s:hi('TabLine',                   s:base4,      s:base2,    'none')
call s:hi('TabLineFill',               s:base4,      s:base2,    'none')
call s:hi('TabLineSel',                s:yellow,     s:base2,    'none')
call s:hi('Visual',                    s:base5,      s:base3,    '')
call s:hi('WildMenu',                  s:base2,      s:green,    '')

hi! link ErrorMsg NE_Red
hi! link WarningMsg NE_Yellow
hi! link ModeMsg NE_Blue
hi! link MoreMsg NE_Blue
hi! link Question NE_Purple
hi! link Directory NE_Purple
hi! link Title NE_Orange


" Solid bar for vertical split
if g:nightelf_solid_vertsplit == 1
  call s:hi('VertSplit',                 s:base2,      s:base2,    'none')
else
  call s:hi('VertSplit',                 s:base4,      s:base1,    'none')
endif

"coloring Editor end
