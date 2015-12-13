" Vim filetype plugin file
" Language:     PAM-CRASH
" Maintainer:   Roman Firt


" Only do this when not done yet for this buffer
if exists("b:did_ftplugin") | finish | endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Couple of Housekeeping stuff
set nocompatible
set ignorecase
set smartcase

" omni completion with Tab
set noexpandtab
nnoremap <Tab> R<C-X><C-O>
inoremap <Tab> <C-N>
inoremap <S-Tab> <C-P>

" Set the format of the include file specification for Abaqus
" Used in :check gf ^wf [i and other commands
setlocal include="^INCLU \/"


" Define format of comment lines (see 'formatoptions' for uses)
setlocal comments=:#,:$

" Set the PAMCRASH Complete Function
setlocal ofu=pamcomplete#Complete
set completeopt=menuone,preview

" Set the pamtags file
set tags=pamtags
set iskeyword+=:,',-,_,.,(,)

" Get the helptags working
helptags ~/.vim/doc
"
" Ctags refreshing
map <silent> <F12> :silent !~/.vim/ftplugin/pamtags.sh<CR>:redraw!<CR>
"
" Status Line hints
set laststatus=2
"set statusline=%{pamcomplete#pamHints()}%=%l,%c%V\ %P
"set statusline=%<%f\ %h%m%r\ \ \ \ \ \ \ \ \ \ %#pam_Hint#%{pamcomplete#pamHints()}%#StatusLine#%=%-14.(%l,%c%V%)\ %P
set statusline=%#pam_Hint#%{pamcomplete#pamHints()}%#StatusLine#%=%-14.(%l,%c%V%)\ %P
"
"
"PAM-CRASH lineal
map ,, 0i$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8<CR><ESC>

"PAM-CRASH Input Cards


" ==== Contact ====

"Contact Type 10
map <silent> ,c10 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c10.inc<CR>dd
"contact Type 154
map <silent> ,c154 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c154.inc<CR>dd
" Contact Type 1
map <silent> ,c1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c1.inc<CR>dd
"Contact Type 21
map <silent> ,c21 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c21.inc<CR>dd
"Contact Type 33
map <silent> ,c33 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c33.inc<CR>dd
"Contact Type 34
map <silent> ,c34 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c34.inc<CR>dd
"Contact Type 36
map <silent> ,c36 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c36.inc<CR>dd
"Contact Type 37
map <silent> ,c37 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c37.inc<CR>dd
"Contact Type 43
map <silent> ,c43 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c43.inc<CR>dd
"Contact Type 44
map <silent> ,c44 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c44.inc<CR>dd
"Contact Type 46
map <silent> ,c46 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c46.inc<CR>dd
"Contact Type 54
map <silent> ,c54 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c54.inc<CR>dd
"Contact Type 61
map <silent> ,c61 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Contact/c61.inc<CR>dd

" ==== Material ====

