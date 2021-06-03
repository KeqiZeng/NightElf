let s:gray0 = ['#323232', 236]
let s:gray1 = ['#404040', 237]
let s:gray2 = ['#606060', 245]

let s:red        = ['#d15e64', 168]
let s:green      = ['#98c378', 108]
let s:yellow     = ['#d8aa64', 179]
let s:blue       = ['#86a6e8',  74]
let s:purple     = ['#bb88e5', 140]

let g:airline#themes#nightelf#palette = {}

function! airline#themes#nightelf#refresh()
    let g:airline#themes#deus#palette.accents = {
        \ 'red': [ s:red[0], '', s:red[1], 0 ]
        \ }

    let s:N1 = [ s:gray0[0], s:green[0], s:gray0[1], s:green[1] ]
    let s:N2 = [ s:gray2[0], s:gray0[0], s:gray2[1], s:gray0[1] ]
    let s:N1 = [ s:green[0], s:gray0[0], s:green[1],         '' ]
    let g:airline#themes#nightelf#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

    let group = airline#themes#get_highlight('ViCommand')
    let g:airline#themes#nightelf#palette.normal_modified = {
                \ 'airline_c': [ group[0], '', group[2], '', '' ]
                \ }

    let s:I1 = [ s:gray0[0], s:blue[0], s:gray0[1], s:blue[1] ]
    let s:I3 = [ s:blue[0], s:gray0[0], s:blue[1],         '' ]
    let g:airline#themes#nightelf#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:I3)
    let g:airline#themes#nightelf#palette.insert_modified = g:airline#themes#nightelf#palette.normal_modified

    let s:R1 = [ s:gray0[0], s:red[0], s:gray0[1], s:red[1] ]
    let s:R3 = [ s:red[0], s:gray0[0], s:red[1],         '' ]
    let g:airline#themes#nightelf#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:R3)
    let g:airline#themes#nightelf#palette.replace_modified = g:airline#themes#nightelf#palette.normal_modified

    let s:V1 = [ s:gray0[0], s:purple[0], s:gray0[1], s:purple[1] ]
    let s:V3 = [ s:purple[0], s:gray0[0], s:purple[1],         '' ]
    let g:airline#themes#nightelf#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:V3)
    let g:airline#themes#nightelf#palette.visual_modified = g:airline#themes#nightelf#palette.normal_modified

    let s:IA = [ s:gray1[0], s:gray0[0], s:gray1[1], s:gray0[1] ]
    let g:airline#themes#nightelf#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
    let g:airline#themes#nightelf#palette.inactive_modified = g:airline#themes#nightelf#palette.normal_modified

    "Warning
    let s:WI = [ s:gray0[0], s:yellow[0], s:gray0[1], s:yellow[1] ]
    let g:airline#themes#nightefl#palette.normal.airline_warning = [
       \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
       \ ]

    let g:airline#themes#nightelf#palette.normal_modified.airline_warning =
       \ g:airline#themes#nightelf#palette.normal.airline_warning

    let g:airline#themes#nightelf#palette.insert.airline_warning =
       \ g:airline#themes#nightelf#palette.normal.airline_warning

    let g:airline#themes#nightelf#palette.insert_modified.airline_warning =
       \ g:airline#themes#nightelf#palette.normal.airline_warning

    let g:airline#themes#nightelf#palette.visual.airline_warning =
       \ g:airline#themes#nightelf#palette.normal.airline_warning

    let g:airline#themes#nightelf#palette.visual_modified.airline_warning =
       \ g:airline#themes#nightelf#palette.normal.airline_warning

    let g:airline#themes#nightelf#palette.replace.airline_warning =
       \ g:airline#themes#nightelf#palette.normal.airline_warning

    let g:airline#themes#nightelf#palette.replace_modified.airline_warning =
       \ g:airline#themes#nightelf#palette.normal.airline_warning

    " Errors
    let s:ER = [ s:gray0[0], s:red[0], s:gray0[1], s:red[1] ]
    let g:airline#themes#nightelf#palette.normal.airline_error = [
       \ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
       \ ]

    let g:airline#themes#nightelf#palette.normal_modified.airline_error =
       \ g:airline#themes#nightelf#palette.normal.airline_error

    let g:airline#themes#nightelf#palette.insert.airline_error =
       \ g:airline#themes#nightelf#palette.normal.airline_error

    let g:airline#themes#nightelf#palette.insert_modified.airline_error =
       \ g:airline#themes#nightelf#palette.normal.airline_error

    let g:airline#themes#nightelf#palette.visual.airline_error =
       \ g:airline#themes#nightelf#palette.normal.airline_error

    let g:airline#themes#nightelf#palette.visual_modified.airline_error =
       \ g:airline#themes#nightelf#palette.normal.airline_error

    let g:airline#themes#nightelf#palette.replace.airline_error =
       \ g:airline#themes#nightelf#palette.normal.airline_error

    let g:airline#themes#nightelf#palette.replace_modified.airline_error =
       \ g:airline#themes#nightelf#palette.normal.airline_error
endfun

call airline#themes#nightelf#refresh()
