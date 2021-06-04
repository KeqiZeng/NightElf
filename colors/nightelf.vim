highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'nightelf'

" Functions {{{
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
" }}}


" Bold Function
if !exists('g:nightelf_bold_function')
  let g:nightelf_bold_function=0
endif


" Italic Comment
if !exists('g:nightelf_italic_comment')
    let g:nightelf_italic_comment=0
endif

if g:nightelf_italic_comment == 1
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:nightelf_italic_comment=1
  else
    let g:nightelf_italic_comment=0
  endif
endif


" Variable Contrast
if !exists('g:nightelf_contrast')
  let g:nightelf_contrast=3
endif

if g:nightelf_contrast == 0
  let s:nightelf_background='#242424'
elseif g:nightelf_contrast == 1
  let s:nightelf_background='#262626'
elseif g:nightelf_contrast == 2
  let s:nightelf_background='#282828'
elseif g:nightelf_contrast == 3
  let s:nightelf_background='#303030'
elseif g:nightelf_contrast == 4
  let s:nightelf_background='#323232'
elseif g:nightelf_contrast == 5
  let s:nightelf_background='#343434'
elseif g:nightelf_contrast == 6
  let s:nightelf_background='#363636'
elseif g:nightelf_contrast == 7
  let s:nightelf_background='#383838'
endif

if !exists('g:nightelf_solid_vertsplit')
  let g:nightelf_solid_vertsplit=0
endif

" color generate {{{

let bases = s:generate_base_colors(s:nightelf_background)
let g:base1 = [bases[0], 236]
let g:base2 = [bases[1], 237]
let g:base3 = [bases[2], 240]
let g:base4 = [bases[3], 245]
let g:base5 = [bases[4], 250]

let s:red        = ['#f15e64', 168]
let s:green      = ['#98c378', 108]
let s:yellow     = ['#d8aa64', 179]
let s:blue       = ['#86a6e8',  74]
let s:purple     = ['#bb88e5', 140]
let s:orange     = ['#e88854', 173]
let s:pink       = ['#ff9999', 181]
let s:teal       = ['#6abab6',  73]
let s:beige      = ['#dfbe8d', 180]
let s:aqua       = ['#54ec8c',  50]
let s:brown      = ['#a65832', 130]


call s:hi('NE_Red',                     s:red,        '',    'none')
call s:hi('NE_Green',                   s:green,      '',    'none')
call s:hi('NE_Blue',                    s:blue,       '',    'none')
call s:hi('NE_Yellow',                  s:yellow,     '',    'none')
call s:hi('NE_Purple',                  s:purple,     '',    'none')
call s:hi('NE_Orange',                  s:orange,     '',    'none')
call s:hi('NE_Pink',                    s:pink,       '',    'none')
call s:hi('NE_Brown',                   s:brown,      '',    'none')

call s:hi('NE_RedBold',                 s:red,        '',    'bold')
call s:hi('NE_GreenBold',               s:green,      '',    'bold')
call s:hi('NE_PurpleBold',              s:purple,     '',    'bold')
call s:hi('NE_BlueBold',                s:blue,       '',    'bold')
call s:hi('NE_OrangeBold',              s:orange,     '',    'bold')
call s:hi('NE_YellowBold',              s:yellow,     '',    'bold')

call s:hi('NE_RedSign',                 s:red,        g:base1,    'none')
call s:hi('NE_GreenSign',               s:green,      g:base1,    'none')
call s:hi('NE_YellowSign',              s:yellow,     g:base1,    'none')
call s:hi('NE_OrangeSign',              s:orange,     g:base1,    'none')
" }}}


" neovim terminal colors
if has('nvim')
  let g:terminal_color_0  = g:base1[0]
  let g:terminal_color_1  = s:red[0]
  let g:terminal_color_2  = s:green[0]
  let g:terminal_color_3  = s:yellow[0]
  let g:terminal_color_4  = s:blue[0]
  let g:terminal_color_5  = s:purple[0]
  let g:terminal_color_6  = s:orange[0]
  let g:terminal_color_7  = g:base4[0]
  let g:terminal_color_8  = g:base2[0]
  let g:terminal_color_9  = s:pink[0]
  let g:terminal_color_10 = s:teal[0]
  let g:terminal_color_11 = s:beige[0]
  let g:terminal_color_12 = s:aqua[0]
  let g:terminal_color_13 = g:base3[0]
  let g:terminal_color_14 = s:brown[0]
  let g:terminal_color_15 = g:base5[0]