"LAYER Material Card
map <silent> ,la ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/la.inc<CR>dd
"Material Type 100
map <silent> ,m100 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m100.inc<CR>dd
"Material Type 101
map <silent> ,m101 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m101.inc<CR>dd
"Material Type 102 (CURVE Definition)
map <silent> ,m102 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m102.inc<CR>dd
"Material Type 103 (CURVE Definition)
map <silent> ,m103 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m103.inc<CR>dd
"Material Type 105 (CURVE Definition, HSR Damage)
map <silent> ,m105 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m105.inc<CR>dd
"Material Type 106 (CURVE Definition)
map <silent> ,m106 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m106.inc<CR>dd
"Material Type 108 (CURVE Definition)
map <silent> ,m108 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m108.inc<CR>dd
"Material Type 109 (CURVE Definition)
map <silent> ,m109 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m109.inc<CR>dd
"Material Type 110
map <silent> ,m110 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m110.inc<CR>dd
"Material Type 115 (CURVE Definition)
map <silent> ,m115 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m115.inc<CR>dd
"Material Type 116 (CURVE Definition)
map <silent> ,m116 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m116.inc<CR>dd
"Material Type 117 (CURVE Definition)
map <silent> ,m117 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m117.inc<CR>dd
"Material Type 118 (CURVE Definition)
map <silent> ,m118 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m118.inc<CR>dd
" Material Type 11
map <silent> ,m11 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m11.inc<CR>dd
"Material Type 121
map <silent> ,m121 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m121.inc<CR>dd
"Material Type 126
map <silent> ,m126 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m126.inc<CR>dd
"Material Type 127 (CURVE Definition)
map <silent> ,m127 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m127.inc<CR>dd
"Material Type 128
map <silent> ,m128 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m128.inc<CR>dd
" Material Type 12
map <silent> ,m12 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m12.inc<CR>dd
"Material Type 130
map <silent> ,m130 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m130.inc<CR>dd
"Material Type 131
map <silent> ,m131 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m131.inc<CR>dd
"Material Type 132
map <silent> ,m132 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m132.inc<CR>dd
"Material Type 143
map <silent> ,m143 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m143.inc<CR>dd
"Marerial Type 150
map <silent> ,m150 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m150.inc<CR>dd
"Material Type 151
map <silent> ,m151 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m151.inc<CR>dd
"Material Type 152
map <silent> ,m152 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m152.inc<CR>dd
" Material Type 15
map <silent> ,m15 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m15.inc<CR>dd
"Material Type 161
map <silent> ,m161 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m161.inc<CR>dd
"Material Type 162 (CURVE Definition)
map <silent> ,m162 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m162.inc<CR>dd
" Material Type 16 (CURVE Definition)
map <silent> ,m16 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m16.inc<CR>dd
"Material Type 171 (CURVE Definition)
map <silent> ,m171 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m171.inc<CR>dd
" Material Type 17
map <silent> ,m17 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m17.inc<CR>dd
" Material Type 18
map <silent> ,m18 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m18.inc<CR>dd
" Material Type 19
map <silent> ,m19 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m19.inc<CR>dd
" Material Type 1 (CURVE Definition)
map <silent> ,m1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m1.inc<CR>dd
"Material Type 200
map <silent> ,m200 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m200.inc<CR>dd
"Material Type 201
map <silent> ,m201 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m201.inc<CR>dd
"Material Type 202 (CURVE Definition)
map <silent> ,m202 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m202.inc<CR>dd
"Material Type 203
map <silent> ,m203 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m203.inc<CR>dd
"Material Type 204
map <silent> ,m204 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m204.inc<CR>dd
"Material Type 205
map <silent> ,m205 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m205.inc<CR>dd
" Material Type 20
map <silent> ,m20 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m20.inc<CR>dd
"Material Type 212 (CURVE Definition)
map <silent> ,m212 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m212.inc<CR>dd
"Material Type 213 (CURVE Definition)
map <silent> ,m213 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m213.inc<CR>dd
"Material Type 214
map <silent> ,m214 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m214.inc<CR>dd
" Material Type 21
map <silent> ,m21 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m21.inc<CR>dd
"Material Type 220
map <silent> ,m220 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m220.inc<CR>dd
"Material Type 221
map <silent> ,m221 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m221.inc<CR>dd
"Material Type 222
map <silent> ,m222 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m222.inc<CR>dd
"Material Type 223
map <silent> ,m223 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m223.inc<CR>dd
"Material Type 224
map <silent> ,m224 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m224.inc<CR>dd
"Material Type 225
map <silent> ,m225 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m225.inc<CR>dd
"Material Type 226
map <silent> ,m226 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m226.inc<CR>dd
"Material Type 22
map <silent> ,m22 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m22.inc<CR>dd
"Material Type 230
map <silent> ,m230 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m230.inc<CR>dd
" Material Type 24
map <silent> ,m24 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m24.inc<CR>dd
" Material Type 25
map <silent> ,m25 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m25.inc<CR>dd
" Material Type 26 (CURVE Definition)
map <silent> ,m26 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m26.inc<CR>dd
" Material Type 28
map <silent> ,m28 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m28.inc<CR>dd
" Material Type 2
map <silent> ,m2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m2.inc<CR>dd
"Material Type 301
map <silent> ,m301 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m301.inc<CR>dd
"Material Type 302
map <silent> ,m302 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m302.inc<CR>dd
"Material Type 303
map <silent> ,m303 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m303.inc<CR>dd
"Material Type 304
map <silent> ,m304 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m304.inc<CR>dd
"Material Type 305
map <silent> ,m305 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m305.inc<CR>dd
" Material Type 30
map <silent> ,m30 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m30.inc<CR>dd
" Material Type 31
map <silent> ,m31 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m31.inc<CR>dd
" Material Type 35 (CURVE Definition)
map <silent> ,m35 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m35.inc<CR>dd
" Material Type 36
map <silent> ,m36 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m36.inc<CR>dd
"Material Type 371
map <silent> ,m371 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m371.inc<CR>dd
" Material Type 37
map <silent> ,m37 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m37.inc<CR>dd
" Material Type 38
map <silent> ,m38 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m38.inc<CR>dd
" Material Type 41
map <silent> ,m41 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m41.inc<CR>dd
" Material Type 42
map <silent> ,m42 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m42.inc<CR>dd
" Material Type 45
map <silent> ,m45 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m45.inc<CR>dd
" Material Type 47
map <silent> ,m47 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m47.inc<CR>dd
" Material Type 51
map <silent> ,m51 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m51.inc<CR>dd
" Material Type 52 (CURVE Definition)
map <silent> ,m52 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m52.inc<CR>dd
" Material Type 5
map <silent> ,m5 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m5.inc<CR>dd
" Material Type 61
map <silent> ,m61 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m61.inc<CR>dd
" Material Type 62 (CURVE Definition)
map <silent> ,m62 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m62.inc<CR>dd
" Material Type 6
map <silent> ,m6 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m6.inc<CR>dd
" Material Type 71 (CURVE Definition)
map <silent> ,m71 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m71.inc<CR>dd
" Material Type 7
map <silent> ,m7 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m7.inc<CR>dd
" Material Type 8
map <silent> ,m8 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m8.inc<CR>dd
" Material Type 99
map <silent> ,m99 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/m99.inc<CR>dd
"VA Material Type 1
map <silent> ,ma1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ma1.inc<CR>dd
"VA Material Type 2
map <silent> ,ma2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ma2.inc<CR>dd
"VA Material Type 3
map <silent> ,ma3 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ma3.inc<CR>dd
"VA Material Type 4
map <silent> ,ma4 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ma4.inc<CR>dd
"VA Material Type 5
map <silent> ,ma5 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ma5.inc<CR>dd
"PFMAT Porous Material
map <silent> ,mp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/mp.inc<CR>dd
"THMAT Thermal Material
map <silent> ,mt ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/mt.inc<CR>dd
"PLY Material Card
map <silent> ,ply0 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply0.inc<CR>dd
"PLY Type 1
map <silent> ,ply1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply1.inc<CR>dd
"PLY Type 2
map <silent> ,ply2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply2.inc<CR>dd
"PLY Type 3
map <silent> ,ply3 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply3.inc<CR>dd
"PLY Type 4
map <silent> ,ply4 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply4.inc<CR>dd
"PLY Type 5
map <silent> ,ply5 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply5.inc<CR>dd
"PLY Type 6
map <silent> ,ply6 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply6.inc<CR>dd
"PLY Type 7
map <silent> ,ply7 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply7.inc<CR>dd
"PLY Type 8
map <silent> ,ply8 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Material/ply8.inc<CR>dd

