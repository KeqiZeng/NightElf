let g:airline#themes#nightelf#palette = {}

function! airline#themes#nightelf#refresh()
    let g:airline#themes#nightelf#palette.accents = {
                \ 'red': airline#themes#get_highlight('Error'),
                \ }

    let s:N1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Number', 'fg'], 'none')
    let s:N2 = airline#themes#get_highlight('Pmenu')
    let s:N3 = airline#themes#get_highlight('FoldColumn')
    let g:airline#themes#nightelf#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

    let group = airline#themes#get_highlight('Operator')
    let g:airline#themes#nightelf#palette.normal_modified = {
                \ 'airline_c': [ group[0], '', group[2], '', '' ]
                \ }

    let s:I1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Statement', 'fg'], 'none')
    let g:airline#themes#nightelf#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
    let g:airline#themes#nightelf#palette.insert_modified = g:airline#themes#nightelf#palette.normal_modified

    let s:R1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Error', 'fg'], 'none')
    let g:airline#themes#nightelf#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
    let g:airline#themes#nightelf#palette.replace_modified = g:airline#themes#nightelf#palette.normal_modified

    let s:V1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Identifier', 'fg'], 'none')
    let g:airline#themes#nightelf#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
    let g:airline#themes#nightelf#palette.visual_modified = g:airline#themes#nightelf#palette.normal_modified

    let s:IA = airline#themes#get_highlight2(['NonText', 'fg'], ['CursorLine', 'bg'])
    let g:airline#themes#nightelf#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
    let g:airline#themes#nightelf#palette.inactive_modified = g:airline#themes#nightelf#palette.normal_modified

    "Warning
    let s:WI = airline#themes#get_highlight2(['Normal', 'bg'], ['Operator', 'fg'], 'none')
    "let g:airline#themes#nightefl#palette.normal.airline_warning = [
       "\ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
       "\ ]
    let g:airline#themes#nightefl#palette.normal.airline_warning = [
       \ s:WI[0], s:WI[1]
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
    let s:ER = airline#themes#get_highlight2(['Normal', 'bg'], ['Error', 'fg'], 'none')
    "let g:airline#themes#nightelf#palette.normal.airline_error = [
       "\ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
       "\ ]
    let g:airline#themes#nightelf#palette.normal.airline_error = [
       \ s:ER[0], s:ER[1]
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
