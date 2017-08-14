
augroup paste_easy
    au!
    autocmd InsertCharPre * call <sid>char_inserted()
    autocmd InsertLeave   * call <sid>stop_easy_paste()
augroup END

command! PasteEasyDisable let g:paste_easy_enable=0
command! PasteEasyEnable let g:paste_easy_enable=1

let g:paste_easy_enable = get(g:,'paste_easy_enable',1)

let s:start = reltime()
let s:past_easy_mode = 0

func! s:char_inserted()
    if g:paste_easy_enable==0
        return
    endif
    if s:past_easy_mode
        return
    endif
    let l:passed = reltimefloat(reltime(s:start))
    let s:start = reltime()
    if l:passed <= 0.01
        " no way a human could get fast like that
        call s:start_easy_paste()
    endif
endfunc

func! s:start_easy_paste()
    if s:past_easy_mode
        return
    endif
    let s:counter = 0
    let s:changedtick = 0
    let s:past_easy_mode = 1
    set paste

    if !has('timers')
        finish
    endif

    let s:changedtick = 0
    let s:counter = 0
    let s:timer = timer_start(50,function('s:on_timer'), {'repeat': -1})

endfunc

func! s:stop_easy_paste()
    if s:past_easy_mode==0
        return
    endif

    let s:past_easy_mode = 0
    set nopaste
    echom 'paste-easy end'

    if !has('timers')
        finish
    endif
    call timer_stop(s:timer)
endfunc

func! s:on_timer(timer)

    if s:changedtick == b:changedtick
        let s:counter += 1
    else
        let s:counter = 0
    endif

    let s:changedtick = b:changedtick

    if s:counter >= 2
        call s:stop_easy_paste()
    endif

endfunc