" ==== Auxiliaries ====

"CDATA Card
map <silent> ,cd ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/cd.inc<CR>dd
"DELEM - Deleted Element Card
map <silent> ,de ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/de.inc<CR>dd
" FUNCT Function Card
map <silent> ,fc ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fc.inc<CR>dd
"FRAME IAXIS=0 U-based, 2 Vectors
map <silent> ,fm0 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fm0.inc<CR>dd
"FRAME IAXIS=1 U-based, 3 Nodes
map <silent> ,fm1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fm1.inc<CR>dd
"FRAME IAXIS=2 T-based, 2 Vectors
map <silent> ,fm2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fm2.inc<CR>dd
"FRAME IAXIS=3 T-based, 3 Nodes
map <silent> ,fm3 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fm3.inc<CR>dd
"FRAME IAXIS=4 Cylindrical
map <silent> ,fm4 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fm4.inc<CR>dd
"FRAME IAXIS=5 Spherical
map <silent> ,fm5 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fm5.inc<CR>dd
"FRICT Friction Model Type 10
map <silent> ,fr10 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr10.inc<CR>dd
"FRICT Friction Model Type 11
map <silent> ,fr11 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr11.inc<CR>dd
"FRICT Friction Model Type 12
map <silent> ,fr12 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr12.inc<CR>dd
"FRICT Friction Model Type 13
map <silent> ,fr13 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr13.inc<CR>dd
"FRICT Friction Model Type 1
map <silent> ,fr1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr1.inc<CR>dd
"FRICT Friction Model Type 2
map <silent> ,fr2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr2.inc<CR>dd
"FRICT Friction Model Type 3
map <silent> ,fr3 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr3.inc<CR>dd
"FRICT Friction Model Type 4
map <silent> ,fr4 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr4.inc<CR>dd
"FRICT Friction Model Type 5
map <silent> ,fr5 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr5.inc<CR>dd
"FRICT Friction Model Type 5
map <silent> ,fr6 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fr6.inc<CR>dd
"FRICT Friction Model Type 10
map <silent> ,fra ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fra.inc<CR>dd
"FRICT Friction Model Type 11
map <silent> ,frb ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/frb.inc<CR>dd
"FRICT Friction Model Type 12
map <silent> ,frc ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/frc.inc<CR>dd
"FRICT Friction Model Type 13
map <silent> ,frd ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/frd.inc<CR>dd
"FUNCSW Function Switch
map <silent> ,fw ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/fw.inc<CR>dd
" GROUP Group Definition
map <silent> ,gr ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/gr.inc<CR>dd
" LOOKU Lookup Table
map <silent> ,lo ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/lo.inc<CR>dd
"NLAVE - Non Local Averadge Definition
map <silent> ,nl ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/nl.inc<CR>dd
"PYFUNC Python Function
map <silent> ,pf ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/pf.inc<CR>dd
"RUPMO Type 0
map <silent> ,ru0 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/ru0.inc<CR>dd
"RUPMO Type 1
map <silent> ,ru1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/ru1.inc<CR>dd
"RUPMO Type 2
map <silent> ,ru2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/ru2.inc<CR>dd
"RUPMO Type 3
map <silent> ,ru3 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/ru3.inc<CR>dd
"RUPMO Type 5
map <silent> ,ru5 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/ru5.inc<CR>dd
"RUPMO Type 6
map <silent> ,ru6 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/ru6.inc<CR>dd
"RUPMO Type 7
map <silent> ,ru7 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/ru7.inc<CR>dd
"SENSOR Type 10
map <silent> ,se10 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se10.inc<CR>dd
"SENSOR Type 11
map <silent> ,se11 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se11.inc<CR>dd
"SENSOR Type 12
map <silent> ,se12 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se12.inc<CR>dd
"SENSOR Type 13
map <silent> ,se13 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se13.inc<CR>dd
"SENSOR Type 14
map <silent> ,se14 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se14.inc<CR>dd
"SENSOR Type 1
map <silent> ,se1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se1.inc<CR>dd
"SENSOR Type 2
map <silent> ,se2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se2.inc<CR>dd
"SENSOR Type 3
map <silent> ,se3 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se3.inc<CR>dd
"SENSOR Type 4
map <silent> ,se4 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se4.inc<CR>dd
"SENSOR Type 5
map <silent> ,se5 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se5.inc<CR>dd
"SENSOR Type 6
map <silent> ,se6 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se6.inc<CR>dd
"SENSOR Type 7
map <silent> ,se7 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se7.inc<CR>dd
"SENSOR Type 8
map <silent> ,se8 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se8.inc<CR>dd
"SENSOR Type 9
map <silent> ,se9 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/se9.inc<CR>dd
"SENSOR Type 10
map <silent> ,sea ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/sea.inc<CR>dd
"SENSOR Type 11
map <silent> ,seb ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/seb.inc<CR>dd
"SENSOR Type 12
map <silent> ,sec ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/sec.inc<CR>dd
"SENSOR Type 13
map <silent> ,sed ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/sed.inc<CR>dd
"SENSOR Type 14
map <silent> ,see ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/see.inc<CR>dd
" UDATA User Data
map <silent> ,ud ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Auxiliaries/ud.inc<CR>dd