endif

" vim terminal colors
let g:terminal_ansi_colors = [g:base1[0], s:red[0], s:green[0], s:yellow[0],
      \ s:blue[0], s:purple[0], s:orange[0], g:base4[0], g:base2[0], s:pink[0],
      \ s:teal[0], s:beige[0], s:aqua[0], g:base3[0], s:brown[0], g:base5[0]]



" Vim-Editor {{{
call s:hi('NonText',                   g:base4,      '',         'none')
call s:hi('Normal',                    g:base5,      g:base1,    'none')
call s:hi('ColorColumn',               '',           g:base2,    '')
call s:hi('Cursor',                    g:base2,      g:base5,    '')
call s:hi('CursorLine',                '',           g:base2,    'none')
call s:hi('CursorLineNr',              s:blue,       g:base1,    'none')
call s:hi('LineNr',                    g:base3,      '',         '')
call s:hi('DiffAdd',                   s:green,      g:base1,    'none')
call s:hi('DiffChange',                s:yellow,     g:base1,    'none')
call s:hi('DiffDelete',                s:red,        g:base1,    'none')
call s:hi('DiffText',                  s:blue,       g:base1,    'none')
call s:hi('FoldColumn',                g:base4,      g:base2,    '')
call s:hi('Folded',                    g:base3,      g:base1,    '')
call s:hi('IncSearch',                 s:beige,      '',         '')
call s:hi('Search',                    g:base1,      s:beige,    '')
call s:hi('MatchParen',                s:aqua,       g:base3,         'underline,bold')
call s:hi('Pmenu',                     g:base5,      g:base2,    '')
call s:hi('PmenuSbar',                 '',           g:base2,    '')
call s:hi('PmenuSel',                  g:base2,      s:green,    '')
call s:hi('PmenuThumb',                '',           g:base4,    '')
call s:hi('SignColumn',                g:base5,      g:base1,    '')
call s:hi('SpecialKey',                g:base4,      '',         '')
call s:hi('SpellBad',                  s:red,        g:base1,    'underline')
call s:hi('SpellCap',                  s:brown,      g:base1,    'none')
call s:hi('SpellRare',                 s:brown,      g:base1,    'none')
call s:hi('SpellLocal',                s:brown,      g:base1,    'none')
call s:hi('StatusLine',                g:base5,      g:base3,    'none')
call s:hi('StatusLineNC',              g:base2,      g:base4,    '')
call s:hi('TabLine',                   g:base4,      g:base2,    'none')
call s:hi('TabLineSel',                s:yellow,     g:base2,    'none')
call s:hi('Visual',                    g:base5,      g:base3,    '')
call s:hi('WildMenu',                  g:base2,      s:green,    '')

hi! link CursorColumn CursorLine
hi! link TabLineFill TabLineFill
hi! link VisualNOS Visual
hi! link ErrorMsg NE_Red
hi! link WarningMsg NE_Yellow
hi! link ModeMsg NE_Blue
hi! link MoreMsg NE_Blue
hi! link Question NE_Purple
hi! link Directory NE_Purple
hi! link Title NE_Orange

" Visual mode cursor
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" Solid bar for vertical split
if g:nightelf_solid_vertsplit == 1
  call s:hi('VertSplit',                 g:base2,      g:base2,    'none')
else
  call s:hi('VertSplit',                 g:base4,      g:base1,    'none')
endif
" }}}


" Standard Syntax {{{

" Comment and TODO
if g:nightelf_italic_comment == 1
  call s:hi('Comment',                   g:base4,      '',         'italic')
  call s:hi('Todo',                      g:base5,      g:base1,    'bold, italic')
else
  call s:hi('Comment',                   g:base4,      '',         'none')
  call s:hi('Todo',                      g:base5,      g:base1,    'bold')
endif


" Function name
if g:nightelf_bold_function == 1
  hi! link Function NE_GreenBold
