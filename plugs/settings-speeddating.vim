
" SpeedDating Settings {{{
if !exists("g:speeddating_no_mappings") || !g:speeddating_no_mappings
  nmap  <M-u>     <Plug>SpeedDatingUp
  nmap  <M-d>     <Plug>SpeedDatingDown
  xmap  <M-u>     <Plug>SpeedDatingUp
  xmap  <M-d>     <Plug>SpeedDatingDown
  nmap d<M-u>     <Plug>SpeedDatingNowUTC
  nmap d<M-d>     <Plug>SpeedDatingNowLocal
  let g:speeddating_no_mappings = 1
endif
" }}}