" ==== Element ====

"BAR Element
map <silent> ,eba ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/eba.inc<CR>dd
"BEAM Element
map <silent> ,ebe ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ebe.inc<CR>dd
"BSHEL Element
map <silent> ,ebs ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ebs.inc<CR>dd
"GAP Element
map <silent> ,ega ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ega.inc<CR>dd
"HEXA20 Element
map <silent> ,ehe ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ehe.inc<CR>dd
"JOINT Element
map <silent> ,ejo ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ejo.inc<CR>dd
"KJOIN Element
map <silent> ,ekj ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ekj.inc<CR>dd
"ELINK Element
map <silent> ,ele ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ele.inc<CR>dd
"LLINK Element
map <silent> ,ell ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ell.inc<CR>dd
"PLINK Element
map <silent> ,elp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/elp.inc<CR>dd
"SLINK Element
map <silent> ,els ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/els.inc<CR>dd
"MEMBR Element
map <silent> ,eme ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/eme.inc<CR>dd
"MTOJNT Element
map <silent> ,emt ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/emt.inc<CR>dd
"PENTA15 Element
map <silent> ,ep1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ep1.inc<CR>dd
"PENTA6 Element
map <silent> ,ep6 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ep6.inc<CR>dd
"SPHEL Element
map <silent> ,eph ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/eph.inc<CR>dd
"SPHELO Element
map <silent> ,epo ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/epo.inc<CR>dd
"SHEL6 Element
map <silent> ,es6 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/es6.inc<CR>dd
"SHEL8 Element
map <silent> ,es8 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/es8.inc<CR>dd
"SPRGBM Element
map <silent> ,esb ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/esb.inc<CR>dd
"SHELL Element
map <silent> ,esh ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/esh.inc<CR>dd
"SOLID Element
map <silent> ,eso ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/eso.inc<CR>dd
"SPRING Element
map <silent> ,esp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/esp.inc<CR>dd
"IMPMA Super Element Matrix Import
map <silent> ,esu ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/esu.inc<CR>dd
"TETR10 Element
map <silent> ,et1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/et1.inc<CR>dd
"TETR4 Element
map <silent> ,et4 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/et4.inc<CR>dd
"TETRA Element
map <silent> ,ete ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ete.inc<CR>dd
"TIED Element
map <silent> ,eti ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/eti.inc<CR>dd
"TSHEL Element
map <silent> ,ets ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Element/ets.inc<CR>dd