else
  hi! link Function NE_Green
endif

" Variable name
hi! link Identifier NE_Purple
" Character name
hi! link Character NE_Orange
" String name
hi! link String NE_Orange
" Generic statement
hi! link Statement NE_Blue
" if, then, else, endif, switch, etc.
hi! link Conditional NE_Blue
" for, do, while, etc.
hi! link Repeat NE_Blue
" case, default, etc.
hi! link Label NE_Blue
" try, catch, throw
hi! link Exception NE_Red
" sizeof, "+", "*", etc.
"hi! link Operator NE_Yellow
call s:hi('Operator',                   g:base5,      '',         'none')
" Any other keyword
hi! link Keyword NE_Brown
" Generic preprocessor
hi! link PreProc NE_Blue
" Preprocessor #include
hi! link Include NE_Blue
" Preprocessor #define
hi! link Define NE_Blue
" Same as Define
hi! link Macro NE_Blue
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit NE_Blue
" Generic constant
hi! link Constant NE_Orange
" Boolean constant: true, false
hi! link Boolean NE_Red
" Number constant: 234, 0xff
hi! link Number NE_Red
" Floating point constant: 2.3e10
hi! link Float NE_Red
" Generic type
hi! link Type NE_Pink
" static, register, volatile, etc
hi! link StorageClass NE_Yellow
" struct, union, enum, etc.
hi! link Structure NE_Green
" typedef
hi! link Typedef NE_Pink
" Special
hi! link Special NE_Green
" Error
hi! link Error NE_RedBold

" Delimiter
call s:hi('Delimiter',                 g:base5,      '',         '')
" Underlined
call s:hi('Underlined',                g:base5,      '',         'underline')
" Conceal
call s:hi('Conceal',                   s:beige,      g:base1,    '')

" }}}

" Languages syntax {{{
" C: {{{
hi! link cDefine Define
hi! link cOperator NE_Yellow
" }}}

" C++: {{{
hi! link cppOperator NE_Yellow

" require vim-polyglot
hi! link cppSTLdefine Define
hi! link cppSTLexception Exception

hi! link  NamespaceTag NE_OrangeBold
hi! link  NamespaceAliasTag NE_PurpleBold
hi! link  ClassTag NE_Pink
hi! link  StructureTag NE_Red
hi! link  EnumTag NE_Green
hi! link  EnumValueTag NE_Brown
hi! link  UnionTag NE_Orange
hi! link  FieldTag NE_Orange
hi! link  LocalVariableTag NE_Purple
hi! link  FunctionTag NE_Green
hi! link  MethodTag NE_Green
hi! link  FunctionParameterTag NE_PurpleBold
hi! link  TemplateTypeParameterTag NE_Green
hi! link  TemplateNonTypeParameterTag NE_RedBold
hi! link  TemplateTemplateParameterTag NE_Yellow
hi! link  MacroDefinitionTag NE_Blue
hi! link  MacroInstantiationTag NE_Blue
hi! link  TypedefTag NE_Green
hi! link  UsingDirectiveTag NE_Yellow
hi! link  UsingDeclarationTag NE_Yellow
" }}}


" Python: {{{
hi! link pythonOperator NE_Yellow
hi! link pythonBuiltinObj NE_Purple
hi! link pythonBuiltinFunc NE_Purple
hi! link pythonDecoratorName NE_Green
hi! link pythonImport NE_Blue
hi! link pythonRun NE_Orange
hi! link pythonCoding NE_Orange
hi! link pythonExceptions Exception
hi! link pythonBoolean Boolean
call s:hi('pythonDot',                    g:base3,      g:base1,    'none')
" }}}


" TeX: {{{
hi! link texRefZone NE_Green
hi! link texMath NE_Blue
" }}}


" Go: {{{
hi! link goDirective NE_Brown
hi! link goConstants NE_Pink
hi! link goDeclaration NE_Pink
hi! link goDeclType NE_Yellow
hi! link goBuiltins NE_Orange
hi! link goFunctionCall Function
hi! link goMethodCall Function
" }}}


