local module = {}

module.install = function(use)
   use 'glepnir/dashboard-nvim'
end


module.configure = function()
end

vim.g.dashboard_default_executive = 'telescope'

local header_light_bg = {
[[Q^  ``;~~::::::::;;;::::::::;;::::::~:::rLFZqDN#gOZt/?;::'-````-,:^\LcicLiiLL|||]],
[[Q:    ,,,:::::::::::::::::::::~~,,,,~;?tqRWgRKZir;::;:;;;::::,,,'',,::;rrrr^;:::]],
[[Qu    -,::::::::::::~~,,,:~,,'',,',;|SqRHKkF=;:;;;>|(JyaZZoSjFzc?r^;::,',,'''''']],
[[QN    .=zz\r;;::~,,,,,,'',''''-.,:\tZUKkF|;::;^\zoKRNQQQQ#NDKKd&dqeyuL;,'`      ]],
[[QQm   ;&##&HUetc\r:,''''-----`.':^vuuz\^:::;\}kg#QQBRNQQQ@@QQNBBB#N6J|~,'`      ]],
[[QQN;  ~NNWWW#QQQNRKZir:'-```````-,::~''':;r/SH#QBk\::KQ@@gQQt,Le}Jvr::'-`       ]],
[[QQQQ~  ^i=^^;;>\c(zt}z?~`````   ``-'',:;r|\(ZdRUL,   ,yUQQQOr//r,',~,,-``       ]],
[[QQQQQ(  `;LtaqW#QQQQRe}|,  ` ````.,::;r||||\}aPvc(?:'-'?uoa}|;'`-'',,,.``       ]],
[[QQQQQ#t  ~uOQ@@QHEq@@@@@QE^``-''',~:;;>|=r;r/zSSoS}z(i/\=^;:,''',~::,'-`        ]],
[[HQQQQRz`'(N@@@Wz:,rgQQQ@@QNu~,,:::,,,,:r||?rr|//icL\||>r^;;::::::::,'-          ]],
[[    z#K  ;O#Nevo\',=SdQ@QWOu^::;:,-`  ';|/\\||\icvi\|?>rr^^;;;;::,'-``          ]],
[[      |     :iJeD6eeeZouJJv(|;;;;:,'``.-`.,::;r|\///\\\||=>r;;::,'.``           ]],
[[      ,       ;i/?>r>?\cvvzz|;;;^;:'`        ``,:^r>=>>>r^;;:::,'--`            ]],
[[      /        >|=r^>||\Lc(|;:;;;^;,-          `,:;;;;;;;;;;::,,'-``            ]],
}


local header_dark_bg = {
[[ :vi||;^^^^^^;;;;;;;;;;;^^^;;;;;;;^^^^;;:~'.``   `.,":;;^>*?|||*r;::~,~,~~~~~:::]],
[[ ;uzi\rr^^;;;;;;;;;;;;;^^^^^^^^^^r^^^;:,``  ``.~:;;;;;;;;;;;^^rr>>rr;;;::::;;;;;]],
[[ 'S2iL*r^;;;;;;;;;;^^^^^^^^rr>>rr>^;:'````-':;;;;;::,,''..'''',,:::;;^r>rr>>>>>>]],
[[  \yu\*:,,::;;;^^^^^^rr>>r>>>=**r;:,.``-':;;;;::,'``       ```` ``.''~;r=?/Llv1t]],
[[  -uSv;    ``.,,::;^>>>=***???*>^;,'',:;;^;;:,-     `              `,:^r=|\/cvzt]],
[[   ;Fx^          ``.~:;>?|||||||*^;;^>=>^;:"'`   -_;^`      ,r~.,,,:;^>?|\\Llvzx]],
[[    ^1(;~::;;;:_,,,,,,:^|||||\\\|?*>>r^;::_,.```~^\icr'`   `:"":r>r^^r*||\\Llvzz]],
[[     ,vz|;~,'`      `.,:r\\|\|||?*^;;;:::::_,'-,,,:^=*>:''',:;>??=>r^r*?|\/Llvzz]],
[[      ,v\^'`    `-`      -:??*=>>r^;;;::::;:",'''',,,~"_:;;^r>>>r^;;^>*|\Liicvzx]],
[[`    `,|>,     ,;^:        '^r^^^^^^^^;:::::::""~,~:::::;;;;^^^;;;^r>*\/LLcc(vvz]],
[[E6Xz, `\\;`  .,'_>^:'`    `':;;;;r*|\\>;:"_:::_~,,~_:::::;;;;;;;^r>?||\L/icl7vvz]],
[[QQQQQt:mq9Z(;~,.``....'',,,,:;;;;;r=|?**|*^^;;:::"""::_:::::;;;^r>*||\\//LLil7vz]],
[[QQQQQNre9OD&Of;~"::::::,,,,,:;;;;;;>|\LiL/\\\|?r;;::::::::;;;;^r>*?|\\\\/iiLLc7v]],
[[QQQQQi"a$KdDgNu::::::::_~,,:;;;;;;;r?\iil(((lL\?r;;;;;;;;;;;;^^r>?||\\Licc(iivvv]],
}


local footer_light_bg = {
[[           ``-',,,-````'r/>f:`:1.``,~'~:;*r::'-'^r,'~|:'````                    ]],
[[      `-',___~,:vL;'``````^L,,:'.--;:,.-''~^^,'--':,:}:_',;,'`                  ]],
[[`.;r;:;|=;:''',,'LB6;-`----,;j?'\F:-``````''_,'''-`-,:/vmNQRZ\:-                ]],
[[::::,',,,,:,:vX^`:w#m^~::;;^/|^:>l;:,''-`---..-```````,L6QQQBQm_`               ]],
[[',''.';i](>~:Lohv;,;tqe(r;r\zojzv\/r;:~,'-````--```  `````':,:u?_,'-`           ]],
[[~:;r:,,:;L};;(uv|\v]fi;~~,'',_~:?*?^^;;;:,',,,'.```` ```````-':::,-`-,-         ]],
[[riKR>,=9RZ^..'_*PQQ@@@Qqt|;,``  ``',:;:_:;|r:'---```````-'''',,:::_''''`        ]],
[[^|]i::aa;'`-;EQQQg##RDORQQgQRhaxL]Zoox=:,:_,.`'',,:,'''--```````-',~:;:_,-      ]],
[['zKv,:;;,``>DQQQ?::cc:^:;N@@@QNKk9kq9Ky|;_'--'_;;;;:~'.':;rr?||v]SmoL^;yR]'`    ]],
[[,:,,S]~~:;]QQQQd:.`'_'_;LgBQN&e}(ue6RNquS\,`'|v{c;:,,'?Se9h6muv*^rL]|;uQQ>''    ]],
[[-'ry/::rcf(^,-.,^rr>r\]oj?~''''',;uR#OXSz;'`rRX(^~'''zDNQ@@@@@Q6?;:Sfrk@Z'````  ]],
[[^m];^ed\::~,,'''''_;:,:^::.-':^:',\eqdeZx^,'~;;;vd&gQ@@@@@@@@@@QO];1gtZZ;'   `-`]],
[[|?::f&z,,^r:,':F>;*LLvir;_,,,:::_:ruMXSov=;,,':^Luk6HBQ@@@@@@@@@Du|cNgOo,`    ``]],
[['.:}NO>'vBz',:\\,,,~,_:|\'.''_1],,:tez?^;_,''''''',_~~~;;*/v]wDNqeSm&QQQ\-``````]],
[[                                                                                ]],
[[                                                                                ]],
[[                              Stop Coming in my Khayal                          ]],
}

local footer_dark_bg = {
[[BBBBBBB###Ng8HK6PkDgggM9x\z;aRerHgMhP9Pm2vtamODOFJhKXcoKRWNN##BBBBBBQQBBBBBQBBBB]],
[[######NDO6mwmX6Z?\jONNgMgg]\$Eo9HDD2o6HDO9P]FkKHH9Z6a^om9$ShK&#BBBQQQQQBBBBBBBBB]],
[[NHjJoeucvjZKOqk$K\ ,oDRHHDDky;v9L^oDWWM&gRKKwk9KKDgDko\=_` `:LoD#BBQBBQQBQQQQBBB]],
[[ZeeZkKUU6EaPZ="{ge_ _FXZoyS]\c]Zz|ue$qODRDDDdHDRRRRWWWk\,     :mg#BBBBBBBBBQBBBB]],
[[K$qOd9j|^?zXZ\;,*j6Sr':?tutL>:;>=L\JSePkKD8gM8DDRgNNNNNgNg9Zke;vwhKDWNBBBBBBQQQQ]],
[[XZj1eUPZu\^Sy?;*cL*^;|jXX$KKkmPavvv]FjojoP9kU$qdRgNNNNggM8RRD9eoahDMD6DNBBBQBBQQ]],
[[t|'`zkv'`:{HdOwv~      'rif$MN##N&9kmjomefcJeODDD&MM8M8RDO999hPeeaw9qqO&NBBBBBBB]],
[[Fi^|Zm::fKRDy,   `  `-'`  ` `,:r\^:;:rve6owUdRKq$hePKKKDDRggNNg&D9kPZSZw6D#BBBBB]],
[[9>'?PejSkR8z-   7ao||oFZy      ',',''';cSwKDDqwojjuaPKHOmuJJ(ci*^;:;\]y;`^ONBBBB]],
[[$ZEP;^PPej^    .oHRKm9mo\`   `:^?;:,``';;/hMKc=^|uZP$Ov;:',,_;?vFx\^cj;  zO9#BBB]],
[[HOx;\eZ1|;?FPDH6FxtzJ/^:;(POqqK9k2;` '~;>uq81`~?]X9OK>-        ,7oZ;;t, :OMR8g#B]],
[[F_^yF:.LooXhUKKOOKwjZke]aeHD9e{eKk/:'.::r{PKXjjf*.``            '^yr`r::SON#BgDg]],
[[c7ea;`>EUFJm6qZ^zyv\\*|1jwUkPaZewet;`~;:?v2P69eF\;,,.           -;i|``':EW###NN8]],
[[Odm^ 'zq= >96Z/LPhhXPwei/9dOqmr^h$or:>7]SmkKKqq9K9PmPXPSjv\?^_- ':;:`   /DWgNNNg]],
[[                                                                                ]],
[[                                                                                ]],
[[                              Stop Coming in my Khayal                          ]],
}

if vim.o.background == 'dark' then
    vim.g.dashboard_custom_header = header_dark_bg
    vim.g.dashboard_custom_footer = footer_dark_bg
else
    vim.g.dashboard_custom_header = header_light_bg
    vim.g.dashboard_custom_footer = footer_light_bg
end

return module