" ==== Others ====

"FUNCT Card with Sinus Function
map <silent> ,fs ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Others/fs.inc<CR>dd
"Gratitational Acceleration
map <silent> ,gv ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Others/gv.inc<CR>dd

" ==== Part ====

"PART Type BAR
map <silent> ,pba ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pba.inc<CR>dd
"PART Type BEAM
map <silent> ,pbe ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pbe.inc<CR>dd
"PART Type BSHEL
map <silent> ,pbs ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pbs.inc<CR>dd
"PART Type COS3D
map <silent> ,pco ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pco.inc<CR>dd
"PART Type GAP
map <silent> ,pga ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pga.inc<CR>dd
"PART Type JOINT
map <silent> ,pjo ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pjo.inc<CR>dd
"PART Type KJOIN
map <silent> ,pkj ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pkj.inc<CR>dd
"PART Type ELINK
map <silent> ,ple ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/ple.inc<CR>dd
"PART Type LLINK
map <silent> ,pll ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pll.inc<CR>dd
"PART Type PLINK
map <silent> ,plp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/plp.inc<CR>dd
"PART Type SLINK
map <silent> ,pls ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pls.inc<CR>dd
"PART Type MEMBR
map <silent> ,pme ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pme.inc<CR>dd
"PART Type MBKJN
map <silent> ,pmk ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pmk.inc<CR>dd
"PART Type MBSPR
map <silent> ,pms ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pms.inc<CR>dd
"PART Type MTOJNT
map <silent> ,pmt ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pmt.inc<CR>dd
"PART Type SPRGBM
map <silent> ,psb ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/psb.inc<CR>dd
"PART Type SPHEL
map <silent> ,pse ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pse.inc<CR>dd
"PART Type SHELL
map <silent> ,psh ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/psh.inc<CR>dd
"PART Type SOLID
map <silent> ,pso ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pso.inc<CR>dd
"PART Type SPRING
map <silent> ,psp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/psp.inc<CR>dd
"PART Type TETRA
map <silent> ,pte ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pte.inc<CR>dd
"PART Type TIED
map <silent> ,pti ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pti.inc<CR>dd
"PART Type TSHEL
map <silent> ,pts ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Part/pts.inc<CR>dd

