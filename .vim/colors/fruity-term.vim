"
" Fruity Color Scheme
" ===================
"
" Author:   Armin Ronacher <armin.ronacher@active-4.com>
" Version:  0.2
"
set background=dark

hi clear
if exists("syntax_on")
syntax reset
endif

let colors_name = "fruity"

" Default Colors
hi Normal       guifg=#ffffff   guibg=#001217 ctermfg=15 ctermbg=233
hi NonText      guifg=#444444   guibg=#000000 ctermfg=238
hi Cursor       guibg=#aaaaaa ctermbg=248
hi lCursor      guibg=#aaaaaa ctermbg=248
hi Visual       guibg=#004254 ctermbg=23

" Search
hi Search       guifg=#161C00   guibg=#BEED00   gui=bold ctermfg=233 ctermbg=154 cterm=bold
hi IncSearch    guifg=#004357   guibg=#B8EFFF ctermfg=23 ctermbg=159

" Window Elements
hi StatusLine   guifg=#00243B   guibg=#C1CFDE   gui=NONE ctermfg=235 ctermbg=252 cterm=NONE
hi StatusLineNC guifg=#506070   guibg=#DFE9F2 ctermfg=241 ctermbg=254
hi VertSplit    guifg=#a0b0c0   guibg=#a0b0c0 ctermfg=145 ctermbg=145
hi Folded       guifg=#111111   guibg=#8090a0 ctermfg=233 ctermbg=103
hi CursorLine   guibg=#001C24 ctermbg=234
hi ColorColumn  guibg=#011c25 ctermbg=234
hi LineNr       guifg=#aaaaaa   guibg=#00252e ctermfg=248 ctermbg=234
hi CursorLineNr guifg=#ffffff   guibg=#00252e ctermfg=15 ctermbg=234
hi MatchParen   guifg=#CEF2D0   guibg=#105715   gui=bold ctermfg=194 ctermbg=22 cterm=bold

" Signs and gutter
hi SignColumn                             guibg=#002B36 ctermbg=235
hi GitGutterAdd           guifg=#5BCF21   guibg=#002B36 ctermfg=76 ctermbg=235
hi GitGutterChange        guifg=#CF9A21   guibg=#002B36 ctermfg=172 ctermbg=235
hi GitGutterDelete        guifg=#CF2121   guibg=#002B36 ctermfg=160 ctermbg=235
hi GitGutterChangeDelete  guifg=#95CF21   guibg=#002B36 ctermfg=112 ctermbg=235
hi SyntasticErrorSign     guifg=#EB1515   guibg=#3B0000 ctermfg=9 ctermbg=52
hi SyntasticWarningSign   guifg=#ED9A09   guibg=#422A00 ctermfg=208 ctermbg=235

" Completion menu
hi Pmenu        guifg=#ffffff   guibg=#0D4854 ctermfg=15 ctermbg=23
hi PmenuSel     guifg=#ffffff   guibg=#146E80 ctermfg=15 ctermbg=24

" Wild menu active item
hi WildMenu     guibg=#324A61   guifg=#D3E3F2   gui=bold ctermfg=189 ctermbg=239 cterm=bold

" Specials
hi Todo         guifg=#e50808   guibg=#520000   gui=bold ctermfg=160 ctermbg=52 cterm=bold
hi Title        guifg=#ffffff                   gui=bold ctermfg=15 cterm=bold
hi Special      guifg=#fd8900 ctermfg=208

" Syntax Elements
hi String       guifg=#0086d2 ctermfg=32
hi Constant     guifg=#007DC4 ctermfg=32
hi Number       guifg=#0086f7                   gui=bold ctermfg=33 cterm=bold
hi Statement    guifg=#fb660a                   gui=bold ctermfg=202 cterm=bold
hi Function     guifg=#00A6FF ctermfg=39
hi PreProc      guifg=#ff0007                   gui=bold ctermfg=9 cterm=bold
hi Comment      guifg=#00d2ff   guibg=#0a1323   gui=italic ctermfg=233 ctermbg=45 cterm=italic
hi Type         guifg=#00A8A0   gui=NONE ctermfg=37 cterm=NONE
hi Error        guifg=#ffffff   guibg=#ab0000 ctermfg=15 ctermbg=124
hi Identifier   guifg=#79E33B ctermfg=113
hi Label        guifg=#BD55E6 ctermfg=134
hi Operator     guifg=#aaaaaa ctermfg=248

