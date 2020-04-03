
" Open Browser Settings {{{
let g:openbrowser_default_search = 'unity3d'
let g:openbrowser_search_engines = extend(
    \get(g:, 'openbrowser_search_engines', {}),
    \{
    \   'unity3d' : 'http://docs.unity3d.com/ScriptReference/30_search.html?q={query}'
    \})
" }}}