" ==== Constraint ====

" LINCO Linear Constraint
map <silent> ,lc ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/lc.inc<CR>dd
"OTMCO Constraint
map <silent> ,oo ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/oo.inc<CR>dd
"RBODY Type 0
map <silent> ,rb0 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/rb0.inc<CR>dd
"RBODY Type 1
map <silent> ,rb1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/rb1.inc<CR>dd
"RBODY Type 2
map <silent> ,rb2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/rb2.inc<CR>dd
"RBODY Type 3
map <silent> ,rb3 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/rb3.inc<CR>dd
"RBODY Type 4
map <silent> ,rb4 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/rb4.inc<CR>dd
"SEWING Definition
map <silent> ,sew ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/sew.inc<CR>dd
"Regular MTOCO
map <silent> ,to0 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/to0.inc<CR>dd
"MTOCO mit User Imposed Mass and Intertia
map <silent> ,to1 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Constraint/to1.inc<CR>dd

" ==== Control ====

"DMPEW User DMP Scaling Factors
map <silent> ,dm ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/dm.inc<CR>dd
"DRAPF Draping File Import
map <silent> ,dr ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/dr.inc<CR>dd
"EXPORT Card
map <silent> ,ex ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/ex.inc<CR>dd
"IMPORT Card
map <silent> ,im ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/im.inc<CR>dd
"INCLU Keyword
map <silent> ,in ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/in.inc<CR>dd
"MERIC Keyword
map <silent> ,me ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/me.inc<CR>dd
"MSTRM Mass Trimming
map <silent> ,mr ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/mr.inc<CR>dd
"ORTHF Orientation File Import
map <silent> ,or ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/or.inc<CR>dd
"PYVAR Variable Definition
map <silent> ,py ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/py.inc<CR>dd
"RMSSOL Shell-Solid Remeshing
map <silent> ,ss ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/ss.inc<CR>dd
"SUBDF Substructure Definition
map <silent> ,su ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/su.inc<CR>dd
"TRSFM Transformation Card
map <silent> ,tr ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Control/tr.inc<CR>dd

" ==== Load ====