" Minibuf Explorer
hi MBENormal          guifg=#00d2ff ctermfg=45
hi MBEVisibleNormal   guifg=#fd8900 gui=bold ctermfg=208 cterm=bold
hi MBEChanged         guifg=#00d2ff gui=underline ctermfg=45 cterm=underline
hi MBEVisibleChanged  guifg=#fd8900 gui=bold,underline ctermfg=208 cterm=bold,underline

" Python Highlighting for python.vim
hi pythonCoding guifg=#ff0086 ctermfg=198
hi pythonRun    guifg=#ff0086 ctermfg=198
hi pythonBuiltinObj     guifg=#2b6ba2           gui=bold ctermfg=25 cterm=bold
hi pythonBuiltinFunc    guifg=#2b6ba2           gui=bold ctermfg=25 cterm=bold
hi pythonException      guifg=#ee0000           gui=bold ctermfg=9 cterm=bold
hi pythonExClass        guifg=#66cd66           gui=bold ctermfg=77 cterm=bold
hi pythonSpaceError     guibg=#270000 ctermbg=232
hi pythonDocTest    guifg=#3c8e68   guibg=#02101d ctermfg=65 ctermbg=233
hi pythonDocTest2   guifg=#3c8e68   guibg=#02101d ctermfg=65 ctermbg=233
hi pythonFunction   guifg=#82C100               gui=bold ctermfg=106 cterm=bold
hi pythonClass      guifg=#ff0086               gui=bold ctermfg=198 cterm=bold
hi pythonString     guifg=#0086d2   guibg=#031526 ctermfg=32 ctermbg=233
hi pythonEscape     guifg=#fd8900   guibg=#031526 ctermfg=208 ctermbg=233
hi pythonStrFormat  guifg=#fd8900   guibg=#031526 ctermfg=208 ctermbg=233
hi def link pythonOperator pythonStatement

" JavaScript Highlighting
hi javaScript                   guifg=#ffffff ctermfg=15
hi javaScriptRegexpString       guifg=#aa6600 ctermfg=130
hi javaScriptDocComment         guifg=#aaaaaa ctermbg=248
hi javaScriptCssStyles          guifg=#dd7700 ctermfg=172
hi javaScriptDomElemFuncs       guifg=#66cd66 ctermfg=77
hi javaScriptHtmlElemFuncs      guifg=#dd7700 ctermfg=172
hi javaScriptLabel              guifg=#00bdec   gui=italic ctermfg=39 cterm=italic
hi javaScriptPrototype          guifg=#00bdec ctermfg=39
hi javaScriptConditional        guifg=#ff0007   gui=bold ctermfg=9 cterm=bold
hi javaScriptRepeat             guifg=#ff0007   gui=bold ctermfg=9 cterm=bold
hi javaScriptFunction           guifg=#ff0086   gui=bold ctermfg=198 cterm=bold

" CSS Highlighting
hi cssIdentifier            guifg=#66cd66       gui=bold ctermfg=77 cterm=bold
hi cssBraces                guifg=#00bdec       gui=bold ctermfg=39 cterm=bold