" Vim: {{{
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link vimLet NE_Blue
hi! link vimMapModKey NE_Orange
hi! link vimMap NE_Purple
hi! link vimNotation NE_Orange
hi! link vimBracket NE_Orange
hi! link vimset NE_Blue
hi! link vimsetEqual NE_Blue
hi! link vimOption NE_Purple
" }}}

" Shell: {{{
hi! link shFunctionKey NE_Orange
hi! link shCommandSub NE_Brown
" }}}


" Diff: {{{
hi! link diffAdded NE_Green
hi! link diffRemoved NE_Red
hi! link diffChanged NE_Yellow
hi! link difFile NE_Purple
" }}}


" Json: {{{
hi! link jsonKeyword NE_Green
hi! link jsonQuote NE_Green
hi! link jsonBraces NE_Blue
hi! link jsonString NE_Orange
" }}}


" Lua: {{{
hi! link luaOperator NE_Yellow
hi! link luaIn NE_Blue
hi! link luaTable NE_Orange
" }}}


" Markdown: {{{
call s:hi('markdownItalic',               s:blue,            '',      'italic')
call s:hi('markdownBold',                 s:purple,          '',      'bold')
call s:hi('markdownBoldItalic',           s:red,             '',      'bold,italic')

"hi! link markdownH1 NE_GreenBold
"hi! link markdownH2 NE_GreenBold
"hi! link markdownH3 NE_BlueBold
"hi! link markdownH4 NE_BlueBold
"hi! link markdownH5 NE_Blue
"hi! link markdownH6 NE_Blue

"hi! link markdownCode NE_Green
"hi! link markdownCodeBlock NE_Green
"hi! link markdownCodeDelimiter NE_Yellow

"hi! link markdownBlockquote NE_Brown
"hi! link markdownListMarker NE_Purple
"hi! link markdownOrderedListMarker NE_Purple
"hi! link markdownRule NE_Brown
"hi! link markdownHeadingRule NE_Brown

"hi! link markdownHeadingDelimiter NE_Orange

"hi! link markdownLinkText NE_Orange
"hi! link markdownIdDeclaration markdownLinkText
"hi! link markdownUrlTitleDelimiter NE_Green

"call s:hi('markdownUrl',                   s:purple,      '',         'underline')
"call s:hi('markdownUrlDelimiter',          g:base4,       '',         '')

" require vim-polyglot
hi! link mkdLink NE_Green
hi! link mkdURL NE_Purple
hi! link mkdInlineURL NE_Purple
hi! link mkdID NE_Pink
hi! link mkdLinkTitle NE_Orange
hi! link mkdCodeStart NE_Green
hi! link mkdCodeDelimiter NE_Green
hi! link mkdCodeEnd NE_Green
" }}}

" Html: {{{
hi! link htmlH1 NE_BlueBold
hi! link htmlH2 NE_BlueBold
hi! link htmlH3 NE_YellowBold
hi! link htmlH4 NE_YellowBold
hi! link htmlH5 NE_Yellow
hi! link htmlH6 NE_Yellow
hi! link htmlTag NE_Blue
hi! link htmlEndTag htmlTag

hi! link htmlTagName NE_PurpleBold
hi! link htmlArg NE_Purple

hi! link htmlScriptTag NE_Orange
hi! link htmlSpecialTagName NE_PurpleBold
call s:hi('htmlTagN', g:base3,  '', 'none')
call s:hi('htmlLink', s:purple, '', 'underline')

hi! link htmlSpecialChar NE_Orange

hi! link htmlBold markdownBold
hi! link htmlItalic markdownItalic
hi! link htmlBoldItalic markdownBoldItalic
hi! link htmlUnderline Underlined
call s:hi('htmlBoldUnderline', s:purple, '', 'bold,underline')
call s:hi('htmlBoldUnderlineItalic', s:red, '', 'bold,underline,italic')
call s:hi('htmlUnderlineItalic', s:blue, '', 'underline,italic')
" }}}

" Xml: {{{
hi! link xmlTag htmlTag
hi! link xmlEndTag htmlEndTag
hi! link xmlTagName htmlTagName
hi! link xmlEqual NE_Blue
hi! link docbkKeyword NE_OrangeBold