"*3D Boundary Condition
map <silent> ,3d ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/3d.inc<CR>dd
"VAABSO Acoustic Absorber
map <silent> ,ab ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/ab.inc<CR>dd
"ACFLD Acceleration Field
map <silent> ,ac ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/ac.inc<CR>dd
"VAMPSO Acoustic Monopole Source
map <silent> ,am ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/am.inc<CR>dd
"ACTUA - Joint Actuator Definition
map <silent> ,at ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/at.inc<CR>dd
"BOUNC Displacement BC
map <silent> ,bc ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/bc.inc<CR>dd
"BDFOR Body Forces
map <silent> ,bd ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/bd.inc<CR>dd
"BFLUX Definition
map <silent> ,bf ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/bf.inc<CR>dd
"PRESBC Pressure Porous BC
map <silent> ,bp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/bp.inc<CR>dd
"CONLO Concentrated Load
map <silent> ,cl ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/cl.inc<CR>dd
"DAMP Nodal Damping
map <silent> ,da ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/da.inc<CR>dd
"DFLUX Definition
map <silent> ,df ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/df.inc<CR>dd
"DISLIM Displacement Limitation
map <silent> ,dl ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/dl.inc<CR>dd
"DETOP Detonation Point
map <silent> ,dp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/dp.inc<CR>dd
"FBC3D - Prescribed Motion onto Fluid Media
map <silent> ,fb ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/fb.inc<CR>dd
"FBCFA - Prescribed Surface Normal BC onto Fluid
map <silent> ,fn ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/fn.inc<CR>dd
"HFLUX
map <silent> ,hf ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/hf.inc<CR>dd
"HTSURF Heat Exchange Surface
map <silent> ,hs ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/hs.inc<CR>dd
"PREBM Beam Pressure
map <silent> ,ib ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/ib.inc<CR>dd
"PREFA Face Pressure
map <silent> ,if ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/if.inc<CR>dd
"INPRES Initial Pressure
map <silent> ,ip ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/ip.inc<CR>dd
"INTEM Initial Temperature
map <silent> ,it ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/it.inc<CR>dd
"INVEL Initial Velocity
map <silent> ,iv ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/iv.inc<CR>dd
"KINDA Kinematic Damping
map <silent> ,kd ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/kd.inc<CR>dd
"RMLOAD Resudial Mode Load
map <silent> ,rm ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/rm.inc<CR>dd
"LCPSD Power Spectral Density Function
map <silent> ,sd ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/sd.inc<CR>dd
"TEMBC Temperature BC
map <silent> ,tc ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/tc.inc<CR>dd
"TURBL Turbulent Boundary Layer Load
map <silent> ,tu ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Load/tu.inc<CR>dd

" ==== Node ====

" CNODE Card
map <silent> ,cn ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Node/cn.inc<CR>dd
" MASS Card
map <silent> ,ms ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Node/ms.inc<CR>dd
"NSMAS2 - Nonstructural mass Type 2
map <silent> ,nm2 ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Node/nm2.inc<CR>dd
" NSMAS - Nonstructural mass
map <silent> ,nm ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Node/nm.inc<CR>dd
" NODE Card
map <silent> ,nn ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Node/nn.inc<CR>dd

" ==== Output ====

"SENPTG Sensor Point (Global)
map <silent> ,seg ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/seg.inc<CR>dd
"SELOUT Selective Output
map <silent> ,sel ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sel.inc<CR>dd
"SENPT Sensor Point (Local)
map <silent> ,sen ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sen.inc<CR>dd
"SEFCO Type CONTACT
map <silent> ,sfc ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sfc.inc<CR>dd
"SECFO Type LINK
map <silent> ,sfl ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sfl.inc<CR>dd
"SECFO Type CONT_MS
map <silent> ,sfm ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sfm.inc<CR>dd
"SECFO Type PLANE
map <silent> ,sfp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sfp.inc<CR>dd
"SECFO Type SECTION
map <silent> ,sfs ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sfs.inc<CR>dd
"SECTION Type SUPPORT
map <silent> ,sfu ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sfu.inc<CR>dd
"SECFO Type VOLFRAC
map <silent> ,sfv ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/sfv.inc<CR>dd
"THNAC Acoustic Output
map <silent> ,tha ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/tha.inc<CR>dd
"THCRS Cross Spectral Density Printout
map <silent> ,thc ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/thc.inc<CR>dd
"THELE Card
map <silent> ,the ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/the.inc<CR>dd
"THLOC Output
map <silent> ,thl ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/thl.inc<CR>dd
"THNOD Output
map <silent> ,thn ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/thn.inc<CR>dd
"THNPO Porous Nodal Output
map <silent> ,thp ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/thp.inc<CR>dd
"VAPANL Structural Panel
map <silent> ,vap ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Output/vap.inc<CR>dd

" ==== Safety ====

"BAGIN Definition
map <silent> ,bag ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Safety/bag.inc<CR>dd
"GASPEC Gas Specification
map <silent> ,gas ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Safety/gas.inc<CR>dd
"MUSC1 Muscle Element Definition
map <silent> ,mus ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Safety/mus.inc<CR>dd
"RETRA Belt Retractor Definition
map <silent> ,ret ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Safety/ret.inc<CR>dd
"SLIPR Slipring Definition
map <silent> ,sli ,,,,kO<ESC>V!cat ~/.vim/ftplugin/pam_cards/Safety/sli.inc<CR>dd