" Ruby Highlighting
hi rubySharpBang    guifg=#00d2ff   guibg=#0a1323   gui=bold,italic ctermfg=45 ctermbg=233 cterm=bold,italic
hi rubyFunction     guifg=#0066bb               gui=bold ctermfg=25 cterm=bold
hi rubyDefine       guifg=#dd0000               gui=bold ctermfg=160 cterm=bold
hi rubyClassName    guifg=#2996a0               gui=bold ctermfg=31 cterm=bold
hi rubyKeyword      guifg=#dd0000               gui=bold ctermfg=160 cterm=bold
hi rubyConditional  guifg=#dd0000               gui=bold ctermfg=160 cterm=bold
hi rubyControl      guifg=#ff0000               gui=bold ctermfg=9 cterm=bold
hi rubyRepeat       guifg=#ff0000               gui=bold ctermfg=9 cterm=bold
hi rubySymbol       guifg=#ff0086 ctermfg=198
hi rubyASCIICode    guifg=#bb0066               gui=bold ctermfg=125 cterm=bold
hi rubyIdentifier               guifg=#008aff ctermfg=33
hi rubyGlobalVariable           guifg=#dd7700 ctermfg=172
hi rubyConstant                 guifg=#dd7700   gui=bold ctermfg=172 cterm=bold
hi rubyBlockParameter           guifg=#66cd66 ctermfg=77
hi rubyPredefinedIdentifier     guifg=#49c9b5 ctermfg=79
hi rubyInterpolationDelimiter   guifg=#00bdec   gui=bold ctermfg=39 cterm=bold
hi rubyString           guifg=#0086d2 guibg=#071320 ctermfg=32 ctermbg=233
hi rubyStringDelimiter  guifg=#dd7700 guibg=#071320 ctermfg=172 ctermbg=233
hi rubyRegexp           guifg=#92cd35 guibg=#200000 ctermfg=113 ctermbg=232
hi rubyRegexpDelimiter  guifg=#ff0007 ctermfg=9
hi rubySpaceError       guibg=#270000 ctermbg=232
hi rubyDocumentation    guifg=#aaaaaa ctermfg=248
hi rubyData             guifg=#777777 ctermfg=243

" XML Highlighting
hi xmlTag           guifg=#00bdec ctermfg=39
hi xmlTagName       guifg=#00bdec ctermfg=39
hi xmlEndTag        guifg=#00bdec ctermfg=39
hi xmlNamespace     guifg=#00bdec                   gui=underline ctermfg=39 cterm=underline
hi xmlAttribPunct   guifg=#cccaa9                   gui=bold ctermfg=187 cterm=bold
hi xmlEqual         guifg=#cccaa9                   gui=bold ctermfg=187 cterm=bold
hi xmlCdata         guifg=#bf0945                   gui=bold ctermfg=125 cterm=bold
hi xmlCdataCdata	guifg=#ac1446   guibg=#23010c   gui=none ctermfg=125 ctermbg=232 cterm=none
hi xmlCdataStart	guifg=#bf0945                   gui=bold ctermfg=125 cterm=bold
hi xmlCdataEnd		guifg=#bf0945                   gui=bold ctermfg=125 cterm=bold

" HTML Highlighting
hi htmlTag          guifg=#00bdec               gui=bold ctermfg=39 cterm=bold
hi htmlEndTag       guifg=#00bdec               gui=bold ctermfg=39 cterm=bold
hi htmlSpecialTagName   guifg=#66cd66 ctermfg=77
hi htmlTagName      guifg=#66cd66 ctermfg=77
hi htmlTagN         guifg=#66cd66 ctermfg=77
hi htmlEvent        guifg=#ffffff ctermfg=15

" Django Highlighting
hi djangoTagBlock   guifg=#ff0007   guibg=#200000   gui=bold ctermfg=9 ctermbg=232 cterm=bold
hi djangoVarBlock   guifg=#ff0007   guibg=#200000 ctermfg=9 ctermbg=232
hi djangoArgument   guifg=#0086d2   guibg=#200000 ctermfg=32 ctermbg=232
hi djangoStatement  guifg=#fb660a   guibg=#200000   gui=bold ctermfg=202 ctermbg=232 cterm=bold
hi djangoComment    guifg=#008800   guibg=#002300   gui=italic ctermfg=233 ctermbg=28 cterm=italic
hi djangoFilter     guifg=#ff0086   guibg=#200000   gui=italic ctermfg=198 ctermbg=232 cterm=italic