hi! link xmlDocTypeDecl NE_Red
hi! link xmlDocTypeKeyword NE_Yellow
hi! link xmlCdataStart NE_Brown
hi! link xmlCdataCdata NE_Green
hi! link dtdFunction NE_Green
hi! link dtdTagName NE_Purple

hi! link xmlAttrib NE_Purple
hi! link xmlProcessingDelim NE_Brown
hi! link dtdParamEntityPunct NE_Brown
hi! link dtdParamEntityDPunct NE_Brown
hi! link xmlAttribPunct NE_Brown

hi! link xmlEntity NE_Orange
hi! link xmlEntityPunct NE_Orange
" }}}


" CSS: {{{
hi! link cssBraces NE_Green
hi! link cssFunctionName Function
hi! link cssIdentifier Identifier
hi! link cssClassName NE_Pink
hi! link cssColor NE_Green
hi! link cssSelectorOp NE_Blue
hi! link cssSelectorOp2 NE_Blue
hi! link cssImportant NE_Green
hi! link cssVendor NE_Brown

hi! link cssTextProp NE_Blue
hi! link cssAnimationProp NE_Blue
hi! link cssUIProp NE_Orange
hi! link cssTransformProp NE_Blue
hi! link cssTransitionProp NE_Blue
hi! link cssPrintProp NE_Blue
hi! link cssPositioningProp NE_Orange
hi! link cssBoxProp NE_Blue
hi! link cssFontDescriptorProp NE_Blue
hi! link cssFlexibleBoxProp NE_Blue
hi! link cssBorderOutlineProp NE_Blue
hi! link cssBackgroundProp NE_Blue
hi! link cssMarginProp NE_Blue
hi! link cssListProp NE_Blue
hi! link cssTableProp NE_Blue
hi! link cssFontProp NE_Blue
hi! link cssPaddingProp NE_Blue
hi! link cssDimensionProp NE_Blue
hi! link cssRenderProp NE_Blue
hi! link cssColorProp NE_Blue
hi! link cssGeneratedContentProp NE_Blue
" }}}


" JavaScript: {{{
hi! link javaScriptNumber Number
hi! link javaScriptBraces NE_Pink
hi! link javaScriptMember NE_Green
hi! link javaScriptMessage NE_Green
hi! link javaScriptGlobal NE_Green
" }}}

" }}}

" Plugins {{{
" CoC: {{{
hi! link CocErrorSign NE_RedSign
hi! link CocWarningSign NE_YellowSign
hi! link CocInfoSign NE_OrangeSign
hi! link CocHintSign NE_GreenSign

hi! link CocErrorVirtualText NE_Red
hi! link CocWarningVirtualText NE_Yellow
hi! link CocInfoVirtualText NE_Orange
hi! link CocHintVirtualText NE_Green

hi! link CocGitAddedSign NE_GreenSign
hi! link CocGitChangedSign NE_YellowSign
hi! link CocGitRemovedSign NE_RedSign
hi! link CocGitTopRemovedSign NE_RedSign
hi! link CocGitChangeRemovedSign NE_OrangeSign

call s:hi('CocWarningFloat',            s:yellow,     g:base2,    'none')
call s:hi('CocErrorFloat',              s:red,        g:base2,    'none')
call s:hi('CocInfoFloat',               s:orange,     g:base2,    'none')
call s:hi('CocHintFloat',               s:green,      g:base2,    'none')
" }}}


" EasyMotion: {{{
hi! link EasyMotionTarget NE_Red
hi! link EasyMotionShade Comment
" }}}


" IndentLine: {{{
if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = g:base4[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = g:base4[0]
endif
" }}}


" GitGutter: {{{
hi! link GitGutterAdd NE_GreenSign
hi! link GitGutterChange NE_YellowSign
hi! link GitGutterDelete NE_RedSign
hi! link GitGutterChangeDelete NE_OrangeSign
" }}}


"-------- Startify: {{{
hi! link StartifyBracket NE_Brown
hi! link StartifyFile NE_Green
hi! link StartifyPath NE_Purple
hi! link StartifySlash NE_Purple
hi! link StartifySection NE_Blue
hi! link StartifyNumber NE_Red
" }}}