" Jinja Highlighting
hi jinjaTagBlock    guifg=#ff0007   guibg=#200000   gui=bold ctermfg=9 ctermbg=232 cterm=bold
hi jinjaVarBlock    guifg=#ff0007   guibg=#200000 ctermfg=9 ctermbg=232
hi jinjaString      guifg=#0086d2   guibg=#200000 ctermfg=32 ctermbg=232
hi jinjaNumber      guifg=#bf0945   guibg=#200000   gui=bold ctermfg=125 ctermbg=232 cterm=bold
hi jinjaStatement   guifg=#fb660a   guibg=#200000   gui=bold ctermfg=202 ctermbg=232 cterm=bold
hi jinjaComment     guifg=#008800   guibg=#002300   gui=italic ctermfg=233 ctermbg=28 cterm=italic
hi jinjaCommentDelim guifg=#008800  guibg=#002300   gui=bold ctermfg=233 ctermbg=28 cterm=bold
hi jinjaFilter      guifg=#ff0086   guibg=#200000 ctermfg=198 ctermbg=232
hi jinjaFunction    guifg=#ff0086   guibg=#200000   gui=bold ctermfg=198 ctermbg=232 cterm=bold
hi jinjaRaw         guifg=#ffffff   guibg=#200000 ctermfg=15 ctermbg=232
hi jinjaRawDelim    guifg=#aaaaaa   guibg=#200000   gui=bold ctermfg=248 ctermbg=232 cterm=bold
hi jinjaOperator    guifg=#ffffff   guibg=#200000 ctermfg=15 ctermbg=232
hi jinjaVariable    guifg=#92cd35   guibg=#200000 ctermfg=113 ctermbg=232
hi jinjaAttribute   guifg=#dd7700   guibg=#200000 ctermfg=172 ctermbg=232
hi jinjaSpecial     guifg=#008ffd   guibg=#200000 ctermfg=33 ctermbg=232

" C Highlighting
hi cString          guifg=#0086d2   guibg=#071320 ctermfg=32 ctermbg=233
hi cFormat          guifg=#fd8900   guibg=#02101d ctermfg=208 ctermbg=233
hi cSpecial         guifg=#92cd35   guibg=#02101d ctermfg=113 ctermbg=233
hi cType            guifg=#92cd35   gui=bold ctermfg=113 cterm=bold
hi def link cppType cType
hi cError           guifg=#ff0007   guibg=#200000   gui=bold ctermfg=9 ctermbg=232 cterm=bold
hi cCppOut          guifg=#777777 ctermfg=243
hi def link cStorageClass Statement
hi def link cStructure Statement
hi def link cppStructure cStructure
hi cppAccess        guifg=#92cd35  gui=NONE ctermfg=113 cterm=NONE

" Rust Highlighting
hi rustSigil        guifg=#C8DEB1   gui=NONE ctermfg=187 cterm=NONE
hi rustModPath      guifg=#57C4FF ctermfg=81
hi rustAttribute    guifg=#63C9FF   gui=italic ctermfg=81 cterm=italic
hi rustDeriving     guifg=#ffffff   gui=italic ctermfg=15 cterm=italic
hi rustCommentDoc   guifg=#8AF7FF   gui=italic ctermbg=123 cterm=italic
hi rustMacro        guifg=#AAFF42 ctermfg=155
hi rustLifetime     guifg=#ffffff ctermfg=15
hi rustModPathSep   guifg=#aaaaaa ctermfg=248

" ERuby Highlighting
hi erubyDelimiter   guifg=#2c8a16                   gui=bold ctermfg=28 cterm=bold
hi erubyComment     guifg=#4d9b3a                   gui=italic ctermbg=65 cterm=italic

" Make highlighting
hi makeTarget       guifg=#69CC56 ctermfg=77
hi makeSpecTarget   guifg=#ABE841 ctermfg=149
hi makeCommands     guifg=#B0EAEB ctermfg=152

" Rst highlighting
hi rstStandaloneHyperlink           guifg=#5CB6ED gui=NONE ctermfg=75 cterm=NONE
hi rstFootnoteReference             guifg=#5CB6ED gui=NONE ctermfg=75 cterm=NONE
hi rstCitationReference             guifg=#5CB6ED gui=NONE ctermfg=75 cterm=NONE
hi rstHyperLinkReference            guifg=#5CB6ED gui=NONE ctermfg=75 cterm=NONE
hi rstInlineInternalTargets         guifg=#5CB6ED gui=NONE ctermfg=75 cterm=NONE
hi rstDoctestBlock                  guifg=#9AD3E3 ctermfg=116
hi rstSections                      guifg=#32C7C7 ctermfg=80

" Directory listings (mostly NERDTree)
hi Directory        guifg=#6EDE23 ctermfg=76
hi NERDTreeUp       guifg=#E3B127 ctermfg=178
hi NERDTreeCWD      guifg=#E35627 ctermfg=166
hi NERDTreeDirSlash guifg=#E35627 ctermfg=166
