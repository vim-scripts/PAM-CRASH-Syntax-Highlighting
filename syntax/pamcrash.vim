" =========================================================
" Vim syntax file
" Language: PAM-CRASH,PAM-STAMP,PAM-COMFORT Input Deck
" Syntax File Version: 4.1
" Author: Roman Firt
" Latest Revision: 13. December 2015
" =========================================================
" NO WARRANTY! USE AT YOUR OWN RISK!
" =========================================================
"
if exists("b:current_syntax")
  finish
endif

syn case match

"{{{ Basic atoms begin
syn match       pam_FreeError      contained "\S\{1,\}"
syn match       pam_TrailingError  contained ".*"
syn match       pam_Source  contained ".*"
syn match       pam_Secure  contained ".*"
syn match       pam_Colon          display contained ":"
syn match       pam_Point          display contained "\."
syn match       pam_String         display contained "\(\f*\)\%<82c"
syn match       pam_NameString     display contained "\(\S*\)\%<82c"
syn match       pam_String         display contained +\(".\{-}"\)\%<82c+
syn match       pam_String         display contained +\('.\{-}'\)\%<82c+
syn match       pam_Integer        display contained "[ ]*[+\-]\=\d\+[ ]*"
syn match       pam_Float          display contained "[ ]*[+-]\=\d\+\.\=\d*[eE]\=[+-]\=\d*[ ]*"
syn match       pam_ModString         display contained +\('.\{-}'\)\%<82c+
syn match       pam_FreeVar        display contained "\[[^\[]\{-}\]"
syn match       pam_FreeVar        display contained "<[^<]\{-}>"
syn match       pam_FreeVar        display contained "{[^{]\{-}}"
syn keyword     pam_Control_YESNO  contained YES NO
"Basic atoms end}}}

"{{{ general field definition begin
" {{{ 1i5
syn match       pam_1i5_e             display contained "\%1c.\{2,5\}"
syn match       pam_1i5_a             display contained "\%1c[ ]*\-\=\d*\%6c"
syn match       pam_1i5_v             display contained "\%1c[ ]*\[[^\[]\{-}\]\%6c"
syn match       pam_1i5_v             display contained "\%1c[ ]*<[^<]\{-}>\%6c"
syn match       pam_1i5_v             display contained "\%1c[ ]*{[^{]\{-}}\%6c"
syn cluster     1i5                   contains=pam_1i5_e,pam_1i5_a,pam_1i5_v
hi def link pam_1i5_a pam_evenArgument
hi def link pam_1i5_e pam_evenError
hi def link pam_1i5_v pam_evenVar
" }}}
" {{{ 1i5x
syn match       pam_1i5x_e             display contained "\%1c.\{2,5\}"
syn match       pam_1i5x_a             display contained "\%1c[ ]*\-\=\d*\%6c"
syn match       pam_1i5x_v             display contained "\%1c[ ]*\[[^\[]\{-}\]\%6c"
syn match       pam_1i5x_v             display contained "\%1c[ ]*<[^<]\{-}>\%6c"
syn match       pam_1i5x_v             display contained "\%1c[ ]*{[^{]\{-}}\%6c"
syn cluster     1i5x                   contains=pam_1i5x_e,pam_1i5x_a,pam_1i5x_v
hi def link pam_1i5x_a pam_oddArgument
hi def link pam_1i5x_e pam_oddError
hi def link pam_1i5x_v pam_oddVar
" }}}
" {{{ 1f5
syn match       pam_1f5_a             display contained "\%1c[ ]*\-\=\d*\%6c"
syn cluster     1f5                   contains=pam_1i5_e,pam_1f5_a,pam_1i5_v
hi def link pam_1f5_a pam_evenArgument
" }}}
" {{{ 1f5x
syn match       pam_1f5x_a             display contained "\%1c[ ]*\-\=\d*\%6c"
syn cluster     1f5x                   contains=pam_1i5x_e,pam_1f5x_a,pam_1i5x_v
hi def link pam_1f5x_a pam_oddArgument
" }}}
" {{{ 1i8
syn match       pam_1i8_e             display contained "\%1c.\{2,8\}"
syn match       pam_1i8_a             display contained "\%1c[ ]*\-\=\d*\%9c"
syn match       pam_1i8_v             display contained "\%1c[ ]*\[[^\[]\{-}\]\%9c"
syn match       pam_1i8_v             display contained "\%1c[ ]*<[^<]\{-}>\%9c"
syn match       pam_1i8_v             display contained "\%1c[ ]*{[^{]\{-}}\%9c"
syn cluster     1i8                   contains=pam_1i8_e,pam_1i8_a,pam_1i8_v
hi def link pam_1i8_a pam_evenArgument
hi def link pam_1i8_e pam_evenError
hi def link pam_1i8_v pam_evenVar
" }}}
" {{{ 1i10
syn match       pam_1i10_e             display contained "\%1c.\{2,10\}"
syn match       pam_1i10_a             display contained "\%1c[ ]*\-\=\d*\%11c"
syn match       pam_1i10_v             display contained "\%1c[ ]*\[[^\[]\{-}\]\%11c"
syn match       pam_1i10_v             display contained "\%1c[ ]*<[^<]\{-}>\%11c"
syn match       pam_1i10_v             display contained "\%1c[ ]*{[^{]\{-}}\%11c"
syn cluster     1i10                   contains=pam_1i10_e,pam_1i10_a,pam_1i10_v
hi def link pam_1i10_a pam_oddArgument
hi def link pam_1i10_e pam_oddError
hi def link pam_1i10_v pam_oddVar
" }}}
" {{{ 1f16
syn match       pam_1f16_e             display contained "\%1c.\{2,16\}"
syn match       pam_1f16_a             display contained "\%1c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%17c"
syn match       pam_1f16_v             display contained "\%1c[ ]*\[[^\[]\{-}\]\%17c"
syn match       pam_1f16_v             display contained "\%1c[ ]*<[^<]\{-}>\%17c"
syn match       pam_1f16_v             display contained "\%1c[ ]*{[^{]\{-}}\%17c"
syn cluster     1f16                   contains=pam_1f16_e,pam_1f16_a,pam_1f16_v
hi def link pam_1f16_a pam_oddArgument
hi def link pam_1f16_e pam_oddError
hi def link pam_1f16_v pam_oddVar
" }}}
" {{{ 1f8
syn match       pam_1f8_e             display contained "\%1c.\{2,8\}"
syn match       pam_1f8_a             display contained "\%1c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%9c"
syn match       pam_1f8_v             display contained "\%1c[ ]*\[[^\[]\{-}\]\%9c"
syn match       pam_1f8_v             display contained "\%1c[ ]*<[^<]\{-}>\%9c"
syn match       pam_1f8_v             display contained "\%1c[ ]*{[^{]\{-}}\%9c"
syn cluster     1f8                   contains=pam_1f8_e,pam_1f8_a,pam_1f8_v
hi def link pam_1f8_a pam_evenArgument
hi def link pam_1f8_e pam_evenError
hi def link pam_1f8_v pam_evenVar
" }}}
" {{{ 1f10
syn match       pam_1f10_a             display contained "\%1c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%11c"
syn cluster     1f10                   contains=pam_1i10_e,pam_1f10_a,pam_1i10_v
hi def link pam_1f10_a pam_oddArgument
" }}}
" {{{ 6i5
syn match       pam_6i5_e             display contained "\%6c.\{1,5\}"
syn match       pam_6i5_a             display contained "\%6c[ ]*\-\=\d*\%11c"
syn match       pam_6i5_v             display contained "\%6c[ ]*\[[^\[]\{-}\]\%11c"
syn match       pam_6i5_v             display contained "\%6c[ ]*<[^<]\{-}>\%11c"
syn match       pam_6i5_v             display contained "\%6c[ ]*{[^{]\{-}}\%11c"
syn cluster     6i5                   contains=pam_6i5_e,pam_6i5_a,pam_6i5_v
hi def link pam_6i5_a pam_oddArgument
hi def link pam_6i5_e pam_oddError
hi def link pam_6i5_v pam_oddVar
" }}}
" {{{ 6i5x
syn match       pam_6i5x_e             display contained "\%6c.\{1,5\}"
syn match       pam_6i5x_a             display contained "\%6c[ ]*\-\=\d*\%11c"
syn match       pam_6i5x_v             display contained "\%6c[ ]*\[[^\[]\{-}\]\%11c"
syn match       pam_6i5x_v             display contained "\%6c[ ]*<[^<]\{-}>\%11c"
syn match       pam_6i5x_v             display contained "\%6c[ ]*{[^{]\{-}}\%11c"
syn cluster     6i5x                   contains=pam_6i5x_e,pam_6i5x_a,pam_6i5x_v
hi def link pam_6i5x_a pam_evenArgument
hi def link pam_6i5x_e pam_evenError
hi def link pam_6i5x_v pam_evenVar
" }}}
" {{{ 6f5
syn match       pam_6f5_a             display contained "\%6c[ ]*\-\=\d*\%11c"
syn cluster     6f5                   contains=pam_6i5x_e,pam_6f5_a,pam_6i5x_v
hi def link pam_6f5_a pam_evenArgument
" }}}
" {{{ 6f10
syn match       pam_6f10_e             display contained "\%6c.\{1,10\}"
syn match       pam_6f10_a             display contained "\%6c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%16c"
syn match       pam_6f10_v             display contained "\%6c[ ]*\[[^\[]\{-}\]\%16c"
syn match       pam_6f10_v             display contained "\%6c[ ]*<[^<]\{-}>\%16c"
syn match       pam_6f10_v             display contained "\%6c[ ]*{[^{]\{-}}\%16c"
syn cluster     6f10                   contains=pam_6f10_e,pam_6f10_a,pam_6f10_v
hi def link pam_6f10_a pam_evenArgument
hi def link pam_6f10_e pam_evenError
hi def link pam_6f10_v pam_evenVar
" }}}
" {{{ 9i8
syn match       pam_9i8_e             display contained "\%9c.\{1,8\}"
syn match       pam_9i8_a             display contained "\%9c[ ]*\-\=\d*\%17c"
syn match       pam_9i8_v             display contained "\%9c[ ]*\[[^\[]\{-}\]\%17c"
syn match       pam_9i8_v             display contained "\%9c[ ]*<[^<]\{-}>\%17c"
syn match       pam_9i8_v             display contained "\%9c[ ]*{[^{]\{-}}\%17c"
syn cluster     9i8                   contains=pam_9i8_e,pam_9i8_a,pam_9i8_v
hi def link pam_9i8_a pam_oddArgument
hi def link pam_9i8_e pam_oddError
hi def link pam_9i8_v pam_oddVar
" }}}
" {{{ 9i8id
syn match       pam_9i8id_a             display contained "\%9c[ ]*\-\=\d*\%17c"
syn cluster     9i8id                   contains=pam_9i8_e,pam_9i8id_a,pam_9i8_v
hi def link pam_9i8id_a pam_oddId
" }}}
" {{{ 9f8
syn match       pam_9f8_a             display contained "\%9c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%17c"
syn cluster     9f8                   contains=pam_9i8_e,pam_9f8_a,pam_9i8_v
hi def link pam_9f8_a pam_oddArgument
" }}}
" {{{ 9f8dim
syn match       pam_9f8dim_a             display contained "\%9c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%17c"
syn cluster     9f8dim                   contains=pam_9i8,pam_9f8dim_a,pam_9i8_v
hi def link pam_9f8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 9f16
syn match       pam_9f16_e             display contained "\%9c.\{1,16\}"
syn match       pam_9f16_a             display contained "\%9c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%25c"
syn match       pam_9f16_v             display contained "\%9c[ ]*\[[^\[]\{-}\]\%25c"
syn match       pam_9f16_v             display contained "\%9c[ ]*<[^<]\{-}>\%25c"
syn match       pam_9f16_v             display contained "\%9c[ ]*{[^{]\{-}}\%25c"
syn cluster     9f16                   contains=pam_9f16_e,pam_9f16_a,pam_9f16_v
hi def link pam_9f16_a pam_oddArgument
hi def link pam_9f16_e pam_oddError
hi def link pam_9f16_v pam_oddVar
" }}}
" {{{ 11f10
syn match       pam_11f10_e             display contained "\%11c.\{1,10\}"
syn match       pam_11f10_a             display contained "\%11c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%21c"
syn match       pam_11f10_v             display contained "\%11c[ ]*\[[^\[]\{-}\]\%21c"
syn match       pam_11f10_v             display contained "\%11c[ ]*<[^<]\{-}>\%21c"
syn match       pam_11f10_v             display contained "\%11c[ ]*{[^{]\{-}}\%21c"
syn cluster     11f10                   contains=pam_11f10_e,pam_11f10_a,pam_11f10_v
hi def link pam_11f10_a pam_evenArgument
hi def link pam_11f10_e pam_evenError
hi def link pam_11f10_v pam_evenVar
" }}}
" {{{ 11i5
syn match       pam_11i5_e             display contained "\%11c.\{1,5\}"
syn match       pam_11i5_a             display contained "\%11c[ ]*\-\=\d*\%16c"
syn match       pam_11i5_v             display contained "\%11c[ ]*\[[^\[]\{-}\]\%16c"
syn match       pam_11i5_v             display contained "\%11c[ ]*<[^<]\{-}>\%16c"
syn match       pam_11i5_v             display contained "\%11c[ ]*{[^{]\{-}}\%16c"
syn cluster     11i5                   contains=pam_11i5_e,pam_11i5_a,pam_11i5_v
hi def link pam_11i5_a pam_evenArgument
hi def link pam_11i5_e pam_evenError
hi def link pam_11i5_v pam_evenVar
" }}}
" {{{ 11i5x
syn match       pam_11i5x_e             display contained "\%11c.\{1,5\}"
syn match       pam_11i5x_a             display contained "\%11c[ ]*\-\=\d*\%16c"
syn match       pam_11i5x_v             display contained "\%11c[ ]*\[[^\[]\{-}\]\%16c"
syn match       pam_11i5x_v             display contained "\%11c[ ]*<[^<]\{-}>\%16c"
syn match       pam_11i5x_v             display contained "\%11c[ ]*{[^{]\{-}}\%16c"
syn cluster     11i5x                   contains=pam_11i5x_e,pam_11i5x_a,pam_11i5x_v
hi def link pam_11i5x_a pam_oddArgument
hi def link pam_11i5x_e pam_oddError
hi def link pam_11i5x_v pam_oddVar
" }}}
" {{{ 11f5
syn match       pam_11f5_a             display contained "\%11c[ ]*\-\=\d*\%16c"
syn cluster     11f5                   contains=pam_11i5_e,pam_11f5_a,pam_11i5_v
hi def link pam_11f5_a pam_evenArgument
" }}}
" {{{ 11f5x
syn match       pam_11f5x_a             display contained "\%11c[ ]*\-\=\d*\%16c"
syn cluster     11f5x                   contains=pam_11i5x_e,pam_11f5x_a,pam_11i5x_v
hi def link pam_11f5x_a pam_oddArgument
" }}}
" {{{ 11i10
syn match       pam_11i10_a             display contained "\%11c[ ]*\-\=\d*\%21c"
syn cluster     11i10                   contains=pam_11f10_e,pam_11i10_a,pam_11f10_v
hi def link pam_11i10_a pam_evenArgument
" }}}
" {{{ 16i5
syn match       pam_16i5_e             display contained "\%16c.\{1,5\}"
syn match       pam_16i5_a             display contained "\%16c[ ]*\-\=\d*\%21c"
syn match       pam_16i5_v             display contained "\%16c[ ]*\[[^\[]\{-}\]\%21c"
syn match       pam_16i5_v             display contained "\%16c[ ]*<[^<]\{-}>\%21c"
syn match       pam_16i5_v             display contained "\%16c[ ]*{[^{]\{-}}\%21c"
syn cluster     16i5                   contains=pam_16i5_e,pam_16i5_a,pam_16i5_v
hi def link pam_16i5_a pam_oddArgument
hi def link pam_16i5_e pam_oddError
hi def link pam_16i5_v pam_oddVar
" }}}
" {{{ 16f5
syn match       pam_16f5_a             display contained "\%16c[ ]*\-\=\d*\%21c"
syn cluster     16f5                   contains=pam_16i5_e,pam_16f5_a,pam_16i5_v
hi def link pam_16f5_a pam_oddArgument
" }}}
" {{{ 16i5x
syn match       pam_16i5x_e             display contained "\%16c.\{1,5\}"
syn match       pam_16i5x_a             display contained "\%16c[ ]*\-\=\d*\%21c"
syn match       pam_16i5x_v             display contained "\%16c[ ]*\[[^\[]\{-}\]\%21c"
syn match       pam_16i5x_v             display contained "\%16c[ ]*<[^<]\{-}>\%21c"
syn match       pam_16i5x_v             display contained "\%16c[ ]*{[^{]\{-}}\%21c"
syn cluster     16i5x                   contains=pam_16i5x_e,pam_16i5x_a,pam_16i5x_v
hi def link pam_16i5x_a pam_evenArgument
hi def link pam_16i5x_e pam_evenError
hi def link pam_16i5x_v pam_evenVar
" }}}
" {{{ 16f5x
syn match       pam_16f5x_a             display contained "\%16c[ ]*\-\=\d*\%21c"
syn cluster     16f5x                   contains=pam_16i5x_e,pam_16f5x_a,pam_16i5x_v
hi def link pam_16f5x_a pam_evenArgument
" }}}
" {{{ 16f10
syn match       pam_16f10_e             display contained "\%16c.\{1,10\}"
syn match       pam_16f10_a             display contained "\%16c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%26c"
syn match       pam_16f10_v             display contained "\%16c[ ]*\[[^\[]\{-}\]\%26c"
syn match       pam_16f10_v             display contained "\%16c[ ]*<[^<]\{-}>\%26c"
syn match       pam_16f10_v             display contained "\%16c[ ]*{[^{]\{-}}\%26c"
syn cluster     16f10                   contains=pam_16f10_e,pam_16f10_a,pam_16f10_v
hi def link pam_16f10_a pam_oddArgument
hi def link pam_16f10_e pam_oddError
hi def link pam_16f10_v pam_oddVar
" }}}
" {{{ 17i8
syn match       pam_17i8_e             display contained "\%17c.\{1,8\}"
syn match       pam_17i8_a             display contained "\%17c[ ]*\-\=\d*\%25c"
syn match       pam_17i8_v             display contained "\%17c[ ]*\[[^\[]\{-}\]\%25c"
syn match       pam_17i8_v             display contained "\%17c[ ]*<[^<]\{-}>\%25c"
syn match       pam_17i8_v             display contained "\%17c[ ]*{[^{]\{-}}\%25c"
syn cluster     17i8                   contains=pam_17i8_e,pam_17i8_a,pam_17i8_v
hi def link pam_17i8_a pam_evenArgument
hi def link pam_17i8_e pam_evenError
hi def link pam_17i8_v pam_evenVar
" }}}
" {{{ 17i8dim
syn match       pam_17i8dim_a             display contained "\%17c[ ]*\-\=\d*\%25c"
syn cluster     17i8dim                   contains=pam_17i8_e,pam_17i8dim_a,pam_17i8_v
hi def link pam_17i8dim_a pam_evenArgumentDimmed
" }}}
" {{{ 17f8
syn match       pam_17f8_a             display contained "\%17c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%25c"
syn cluster     17f8                   contains=pam_17i8_e,pam_17f8_a,pam_17i8_v
hi def link pam_17f8_a pam_evenArgument
" }}}
" {{{ 17f8dim
syn match       pam_17f8dim_a             display contained "\%17c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%25c"
syn cluster     17f8dim                   contains=pam_17i8_e,pam_17f8dim_a,pam_17i8_v
hi def link pam_17f8dim_a pam_evenArgumentDimmed
" }}}
" {{{ 17f16
syn match       pam_17f16_e             display contained "\%17c.\{1,16\}"
syn match       pam_17f16_a             display contained "\%17c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%33c"
syn match       pam_17f16_v             display contained "\%17c[ ]*\[[^\[]\{-}\]\%33c"
syn match       pam_17f16_v             display contained "\%17c[ ]*<[^<]\{-}>\%33c"
syn match       pam_17f16_v             display contained "\%17c[ ]*{[^{]\{-}}\%33c"
syn cluster     17f16                   contains=pam_17f16_e,pam_17f16_a,pam_17f16_v
hi def link pam_17f16_a pam_evenArgument
hi def link pam_17f16_e pam_evenError
hi def link pam_17f16_v pam_evenVar
" }}}
" {{{ 17f16dim
syn match       pam_17f16dim_a             display contained "\%17c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%33c"
syn cluster     17f16dim                   contains=pam_17f16_e,pam_17f16dim_a,pam_17f16_v
hi def link pam_17f16dim_a pam_evenArgumentDimmed
" }}}
" {{{ 21f10
syn match       pam_21f10_e             display contained "\%21c.\{1,10\}"
syn match       pam_21f10_a             display contained "\%21c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%31c"
syn match       pam_21f10_v             display contained "\%21c[ ]*\[[^\[]\{-}\]\%31c"
syn match       pam_21f10_v             display contained "\%21c[ ]*<[^<]\{-}>\%31c"
syn match       pam_21f10_v             display contained "\%21c[ ]*{[^{]\{-}}\%31c"
syn cluster     21f10                   contains=pam_21f10_e,pam_21f10_a,pam_21f10_v
hi def link pam_21f10_a pam_oddArgument
hi def link pam_21f10_e pam_oddError
hi def link pam_21f10_v pam_oddVar
" }}}
" {{{ 21f20
syn match       pam_21f20_e             display contained "\%21c.\{1,20\}"
syn match       pam_21f20_a             display contained "\%21c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn match       pam_21f20_v             display contained "\%21c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_21f20_v             display contained "\%21c[ ]*<[^<]\{-}>\%41c"
syn match       pam_21f20_v             display contained "\%21c[ ]*{[^{]\{-}}\%41c"
syn cluster     21f20                   contains=pam_21f20_e,pam_21f20_a,pam_21f20_v
hi def link pam_21f20_a pam_oddArgument
hi def link pam_21f20_e pam_oddError
hi def link pam_21f20_v pam_oddVar
" }}}
" {{{ 21i5
syn match       pam_21i5_e             display contained "\%21c.\{1,5\}"
syn match       pam_21i5_a             display contained "\%21c[ ]*\-\=\d*\%26c"
syn match       pam_21i5_v             display contained "\%21c[ ]*\[[^\[]\{-}\]\%26c"
syn match       pam_21i5_v             display contained "\%21c[ ]*<[^<]\{-}>\%26c"
syn match       pam_21i5_v             display contained "\%21c[ ]*{[^{]\{-}}\%26c"
syn cluster     21i5                   contains=pam_21i5_e,pam_21i5_a,pam_21i5_v
hi def link pam_21i5_a pam_oddArgument
hi def link pam_21i5_e pam_oddError
hi def link pam_21i5_v pam_oddVar
" }}}
" {{{ 21f5
syn match       pam_21f5_a             display contained "\%21c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%26c"
syn cluster     21f5                   contains=pam_21i5_e,pam_21f5_a,pam_21i5_v
hi def link pam_21f5_a pam_oddArgument
" }}}
" {{{ 21i5x
syn match       pam_21i5x_e             display contained "\%21c.\{1,5\}"
syn match       pam_21i5x_a             display contained "\%21c[ ]*\-\=\d*\%26c"
syn match       pam_21i5x_v             display contained "\%21c[ ]*\[[^\[]\{-}\]\%26c"
syn match       pam_21i5x_v             display contained "\%21c[ ]*<[^<]\{-}>\%26c"
syn match       pam_21i5x_v             display contained "\%21c[ ]*{[^{]\{-}}\%26c"
syn cluster     21i5x                   contains=pam_21i5x_e,pam_21i5x_a,pam_21i5x_v
hi def link pam_21i5x_a pam_evenArgument
hi def link pam_21i5x_e pam_evenError
hi def link pam_21i5x_v pam_evenVar
" }}}
" {{{ 21f5x
syn match       pam_21f5x_a             display contained "\%21c[ ]*\-\=\d*\%26c"
syn cluster     21f5x                   contains=pam_21i5x_e,pam_21f5x_a,pam_21i5x_v
hi def link pam_21f5x_a pam_evenArgument
" }}}
" {{{ 21i10
syn match       pam_21i10_a             display contained "\%21c[ ]*\-\=\d*\%31c"
syn cluster     21i10                   contains=pam_21f10_e,pam_21i10_a,pam_21f10_v
hi def link pam_21i10_a pam_oddArgument
" }}}
" {{{ 22i8
syn match       pam_22i8_e             display contained "\%22c.\{1,8\}"
syn match       pam_22i8_a             display contained "\%22c[ ]*\-\=\d*\%30c"
syn match       pam_22i8_v             display contained "\%22c[ ]*\[[^\[]\{-}\]\%30c"
syn match       pam_22i8_v             display contained "\%22c[ ]*<[^<]\{-}>\%30c"
syn match       pam_22i8_v             display contained "\%22c[ ]*{[^{]\{-}}\%30c"
syn cluster     22i8                   contains=pam_22i8_e,pam_22i8_a,pam_22i8_v
hi def link pam_22i8_a pam_oddArgument
hi def link pam_22i8_e pam_oddError
hi def link pam_22i8_v pam_oddVar
" }}}
" {{{ 25i8
syn match       pam_25i8_e             display contained "\%25c.\{1,8\}"
syn match       pam_25i8_a             display contained "\%25c[ ]*\-\=\d*\%33c"
syn match       pam_25i8_v             display contained "\%25c[ ]*\[[^\[]\{-}\]\%33c"
syn match       pam_25i8_v             display contained "\%25c[ ]*<[^<]\{-}>\%33c"
syn match       pam_25i8_v             display contained "\%25c[ ]*{[^{]\{-}}\%33c"
syn cluster     25i8                   contains=pam_25i8_e,pam_25i8_a,pam_25i8_v
hi def link pam_25i8_a pam_oddArgument
hi def link pam_25i8_e pam_oddError
hi def link pam_25i8_v pam_oddVar
" }}}
" {{{ 25i8dim
syn match       pam_25i8dim_a             display contained "\%25c[ ]*\-\=\d*\%33c"
syn cluster     25i8dim                   contains=pam_25i8_e,pam_25i8dim_a,pam_25i8_v
hi def link pam_25i8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 25f8
syn match       pam_25f8_a             display contained "\%25c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%33c"
syn cluster     25f8                   contains=pam_25i8_e,pam_25f8_a,pam_25i8_v
hi def link pam_25f8_a pam_oddArgument
" }}}
" {{{ 25f8dim
syn match       pam_25f8dim_a             display contained "\%25c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%33c"
syn cluster     25f8dim                   contains=pam_25i8_e,pam_25f8dim_a,pam_25i8_v
hi def link pam_25f8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 25f16
syn match       pam_25f16_e             display contained "\%25c.\{1,16\}"
syn match       pam_25f16_a             display contained "\%25c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn match       pam_25f16_v             display contained "\%25c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_25f16_v             display contained "\%25c[ ]*<[^<]\{-}>\%41c"
syn match       pam_25f16_v             display contained "\%25c[ ]*{[^{]\{-}}\%41c"
syn cluster     25f16                   contains=pam_25f16_e,pam_25f16_a,pam_25f16_v
hi def link pam_25f16_a pam_evenArgument
hi def link pam_25f16_e pam_evenError
hi def link pam_25f16_v pam_evenVar
" }}}
" {{{ 25f16x
syn match       pam_25f16x_e             display contained "\%25c.\{1,16\}"
syn match       pam_25f16x_a             display contained "\%25c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn match       pam_25f16x_v             display contained "\%25c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_25f16x_v             display contained "\%25c[ ]*<[^<]\{-}>\%41c"
syn match       pam_25f16x_v             display contained "\%25c[ ]*{[^{]\{-}}\%41c"
syn cluster     25f16x                   contains=pam_25f16x_e,pam_25f16x_a,pam_25f16x_v
hi def link pam_25f16x_a pam_oddArgument
hi def link pam_25f16x_e pam_oddError
hi def link pam_25f16x_v pam_oddVar
" }}}
" {{{ 26i5
syn match       pam_26i5_e             display contained "\%26c.\{1,5\}"
syn match       pam_26i5_a             display contained "\%26c[ ]*\-\=\d*\%31c"
syn match       pam_26i5_v             display contained "\%26c[ ]*\[[^\[]\{-}\]\%31c"
syn match       pam_26i5_v             display contained "\%26c[ ]*<[^<]\{-}>\%31c"
syn match       pam_26i5_v             display contained "\%26c[ ]*{[^{]\{-}}\%31c"
syn cluster     26i5                   contains=pam_26i5_e,pam_26i5_a,pam_26i5_v
hi def link pam_26i5_a pam_evenArgument
hi def link pam_26i5_e pam_evenError
hi def link pam_26i5_v pam_evenVar
" }}}
" {{{ 26i5x
syn match       pam_26i5x_e             display contained "\%26c.\{1,5\}"
syn match       pam_26i5x_a             display contained "\%26c[ ]*\-\=\d*\%31c"
syn match       pam_26i5x_v             display contained "\%26c[ ]*\[[^\[]\{-}\]\%31c"
syn match       pam_26i5x_v             display contained "\%26c[ ]*<[^<]\{-}>\%31c"
syn match       pam_26i5x_v             display contained "\%26c[ ]*{[^{]\{-}}\%31c"
syn cluster     26i5x                   contains=pam_26i5x_e,pam_26i5x_a,pam_26i5x_v
hi def link pam_26i5x_a pam_oddArgument
hi def link pam_26i5x_e pam_oddError
hi def link pam_26i5x_v pam_oddVar
" }}}
" {{{ 26f5x
syn match       pam_26f5x_a             display contained "\%26c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%31c"
syn cluster     26f5x                   contains=pam_26i5x_e,pam_26f5x_a,pam_26i5x_v
hi def link pam_26f5x_a pam_oddArgument
" }}}
" {{{ 26f5
syn match       pam_26f5_a             display contained "\%26c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%31c"
syn cluster     26f5                   contains=pam_26i5_e,pam_26f5_a,pam_26i5_v
hi def link pam_26f5_a pam_evenArgument
" }}}
" {{{ 26f10
syn match       pam_26f10_e             display contained "\%26c.\{1,10\}"
syn match       pam_26f10_a             display contained "\%26c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%36c"
syn match       pam_26f10_v             display contained "\%26c[ ]*\[[^\[]\{-}\]\%36c"
syn match       pam_26f10_v             display contained "\%26c[ ]*<[^<]\{-}>\%36c"
syn match       pam_26f10_v             display contained "\%26c[ ]*{[^{]\{-}}\%36c"
syn cluster     26f10                   contains=pam_26f10_e,pam_26f10_a,pam_26f10_v
hi def link pam_26f10_a pam_evenArgument
hi def link pam_26f10_e pam_evenError
hi def link pam_26f10_v pam_evenVar
" }}}
" {{{ 31f10
syn match       pam_31f10_e             display contained "\%31c.\{1,10\}"
syn match       pam_31f10_a             display contained "\%31c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn match       pam_31f10_v             display contained "\%31c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_31f10_v             display contained "\%31c[ ]*<[^<]\{-}>\%41c"
syn match       pam_31f10_v             display contained "\%31c[ ]*{[^{]\{-}}\%41c"
syn cluster     31f10                   contains=pam_31f10_e,pam_31f10_a,pam_31f10_v
hi def link pam_31f10_a pam_evenArgument
hi def link pam_31f10_e pam_evenError
hi def link pam_31f10_v pam_evenVar
" }}}
" {{{ 31f10x
syn match       pam_31f10x_e             display contained "\%31c.\{1,10\}"
syn match       pam_31f10x_a             display contained "\%31c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn match       pam_31f10x_v             display contained "\%31c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_31f10x_v             display contained "\%31c[ ]*<[^<]\{-}>\%41c"
syn match       pam_31f10x_v             display contained "\%31c[ ]*{[^{]\{-}}\%41c"
syn cluster     31f10x                   contains=pam_31f10x_e,pam_31f10x_a,pam_31f10x_v
hi def link pam_31f10x_a pam_oddArgument
hi def link pam_31f10x_e pam_oddError
hi def link pam_31f10x_v pam_oddVar
" }}}
" {{{ 31i5
syn match       pam_31i5_e             display contained "\%31c.\{1,5\}"
syn match       pam_31i5_a             display contained "\%31c[ ]*\-\=\d*\%36c"
syn match       pam_31i5_v             display contained "\%31c[ ]*\[[^\[]\{-}\]\%36c"
syn match       pam_31i5_v             display contained "\%31c[ ]*<[^<]\{-}>\%36c"
syn match       pam_31i5_v             display contained "\%31c[ ]*{[^{]\{-}}\%36c"
syn cluster     31i5                   contains=pam_31i5_e,pam_31i5_a,pam_31i5_v
hi def link pam_31i5_a pam_evenArgument
hi def link pam_31i5_e pam_evenError
hi def link pam_31i5_v pam_evenVar
" }}}
" {{{ 31i5x
syn match       pam_31i5x_e             display contained "\%31c.\{1,5\}"
syn match       pam_31i5x_a             display contained "\%31c[ ]*\-\=\d*\%36c"
syn match       pam_31i5x_v             display contained "\%31c[ ]*\[[^\[]\{-}\]\%36c"
syn match       pam_31i5x_v             display contained "\%31c[ ]*<[^<]\{-}>\%36c"
syn match       pam_31i5x_v             display contained "\%31c[ ]*{[^{]\{-}}\%36c"
syn cluster     31i5x                   contains=pam_31i5x_e,pam_31i5x_a,pam_31i5x_v
hi def link pam_31i5x_a pam_oddArgument
hi def link pam_31i5x_e pam_oddError
hi def link pam_31i5x_v pam_oddVar
" }}}
" {{{ 31f5
syn match       pam_31f5_a             display contained "\%31c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%36c"
syn cluster     31f5                   contains=pam_31i5_e,pam_31f5_a,pam_31i5_v
hi def link pam_31f5_a pam_evenArgument
" }}}
" {{{ 31f5x
syn match       pam_31f5x_a             display contained "\%31c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%36c"
syn cluster     31f5x                   contains=pam_31i5x_e,pam_31f5x_a,pam_31i5x_v
hi def link pam_31f5x_a pam_oddArgument
" }}}
" {{{ 31f6
syn match       pam_31f6_e             display contained "\%31c.\{1,6\}"
syn match       pam_31f6_a             display contained "\%31c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%37c"
syn match       pam_31f6_v             display contained "\%31c[ ]*\[[^\[]\{-}\]\%37c"
syn match       pam_31f6_v             display contained "\%31c[ ]*<[^<]\{-}>\%37c"
syn match       pam_31f6_v             display contained "\%31c[ ]*{[^{]\{-}}\%37c"
syn cluster     31f6                   contains=pam_31f6_e,pam_31f6_a,pam_31f6_v
hi def link pam_31f6_a pam_evenArgument
hi def link pam_31f6_e pam_evenError
hi def link pam_31f6_v pam_evenVar
" }}}
" {{{ 31i10
syn match       pam_31i10_a             display contained "\%31c[ ]*\-\=\d*\%41c"
syn cluster     31i10                   contains=pam_31f10_e,pam_31i10_a,pam_31f10_v
hi def link pam_31i10_a pam_evenArgument
" }}}
" {{{ 33i8
syn match       pam_33i8_e             display contained "\%33c.\{1,8\}"
syn match       pam_33i8_a             display contained "\%33c[ ]*\-\=\d*\%41c"
syn match       pam_33i8_v             display contained "\%33c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_33i8_v             display contained "\%33c[ ]*<[^<]\{-}>\%41c"
syn match       pam_33i8_v             display contained "\%33c[ ]*{[^{]\{-}}\%41c"
syn cluster     33i8                   contains=pam_33i8_e,pam_33i8_a,pam_33i8_v
hi def link pam_33i8_a pam_evenArgument
hi def link pam_33i8_e pam_evenError
hi def link pam_33i8_v pam_evenVar
" }}}
" {{{ 33i8x
syn match       pam_33i8x_e             display contained "\%33c.\{1,8\}"
syn match       pam_33i8x_a             display contained "\%33c[ ]*\-\=\d*\%41c"
syn match       pam_33i8x_v             display contained "\%33c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_33i8x_v             display contained "\%33c[ ]*<[^<]\{-}>\%41c"
syn match       pam_33i8x_v             display contained "\%33c[ ]*{[^{]\{-}}\%41c"
syn cluster     33i8x                   contains=pam_33i8x_e,pam_33i8x_a,pam_33i8x_v
hi def link pam_33i8x_a pam_oddArgument
hi def link pam_33i8x_e pam_oddError
hi def link pam_33i8x_v pam_oddVar
" }}}
" {{{ 33i8dim
syn match       pam_33i8dim_a             display contained "\%33c[ ]*\-\=\d*\%41c"
syn cluster     33i8dim                   contains=pam_33i8_e,pam_33i8dim_a,pam_33i8_v
hi def link pam_33i8dim_a pam_evenArgumentDimmed
" }}}
" {{{ 33f8
syn match       pam_33f8_a             display contained "\%33c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn cluster     33f8                   contains=pam_33i8_e,pam_33f8_a,pam_33i8_v
hi def link pam_33f8_a pam_evenArgument
" }}}
" {{{ 33f8dim
syn match       pam_33f8dim_a             display contained "\%33c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn cluster     33f8dim                   contains=pam_33i8_e,pam_33f8dim_a,pam_33i8_v
hi def link pam_33f8dim_a pam_evenArgumentDimmed
" }}}
" {{{ 33f16
syn match       pam_33f16_e             display contained "\%33c.\{1,16\}"
syn match       pam_33f16_a             display contained "\%33c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%49c"
syn match       pam_33f16_v             display contained "\%33c[ ]*\[[^\[]\{-}\]\%49c"
syn match       pam_33f16_v             display contained "\%33c[ ]*<[^<]\{-}>\%49c"
syn match       pam_33f16_v             display contained "\%33c[ ]*{[^{]\{-}}\%49c"
syn cluster     33f16                   contains=pam_33f16_e,pam_33f16_a,pam_33f16_v
hi def link pam_33f16_a pam_oddArgument
hi def link pam_33f16_e pam_oddError
hi def link pam_33f16_v pam_oddVar
"}}}
" {{{ 33f16dim
syn match       pam_33f16dim_a             display contained "\%33c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%49c"
syn cluster     33f16dim                   contains=pam_33f16_e,pam_33f16dim_a,pam_33f16_v
hi def link pam_33f16dim_a pam_oddArgumentDimmed
"}}}
" {{{ 35i8
syn match       pam_35i8_e             display contained "\%35c.\{1,8\}"
syn match       pam_35i8_a             display contained "\%35c[ ]*\-\=\d*\%43c"
syn match       pam_35i8_v             display contained "\%35c[ ]*\[[^\[]\{-}\]\%43c"
syn match       pam_35i8_v             display contained "\%35c[ ]*<[^<]\{-}>\%43c"
syn match       pam_35i8_v             display contained "\%35c[ ]*{[^{]\{-}}\%43c"
syn cluster     35i8                   contains=pam_35i8_e,pam_35i8_a,pam_35i8_v
hi def link pam_35i8_a pam_oddArgument
hi def link pam_35i8_e pam_oddError
hi def link pam_35i8_v pam_oddVar
" }}}
" {{{ 36i5
syn match       pam_36i5_e             display contained "\%36c.\{1,5\}"
syn match       pam_36i5_a             display contained "\%36c[ ]*\-\=\d*\%41c"
syn match       pam_36i5_v             display contained "\%36c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_36i5_v             display contained "\%36c[ ]*<[^<]\{-}>\%41c"
syn match       pam_36i5_v             display contained "\%36c[ ]*{[^{]\{-}}\%41c"
syn cluster     36i5                   contains=pam_36i5_e,pam_36i5_a,pam_36i5_v
hi def link pam_36i5_a pam_oddArgument
hi def link pam_36i5_e pam_oddError
hi def link pam_36i5_v pam_oddVar
" }}}
" {{{ 36i5x
syn match       pam_36i5x_e             display contained "\%36c.\{1,5\}"
syn match       pam_36i5x_a             display contained "\%36c[ ]*\-\=\d*\%41c"
syn match       pam_36i5x_v             display contained "\%36c[ ]*\[[^\[]\{-}\]\%41c"
syn match       pam_36i5x_v             display contained "\%36c[ ]*<[^<]\{-}>\%41c"
syn match       pam_36i5x_v             display contained "\%36c[ ]*{[^{]\{-}}\%41c"
syn cluster     36i5x                   contains=pam_36i5x_e,pam_36i5x_a,pam_36i5x_v
hi def link pam_36i5x_a pam_evenArgument
hi def link pam_36i5x_e pam_evenError
hi def link pam_36i5x_v pam_evenVar
" }}}
" {{{ 36f5
syn match       pam_36f5_a             display contained "\%36c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn cluster     36f5                   contains=pam_36i5_e,pam_36f5_a,pam_36i5_v
hi def link pam_36f5_a pam_oddArgument
" }}}
" {{{ 36f5x
syn match       pam_36f5x_a             display contained "\%36c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%41c"
syn cluster     36f5x                   contains=pam_36i5x_e,pam_36f5x_a,pam_36i5x_v
hi def link pam_36f5x_a pam_evenArgument
" }}}
" {{{ 36f10x
syn match       pam_36f10x_e             display contained "\%36c.\{1,10\}"
syn match       pam_36f10x_a             display contained "\%36c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%46c"
syn match       pam_36f10x_v             display contained "\%36c[ ]*\[[^\[]\{-}\]\%46c"
syn match       pam_36f10x_v             display contained "\%36c[ ]*<[^<]\{-}>\%46c"
syn match       pam_36f10x_v             display contained "\%36c[ ]*{[^{]\{-}}\%46c"
syn cluster     36f10x                   contains=pam_36f10x_e,pam_36f10x_a,pam_36f10x_v
hi def link pam_36f10x_a pam_evenArgument
hi def link pam_36f10x_e pam_evenError
hi def link pam_36f10x_v pam_evenVar
" }}}
" {{{ 36f10
syn match       pam_36f10_e             display contained "\%36c.\{1,10\}"
syn match       pam_36f10_a             display contained "\%36c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%46c"
syn match       pam_36f10_v             display contained "\%36c[ ]*\[[^\[]\{-}\]\%46c"
syn match       pam_36f10_v             display contained "\%36c[ ]*<[^<]\{-}>\%46c"
syn match       pam_36f10_v             display contained "\%36c[ ]*{[^{]\{-}}\%46c"
syn cluster     36f10                   contains=pam_36f10_e,pam_36f10_a,pam_36f10_v
hi def link pam_36f10_a pam_oddArgument
hi def link pam_36f10_e pam_oddError
hi def link pam_36f10_v pam_oddVar
" }}}
" {{{ 41i3
syn match       pam_41i3_e             display contained "\%41c.\{1,3\}"
syn match       pam_41i3_a             display contained "\%41c[ ]*\-\=\d*\%44c"
syn match       pam_41i3_v             display contained "\%41c[ ]*\[[^\[]\{-}\]\%44c"
syn match       pam_41i3_v             display contained "\%41c[ ]*<[^<]\{-}>\%44c"
syn match       pam_41i3_v             display contained "\%41c[ ]*{[^{]\{-}}\%44c"
syn cluster     41i3                   contains=pam_41i3_e,pam_41i3_a,pam_41i3_v
hi def link pam_41i3_a pam_evenArgument
hi def link pam_41i3_e pam_evenError
hi def link pam_41i3_v pam_evenVar
" }}}
" {{{ 41i5
syn match       pam_41i5_e             display contained "\%41c.\{1,5\}"
syn match       pam_41i5_a             display contained "\%41c[ ]*\-\=\d*\%46c"
syn match       pam_41i5_v             display contained "\%41c[ ]*\[[^\[]\{-}\]\%46c"
syn match       pam_41i5_v             display contained "\%41c[ ]*<[^<]\{-}>\%46c"
syn match       pam_41i5_v             display contained "\%41c[ ]*{[^{]\{-}}\%46c"
syn cluster     41i5                   contains=pam_41i5_e,pam_41i5_a,pam_41i5_v
hi def link pam_41i5_a pam_oddArgument
hi def link pam_41i5_e pam_oddError
hi def link pam_41i5_v pam_oddVar
" }}}
" {{{ 41i5x
syn match       pam_41i5x_e             display contained "\%41c.\{1,5\}"
syn match       pam_41i5x_a             display contained "\%41c[ ]*\-\=\d*\%46c"
syn match       pam_41i5x_v             display contained "\%41c[ ]*\[[^\[]\{-}\]\%46c"
syn match       pam_41i5x_v             display contained "\%41c[ ]*<[^<]\{-}>\%46c"
syn match       pam_41i5x_v             display contained "\%41c[ ]*{[^{]\{-}}\%46c"
syn cluster     41i5x                   contains=pam_41i5x_e,pam_41i5x_a,pam_41i5x_v
hi def link pam_41i5x_a pam_evenArgument
hi def link pam_41i5x_e pam_evenError
hi def link pam_41i5x_v pam_evenVar
" }}}
" {{{ 41i8
syn match       pam_41i8_e             display contained "\%41c.\{1,8\}"
syn match       pam_41i8_a             display contained "\%41c[ ]*\-\=\d*\%49c"
syn match       pam_41i8_v             display contained "\%41c[ ]*\[[^\[]\{-}\]\%49c"
syn match       pam_41i8_v             display contained "\%41c[ ]*<[^<]\{-}>\%49c"
syn match       pam_41i8_v             display contained "\%41c[ ]*{[^{]\{-}}\%49c"
syn cluster     41i8                   contains=pam_41i8_e,pam_41i8_a,pam_41i8_v
hi def link pam_41i8_a pam_oddArgument
hi def link pam_41i8_e pam_oddError
hi def link pam_41i8_v pam_oddVar
" }}}
" {{{ 41i8x
syn match       pam_41i8x_e             display contained "\%41c.\{1,8\}"
syn match       pam_41i8x_a             display contained "\%41c[ ]*\-\=\d*\%49c"
syn match       pam_41i8x_v             display contained "\%41c[ ]*\[[^\[]\{-}\]\%49c"
syn match       pam_41i8x_v             display contained "\%41c[ ]*<[^<]\{-}>\%49c"
syn match       pam_41i8x_v             display contained "\%41c[ ]*{[^{]\{-}}\%49c"
syn cluster     41i8x                   contains=pam_41i8x_e,pam_41i8x_a,pam_41i8x_v
hi def link pam_41i8x_a pam_evenArgument
hi def link pam_41i8x_e pam_evenError
hi def link pam_41i8x_v pam_evenVar
" }}}
" {{{ 41i10
syn match       pam_41i10_e             display contained "\%41c.\{1,10\}"
syn match       pam_41i10_a             display contained "\%41c[ ]*\-\=\d*\%51c"
syn match       pam_41i10_v             display contained "\%41c[ ]*\[[^\[]\{-}\]\%51c"
syn match       pam_41i10_v             display contained "\%41c[ ]*<[^<]\{-}>\%51c"
syn match       pam_41i10_v             display contained "\%41c[ ]*{[^{]\{-}}\%51c"
syn cluster     41i10                   contains=pam_41i10_e,pam_41i10_a,pam_41i10_v
hi def link pam_41i10_a pam_oddArgument
hi def link pam_41i10_e pam_oddError
hi def link pam_41i10_v pam_oddVar
" }}}
" {{{ 41i10x
syn match       pam_41i10x_e             display contained "\%41c.\{1,10\}"
syn match       pam_41i10x_a             display contained "\%41c[ ]*\-\=\d*\%51c"
syn match       pam_41i10x_v             display contained "\%41c[ ]*\[[^\[]\{-}\]\%51c"
syn match       pam_41i10x_v             display contained "\%41c[ ]*<[^<]\{-}>\%51c"
syn match       pam_41i10x_v             display contained "\%41c[ ]*{[^{]\{-}}\%51c"
syn cluster     41i10x                   contains=pam_41i10x_e,pam_41i10x_a,pam_41i10x_v
hi def link pam_41i10x_a pam_evenArgument
hi def link pam_41i10x_e pam_evenError
hi def link pam_41i10x_v pam_evenVar
" }}}
" {{{ 41f8
syn match       pam_41f8_a             display contained "\%41c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%49c"
syn cluster     41f8                   contains=pam_41i8_e,pam_41f8_a,pam_41i8_v
hi def link pam_41f8_a pam_oddArgument
" }}}
" {{{ 41f8x
syn match       pam_41f8x_a             display contained "\%41c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%49c"
syn cluster     41f8x                   contains=pam_41i8x_e,pam_41f8x_a,pam_41i8x_v
hi def link pam_41f8x_a pam_evenArgument
" }}}
" {{{ 41f8dim
syn match       pam_41f8dim_a             display contained "\%41c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%49c"
syn cluster     41f8dim                   contains=pam_41i8_e,pam_41f8dim_a,pam_41i8_v
hi def link pam_41f8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 41f10
syn match       pam_41f10_a             display contained "\%41c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%51c"
syn cluster     41f10                   contains=pam_41i10_e,pam_41f10_a,pam_41i10_v
hi def link pam_41f10_a pam_oddArgument
" }}}
" {{{ 41f10x
syn match       pam_41f10x_a             display contained "\%41c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%51c"
syn cluster     41f10x                   contains=pam_41i10x_e,pam_41f10x_a,pam_41i10x_v
hi def link pam_41f10x_a pam_evenArgument
" }}}
" {{{ 41f16
syn match       pam_41f16_e             display contained "\%41c.\{1,16\}"
syn match       pam_41f16_a             display contained "\%41c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%57c"
syn match       pam_41f16_v             display contained "\%41c[ ]*\[[^\[]\{-}\]\%57c"
syn match       pam_41f16_v             display contained "\%41c[ ]*<[^<]\{-}>\%57c"
syn match       pam_41f16_v             display contained "\%41c[ ]*{[^{]\{-}}\%57c"
syn cluster     41f16                   contains=pam_41f16_e,pam_41f16_a,pam_41f16_v
hi def link pam_41f16_a pam_oddArgument
hi def link pam_41f16_e pam_oddError
hi def link pam_41f16_v pam_oddVar
" }}}
" {{{ 41i8dim
syn match       pam_41i8dim_a             display contained "\%41c[ ]*\-\=\d*\%49c"
syn cluster     41i8dim                   contains=pam_41i8_e,pam_41i8dim_a,pam_41i8_v
hi def link pam_41i8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 44i3
syn match       pam_44i3_e             display contained "\%44c.\{1,3\}"
syn match       pam_44i3_a             display contained "\%44c[ ]*\-\=\d*\%47c"
syn match       pam_44i3_v             display contained "\%44c[ ]*\[[^\[]\{-}\]\%47c"
syn match       pam_44i3_v             display contained "\%44c[ ]*<[^<]\{-}>\%47c"
syn match       pam_44i3_v             display contained "\%44c[ ]*{[^{]\{-}}\%47c"
syn cluster     44i3                   contains=pam_44i3_e,pam_44i3_a,pam_44i3_v
hi def link pam_44i3_a pam_oddArgument
hi def link pam_44i3_e pam_oddError
hi def link pam_44i3_v pam_oddVar
" }}}
" {{{ 46i5
syn match       pam_46i5_e             display contained "\%46c.\{1,5\}"
syn match       pam_46i5_a             display contained "\%46c[ ]*\-\=\d*\%51c"
syn match       pam_46i5_v             display contained "\%46c[ ]*\[[^\[]\{-}\]\%51c"
syn match       pam_46i5_v             display contained "\%46c[ ]*<[^<]\{-}>\%51c"
syn match       pam_46i5_v             display contained "\%46c[ ]*{[^{]\{-}}\%51c"
syn cluster     46i5                   contains=pam_46i5_e,pam_46i5_a,pam_46i5_v
hi def link pam_46i5_a pam_oddArgument
hi def link pam_46i5_e pam_oddError
hi def link pam_46i5_v pam_oddVar
" }}}
" {{{ 46i5x
syn match       pam_46i5x_e             display contained "\%46c.\{1,5\}"
syn match       pam_46i5x_a             display contained "\%46c[ ]*\-\=\d*\%51c"
syn match       pam_46i5x_v             display contained "\%46c[ ]*\[[^\[]\{-}\]\%51c"
syn match       pam_46i5x_v             display contained "\%46c[ ]*<[^<]\{-}>\%51c"
syn match       pam_46i5x_v             display contained "\%46c[ ]*{[^{]\{-}}\%51c"
syn cluster     46i5x                   contains=pam_46i5x_e,pam_46i5x_a,pam_46i5x_v
hi def link pam_46i5x_a pam_evenArgument
hi def link pam_46i5x_e pam_evenError
hi def link pam_46i5x_v pam_evenVar
" }}}
" {{{ 46f6
syn match       pam_46f6_e             display contained "\%46c.\{1,6\}"
syn match       pam_46f6_a             display contained "\%46c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%52c"
syn match       pam_46f6_v             display contained "\%46c[ ]*\[[^\[]\{-}\]\%52c"
syn match       pam_46f6_v             display contained "\%46c[ ]*<[^<]\{-}>\%52c"
syn match       pam_46f6_v             display contained "\%46c[ ]*{[^{]\{-}}\%52c"
syn cluster     46f6                   contains=pam_46f6_e,pam_46f6_a,pam_46f6_v
hi def link pam_46f6_a pam_oddArgument
hi def link pam_46f6_e pam_oddError
hi def link pam_46f6_v pam_oddVar
" }}}
" {{{ 46f10
syn match       pam_46f10_e             display contained "\%46c.\{1,10\}"
syn match       pam_46f10_a             display contained "\%46c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%56c"
syn match       pam_46f10_v             display contained "\%46c[ ]*\[[^\[]\{-}\]\%56c"
syn match       pam_46f10_v             display contained "\%46c[ ]*<[^<]\{-}>\%56c"
syn match       pam_46f10_v             display contained "\%46c[ ]*{[^{]\{-}}\%56c"
syn cluster     46f10                   contains=pam_46f10_e,pam_46f10_a,pam_46f10_v
hi def link pam_46f10_a pam_oddArgument
hi def link pam_46f10_e pam_oddError
hi def link pam_46f10_v pam_oddVar
" }}}
" {{{ 46f10x
syn match       pam_46f10x_e             display contained "\%46c.\{1,10\}"
syn match       pam_46f10x_a             display contained "\%46c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%56c"
syn match       pam_46f10x_v             display contained "\%46c[ ]*\[[^\[]\{-}\]\%56c"
syn match       pam_46f10x_v             display contained "\%46c[ ]*<[^<]\{-}>\%56c"
syn match       pam_46f10x_v             display contained "\%46c[ ]*{[^{]\{-}}\%56c"
syn cluster     46f10x                   contains=pam_46f10x_e,pam_46f10x_a,pam_46f10x_v
hi def link pam_46f10x_a pam_evenArgument
hi def link pam_46f10x_e pam_evenError
hi def link pam_46f10x_v pam_evenVar
" }}}
" {{{ 46i10
syn match       pam_46i10_a             display contained "\%46c[ ]*\-\=\d*\%56c"
syn cluster     46i10                   contains=pam_46f10x_e,pam_46i10_a,pam_46f10x_v
hi def link pam_46i10_a pam_evenArgument
" }}}
" {{{ 47i3
syn match       pam_47i3_e             display contained "\%47c.\{1,3\}"
syn match       pam_47i3_a             display contained "\%47c[ ]*\-\=\d*\%50c"
syn match       pam_47i3_v             display contained "\%47c[ ]*\[[^\[]\{-}\]\%50c"
syn match       pam_47i3_v             display contained "\%47c[ ]*<[^<]\{-}>\%50c"
syn match       pam_47i3_v             display contained "\%47c[ ]*{[^{]\{-}}\%50c"
syn cluster     47i3                   contains=pam_47i3_e,pam_47i3_a,pam_47i3_v
hi def link pam_47i3_a pam_evenArgument
hi def link pam_47i3_e pam_evenError
hi def link pam_47i3_v pam_evenVar
" }}}
" {{{ 49f6
syn match       pam_49f6_e             display contained "\%49c.\{1,6\}"
syn match       pam_49f6_a             display contained "\%49c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%55c"
syn match       pam_49f6_v             display contained "\%49c[ ]*\[[^\[]\{-}\]\%55c"
syn match       pam_49f6_v             display contained "\%49c[ ]*<[^<]\{-}>\%55c"
syn match       pam_49f6_v             display contained "\%49c[ ]*{[^{]\{-}}\%55c"
syn cluster     49f6                   contains=pam_49f6_e,pam_49f6_a,pam_49f6_v
hi def link pam_49f6_a pam_evenArgument
hi def link pam_49f6_e pam_evenError
hi def link pam_49f6_v pam_evenVar
" }}}
" {{{ 48i8
syn match       pam_48i8_e             display contained "\%48c.\{1,8\}"
syn match       pam_48i8_a             display contained "\%48c[ ]*\-\=\d*\%56c"
syn match       pam_48i8_v             display contained "\%48c[ ]*\[[^\[]\{-}\]\%56c"
syn match       pam_48i8_v             display contained "\%48c[ ]*<[^<]\{-}>\%56c"
syn match       pam_48i8_v             display contained "\%48c[ ]*{[^{]\{-}}\%56c"
syn cluster     48i8                   contains=pam_48i8_e,pam_48i8_a,pam_48i8_v
hi def link pam_48i8_a pam_oddArgument
hi def link pam_48i8_e pam_oddError
hi def link pam_48i8_v pam_oddVar
" }}}
" {{{ 49i8
syn match       pam_49i8_e             display contained "\%49c.\{1,8\}"
syn match       pam_49i8_a             display contained "\%49c[ ]*\-\=\d*\%57c"
syn match       pam_49i8_v             display contained "\%49c[ ]*\[[^\[]\{-}\]\%57c"
syn match       pam_49i8_v             display contained "\%49c[ ]*<[^<]\{-}>\%57c"
syn match       pam_49i8_v             display contained "\%49c[ ]*{[^{]\{-}}\%57c"
syn cluster     49i8                   contains=pam_49i8_e,pam_49i8_a,pam_49i8_v
hi def link pam_49i8_a pam_evenArgument
hi def link pam_49i8_e pam_evenError
hi def link pam_49i8_v pam_evenVar
" }}}
" {{{ 49i8x
syn match       pam_49i8x_e             display contained "\%49c.\{1,8\}"
syn match       pam_49i8x_a             display contained "\%49c[ ]*\-\=\d*\%57c"
syn match       pam_49i8x_v             display contained "\%49c[ ]*\[[^\[]\{-}\]\%57c"
syn match       pam_49i8x_v             display contained "\%49c[ ]*<[^<]\{-}>\%57c"
syn match       pam_49i8x_v             display contained "\%49c[ ]*{[^{]\{-}}\%57c"
syn cluster     49i8x                   contains=pam_49i8x_e,pam_49i8x_a,pam_49i8x_v
hi def link pam_49i8x_a pam_oddArgument
hi def link pam_49i8x_e pam_oddError
hi def link pam_49i8x_v pam_oddVar
" }}}
" {{{ 49f8
syn match       pam_49f8_a             display contained "\%49c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%57c"
syn cluster     49f8                   contains=pam_49i8_e,pam_49f8_a,pam_49i8_v
hi def link pam_49f8_a pam_evenArgument
" }}}
" {{{ 49i8dim
syn match       pam_49i8dim_a             display contained "\%49c[ ]*\-\=\d*\%57c"
syn cluster     49i8dim                   contains=pam_49i8_e,pam_49i8dim_a,pam_49i8_v
hi def link pam_49i8dim_a pam_evenArgumentDimmed
" }}}
" {{{ 49f16
syn match       pam_49f16_e             display contained "\%49c.\{1,16\}"
syn match       pam_49f16_a             display contained "\%49c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%65c"
syn match       pam_49f16_v             display contained "\%49c[ ]*\[[^\[]\{-}\]\%65c"
syn match       pam_49f16_v             display contained "\%49c[ ]*<[^<]\{-}>\%65c"
syn match       pam_49f16_v             display contained "\%49c[ ]*{[^{]\{-}}\%65c"
syn cluster     49f16                   contains=pam_49f16_e,pam_49f16_a,pam_49f16_v
hi def link pam_49f16_a pam_evenArgument
hi def link pam_49f16_e pam_evenError
hi def link pam_49f16_v pam_evenVar
" }}}
" {{{ 49f16dim
syn match       pam_49f16dim_a             display contained "\%49c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%65c"
syn cluster     49f16dim                   contains=pam_49f16_e,pam_49f16dim_a,pam_49f16_v
hi def link pam_49f16dim_a pam_evenArgumentDimmed
" }}}
" {{{ 50i3
syn match       pam_50i3_e             display contained "\%50c.\{1,3\}"
syn match       pam_50i3_a             display contained "\%50c[ ]*\-\=\d*\%53c"
syn match       pam_50i3_v             display contained "\%50c[ ]*\[[^\[]\{-}\]\%53c"
syn match       pam_50i3_v             display contained "\%50c[ ]*<[^<]\{-}>\%53c"
syn match       pam_50i3_v             display contained "\%50c[ ]*{[^{]\{-}}\%53c"
syn cluster     50i3                   contains=pam_50i3_e,pam_50i3_a,pam_50i3_v
hi def link pam_50i3_a pam_oddArgument
hi def link pam_50i3_e pam_oddError
hi def link pam_50i3_v pam_oddVar
" }}}
" {{{ 51i5
syn match       pam_51i5_e             display contained "\%51c.\{1,5\}"
syn match       pam_51i5_a             display contained "\%51c[ ]*\-\=\d*\%56c"
syn match       pam_51i5_v             display contained "\%51c[ ]*\[[^\[]\{-}\]\%56c"
syn match       pam_51i5_v             display contained "\%51c[ ]*<[^<]\{-}>\%56c"
syn match       pam_51i5_v             display contained "\%51c[ ]*{[^{]\{-}}\%56c"
syn cluster     51i5                   contains=pam_51i5_e,pam_51i5_a,pam_51i5_v
hi def link pam_51i5_a pam_evenArgument
hi def link pam_51i5_e pam_evenError
hi def link pam_51i5_v pam_evenVar
" }}}
" {{{ 51i5x
syn match       pam_51i5x_e             display contained "\%51c.\{1,5\}"
syn match       pam_51i5x_a             display contained "\%51c[ ]*\-\=\d*\%56c"
syn match       pam_51i5x_v             display contained "\%51c[ ]*\[[^\[]\{-}\]\%56c"
syn match       pam_51i5x_v             display contained "\%51c[ ]*<[^<]\{-}>\%56c"
syn match       pam_51i5x_v             display contained "\%51c[ ]*{[^{]\{-}}\%56c"
syn cluster     51i5x                   contains=pam_51i5x_e,pam_51i5x_a,pam_51i5x_v
hi def link pam_51i5x_a pam_oddArgument
hi def link pam_51i5x_e pam_oddError
hi def link pam_51i5x_v pam_oddVar
" }}}
" {{{ 51i10
syn match       pam_51i10_e             display contained "\%51c.\{1,10\}"
syn match       pam_51i10_a             display contained "\%51c[ ]*\-\=\d*\%61c"
syn match       pam_51i10_v             display contained "\%51c[ ]*\[[^\[]\{-}\]\%61c"
syn match       pam_51i10_v             display contained "\%51c[ ]*<[^<]\{-}>\%61c"
syn match       pam_51i10_v             display contained "\%51c[ ]*{[^{]\{-}}\%61c"
syn cluster     51i10                   contains=pam_51i10_e,pam_51i10_a,pam_51i10_v
hi def link pam_51i10_a pam_evenArgument
hi def link pam_51i10_e pam_evenError
hi def link pam_51i10_v pam_evenVar
" }}}
" {{{ 51f5
syn match       pam_51f5_a             display contained "\%51c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%56c"
syn cluster     51f5                   contains=pam_51i5_e,pam_51f5_a,pam_51i5_v
hi def link pam_51f5_a pam_evenArgument
" }}}
" {{{ 51f10
syn match       pam_51f10_a             display contained "\%51c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%61c"
syn cluster     51f10                   contains=pam_51i10_e,pam_51f10_a,pam_51i10_v
hi def link pam_51f10_a pam_evenArgument
" }}}
" {{{ 51f10x
syn match       pam_51f10x_e             display contained "\%51c.\{1,10\}"
syn match       pam_51f10x_a             display contained "\%51c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%61c"
syn match       pam_51f10x_v             display contained "\%51c[ ]*\[[^\[]\{-}\]\%61c"
syn match       pam_51f10x_v             display contained "\%51c[ ]*<[^<]\{-}>\%61c"
syn match       pam_51f10x_v             display contained "\%51c[ ]*{[^{]\{-}}\%61c"
syn cluster     51f10x                   contains=pam_51f10x_e,pam_51f10x_a,pam_51f10x_v
hi def link pam_51f10x_a pam_oddArgument
hi def link pam_51f10x_e pam_oddError
hi def link pam_51f10x_v pam_oddVar
" }}}
" {{{ 52f6
syn match       pam_52f6_e             display contained "\%52c.\{1,6\}"
syn match       pam_52f6_a             display contained "\%52c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%58c"
syn match       pam_52f6_v             display contained "\%52c[ ]*\[[^\[]\{-}\]\%58c"
syn match       pam_52f6_v             display contained "\%52c[ ]*<[^<]\{-}>\%58c"
syn match       pam_52f6_v             display contained "\%52c[ ]*{[^{]\{-}}\%58c"
syn cluster     52f6                   contains=pam_52f6_e,pam_52f6_a,pam_52f6_v
hi def link pam_52f6_a pam_evenArgument
hi def link pam_52f6_e pam_evenError
hi def link pam_52f6_v pam_evenVar
" }}}
" {{{ 53i3
syn match       pam_53i3_e             display contained "\%53c.\{1,3\}"
syn match       pam_53i3_a             display contained "\%53c[ ]*\-\=\d*\%56c"
syn match       pam_53i3_v             display contained "\%53c[ ]*\[[^\[]\{-}\]\%56c"
syn match       pam_53i3_v             display contained "\%53c[ ]*<[^<]\{-}>\%56c"
syn match       pam_53i3_v             display contained "\%53c[ ]*{[^{]\{-}}\%56c"
syn cluster     53i3                   contains=pam_53i3_e,pam_53i3_a,pam_53i3_v
hi def link pam_53i3_a pam_evenArgument
hi def link pam_53i3_e pam_evenError
hi def link pam_53i3_v pam_evenVar
" }}}
" {{{ 56i5
syn match       pam_56i5_e             display contained "\%56c.\{1,5\}"
syn match       pam_56i5_a             display contained "\%56c[ ]*\-\=\d*\%61c"
syn match       pam_56i5_v             display contained "\%56c[ ]*\[[^\[]\{-}\]\%61c"
syn match       pam_56i5_v             display contained "\%56c[ ]*<[^<]\{-}>\%61c"
syn match       pam_56i5_v             display contained "\%56c[ ]*{[^{]\{-}}\%61c"
syn cluster     56i5                   contains=pam_56i5_e,pam_56i5_a,pam_56i5_v
hi def link pam_56i5_a pam_oddArgument
hi def link pam_56i5_e pam_oddError
hi def link pam_56i5_v pam_oddVar
" }}}
" {{{ 56f5
syn match       pam_56f5_a             display contained "\%56c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%61c"
syn cluster     56f5                   contains=pam_56i5_e,pam_56f5_a,pam_56i5_v
hi def link pam_56f5_a pam_oddArgument
" }}}
" {{{ 56f10x
syn match       pam_56f10x_e             display contained "\%56c.\{1,10\}"
syn match       pam_56f10x_a             display contained "\%56c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%66c"
syn match       pam_56f10x_v             display contained "\%56c[ ]*\[[^\[]\{-}\]\%66c"
syn match       pam_56f10x_v             display contained "\%56c[ ]*<[^<]\{-}>\%66c"
syn match       pam_56f10x_v             display contained "\%56c[ ]*{[^{]\{-}}\%66c"
syn cluster     56f10x                   contains=pam_56f10x_e,pam_56f10x_a,pam_56f10x_v
hi def link pam_56f10x_a pam_oddArgument
hi def link pam_56f10x_e pam_oddError
hi def link pam_56f10x_v pam_oddVar
" }}}
" {{{ 56f10
syn match       pam_56f10_e             display contained "\%56c.\{1,10\}"
syn match       pam_56f10_a             display contained "\%56c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%66c"
syn match       pam_56f10_v             display contained "\%56c[ ]*\[[^\[]\{-}\]\%66c"
syn match       pam_56f10_v             display contained "\%56c[ ]*<[^<]\{-}>\%66c"
syn match       pam_56f10_v             display contained "\%56c[ ]*{[^{]\{-}}\%66c"
syn cluster     56f10                   contains=pam_56f10_e,pam_56f10_a,pam_56f10_v
hi def link pam_56f10_a pam_evenArgument
hi def link pam_56f10_e pam_evenError
hi def link pam_56f10_v pam_evenVar
" }}}
" {{{ 57i8
syn match       pam_57i8_e             display contained "\%57c.\{1,8\}"
syn match       pam_57i8_a             display contained "\%57c[ ]*\-\=\d*\%65c"
syn match       pam_57i8_v             display contained "\%57c[ ]*\[[^\[]\{-}\]\%65c"
syn match       pam_57i8_v             display contained "\%57c[ ]*<[^<]\{-}>\%65c"
syn match       pam_57i8_v             display contained "\%57c[ ]*{[^{]\{-}}\%65c"
syn cluster     57i8                   contains=pam_57i8_e,pam_57i8_a,pam_57i8_v
hi def link pam_57i8_a pam_oddArgument
hi def link pam_57i8_e pam_oddError
hi def link pam_57i8_v pam_oddVar
" }}}
" {{{ 57i8x
syn match       pam_57i8x_e             display contained "\%57c.\{1,8\}"
syn match       pam_57i8x_a             display contained "\%57c[ ]*\-\=\d*\%65c"
syn match       pam_57i8x_v             display contained "\%57c[ ]*\[[^\[]\{-}\]\%65c"
syn match       pam_57i8x_v             display contained "\%57c[ ]*<[^<]\{-}>\%65c"
syn match       pam_57i8x_v             display contained "\%57c[ ]*{[^{]\{-}}\%65c"
syn cluster     57i8x                   contains=pam_57i8x_e,pam_57i8x_a,pam_57i8x_v
hi def link pam_57i8x_a pam_evenArgument
hi def link pam_57i8x_e pam_evenError
hi def link pam_57i8x_v pam_evenVar
" }}}
" {{{ 57i8dim
syn match       pam_57i8dim_a             display contained "\%57c[ ]*\-\=\d*\%65c"
syn cluster     57i8dim                   contains=pam_57i8_e,pam_57i8dim_a,pam_57i8_v
hi def link pam_57i8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 57f6
syn match       pam_57f6_e             display contained "\%57c.\{1,6\}"
syn match       pam_57f6_a             display contained "\%57c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%63c"
syn match       pam_57f6_v             display contained "\%57c[ ]*\[[^\[]\{-}\]\%63c"
syn match       pam_57f6_v             display contained "\%57c[ ]*<[^<]\{-}>\%63c"
syn match       pam_57f6_v             display contained "\%57c[ ]*{[^{]\{-}}\%63c"
syn cluster     57f6                   contains=pam_57f6_e,pam_57f6_a,pam_57f6_v
hi def link pam_57f6_a pam_oddArgument
hi def link pam_57f6_e pam_oddError
hi def link pam_57f6_v pam_oddVar
" }}}
" {{{ 57f8
syn match       pam_57f8_a             display contained "\%57c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%65c"
syn cluster     57f8                   contains=pam_57i8_e,pam_57f8_a,pam_57i8_v
hi def link pam_57f8_a pam_oddArgument
" }}}
" {{{ 57f8dim
syn match       pam_57f8dim_a             display contained "\%57c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%65c"
syn cluster     57f8dim                   contains=pam_57i8_e,pam_57f8dim_a,pam_57i8_v
hi def link pam_57f8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 57f16x
syn match       pam_57f16x_e             display contained "\%57c.\{1,16\}"
syn match       pam_57f16x_a             display contained "\%57c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%73c"
syn match       pam_57f16x_v             display contained "\%57c[ ]*\[[^\[]\{-}\]\%73c"
syn match       pam_57f16x_v             display contained "\%57c[ ]*<[^<]\{-}>\%73c"
syn match       pam_57f16x_v             display contained "\%57c[ ]*{[^{]\{-}}\%73c"
syn cluster     57f16x                   contains=pam_57f16x_e,pam_57f16x_a,pam_57f16x_v
hi def link pam_57f16x_a pam_oddArgument
hi def link pam_57f16x_e pam_oddError
hi def link pam_57f16x_v pam_oddVar
" }}}
" {{{ 57f16
syn match       pam_57f16_e             display contained "\%57c.\{1,16\}"
syn match       pam_57f16_a             display contained "\%57c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%73c"
syn match       pam_57f16_v             display contained "\%57c[ ]*\[[^\[]\{-}\]\%73c"
syn match       pam_57f16_v             display contained "\%57c[ ]*<[^<]\{-}>\%73c"
syn match       pam_57f16_v             display contained "\%57c[ ]*{[^{]\{-}}\%73c"
syn cluster     57f16                   contains=pam_57f16_e,pam_57f16_a,pam_57f16_v
hi def link pam_57f16_a pam_evenArgument
hi def link pam_57f16_e pam_evenError
hi def link pam_57f16_v pam_evenVar
" }}}
" {{{ 58f6
syn match       pam_58f6_e             display contained "\%58c.\{1,6\}"
syn match       pam_58f6_a             display contained "\%58c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%64c"
syn match       pam_58f6_v             display contained "\%58c[ ]*\[[^\[]\{-}\]\%64c"
syn match       pam_58f6_v             display contained "\%58c[ ]*<[^<]\{-}>\%64c"
syn match       pam_58f6_v             display contained "\%58c[ ]*{[^{]\{-}}\%64c"
syn cluster     58f6                   contains=pam_58f6_e,pam_58f6_a,pam_58f6_v
hi def link pam_58f6_a pam_oddArgument
hi def link pam_52f6_e pam_oddError
hi def link pam_52f6_v pam_oddVar
" }}}
" {{{ 61i5
syn match       pam_61i5_e             display contained "\%61c.\{1,5\}"
syn match       pam_61i5_a             display contained "\%61c[ ]*\-\=\d*\%66c"
syn match       pam_61i5_v             display contained "\%61c[ ]*\[[^\[]\{-}\]\%66c"
syn match       pam_61i5_v             display contained "\%61c[ ]*<[^<]\{-}>\%66c"
syn match       pam_61i5_v             display contained "\%61c[ ]*{[^{]\{-}}\%66c"
syn cluster     61i5                   contains=pam_61i5_e,pam_61i5_a,pam_61i5_v
hi def link pam_61i5_a pam_evenArgument
hi def link pam_61i5_e pam_evenError
hi def link pam_61i5_v pam_evenVar
" }}}
" {{{ 61i5x
syn match       pam_61i5x_e             display contained "\%61c.\{1,5\}"
syn match       pam_61i5x_a             display contained "\%61c[ ]*\-\=\d*\%66c"
syn match       pam_61i5x_v             display contained "\%61c[ ]*\[[^\[]\{-}\]\%66c"
syn match       pam_61i5x_v             display contained "\%61c[ ]*<[^<]\{-}>\%66c"
syn match       pam_61i5x_v             display contained "\%61c[ ]*{[^{]\{-}}\%66c"
syn cluster     61i5x                   contains=pam_61i5x_e,pam_61i5x_a,pam_61i5x_v
hi def link pam_61i5x_a pam_oddArgument
hi def link pam_61i5x_e pam_oddError
hi def link pam_61i5x_v pam_oddVar
" }}}
" {{{ 61f6
syn match       pam_61f6_e             display contained "\%61c.\{1,6\}"
syn match       pam_61f6_a             display contained "\%61c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%67c"
syn match       pam_61f6_v             display contained "\%61c[ ]*\[[^\[]\{-}\]\%67c"
syn match       pam_61f6_v             display contained "\%61c[ ]*<[^<]\{-}>\%67c"
syn match       pam_61f6_v             display contained "\%61c[ ]*{[^{]\{-}}\%67c"
syn cluster     61f6                   contains=pam_61f6_e,pam_61f6_a,pam_61f6_v
hi def link pam_61f6_a pam_oddArgument
hi def link pam_61f6_e pam_oddError
hi def link pam_61f6_v pam_oddVar
" }}}
" {{{ 61i8
syn match       pam_61i8_e             display contained "\%61c.\{1,8\}"
syn match       pam_61i8_a             display contained "\%61c[ ]*\-\=\d*\%69c"
syn match       pam_61i8_v             display contained "\%61c[ ]*\[[^\[]\{-}\]\%69c"
syn match       pam_61i8_v             display contained "\%61c[ ]*<[^<]\{-}>\%69c"
syn match       pam_61i8_v             display contained "\%61c[ ]*{[^{]\{-}}\%69c"
syn cluster     61i8                   contains=pam_61i8_e,pam_61i8_a,pam_61i8_v
hi def link pam_61i8_a pam_oddArgument
hi def link pam_61i8_e pam_oddError
hi def link pam_61i8_v pam_oddVar
" }}}
" {{{ 61i10
syn match       pam_61i10_e             display contained "\%61c.\{1,10\}"
syn match       pam_61i10_a             display contained "\%61c[ ]*\-\=\d*\%71c"
syn match       pam_61i10_v             display contained "\%61c[ ]*\[[^\[]\{-}\]\%71c"
syn match       pam_61i10_v             display contained "\%61c[ ]*<[^<]\{-}>\%71c"
syn match       pam_61i10_v             display contained "\%61c[ ]*{[^{]\{-}}\%71c"
syn cluster     61i10                   contains=pam_61i10_e,pam_61i10_a,pam_61i10_v
hi def link pam_61i10_a pam_oddArgument
hi def link pam_61i10_e pam_oddError
hi def link pam_61i10_v pam_oddVar
" }}}
" {{{ 61f10
syn match       pam_61f10_a             display contained "\%61c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%71c"
syn cluster     61f10                   contains=pam_61i10_e,pam_61f10_a,pam_61i10_v
hi def link pam_61f10_a pam_oddArgument
" }}}
" {{{ 61f10x
syn match       pam_61f10x_e             display contained "\%61c.\{1,10\}"
syn match       pam_61f10x_a             display contained "\%61c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%71c"
syn match       pam_61f10x_v             display contained "\%61c[ ]*\[[^\[]\{-}\]\%71c"
syn match       pam_61f10x_v             display contained "\%61c[ ]*<[^<]\{-}>\%71c"
syn match       pam_61f10x_v             display contained "\%61c[ ]*{[^{]\{-}}\%71c"
syn cluster     61f10x                   contains=pam_61f10x_e,pam_61f10x_a,pam_61f10x_v
hi def link pam_61f10x_a pam_evenArgument
hi def link pam_61f10x_e pam_evenError
hi def link pam_61f10x_v pam_evenVar
" }}}
" {{{ 63f6
syn match       pam_63f6_e             display contained "\%63c.\{1,6\}"
syn match       pam_63f6_a             display contained "\%63c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%69c"
syn match       pam_63f6_v             display contained "\%63c[ ]*\[[^\[]\{-}\]\%69c"
syn match       pam_63f6_v             display contained "\%63c[ ]*<[^<]\{-}>\%69c"
syn match       pam_63f6_v             display contained "\%63c[ ]*{[^{]\{-}}\%69c"
syn cluster     63f6                   contains=pam_63f6_e,pam_63f6_a,pam_63f6_v
hi def link pam_63f6_a pam_evenArgument
hi def link pam_63f6_e pam_evenError
hi def link pam_63f6_v pam_evenVar
" }}}
" {{{ 65f6
syn match       pam_65f6_e             display contained "\%65c.\{1,6\}"
syn match       pam_65f6_a             display contained "\%65c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%71c"
syn match       pam_65f6_v             display contained "\%65c[ ]*\[[^\[]\{-}\]\%71c"
syn match       pam_65f6_v             display contained "\%65c[ ]*<[^<]\{-}>\%71c"
syn match       pam_65f6_v             display contained "\%65c[ ]*{[^{]\{-}}\%71c"
syn cluster     65f6                   contains=pam_65f6_e,pam_65f6_a,pam_65f6_v
hi def link pam_65f6_a pam_evenArgument
hi def link pam_65f6_e pam_evenError
hi def link pam_65f6_v pam_evenVar
" }}}
" {{{ 65f8
syn match       pam_65f8_e             display contained "\%65c.\{1,8\}"
syn match       pam_65f8_a             display contained "\%65c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%73c"
syn match       pam_65f8_v             display contained "\%65c[ ]*\[[^\[]\{-}\]\%73c"
syn match       pam_65f8_v             display contained "\%65c[ ]*<[^<]\{-}>\%73c"
syn match       pam_65f8_v             display contained "\%65c[ ]*{[^{]\{-}}\%73c"
syn cluster     65f8                   contains=pam_65f8_e,pam_65f8_a,pam_65f8_v
hi def link pam_65f8_a pam_evenArgument
hi def link pam_65f8_e pam_evenError
hi def link pam_65f8_v pam_evenVar
" }}}
" {{{ 65f8dim
syn match       pam_65f8dim_a             display contained "\%65c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%73c"
syn cluster     65f8dim                   contains=pam_65f8_e,pam_65f8dim_a,pam_65f8_v
hi def link pam_65f8dim_a pam_evenArgumentDimmed
" }}}
" {{{ 65f16
syn match       pam_65f16_e             display contained "\%65c.\{1,16\}"
syn match       pam_65f16_a             display contained "\%65c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%81c"
syn match       pam_65f16_v             display contained "\%65c[ ]*\[[^\[]\{-}\]\%81c"
syn match       pam_65f16_v             display contained "\%65c[ ]*<[^<]\{-}>\%81c"
syn match       pam_65f16_v             display contained "\%65c[ ]*{[^{]\{-}}\%81c"
syn cluster     65f16                   contains=pam_65f16_e,pam_65f16_a,pam_65f16_v
hi def link pam_65f16_a pam_oddArgument
hi def link pam_65f16_e pam_oddError
hi def link pam_65f16_v pam_oddVar
" }}}
" {{{ 65f16x
syn match       pam_65f16x_e             display contained "\%65c.\{1,16\}"
syn match       pam_65f16x_a             display contained "\%65c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%81c"
syn match       pam_65f16x_v             display contained "\%65c[ ]*\[[^\[]\{-}\]\%81c"
syn match       pam_65f16x_v             display contained "\%65c[ ]*<[^<]\{-}>\%81c"
syn match       pam_65f16x_v             display contained "\%65c[ ]*{[^{]\{-}}\%81c"
syn cluster     65f16x                   contains=pam_65f16x_e,pam_65f16x_a,pam_65f16x_v
hi def link pam_65f16x_a pam_evenArgument
hi def link pam_65f16x_e pam_evenError
hi def link pam_65f16x_v pam_evenVar
" }}}
" {{{ 65i8
syn match       pam_65i8_a             display contained "\%65c[ ]*\-\=\d*\%73c"
syn cluster     65i8                   contains=pam_65f8_e,pam_65i8_a,pam_65f8_v
hi def link pam_65i8_a pam_evenArgument
" }}}
" {{{ 65i8x
syn match       pam_65i8x_e             display contained "\%65c.\{1,8\}"
syn match       pam_65i8x_a             display contained "\%65c[ ]*\-\=\d*\%73c"
syn match       pam_65i8x_v             display contained "\%65c[ ]*\[[^\[]\{-}\]\%73c"
syn match       pam_65i8x_v             display contained "\%65c[ ]*<[^<]\{-}>\%73c"
syn match       pam_65i8x_v             display contained "\%65c[ ]*{[^{]\{-}}\%73c"
syn cluster     65i8x                   contains=pam_65i8x_e,pam_65i8x_a,pam_65i8x_v
hi def link pam_65i8x_a pam_oddArgument
hi def link pam_65i8x_e pam_oddError
hi def link pam_65i8x_v pam_oddVar
" }}}
" {{{ 65i8dim
syn match       pam_65i8dim_a             display contained "\%65c[ ]*\-\=\d*\%73c"
syn cluster     65i8dim                   contains=pam_65f8_e,pam_65i8dim_a,pam_65f8_v
hi def link pam_65i8dim_a pam_evenArgumentDimmed
" }}}
" {{{ 66i5
syn match       pam_66i5_e             display contained "\%66c.\{1,5\}"
syn match       pam_66i5_a             display contained "\%66c[ ]*\-\=\d*\%71c"
syn match       pam_66i5_v             display contained "\%66c[ ]*\[[^\[]\{-}\]\%71c"
syn match       pam_66i5_v             display contained "\%66c[ ]*<[^<]\{-}>\%71c"
syn match       pam_66i5_v             display contained "\%66c[ ]*{[^{]\{-}}\%71c"
syn cluster     66i5                   contains=pam_66i5_e,pam_66i5_a,pam_66i5_v
hi def link pam_66i5_a pam_oddArgument
hi def link pam_66i5_e pam_oddError
hi def link pam_66i5_v pam_oddVar
" }}}
" {{{ 66i5x
syn match       pam_66i5x_e             display contained "\%66c.\{1,5\}"
syn match       pam_66i5x_a             display contained "\%66c[ ]*\-\=\d*\%71c"
syn match       pam_66i5x_v             display contained "\%66c[ ]*\[[^\[]\{-}\]\%71c"
syn match       pam_66i5x_v             display contained "\%66c[ ]*<[^<]\{-}>\%71c"
syn match       pam_66i5x_v             display contained "\%66c[ ]*{[^{]\{-}}\%71c"
syn cluster     66i5x                   contains=pam_66i5x_e,pam_66i5x_a,pam_66i5x_v
hi def link pam_66i5x_a pam_evenArgument
hi def link pam_66i5x_e pam_evenError
hi def link pam_66i5x_v pam_evenVar
" }}}
" {{{ 66f10
syn match       pam_66f10_e             display contained "\%66c.\{1,10\}"
syn match       pam_66f10_a             display contained "\%66c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%76c"
syn match       pam_66f10_v             display contained "\%66c[ ]*\[[^\[]\{-}\]\%76c"
syn match       pam_66f10_v             display contained "\%66c[ ]*<[^<]\{-}>\%76c"
syn match       pam_66f10_v             display contained "\%66c[ ]*{[^{]\{-}}\%76c"
syn cluster     66f10                   contains=pam_66f10_e,pam_66f10_a,pam_66f10_v
hi def link pam_66f10_a pam_oddArgument
hi def link pam_66f10_e pam_oddError
hi def link pam_66f10_v pam_oddVar
" }}}
" {{{ 67f6
syn match       pam_67f6_e             display contained "\%67c.\{1,6\}"
syn match       pam_67f6_a             display contained "\%67c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%73c"
syn match       pam_67f6_v             display contained "\%67c[ ]*\[[^\[]\{-}\]\%73c"
syn match       pam_67f6_v             display contained "\%67c[ ]*<[^<]\{-}>\%73c"
syn match       pam_67f6_v             display contained "\%67c[ ]*{[^{]\{-}}\%73c"
syn cluster     67f6                   contains=pam_67f6_e,pam_67f6_a,pam_67f6_v
hi def link pam_67f6_a pam_evenArgument
hi def link pam_67f6_e pam_evenError
hi def link pam_67f6_v pam_evenVar
" }}}
" {{{ 69f6
syn match       pam_69f6_e             display contained "\%69c.\{1,6\}"
syn match       pam_69f6_a             display contained "\%69c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%75c"
syn match       pam_69f6_v             display contained "\%69c[ ]*\[[^\[]\{-}\]\%75c"
syn match       pam_69f6_v             display contained "\%69c[ ]*<[^<]\{-}>\%75c"
syn match       pam_69f6_v             display contained "\%69c[ ]*{[^{]\{-}}\%75c"
syn cluster     69f6                   contains=pam_69f6_e,pam_69f6_a,pam_69f6_v
hi def link pam_69f6_a pam_oddArgument
hi def link pam_69f6_e pam_oddError
hi def link pam_69f6_v pam_oddVar
" }}}
" {{{ 71f10
syn match       pam_71f10_e             display contained "\%71c.\{1,10\}"
syn match       pam_71f10_a             display contained "\%71c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%81c"
syn match       pam_71f10_v             display contained "\%71c[ ]*\[[^\[]\{-}\]\%81c"
syn match       pam_71f10_v             display contained "\%71c[ ]*<[^<]\{-}>\%81c"
syn match       pam_71f10_v             display contained "\%71c[ ]*{[^{]\{-}}\%81c"
syn cluster     71f10                   contains=pam_71f10_e,pam_71f10_a,pam_71f10_v
hi def link pam_71f10_a pam_evenArgument
hi def link pam_71f10_e pam_evenError
hi def link pam_71f10_v pam_evenVar
" }}}
" {{{ 71f10x
syn match       pam_71f10x_e             display contained "\%71c.\{1,10\}"
syn match       pam_71f10x_a             display contained "\%71c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%81c"
syn match       pam_71f10x_v             display contained "\%71c[ ]*\[[^\[]\{-}\]\%81c"
syn match       pam_71f10x_v             display contained "\%71c[ ]*<[^<]\{-}>\%81c"
syn match       pam_71f10x_v             display contained "\%71c[ ]*{[^{]\{-}}\%81c"
syn cluster     71f10x                   contains=pam_71f10x_e,pam_71f10x_a,pam_71f10x_v
hi def link pam_71f10x_a pam_oddArgument
hi def link pam_71f10x_e pam_oddError
hi def link pam_71f10x_v pam_oddVar
" }}}
" {{{ 71i5
syn match       pam_71i5_e             display contained "\%71c.\{1,5\}"
syn match       pam_71i5_a             display contained "\%71c[ ]*\-\=\d*\%76c"
syn match       pam_71i5_v             display contained "\%71c[ ]*\[[^\[]\{-}\]\%76c"
syn match       pam_71i5_v             display contained "\%71c[ ]*<[^<]\{-}>\%76c"
syn match       pam_71i5_v             display contained "\%71c[ ]*{[^{]\{-}}\%76c"
syn cluster     71i5                   contains=pam_71i5_e,pam_71i5_a,pam_71i5_v
hi def link pam_71i5_a pam_evenArgument
hi def link pam_71i5_e pam_evenError
hi def link pam_71i5_v pam_evenVar
" }}}
" {{{ 71i5x
syn match       pam_71i5x_e             display contained "\%71c.\{1,5\}"
syn match       pam_71i5x_a             display contained "\%71c[ ]*\-\=\d*\%76c"
syn match       pam_71i5x_v             display contained "\%71c[ ]*\[[^\[]\{-}\]\%76c"
syn match       pam_71i5x_v             display contained "\%71c[ ]*<[^<]\{-}>\%76c"
syn match       pam_71i5x_v             display contained "\%71c[ ]*{[^{]\{-}}\%76c"
syn cluster     71i5x                   contains=pam_71i5x_e,pam_71i5x_a,pam_71i5x_v
hi def link pam_71i5x_a pam_oddArgument
hi def link pam_71i5x_e pam_oddError
hi def link pam_71i5x_v pam_oddVar
" }}}
" {{{ 71i10
syn match       pam_71i10_a             display contained "\%71c[ ]*\-\=\d*\%81c"
syn cluster     71i10                   contains=pam_71f10_e,pam_71i10_a,pam_71f10_v
hi def link pam_71i10_a pam_evenArgument
" }}}
" {{{ 71i10x
syn match       pam_71i10x_a             display contained "\%71c[ ]*\-\=\d*\%81c"
syn cluster     71i10x                   contains=pam_71f10x_e,pam_71i10x_a,pam_71f10x_v
hi def link pam_71i10x_a pam_oddArgument
" }}}
" {{{ 73f6
syn match       pam_73f6_e             display contained "\%73c.\{1,6\}"
syn match       pam_73f6_a             display contained "\%73c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%79c"
syn match       pam_73f6_v             display contained "\%73c[ ]*\[[^\[]\{-}\]\%79c"
syn match       pam_73f6_v             display contained "\%73c[ ]*<[^<]\{-}>\%79c"
syn match       pam_73f6_v             display contained "\%73c[ ]*{[^{]\{-}}\%79c"
syn cluster     73f6                   contains=pam_73f6_e,pam_73f6_a,pam_73f6_v
hi def link pam_73f6_a pam_oddArgument
hi def link pam_73f6_e pam_oddError
hi def link pam_73f6_v pam_oddVar
" }}}
" {{{ 73f8
syn match       pam_73f8_e             display contained "\%73c.\{1,8\}"
syn match       pam_73f8_a             display contained "\%73c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%81c"
syn match       pam_73f8_v             display contained "\%73c[ ]*\[[^\[]\{-}\]\%81c"
syn match       pam_73f8_v             display contained "\%73c[ ]*<[^<]\{-}>\%81c"
syn match       pam_73f8_v             display contained "\%73c[ ]*{[^{]\{-}}\%81c"
syn cluster     73f8                   contains=pam_73f8_e,pam_73f8_a,pam_73f8_v
hi def link pam_73f8_a pam_oddArgument
hi def link pam_73f8_e pam_oddError
hi def link pam_73f8_v pam_oddVar
" }}}
" {{{ 73f8dim
syn match       pam_73f8dim_a             display contained "\%73c[ ]*[+-]\=\d*\.\=\d*\([eE][+-]\=\d*\)\=\%81c"
syn cluster     73f8dim                   contains=pam_73f8_e,pam_73f8dim_a,pam_73f8_v
hi def link pam_73f8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 73i8
syn match       pam_73i8_a             display contained "\%73c[ ]*\-\=\d*\%81c"
syn cluster     73i8                   contains=pam_73f8_e,pam_73i8_a,pam_73f8_v
hi def link pam_73i8_a pam_oddArgument
" }}}
" {{{ 73i8dim
syn match       pam_73i8dim_a             display contained "\%73c[ ]*\-\=\d*\%81c"
syn cluster     73i8dim                   contains=pam_73f8_e,pam_73i8dim_a,pam_73f8_v
hi def link pam_73i8dim_a pam_oddArgumentDimmed
" }}}
" {{{ 75i6
syn match       pam_75i6_e             display contained "\%75c.\{1,6\}"
syn match       pam_75i6_a             display contained "\%75c[ ]*\-\=\d*\%81c"
syn match       pam_75i6_v             display contained "\%75c[ ]*\[[^\[]\{-}\]\%81c"
syn match       pam_75i6_v             display contained "\%75c[ ]*<[^<]\{-}>\%81c"
syn match       pam_75i6_v             display contained "\%75c[ ]*{[^{]\{-}}\%81c"
syn cluster     75i6                   contains=pam_75i6_e,pam_75i6_a,pam_75i6_v
hi def link pam_75i6_a pam_evenArgument
hi def link pam_75i6_e pam_evenError
hi def link pam_75i6_v pam_evenVar
" }}}
" {{{ 76i5
syn match       pam_76i5_e             display contained "\%76c.\{1,5\}"
syn match       pam_76i5_a             display contained "\%76c[ ]*\-\=\d*\%81c"
syn match       pam_76i5_v             display contained "\%76c[ ]*\[[^\[]\{-}\]\%81c"
syn match       pam_76i5_v             display contained "\%76c[ ]*<[^<]\{-}>\%81c"
syn match       pam_76i5_v             display contained "\%76c[ ]*{[^{]\{-}}\%81c"
syn cluster     76i5                   contains=pam_76i5_e,pam_76i5_a,pam_76i5_v
hi def link pam_76i5_a pam_oddArgument
hi def link pam_76i5_e pam_oddError
hi def link pam_76i5_v pam_oddVar
" }}}
" {{{ 76i5x
syn match       pam_76i5x_e             display contained "\%76c.\{1,5\}"
syn match       pam_76i5x_a             display contained "\%76c[ ]*\-\=\d*\%81c"
syn match       pam_76i5x_v             display contained "\%76c[ ]*\[[^\[]\{-}\]\%81c"
syn match       pam_76i5x_v             display contained "\%76c[ ]*<[^<]\{-}>\%81c"
syn match       pam_76i5x_v             display contained "\%76c[ ]*{[^{]\{-}}\%81c"
syn cluster     76i5x                   contains=pam_76i5x_e,pam_76i5x_a,pam_76i5x_v
hi def link pam_76i5x_a pam_evenArgument
hi def link pam_76i5x_e pam_evenError
hi def link pam_76i5x_v pam_evenVar
" }}}
" general field definition end}}}
   
" {{{ Gaps
   syn match       1g24            display contained "\%1c.\{1,24\}"
   syn match       1g40            display contained "\%1c.\{1,40\}"
   syn match       11gE             display contained "\%11c.*"
   syn match       16g10             display contained "\%16c.\{1,10\}"
   syn match       17g8             display contained "\%17c.\{1,8\}"
   syn match       21gE             display contained "\%21c.*"
   syn match       25g24            display contained "\%25c.\{1,24\}"
   syn match       31gE             display contained "\%31c.*"
   syn match       33g16            display contained "\%33c.\{1,16\}"
   syn match       37gE             display contained "\%37c.*"
   syn match       41gE             display contained "\%41c.*"
   syn match       41g24            display contained "\%41c.\{1,24\}"
   syn match       49gE             display contained "\%49c.*"
   syn match       55gE             display contained "\%55c.*"
   syn match       56g5             display contained "\%56c.\{1,5\}"
   syn match       57gE             display contained "\%57c.*"
   syn match       61gE             display contained "\%61c.*"
   syn match       63gE             display contained "\%63c.*"
   syn match       64gE             display contained "\%64c.*"
   syn match       71gE             display contained "\%71c.*"
   syn match       73gE             display contained "\%73c.*"
   syn match       79gE             display contained "\%79c.*"
"}}}

" {{{ CONTROL - GENERAL begin
syn match      pam_Control_RESUMERUN             display "^\CRESUMERUN"
hi def link pam_Control_RESUMERUN pam_HeaderKW
syn region      pam_Control_INPUTVERSION         matchgroup=pam_HeaderKW start="\CINPUTVERSION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_INPUTVERSION_arg,pam_Continue keepend
   syn keyword     pam_Control_INPUTVERSION_arg     contained containedin=pam_Control_INPUTVERSION 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014

syn region      pam_Control_ANALYSIS             matchgroup=pam_HeaderKW start="\CANALYSIS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_ANALYSIS_arg,pam_Continue keepend
   syn keyword     pam_Control_ANALYSIS_arg         contained containedin=pam_Control_ANALYSIS EXPLICIT IMPLICIT IMPLICIT_PCG

syn region      pam_Control_SIGNAL               matchgroup=pam_HeaderKW start="\CSIGNAL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_MODULAR_DATA               matchgroup=pam_HeaderKW start="\CMODULAR_DATA" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_ACTIVATE_GLOBAL               containedin=ALL matchgroup=pam_HeaderKW start="\CACTIVATE_GLOBAL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_String,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue keepend

syn region      pam_Control_FILE                 matchgroup=pam_HeaderKW start="\CFILE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Continue keepend

syn region      pam_Control_STOPRUN              matchgroup=pam_HeaderKW start="\CSTOPRUN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Control_STOPRUN_arg,pam_Continue keepend
   syn keyword     pam_Control_STOPRUN_arg          contained containedin=pam_Control_STOPRUN ENERGY CPULIMIT TIMESTEP CONTACT_DIVERGENCE

syn region      pam_Control_SHELLCHECK           matchgroup=pam_HeaderKW start="\CSHELLCHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_SOLIDCHECK           matchgroup=pam_HeaderKW start="\CSOLIDCHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_AIRBAGCHECK          matchgroup=pam_HeaderKW start="\CAIRBAGCHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_AIRBAGCHECK_arg,pam_Control_YESNO,pam_Continue keepend
   syn keyword     pam_Control_AIRBAGCHECK_arg      contained containedin=pam_Control_AIRBAGCHECK VOLUME ORIENT

syn region      pam_Control_METRICCHECK          matchgroup=pam_HeaderKW start="\CMETRICCHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_NVHFILES          matchgroup=pam_HeaderKW start="\CNVHFILES" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Control_NVHFILES_arg,pam_Continue keepend
   syn keyword     pam_Control_NVHFILES_arg        contained containedin=pam_Control_NVHFILES KEEP REMOVE
   hi def link pam_Control_NVHFILES_arg pam_Argument

syn region      pam_Control_PYVARCHECK          matchgroup=pam_HeaderKW start="\CPYVARCHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_DATACHECK            matchgroup=pam_HeaderKW start="\CDATACHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_DATACHECK_arg,pam_Control_YESNO,pam_Continue keepend
   syn keyword     pam_Control_DATACHECK_arg        contained containedin=pam_Control_DATACHECK QUIT STOP

syn region      pam_Control_MAXMEMORY            matchgroup=pam_HeaderKW start="\CMAXMEMORY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_USE_MODULE            matchgroup=pam_HeaderKW start="\CUSE_MODULE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend

syn region      pam_Control_MEMCHECK             matchgroup=pam_HeaderKW start="\CMEMCHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_MEMCHECK_arg,pam_Control_YESNO,pam_Continue keepend
   syn keyword     pam_Control_MEMCHECK_arg         contained containedin=pam_Control_MEMCHECK STANDARD ACURATE

syn region      pam_Control_RESTARTFILES         matchgroup=pam_HeaderKW start="\CRESTARTFILES" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend

syn region      pam_Control_PIPE                 matchgroup=pam_HeaderKW start="\CPIPE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_SOLVER               matchgroup=pam_HeaderKW start="\CSOLVER" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_SOLVER_arg,pam_Continue keepend
   syn keyword     pam_Control_SOLVER_arg           contained containedin=pam_Control_SOLVER CRASH STAMP

syn region      pam_Control_MERGEGAP             matchgroup=pam_HeaderKW start="\CMERGEGAP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend

syn region      pam_Control_DEBUG                matchgroup=pam_HeaderKW start="\CDEBUG" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend

syn region      pam_Control_SUBRUN               matchgroup=pam_HeaderKW start="\CSUBRUN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Integer,pam_Float,pam_Continue keepend

syn region      pam_Control_UNIT                 matchgroup=pam_HeaderKW start="\CUNIT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_UNIT_arg,pam_Continue keepend
   syn keyword     pam_Control_UNIT_arg             contained containedin=pam_Control_UNIT M MM CM FOOT INCH KG HKG GRAM TON DTON KG/G SLUG POUND SLINCH S MS US KELVIN CELSIUS FAHR RANK

syn region      pam_Control_DCOMP                matchgroup=pam_HeaderKW start="\CDCOMP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_DCOMP_arg,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_DCOMP_arg            contained containedin=pam_Control_DCOMP LCB VCB RCB CCB METIS SEQUENCE X Y Z CENTER

syn region      pam_Control_PROFILE_DMP          matchgroup=pam_HeaderKW start="\CPROFILE_DMP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend

syn region      pam_Control_AUTOSLEEP            matchgroup=pam_HeaderKW start="\CAUTOSLEEP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend

syn match       pam_Control_COUPLINGMADYMO       display "\CCOUPLING MADYMO$" 

"dummy ERFFIL (no syntax)
syn region      pam_Control_ERFFIL               matchgroup=pam_CardTag start="^\CERFFIL/" end="^\CEND_ERFFIL" contains=pam_Comment,pam_Comment_Position fold keepend

syn region      pam_Control_TITLE                matchgroup=pam_CardTag start="^\CTITLE /" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Continue keepend

syn region      pam_Control_DRAPP                matchgroup=pam_CardTag start="^\CDRAPP   " end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Continue keepend

syn region      pam_Control_RUNEND               matchgroup=pam_CardTag start="^\CRUNEND/" end="^\CEND_RUNEND" contains=pam_Error,pam_Control_RUNEND_arg,pam_Float,pam_Integer,pam_Comment,pam_Comment_Position,pam_FreeVar fold keepend
syn keyword     pam_Control_RUNEND_arg           contained containedin=pam_Control_RUNEND TIME SENSOR START_AT

   " END_PICK
   syn match       pam_EndPICK        display contained "^\CEND_PICK"
   hi def link pam_EndPICK pam_CardTag
   syn region      pam_Control_PICK_r4     transparent contained containedin=pam_Control_PICK start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error,pam_Control_PICK_arg,pam_Float nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPICK skipnl keepend
   syn region      pam_Control_PICK_r3     transparent contained containedin=pam_Control_PICK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Control_PICK_arg,pam_String,pam_Float,pam_Integer,pam_Comment,pam_Comment_Position nextgroup=pam_Control_PICK_r4 skipnl keepend
   syn region      pam_Control_PICK_r2     transparent contained containedin=pam_Control_PICK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Control_PICK_r3 skipnl keepend
   syn region      pam_Control_PICK_r1         transparent contained containedin=pam_Control_PICK start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Control_PICK_r2 skipnl keepend
syn region      pam_Control_PICK               matchgroup=pam_CardTag start="^\CPICK  /" end="^\CEND_PICK" contains=pam_Error,pam_Control_PICK_arg,pam_Float,pam_Integer,pam_Comment,pam_Comment_Position,pam_FreeVar fold keepend
syn keyword     pam_Control_PICK_arg           contained containedin=pam_Control_PICK TIME_PICK RESTART_FILE
hi def link pam_Control_PICK_arg pam_Argument


" CONTROL - General end}}}

" {{{OCTRL
syn region      pam_Control_OCTRL                matchgroup=pam_CardTag start="^\COCTRL /" end="^\CEND_OCTRL[ ]*" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
   syn region      pam_Control_OCTRL_ERFOUTPUT      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="ERFOUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region      pam_Control_OCTRL_OUTPUT_FILE_FORMAT      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="OUTPUT_FILE_FORMAT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_OUTPUT_FILE_FORMAT_arg,pam_Continue,pam_FreeVar
      syn keyword     pam_Control_OCTRL_OUTPUT_FILE_FORMAT_arg  contained containedin=pam_Control_OCTRL_OUTPUT_FILE_FORMAT ERF DSYTHP ALL
      hi def link pam_Control_OCTRL_OUTPUT_FILE_FORMAT_arg pam_Argument
   syn region      pam_Control_OCTRL_TIME_HISTORY      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="TIME_HISTORY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_TIME_HISTORY_arg,pam_FLoat,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_TIME_HISTORY_arg  contained containedin=pam_Control_OCTRL_TIME_HISTORY INTERVAL POINT CURVE CYCLE NO 
      hi def link pam_Control_OCTRL_TIME_HISTORY_arg pam_Argument
   syn region      pam_Control_OCTRL_CONTOUR_PLOT      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="CONTOUR_PLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_CONTOUR_PLOT_arg,pam_FLoat,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_CONTOUR_PLOT_arg  contained containedin=pam_Control_OCTRL_CONTOUR_PLOT INTERVAL STATE CURVE CYCLE FIRST NO 
      hi def link pam_Control_OCTRL_CONTOUR_PLOT_arg pam_Argument
   syn region      pam_Control_OCTRL_COLOUTPUT      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="COLOUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_COLOUTPUT_arg,pam_Continue
      syn keyword     pam_Control_OCTRL_COLOUTPUT_arg  contained containedin=pam_Control_OCTRL_COLOUTPUT ALL BAGIN MTOCO MUSCL DFLT OTMCO PLINK RBODY TIED NO
   syn region      pam_Control_OCTRL_THPOUTPUT      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="THPOUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_THPOUTPUT_arg,pam_FLoat,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_THPOUTPUT_arg  contained containedin=pam_Control_OCTRL_THPOUTPUT INTERVAL CYCLE CURVE POINT NO 
   syn region      pam_Control_OCTRL_DSYOUTPUT      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="DSYOUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_DSYOUTPUT_arg,pam_Float,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_DSYOUTPUT_arg  contained containedin=pam_Control_OCTRL_DSYOUTPUT INTERVAL STATE CYCLE CURVE POINT NO FIRST
   syn region      pam_Control_OCTRL_PRTOUTPUT      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="PRTOUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_DSYOUTPUT_arg,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_PRTOUTPUT_arg  contained containedin=pam_Control_OCTRL_PRTOUTPUT INTERVAL CYCLE CURVE POINT NO FIRST
   syn region      pam_Control_OCTRL_RSTOUTPUT      contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="RSTOUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_RSTOUTPUT_arg,pam_Float,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_RSTOUTPUT_arg  contained containedin=pam_Control_OCTRL_RSTOUTPUT INTERVAL CYCLE NO 
   syn region      pam_Control_OCTRL_NODPLOT        contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="NODPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_NODPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_NODPLOT_arg  contained containedin=pam_Control_OCTRL_NODPLOT ALL ACOI CRUP DISP FACM PCNT PRES TEMP DFLT VELO NO
   syn region      pam_Control_OCTRL_SOLPLOT        contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="SOLPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_SOLPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_SOLPLOT_arg  contained containedin=pam_Control_OCTRL_SOLPLOT DHGL DINT DPLE DVEL DXYZ EHGL EINT ELSI ENTH EPLE EPSI EPTH EVOL EXYZ FDMG FLUX IMSC LEPS LSIG NSMS PORO PSIG PSMA PSMI PSRA PSTR STSC SXYZ TEMP USRV VAUX DFLT NO ALL
   syn region      pam_Control_OCTRL_SHLPLOT        contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="SHLPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_SHLPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_SHLPLOT_arg  contained containedin=pam_Control_OCTRL_SHLPLOT ALL BSTR EPMI EPMX NXYZ DFLD DFRC DHGL DINT DIRF DMG EHGL EINT ELSI ENER EPME EPSE EPSI ESMA ESME ESMI FANG FDMG FRSK GRUC IMSC MLEA MLEA MSTM PATH MXYZ PLYF PLYN RISK SHPR SIGM SRMS STRA STSC VAUX WRIN MSQV NSMS DFLT NO
   syn region      pam_Control_OCTRL_BEAPLOT        contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="BEAPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_BEAPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_BEAPLOT_arg  contained containedin=pam_Control_OCTRL_BEAPLOT ALL ANGL DAXI ELSI EPMI EPMX EPSI ESMA ESMI FAXI FDMG FORC FSSH FTSH LENG MOMT MSN1 MSN2 MTN1 MTN2 MTOR RDIS RSN1 RSN2 RTN1 RTN2 RTOR TDIS ENTH FLUX NO
   syn region      pam_Control_OCTRL_LNKPLOT        contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="LNKPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_LNKPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_LNKPLOT_arg  contained containedin=pam_Control_OCTRL_LNKPLOT ALL DAMG FGLB FLOC MGLB MLOC
   syn region      pam_Control_OCTRL_SPHPLOT        contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="SPHPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_SPHPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_SPHPLOT_arg  contained containedin=pam_Control_OCTRL_SPHPLOT ALL EPLE SIE SML SXYZ VAUX DFLT
   syn region      pam_Control_OCTRL_FPMPLOT        contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="FPMPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_FPMPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_FPMPLOT_arg  contained containedin=pam_Control_OCTRL_FPMPLOT ALL CHID CORP CV ENER MACH MPPD DFTL NEIG ORD RV SDEN SMOO SPRE SSPE STEM TDEN TPRE TSTP TTEM TYPE VELO NO
   syn region      pam_Control_OCTRL_FPMOUTPUT        contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="FPMOUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
   syn region      pam_Control_OCTRL_MPCPLOT          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="MPCPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_MPCPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_MPCPLOT_arg  contained containedin=pam_Control_OCTRL_MPCPLOT OTMCO
   syn region      pam_Control_OCTRL_RBODYMESH          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="RBODY_MESH" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
   syn region      pam_Control_OCTRL_CNTPLOT          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="CNTPLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_CNTPLOT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_CNTPLOT_arg  contained containedin=pam_Control_OCTRL_CNTPLOT ALL CNTF CNTP CNTV DFLT
   syn region      pam_Control_OCTRL_PREFILTER          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="PREFILTER" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_PREFILTER_arg,pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_PREFILTER_arg  contained containedin=pam_Control_OCTRL_PREFILTER TYPE0 TYPE1 AXYZ NTF RWLF SECF SPOT ALL DFLT NO
   syn region      pam_Control_OCTRL_GLBTHP          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="GLBTHP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_GLBTHP_arg,pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_GLBTHP_arg  contained containedin=pam_Control_OCTRL_GLBTHP ALL ACOE AVGX AVGY AVGZ BAG6 BAGS CNTE INJP KINE MEAS MHGL MINT MKIN MLSI MMEM SSML STEP SECF SECM SPRE SSLD TCNT CNTF CNTP CNTS DLOC DMAS DMSC INTE RACC RANG RVEL RWLE RWLF SDEN TDMP TEXT THGL TOTE TRWL TSLP INTE DFLT NO
   syn region      pam_Control_OCTRL_SHLTHP          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="SHLTHP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_SHLTHP_arg,pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_SHLTHP_arg  contained containedin=pam_Control_OCTRL_SHLTHP ALL BSTR DFLT DMG ENER EPME EPMI EPMX EPSE EPSI ESMA ESME ESMI FANG FRSK GRUC MLEA MXYZ NXYZ PATH RISK SHPR SIGM SRMS STRA VAUX WRIN DFLT ENTH FLUX NO
   syn region      pam_Control_OCTRL_RANTHP          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="RANTHP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_RANTHP_arg,pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_RANTHP_arg  contained containedin=pam_Control_OCTRL_RANTHP CORR CRMS PSDF DFLT NO ALL
   syn region      pam_Control_OCTRL_BEATHP          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="BEATHP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_BEATHP_arg,pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_BEATHP_arg  contained containedin=pam_Control_OCTRL_BEATHP ALL ANGL DAXI ELSI EPMI EMPX EPSI ESMA ESMI FAXI FDMG FORC FSSH FTSH LENG MOMT MSN1 MSN2 MTN1 MTN2 MTOR RDIS RSN1 RSN2 RTN1 RTN2 RTOR TDIS ENTH FLUX NO
   syn region      pam_Control_OCTRL_SOLTHP          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="SOLTHP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_SOLTHP_arg,pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_SOLTHP_arg  contained containedin=pam_Control_OCTRL_SOLTHP ALL DHGL DINT DVEL EHGL EINT ELSI EPLE FDMG IMSC NSMS PORO STSC SXYZ VAUX DFLT DPLE DXYZ EXYZ LEPS LSIG PSIG PSMA PSMI PSRA PSTR TEMP USRV NO
      hi def link pam_Control_OCTRL_SOLTHP_arg pam_Argument
   syn region      pam_Control_OCTRL_MPF_AFM         contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="MPF_AFM" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
   syn region      pam_Control_OCTRL_MPF_ASM         contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="MPF_ASM" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
   syn region      pam_Control_OCTRL_PRINT          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="PRINT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_PRINT_arg,pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_PRINT_arg  contained containedin=pam_Control_OCTRL_PRINT BEAM BOUN CONT COOR FPM LINK LOAD MASS PYVA QUAD RIGB RIGW SECU SOLD VELO TEMP
syn match       pam_Control_OCTRL_arg            display contained containedin=pam_Control_OCTRL "[ ]*\CASCII_RESULTS[ ]*"
   syn region      pam_Control_OCTRL_ASCII_RESULTS          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="ASCII_RESULTS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_ASCII_RESULTS_arg,pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_ASCII_RESULTS_arg  contained containedin=pam_Control_OCTRL_ASCII_RESULTS ALL ACCE DISP EIGV PRES VELO DFLT
   syn region      pam_Control_OCTRL_COMPLEX_PRINT          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="COMPLEX_PRINT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_COMPLEX_PRINT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_COMPLEX_PRINT_arg  contained containedin=pam_Control_OCTRL_COMPLEX_PRINT POLAR RAW RADIAN DEGREE
   syn region      pam_Control_OCTRL_TOTAL_STRAIN          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="TOTAL_STRAIN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_TOTAL_STRAIN_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_TOTAL_STRAIN_arg  contained containedin=pam_Control_OCTRL_TOTAL_STRAIN INCREMENTAL LAGRANGIAN
   syn region      pam_Control_OCTRL_CORNER_STRESS          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="CORNER_STRESS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_YESNO,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
   syn region      pam_Control_OCTRL_STRESS_TENSOR          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="STRESS_TENSOR" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_STRESS_TENSOR_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_STRESS_TENSOR_arg  contained containedin=pam_Control_OCTRL_STRESS_TENSOR GAUSS CORNER
   syn region      pam_Control_OCTRL_MAX_EQUIVALENT_STRESS          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="MAX_EQUIVALENT_STRESS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_MAX_EQUIVALENT_STRESS_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_MAX_EQUIVALENT_STRESS_arg  contained containedin=pam_Control_OCTRL_MAX_EQUIVALENT_STRESS GAUSS ELEMENT CORNER
   syn region      pam_Control_OCTRL_POST_PLY_FRAME          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="POST_PLY_FRAME" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_POST_PLY_FRAME_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_POST_PLY_FRAME_arg  contained containedin=pam_Control_OCTRL_POST_PLY_FRAME PLY ORTHOTROPIC LOCAL
   syn region      pam_Control_OCTRL_MEDSTRS_TIME         contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="MEDSTRS_TIME" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
   syn region      pam_Control_OCTRL_MPPOUTPUT          contained containedin=pam_Control_OCTRL matchgroup=pam_Keyword start="MPPOUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_OCTRL_MPPOUTPUT_arg,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue
      syn keyword     pam_Control_OCTRL_MPPOUTPUT_arg  contained containedin=pam_Control_OCTRL_MPPOUTPUT WRITE MERGE KEEP REMOVE ALLFILE DSYONLY THPONLY NOFILE

hi def link pam_Control_INPUTVERSION_arg pam_Integer
hi def link pam_Control_ANALYSIS_arg pam_Argument
hi def link pam_Control_STOPRUN_arg pam_Argument
hi def link pam_Control_AIRBAGCHECK_arg pam_Argument
hi def link pam_Control_DATACHECK_arg pam_Argument
hi def link pam_Control_MEMCHECK_arg pam_Argument
hi def link pam_Control_SOLVER_arg pam_Argument
hi def link pam_Control_UNIT_arg pam_Argument
hi def link pam_Control_DCOMP_arg pam_Argument
hi def link pam_Control_COUPLINGMADYMO pam_Keyword
hi def link pam_Control_RUNEND_arg pam_Keyword
hi def link pam_Control_OCTRL_COLOUTPUT_arg pam_Argument
hi def link pam_Control_OCTRL_THPOUTPUT_arg pam_Argument
hi def link pam_Control_OCTRL_DSYOUTPUT_arg pam_Argument
hi def link pam_Control_OCTRL_PRTOUTPUT_arg pam_Argument
hi def link pam_Control_OCTRL_RSTOUTPUT_arg pam_Argument
hi def link pam_Control_OCTRL_NODPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_SOLPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_SHLPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_BEAPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_LNKPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_SPHPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_FPMPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_MPCPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_CNTPLOT_arg pam_Argument
hi def link pam_Control_OCTRL_PREFILTER_arg pam_Argument
hi def link pam_Control_OCTRL_GLBTHP_arg pam_Argument
hi def link pam_Control_OCTRL_SHLTHP_arg pam_Argument
hi def link pam_Control_OCTRL_BEATHP_arg pam_Argument
hi def link pam_Control_OCTRL_RANTHP_arg pam_Argument
hi def link pam_Control_OCTRL_PRINT_arg pam_Argument
hi def link pam_Control_OCTRL_ASCII_RESULTS_arg pam_Argument
hi def link pam_Control_OCTRL_COMPLEX_PRINT_arg pam_Argument
hi def link pam_Control_OCTRL_TOTAL_STRAIN_arg pam_Argument
hi def link pam_Control_OCTRL_STRESS_TENSOR_arg pam_Argument
hi def link pam_Control_OCTRL_MAX_EQUIVALENT_STRESS_arg pam_Argument
hi def link pam_Control_OCTRL_POST_PLY_FRAME_arg pam_Argument
hi def link pam_Control_OCTRL_MPPOUTPUT_arg pam_Argument
" OCTRL end}}}

" {{{ TCTRL
syn region      pam_Control_TCTRL                matchgroup=pam_CardTag start="^\CTCTRL /" end="^\CEND_TCTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continur,pam_Control_TCTRL_INITIAL fold keepend
   syn region    pam_Control_TCTRL_INITIAL       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="INITIAL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_PREFER        contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="PREFER" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Float,pam_Control_TCTRL_PREFER_arg,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword pam_Control_TCTRL_PREFER_arg   contained containedin=pam_Control_TCTRL_PREFER CURVE none
   syn region    pam_Control_TCTRL_SCALE        contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="SCALE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Integer,pam_Control_TCTRL_SCALE_arg,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword pam_Control_TCTRL_SCALE_arg   contained containedin=pam_Control_TCTRL_SCALE CONSTANT CURVE
   syn region    pam_Control_TCTRL_THERM_TSTEP_SCALE       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="THERM_TSTEP_SCALE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_STIFFNESS_SCALE       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="STIFFNESS_SCALE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_INIT_MASS_SCALE       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="INIT_MASS_SCALE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_NODAL       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="NODAL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_TCTRL_DYNA_MASS_SCALE       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="DYNA_MASS_SCALE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Integer,pam_Continue
   syn region    pam_Control_TCTRL_OTMCO_TIMESTEP        contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="OTMCO_TIMESTEP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Integer,pam_Control_TCTRL_OTMCO_TIMESTEP_arg,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword pam_Control_TCTRL_OTMCO_TIMESTEP_arg   contained containedin=pam_Control_TCTRL_OTMCO_TIMESTEP BEND NOBEND
   syn region    pam_Control_TCTRL_SHELL_TIMESTEP        contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="SHELL_TIMESTEP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Integer,pam_Control_TCTRL_SHELL_TIMESTEP_arg,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword pam_Control_TCTRL_SHELL_TIMESTEP_arg   contained containedin=pam_Control_TCTRL_SHELL_TIMESTEP LARGE SMALL BEND NOBEND BENDLARGE NU NONU
   syn region    pam_Control_TCTRL_AUTO_STEPSIZE       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="AUTO_STEPSIZE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_AUTO_CUTBACK       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="AUTO_CUTBACK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_AUTO_ITERATION       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="AUTO_ITERATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_AUTO_RESIDUE       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="AUTO_RESIDUE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_AUTO_RESIDUE_TEMPERATURE       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="AUTO_RESIDUE_TEMPERATURE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_TCTRL_AUTO_INCREMENT_TEMPERATURE       contained containedin=pam_Control_TCTRL matchgroup=pam_Keyword start="AUTO_INCREMENT_TEMPERATURE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue

hi def link pam_Control_TCTRL_PREFER_arg pam_Argument
hi def link pam_Control_TCTRL_SCALE_arg pam_Argument
hi def link pam_Control_TCTRL_OTMCO_TIMESTEP_arg pam_Argument
hi def link pam_Control_TCTRL_SHELL_TIMESTEP_arg pam_Argument
" TCTRL end}}}

" {{{ ECTRL
syn region      pam_Control_ECTRL                matchgroup=pam_CardTag start="^\CECTRL /" end="^\CEND_ECTRL[ ]*" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
   syn region      pam_Control_ECTRL_THICKNESS_INTEGRATION      contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="THICKNESS_INTEGRATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_ECTRL_THICKNESS_INTEGRATION_arg,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword     pam_Control_ECTRL_THICKNESS_INTEGRATION_arg  contained containedin=pam_Control_ECTRL_THICKNESS_INTEGRATION UNIFORM GAUSS SIMPSON
   syn region    pam_Control_ECTRL_SHELL_FORMULATION       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="SHELL_FORMULATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_ECTRL_SOLID_FORMULATION       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="SOLID_FORMULATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_ECTRL_BEAM_FORMULATION       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="BEAM_FORMULATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region      pam_Control_ECTRL_ANTIDRILL      contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="ANTIDRILL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_ECTRL_ANTIDRILL_arg,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword     pam_Control_ECTRL_ANTIDRILL_arg  contained containedin=pam_Control_ECTRL_ANTIDRILL PROJECTION RBODY PROJECTION_RBODY PENALTY NO
   syn region      pam_Control_ECTRL_OTMCO_UPDATE_METHOD      contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="OTMCO_UPDATE_METHOD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_ECTRL_OTMCO_UPDATE_METHOD_arg,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword     pam_Control_ECTRL_OTMCO_UPDATE_METHOD_arg  contained containedin=pam_Control_ECTRL_OTMCO_UPDATE_METHOD LINEAR ROTATION_INCREMENT ROTATION_ANGLE
   syn region    pam_Control_ECTRL_KINJ       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="KINJ" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_ECTRL_POST_CUTOFF_SLOPE       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="POST_CUTOFF_SLOPE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region      pam_Control_ECTRL_ZROTSHELL      contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="ZROTSHELL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_ECTRL_ZROTSHELL_arg,pam_Float,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword     pam_Control_ECTRL_ZROTSHELL_arg  contained containedin=pam_Control_ECTRL_ZROTSHELL PENALTY
   syn region    pam_Control_ECTRL_ENFORCE_ELASTIC       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="ENFORCE_ELASTIC" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_ECTRL_SPRINGBACK       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="SPRINGBACK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region      pam_Control_ECTRL_GEOM_STIFFNESS_MATRIX      contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="GEOM_STIFFNESS_MATRIX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_ECTRL_GEOM_STIFFNESS_MATRIX_arg,pam_Float,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword     pam_Control_ECTRL_GEOM_STIFFNESS_MATRIX_arg  contained containedin=pam_Control_ECTRL_GEOM_STIFFNESS_MATRIX ITERATION INCREMENT YES NO
   syn region    pam_Control_ECTRL_SHELL_ENHANCED_STRAIN       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="SHELL_ENHANCED_STRAIN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_ECTRL_FLEXIBILITY       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="FLEXIBILITY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_ECTRL_TRIANGLE_HYBRID_STRAIN       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="TRIANGLE_HYBRID_STRAIN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_ECTRL_PLAIN_PLASTICITY       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="PLAIN_PLASTICITY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_ECTRL_MEMB_STABILIZATION       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="MEMB_STABILIZATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Float,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_ECTRL_STRAINRATE       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="STRAINRATE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_ECTRL_RATEFILTER       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="RATEFILTER" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_ECTRL_RATEFILTER_CYCLE       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="RATEFILTER_CYCLE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_ECTRL_RATEFILTER_TIME       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="RATEFILTER_TIME" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region      pam_Control_ECTRL_RATESCALE      contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="RATESCALE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_ECTRL_RATESCALE_arg,pam_Float,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword     pam_Control_ECTRL_RATESCALE_arg  contained containedin=pam_Control_ECTRL_RATESCALE CONSTANT CURVE FUNCTS FUNCTR
   syn region      pam_Control_ECTRL_RATECURVE      contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="RATECURVE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_ECTRL_RATECURVE_arg,pam_Float,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword     pam_Control_ECTRL_RATECURVE_arg  contained containedin=pam_Control_ECTRL_RATECURVE LINEAR LOG
   syn region    pam_Control_ECTRL_METRIC_3D_LOAD       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="METRIC_3D_LOAD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_ECTRL_ENERGY_MONITORING       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="ENERGY_MONITORING" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_ECTRL_PLINK_DIST_CHECK       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="PLINK_DIST_CHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_ECTRL_PLINK_ORI_ESTIMATE       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="PLINK_ORI_ESTIMATE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_ECTRL_STRAIN_ORDER       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="STRAIN_ORDER" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_ECTRL_SPRINGFORWARD       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="SPRINGFORWARD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_ECTRL_SIMPLFMASS       contained containedin=pam_Control_ECTRL matchgroup=pam_Keyword start="SIMPLFMASS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar

hi def link pam_Control_ECTRL_THICKNESS_INTEGRATION_arg pam_Argument
hi def link pam_Control_ECTRL_ANTIDRILL_arg pam_Argument
hi def link pam_Control_ECTRL_OTMCO_UPDATE_METHOD_arg pam_Argument
hi def link pam_Control_ECTRL_ZROTSHELL_arg pam_Argument
hi def link pam_Control_ECTRL_GEOM_STIFFNESS_MATRIX_arg pam_Argument
hi def link pam_Control_ECTRL_RATESCALE_arg pam_Argument
hi def link pam_Control_ECTRL_RATECURVE_arg pam_Argument

" ECTRL end}}}

" {{{ EOCTRL
syn region      pam_Control_EOCTRL                matchgroup=pam_CardTag start="^\CEOCTRL/" end="^\CEND_EOCTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
   syn region    pam_Control_EOCTRL_COMPRESSION       contained containedin=pam_Control_EOCTRL matchgroup=pam_Keyword start="COMPRESSION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_EOCTRL_STRIPPED_INPUT       contained containedin=pam_Control_EOCTRL matchgroup=pam_Keyword start="STRIPPED_INPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region   pam_CONTROL_EOCTRL_ERFFILL        matchgroup=pam_Argument start="^\CERFFIL" end="^\CEND_ERFFIL" contained containedin=pam_Control_EOCTRL contains=pam_Comment,pam_Comment_Position

" EOCTRL end}}}

" {{{ CCTRL
syn region      pam_Control_CCTRL                matchgroup=pam_CardTag start="^\CCCTRL /" end="^\CEND_CCTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
   syn region    pam_Control_CCTRL_ITER_INIPEN_N       contained containedin=pam_Control_CCTRL matchgroup=pam_Keyword start="ITER_INIPEN_N" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_CCTRL_ITER_FORCE_N       contained containedin=pam_Control_CCTRL matchgroup=pam_Keyword start="ITER_FORCE_N" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_CCTRL_ITER_FORCE_EPS       contained containedin=pam_Control_CCTRL matchgroup=pam_Keyword start="ITER_FORCE_EPS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue
   syn region    pam_Control_CCTRL_LEAKFILTER       contained containedin=pam_Control_CCTRL matchgroup=pam_Keyword start="LEAKFILTER" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_CCTRL_FRIFLT       contained containedin=pam_Control_CCTRL matchgroup=pam_Keyword start="FRIFLT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue
   syn region    pam_Control_CCTRL_CONTACT_INTEGRATION       contained containedin=pam_Control_CCTRL matchgroup=pam_Keyword start="CONTACT_INTEGRATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Control_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_CCTRL_ADAPTIVE_PENALTY       contained containedin=pam_Control_CCTRL matchgroup=pam_Keyword start="ADAPTIVE_PENALTY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Control_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
   syn region    pam_Control_CCTRL_AUTOMATIC_FRICTION       contained containedin=pam_Control_CCTRL matchgroup=pam_Keyword start="AUTOMATIC_FRICTION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Control_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar

" CCTRL end}}}

" {{{ SPCTRL
syn region      pam_Control_SPCTRL                matchgroup=pam_CardTag start="^\CSPCTRL/" end="^\CEND_SPCTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
   syn region    pam_Control_SPCTRL_KERNEL       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="KERNEL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue keepend
   syn region    pam_Control_SPCTRL_XSYM       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="X_SYMMETRY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_YESNO,pam_Continue keepend
   syn region    pam_Control_SPCTRL_YSYM       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="Y_SYMMETRY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_YESNO,pam_Continue keepend
   syn region    pam_Control_SPCTRL_ZSYM       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="Z_SYMMETRY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_YESNO,pam_Continue keepend
   syn region    pam_Control_SPCTRL_ARTCISC_TENSION       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="ARTVISC_TENSION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_YESNO,pam_Continue keepend
   syn region    pam_Control_SPCTRL_MOMENTUM       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="MOMENTUM_FORMALISM" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue keepend
   syn region    pam_Control_SPCTRL_DIMENSION1D       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="DIMENSION_1D" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue keepend
   syn region    pam_Control_SPCTRL_DIMENSION2D       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="DIMENSION_2D" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue keepend
   syn region    pam_Control_SPCTRL_VISCOSITY       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="VISCOSITY_TYPE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_SPCTRL_VISCOSITY_arg,pam_Continue keepend
      syn region pam_Control_SPCTRL_VISCOSITY_arg2 contained containedin=pam_Control_SPCTRL_VISCOSITY matchgroup=pam_Argument start="M-G" end="."
      syn keyword pam_Control_SPCTRL_VISCOSITY_arg contained containedin=pam_Control_SPCTRL_VISCOSITY FEM
      hi def link pam_Control_SPCTRL_VISCOSITY_arg pam_Argument
   syn region    pam_Control_SPCTRL_TIMESTEP       contained containedin=pam_Control_SPCTRL matchgroup=pam_Keyword start="TIMESTEP_SCHEME" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_SPCTRL_VISCOSITY_arg,pam_Continue keepend
      syn keyword pam_Control_SPCTRL_TIMESTEP_arg contained containedin=pam_Control_SPCTRL_TIMESTEP SML DST
      hi def link pam_Control_SPCTRL_TIMESTEP_arg pam_Argument
" SPCTRL }}}

   syn region    pam_Control_SPCTRL_SECURE_NODE_V containedin=NONE matchgroup=pam_Keyword start="\CSECURE_NODE_VISU" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_YESNO,pam_Continue keepend
   syn region    pam_Control_SIGNAL containedin=NONE matchgroup=pam_Keyword start="^\CSIGNAL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Control_YESNO,pam_Continue keepend

" {{{ ICTRL
syn region      pam_Control_ICTRL                matchgroup=pam_CardTag start="^\CICTRL /" end="^\CEND_ICTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_Control_ANALYSIS_TYPE        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CANALYSIS_TYPE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_ANALYSIS_arg,pam_Continue keepend
   syn keyword     pam_Control_ANALYSIS_arg         contained containedin=pam_Control_ANALYSIS_TYPE STATIC DYNAMICS BUCKLING TRANSIENT LINEAR NON_LINEAR GEOMETRIC_NON_LINEAR
   hi def link pam_Control_ANALYSIS_arg pam_Argument
   syn match pam_Control_ANALYSIS_arg          contained containedin=pam_Control_ANALYSIS_TYPE "QUASI-STATIC"
syn region      pam_Control_PENALTY_K3D        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CPENALTY_K3D" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_SOLVER_MATRIX        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CSOLVER_MATRIX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_SOLVER_MEMORY_OOC        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CSOLVER_MEMORY_OOC" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Continue keepend
syn region      pam_Control_RHS_BLOCK_SIZE        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CRHS_BLOCK_SIZE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_NL_RESOLUTION        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_RESOLUTION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
   syn keyword     pam_Control_NL_RESOLUTION_arg         contained containedin=pam_Control_NL_RESOLUTION NEWTON_STANDARD NEWTON_MODIFIED BFGS
   hi def link pam_Control_NL_RESOLUTION_arg pam_Argument
syn region      pam_Control_NL_ITERATION_MAX        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_ITERATION_MAX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_NL_SLOW_CONVERGENCE        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_SLOW_CONVERGENCE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_CONVERGENCE_ACTIVETOL        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_CONVERGENCE_ACTIVETOL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_CONVERGENCE_DISPLACEMENT        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_CONVERGENCE_DISPLACEMENT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_CONVERGENCE_FORCE        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_CONVERGENCE_FORCE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_INITIAL_REF_FORCE        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_INITIAL_REF_FORCE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_PREFER_REF_FORCE        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_PREFER_REF_FORCE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_CONVERGENCE_TEMPERATURE        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_CONVERGENCE_TEMPERATURE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_CONVERGENCE_HEAT_FLUX        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_CONVERGENCE_HEAT_FLUX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_INITIAL_REF_HEAT_FLUX        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_INITIAL_REF_HEAT_FLUX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_PREFER_REF_HEAT_FLUX        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_PREFER_REF_HEAT_FLUX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_NL_LINE_SEARCH        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_LINE_SEARCH" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Integer,pam_Continue keepend
syn region      pam_Control_NL_STABILIZE        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CNL_STABILIZE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_NL_STABILIZE_arg         contained containedin=pam_Control_NL_STABILIZE AUTO USER
   hi def link pam_Control_NL_STABILIZE_arg pam_Argument
syn region      pam_Control_INERTIA_RELIEF        contained containedin=pam_Control_ICTRL matchgroup=pam_HeaderKW start="\CINERTIA_RELIEF" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_INERTIA_RELIEF_arg         contained containedin=pam_Control_INERTIA_RELIEF ANALYTICAL
   hi def link pam_Control_INERTIA_RELIEF_arg pam_Argument
" ICTRL end }}}

" {{{ TRANS
syn region      pam_Control_TRANS                matchgroup=pam_CardTag start="^\CTRANS /" end="^\CEND_TRANS[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue,pam_Integer,pam_Float fold keepend
syn region      pam_Control_METHOD        contained containedin=pam_Control_TRANS matchgroup=pam_HeaderKW start="\CMETHOD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_METHOD_arg,pam_Continue keepend
   syn keyword     pam_Control_METHOD_arg         contained containedin=pam_Control_METHOD MODAL DIRECT
   hi def link pam_Control_METHOD_arg pam_Argument
syn region      pam_Control_DBASE_EIGEN        contained containedin=pam_Control_TRANS,pam_Control_EIGEN,pam_Control_GFRP matchgroup=pam_HeaderKW start="\CDBASE_EIGEN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Continue keepend
syn region      pam_Control_RIGID_EIGEN        contained containedin=pam_Control_TRANS matchgroup=pam_HeaderKW start="\CRIGID_EIGEN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_USE_EIGEN        contained containedin=pam_Control_TRANS matchgroup=pam_HeaderKW start="\CUSE_EIGEN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_DAMPING_MODAL        contained containedin=pam_Control_TRANS matchgroup=pam_HeaderKW start="\CDAMPING_MODAL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_DAMPING_MODAL        contained containedin=pam_Control_TRANS matchgroup=pam_HeaderKW start="\CDAMPING_MODAL_VISCOUS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_DAMPING_RAYLEIGH        contained containedin=pam_Control_TRANS,pam_Control_GFRP matchgroup=pam_HeaderKW start="\CDAMPING_RAYLEIGH" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_OVERALL_STRUCTURAL_DAMPING        contained containedin=pam_Control_TRANS matchgroup=pam_HeaderKW start="\COVERALL_STRUCTURAL_DAMPING" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_TIME_INTEGRATION        contained containedin=pam_Control_TRANS matchgroup=pam_HeaderKW start="\CTIME_INTEGRATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_TIME_INTEGRATION_arg,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_TIME_INTEGRATION_arg         contained containedin=pam_Control_TIME_INTEGRATION NEWMARK
   hi def link pam_Control_TIME_INTEGRATION_arg pam_Argument
syn region      pam_Control_PREDICTION_METHOD        contained containedin=pam_Control_TRANS matchgroup=pam_HeaderKW start="\CPREDICTION_METHOD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_PREDICTION_METHOD_arg,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_PREDICTION_METHOD_arg         contained containedin=pam_Control_PREDICTION_METHOD DISPLACEMENT VELOCITY
   hi def link pam_Control_PREDICTION_METHOD_arg pam_Argument
syn region      pam_Control_DAMPING_TARGET_FREQUENCY        contained containedin=pam_Control_TRANS,pam_Control_GFRP matchgroup=pam_HeaderKW start="\CDAMPING_TARGET_FREQUENCY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
" TRANS end }}}

" {{{ EIGEN
syn region      pam_Control_EIGEN                matchgroup=pam_CardTag start="^\CEIGEN /" end="^\CEND_EIGEN[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_Control_METHOD2        contained containedin=pam_Control_EIGEN matchgroup=pam_HeaderKW start="\CMETHOD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_METHOD2_arg,pam_Continue keepend
   syn keyword     pam_Control_METHOD2_arg         contained containedin=pam_Control_METHOD2 BLOCK_IRAM AMLS
   hi def link pam_Control_METHOD2_arg pam_Argument
syn region      pam_Control_BLOCK_SIZE        contained containedin=pam_Control_EIGEN matchgroup=pam_HeaderKW start="\CBLOCK_SIZE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Float,pam_Continue keepend
syn region      pam_Control_SOLVER_PARAMETER        contained containedin=pam_Control_EIGEN,pam_Control_BUCKL matchgroup=pam_HeaderKW start="\CSOLVER_PARAMETER" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_RAM_OPTIMIZATION        contained containedin=pam_Control_EIGEN matchgroup=pam_HeaderKW start="\CRAM_OPTIMIZATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend
syn region      pam_Control_MODES        contained containedin=pam_Control_EIGEN matchgroup=pam_HeaderKW start="\CMODES" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_MODES_arg,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_MODES_arg         contained containedin=pam_Control_MODES EXTRACT CHECK REAL ACOUSTIC
   hi def link pam_Control_MODES_arg pam_Argument
syn region      pam_Control_DBASE_DAMP        contained containedin=pam_Control_EIGEN,pam_Control_DAMP,pam_Control_GFRP matchgroup=pam_HeaderKW start="\CDBASE_DAMP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Continue keepend
syn region      pam_Control_EGM_FILE        contained containedin=pam_Control_EIGEN matchgroup=pam_HeaderKW start="\CEGM_FILE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend
syn region      pam_Control_CHECK        contained containedin=pam_Control_EIGEN matchgroup=pam_HeaderKW start="\CCHECK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Control_CHECK_arg,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_CHECK_arg         contained containedin=pam_Control_CHECK MASS_ORTHOGONALITY PARTICIPATION_FACTOR EFFECTIVE_MASS GENERALIZED_STIFFNESS ALL
   hi def link pam_Control_CHECK_arg pam_Argument
syn region      pam_Control_RESIDUAL_MODES        contained containedin=pam_Control_EIGEN matchgroup=pam_HeaderKW start="\CRESIDUAL_MODES" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Control_RESIDUAL_MODES_arg,pam_Continue keepend
   syn keyword     pam_Control_RESIDUAL_MODES_arg         contained containedin=pam_Control_RESIDUAL_MODES LOAD RMLOAD
   hi def link pam_Control_RESIDUAL_MODES_arg pam_Argument
syn region      pam_Control_DAMPING_MATRIX        contained containedin=pam_Control_EIGEN,pam_Control_GFRP,pam_Control_TRANS matchgroup=pam_HeaderKW start="\CDAMPING_MATRIX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Control_DAMPING_MATRIX_arg,pam_Continue keepend
   syn keyword     pam_Control_DAMPING_MATRIX_arg         contained containedin=pam_Control_DAMPING_MATRIX STRUCTURAL VISCOUS FLUID NO
   hi def link pam_Control_DAMPING_MATRIX_arg pam_Argument
syn region      pam_Control_SHIFT_FREQUENCY        contained containedin=pam_Control_EIGEN matchgroup=pam_HeaderKW start="\CSHIFT_FREQUENCY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_MASS_MATRIX        contained containedin=pam_Control_EIGEN,pam_Control_TRANS matchgroup=pam_HeaderKW start="\CMASS_MATRIX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Control_MASS_MATRIX_arg,pam_Continue keepend
   syn keyword     pam_Control_MASS_MATRIX_arg         contained containedin=pam_Control_MASS_MATRIX CONSISTENT LUMPED
   hi def link pam_Control_MASS_MATRIX_arg pam_Argument

" EIGEN end }}}

" {{{ GFRP
syn region      pam_Control_GFRP                matchgroup=pam_CardTag start="^\CGFRP  /" end="^\CEND_GFRP[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue,pam_Integer,pam_Float fold keepend
syn region      pam_Control_SOLUTION        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CSOLUTION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_SOLUTION_arg,pam_Continue keepend
   syn keyword     pam_Control_SOLUTION_arg         contained containedin=pam_Control_SOLUTION RESPONSE RESPONSE_ACOUSTIC RESPONSE_COUPLE IMPEDANCE RANDOM_RESPONSE RANDOM_RESPONSE_ACOUSTIC RANDOM_RESPONSE_COUPLE
   hi def link pam_Control_SOLUTION_arg pam_Argument
syn region      pam_Control_COUPLING_DISTANCE        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CCOUPLING_DISTANCE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_METHOD        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CMETHOD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_METHOD_arg,pam_Continue keepend
   syn keyword     pam_Control_METHOD_arg         contained containedin=pam_Control_METHOD MODAL DIRECT
   hi def link pam_Control_METHOD_arg pam_Argument
syn region      pam_Control_USE_EIGEN2        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CUSE_EIGEN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_String,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue,pam_Integer keepend
   syn keyword     pam_Control_USE_EIGEN2_arg         contained containedin=pam_Control_USE_EIGEN2 PAM NASTRAN
   hi def link pam_Control_USE_EIGEN2_arg pam_Argument
syn region      pam_Control_FREQUENCY_RANGE        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CFREQUENCY_RANGE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_FREQUENCY_DISCRETE        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CFREQUENCY_DISCRETE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue,pam_Float keepend
syn region      pam_Control_FREQUENCY_EIGEN        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CFREQUENCY_EIGEN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
   syn keyword     pam_Control_GFRP_arg         contained containedin=pam_Control_GFRP LINEAR LOG
   hi def link pam_Control_GFRP_arg pam_Argument
syn region      pam_Control_DAMPING_MODAL_VISCOUS        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CDAMPING_MODAL_VISCOUS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_OVERALL_STRUCTURAL_DAMPING        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\COVERALL_STRUCTURAL_DAMPING" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Control_OVERALL_STRUCTURAL_DAMPING_arg,pam_Continue keepend
   syn keyword     pam_Control_OVERALL_STRUCTURAL_DAMPING_arg         contained containedin=pam_Control_OVERALL_STRUCTURAL_DAMPING CURVE
   hi def link pam_Control_OVERALL_STRUCTURAL_DAMPING_arg pam_Argument
syn region      pam_Control_DAMPING_MODAL_STRUCTURAL        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CDAMPING_MODAL_STRUCTURAL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_TIME_HISTORY        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CTIME_HISTORY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Continue,pam_Integer,pam_Control_YESNO keepend
   syn keyword     pam_Control_TIME_HISTORY_arg         contained containedin=pam_Control_TIME_HISTORY,pam_Control_CONTOUR_PLOT ASM AFM APM ALL
   hi def link pam_Control_TIME_HISTORY_arg pam_Argument
syn region      pam_Control_CONTOUR_PLOT        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CCONTOUR_PLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Continue,pam_Integer,pam_Control_YESNO keepend
syn region      pam_Control_CONTOUR_PLOT_RANGE        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CCONTOUR_PLOT_RANGE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_CORROUTPUT        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CCORROUTPUT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_BLOCK_SIZE        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CBLOCK_SIZE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_DBASE_RANDOM        contained containedin=pam_Control_GFRP matchgroup=pam_HeaderKW start="\CDBASE_RANDOM" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Continue keepend
" GFRP end }}}

" {{{ BUCKL
syn region      pam_Control_BUCKL                matchgroup=pam_CardTag start="^\CBUCKL /" end="^\CEND_BUCKL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue,pam_Integer,pam_Float fold keepend
syn region      pam_Control_MODES2        contained containedin=pam_Control_BUCKL matchgroup=pam_HeaderKW start="\CMODES" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_MODES2_arg,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_MODES2_arg         contained containedin=pam_Control_MODES2 EXTRACT CHECK 
   hi def link pam_Control_MODES2_arg pam_Argument
syn region      pam_Control_DBASE_BUCKL        contained containedin=pam_Control_TRANS,pam_Control_BUCKL,pam_Control_GFRP matchgroup=pam_HeaderKW start="\CDBASE_BUCKL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Continue keepend
syn region      pam_Control_TANGENT_MATRIX        contained containedin=pam_Control_BUCKL matchgroup=pam_HeaderKW start="\CTANGENT_MATRIX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_TANGENT_MATRIX_arg,pam_Float,pam_Continue keepend
   syn keyword     pam_Control_TANGENT_MATRIX_arg         contained containedin=pam_Control_TANGENT_MATRIX ELASTIC SECANT_MODULUS TANGENT_MODULUS
   hi def link pam_Control_TANGENT_MATRIX_arg pam_Argument

" BUCKL end}}}

" {{{ ACTRL
syn region      pam_Control_ACTRL                matchgroup=pam_CardTag start="^\CACTRL /" end="^\CEND_ACTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue,pam_Integer,pam_Float fold keepend
syn region      pam_Control_ARC_METHOD        contained containedin=pam_Control_ACTRL matchgroup=pam_HeaderKW start="\CARC_METHOD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_ARC_METHOD_arg keepend
   syn keyword     pam_Control_ARC_METHOD_arg         contained containedin=pam_Control_ARC_METHOD RIKS MODIFIED_RIKS
   hi def link pam_Control_ARC_METHOD_arg pam_Argument
syn region      pam_Control_ARC_STEPSIZE        contained containedin=pam_Control_ACTRL matchgroup=pam_HeaderKW start="\CARC_STEPSIZE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_ARC_CUTBACK        contained containedin=pam_Control_ACTRL matchgroup=pam_HeaderKW start="\CARC_CUTBACK" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_ARC_ITERATION        contained containedin=pam_Control_ACTRL matchgroup=pam_HeaderKW start="\CARC_ITERATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Continue keepend
syn region      pam_Control_ARC_PLOT        contained containedin=pam_Control_ACTRL matchgroup=pam_HeaderKW start="\CARC_PLOT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend
syn region      pam_Control_ARC_STOP        contained containedin=pam_Control_ACTRL matchgroup=pam_HeaderKW start="\CARC_STOP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_Continue keepend

" ACTRL end }}}

" {{{ HEAT
syn region      pam_Control_HEAT                matchgroup=pam_CardTag start="^\CHEAT  /" end="^\CEND_HEAT[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue,pam_Integer,pam_Float fold keepend
syn region      pam_Control_COUPLING_TYPE        contained containedin=pam_Control_HEAT matchgroup=pam_HeaderKW start="\CCOUPLING_TYPE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_COUPLING_TYPE_arg,pam_String keepend
   syn keyword     pam_Control_COUPLING_TYPE_arg         contained containedin=pam_Control_COUPLING_TYPE UNCOUPLED 
   hi def link pam_Control_COUPLING_TYPE_arg pam_Argument
syn region      pam_Control_TIME_INTEGRATION        contained containedin=pam_Control_HEAT matchgroup=pam_HeaderKW start="\CTIME_INTEGRATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_TIME_INTEGRATION_arg,pam_Float keepend
   syn keyword     pam_Control_TIME_INTEGRATION_arg         contained containedin=pam_Control_TIME_INTEGRATION BACKWARD_EULER CRANK-NICOLSON GENERALIZED 
   syn match    pam_Control_TIME_INTEGRATION_arg2 contained containedin=pam_Control_TIME_INTEGRATION "CRANK-NICOLSON"
   hi def link pam_Control_TIME_INTEGRATION_arg pam_Argument
   hi def link pam_Control_TIME_INTEGRATION_arg2 pam_Argument
syn region      pam_Control_HEAT_CAPACITANCE_MATRIX        contained containedin=pam_Control_HEAT matchgroup=pam_HeaderKW start="\CHEAT_CAPACITANCE_MATRIX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_HEAT_CAPACITANCE_MATRIX_arg keepend
   syn keyword     pam_Control_HEAT_CAPACITANCE_MATRIX_arg         contained containedin=pam_Control_HEAT_CAPACITANCE_MATRIX CONSISTENT LUMPED INTEG_CORNER ROW_SUM SCALING
   hi def link pam_Control_HEAT_CAPACITANCE_MATRIX_arg pam_Argument
syn region      pam_Control_INITIAL_TEMPERATURE        contained containedin=pam_Control_HEAT matchgroup=pam_HeaderKW start="\CINITIAL_TEMPERATURE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
syn region      pam_Control_STEFANBOLTZMANN        contained containedin=pam_Control_HEAT matchgroup=pam_HeaderKW start="\CSTEFAN-BOLTZMANN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
syn region      pam_Control_ABSOLUTE_ZERO        contained containedin=pam_Control_HEAT matchgroup=pam_HeaderKW start="\CABSOLUTE_ZERO" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
syn region      pam_Control_SHELL_NODAL_TEMPERATURE_POINT        contained containedin=pam_Control_HEAT matchgroup=pam_HeaderKW start="\CSHELL_NODAL_TEMPERATURE_POINT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_SHELL_NODAL_TEMPERATURE_POINT_arg,pam_Integer keepend
   syn keyword     pam_Control_SHELL_NODAL_TEMPERATURE_POINT_arg         contained containedin=pam_Control_SHELL_NODAL_TEMPERATURE_POINT UNIFORM DISTRIBUTED
   hi def link pam_Control_SHELL_NODAL_TEMPERATURE_POINT_arg pam_Argument
" HEAT end }}}

" {{{ PFLOW
syn region      pam_Control_PFLOW                matchgroup=pam_CardTag start="^\CPFLOW /" end="^\CEND_PFLOW[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_Control_COUPLING_TYPE2        contained containedin=pam_Control_PFLOW matchgroup=pam_HeaderKW start="\CCOUPLING_TYPE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_COUPLING_TYPE2_arg,pam_String keepend
   syn keyword     pam_Control_COUPLING_TYPE2_arg         contained containedin=pam_Control_COUPLING_TYPE2 UNCOUPLED COUPLED_WITH_STRESS
   hi def link pam_Control_COUPLING_TYPE2_arg pam_Argument
syn region      pam_Control_LUMPED_MATRIX        contained containedin=pam_Control_PFLOW matchgroup=pam_HeaderKW start="\CLUMPED_MATRIX" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_LUMPED_MATRIX_arg keepend
   syn keyword     pam_Control_LUMPED_MATRIX_arg         contained containedin=pam_Control_LUMPED_MATRIX ROW_SUM SCALING
   hi def link pam_Control_LUMPED_MATRIX_arg pam_Argument
syn region      pam_Control_INITIAL_PRESSURE        contained containedin=pam_Control_PFLOW matchgroup=pam_HeaderKW start="\CINITIAL_PRESSURE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend

" PFLOW end}}}

" {{{ MCTRL
syn region      pam_Control_MCTRL                matchgroup=pam_CardTag start="^\CMCTRL /" end="^\CEND_MCTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_Control_INDPT_METRIC_FILE_READING        contained containedin=pam_Control_MCTRL matchgroup=pam_HeaderKW start="\CINDPT_METRIC_FILE_READING" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend

" MCTRL end }}}

" {{{ MACTRL
syn region      pam_Control_MACTRL                matchgroup=pam_CardTag start="^\CMACTRL/" end="^\CEND_MACTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_Control_MAT45        contained containedin=pam_Control_MACTRL matchgroup=pam_HeaderKW start="\CMAT45" matchgroup=pam_End end="\CEND_MAT45" contains=pam_Float,pam_Error,pam_FreeError,pam_FreeVar,pam_Continue keepend
   syn region    pam_Control_MAT45_arg       contained containedin=pam_Control_MAT45 matchgroup=pam_Keyword start="STRAINRATE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_CONTROL_YESNO,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar,pam_Float

" MACTRL end }}}

" {{{ LCTRL
syn region      pam_Control_LCTRL                matchgroup=pam_CardTag start="^\CLCTRL /" end="^\CEND_LCTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_Control_TEMBC_SHELL_INTERPOLATION        contained containedin=pam_Control_LCTRL matchgroup=pam_HeaderKW start="\CTEMBC_SHELL_INTERPOLATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend
syn region      pam_Control_LOAD_CONSTANT_VARIATION        contained containedin=pam_Control_LCTRL matchgroup=pam_HeaderKW start="\CLOAD_CONSTANT_VARIATION" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_LOAD_CONSTANT_VARIATION_arg keepend
   syn keyword     pam_Control_LOAD_CONSTANT_VARIATION_arg         contained containedin=pam_Control_LOAD_CONSTANT_VARIATION STEP RAMP
   hi def link pam_Control_LOAD_CONSTANT_VARIATION_arg pam_Argument
syn region      pam_Control_COMPLEX_LOAD        contained containedin=pam_Control_LCTRL matchgroup=pam_HeaderKW start="\CCOMPLEX_LOAD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_COMPLEX_LOAD_arg keepend
   syn keyword     pam_Control_COMPLEX_LOAD_arg         contained containedin=pam_Control_COMPLEX_LOAD RAW POLAR RADIAN DEGREE
   hi def link pam_Control_COMPLEX_LOAD_arg pam_Argument
syn region      pam_Control_FOLLOWING_FORCE        contained containedin=pam_Control_LCTRL matchgroup=pam_HeaderKW start="\CFOLLOWING_FORCE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_FOLLOWING_FORCE_arg keepend
   syn keyword     pam_Control_FOLLOWING_FORCE_arg         contained containedin=pam_Control_FOLLOWING_FORCE CURRENT PREVIOUS
   hi def link pam_Control_FOLLOWING_FORCE_arg pam_Argument
" LCTRL end }}}

" {{{ MBSYS
   "Row 2 (Name)
   syn region      pam_MBSYS_r2     transparent contained containedin=pam_MBSYS start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position keepend
   "Row 1
   syn region      pam_MBSYS_r1     transparent contained containedin=pam_MBSYS start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_r2 skipnl keepend
syn region      pam_MBSYS                matchgroup=pam_CardTag start="^\CMBSYS /" end="^\CEND_MBSYS" contains=pam_MBSYS_r[1-4] fold keepend
      "Row 5
      syn region      pam_MBSYS_RBODY0_r5     transparent contained containedin=pam_MBSYS_RBODY0 start="\%1c." start="^$\n" end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_Error,pam_End skipnl keepend
      "Row 4
      syn region      pam_MBSYS_RBODY0_r4     transparent contained containedin=pam_MBSYS_RBODY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_RBODY0_r5 skipnl keepend
      "Row 3
      syn region      pam_MBSYS_RBODY0_r3     transparent contained containedin=pam_MBSYS_RBODY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_RBODY0_r4 skipnl keepend
      "Row 2
      syn region      pam_MBSYS_RBODY0_r2     transparent contained containedin=pam_MBSYS_RBODY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_RBODY0_r3 skipnl keepend
      "Row 1
      syn region      pam_MBSYS_RBODY0_r1     transparent contained containedin=pam_MBSYS_RBODY0 start="\%19c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_RBODY0_r2 skipnl keepend
   syn region      pam_MBSYS_RBODY0 transparent contained containedin=pam_MBSYS matchgroup=pam_Argument start="^[ ]\{8\}RIGID_BODY.*0[ ]*$"rs=s+18 matchgroup=pam_End end="^[ ]\{8\}END_RIGID_BODY" contains=pam_Integer keepend
      "Row 2
      syn region      pam_MBSYS_SPRING_r2     transparent contained containedin=pam_MBSYS_SPRING start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
      "Row 1
      syn region      pam_MBSYS_SPRING_r1     transparent contained containedin=pam_MBSYS_SPRING start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_SPRING_r2 skipnl keepend
   syn region      pam_MBSYS_SPRING transparent contained containedin=pam_MBSYS matchgroup=pam_Argument start="^[ ]\{8\}SPRING"rs=s+14 matchgroup=pam_End end="^[ ]\{8\}END_SPRING" contains=pam_Integer keepend
         syn keyword pam_MBSYS_SPRING_arg  contained containedin=pam_MBSYS_SPRING MAXWELL KELVIN 3D
         hi def link pam_MBSYS_SPRING_arg pam_Argument
      "Row 4
      syn region      pam_MBSYS_RBODY1_r4     transparent contained containedin=pam_MBSYS_RBODY1 start="\%1c." start="^$\n" end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_Error,pam_End skipnl keepend
      "Row 3
      syn region      pam_MBSYS_RBODY1_r3     transparent contained containedin=pam_MBSYS_RBODY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_RBODY1_r4 skipnl keepend
      "Row 2
      syn region      pam_MBSYS_RBODY1_r2     transparent contained containedin=pam_MBSYS_RBODY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_RBODY1_r3 skipnl keepend
      "Row 1
      syn region      pam_MBSYS_RBODY1_r1     transparent contained containedin=pam_MBSYS_RBODY1 start="\%19c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_RBODY1_r2 skipnl keepend
   syn region      pam_MBSYS_RBODY1 transparent contained containedin=pam_MBSYS matchgroup=pam_Argument start="^[ ]\{8\}RIGID_BODY.*1[ ]*$"rs=s+18 matchgroup=pam_End end="^[ ]\{8\}END_RIGID_BODY" contains=pam_Integer keepend
      "Row 6
      syn region      pam_MBSYS_JOINT_r6     transparent contained containedin=pam_MBSYS_JOINT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
         syn keyword pam_MBSYS_JOINT_r6_arg  contained containedin=pam_MBSYS_JOINT_r6 REFERENCE_DIS REFERENCE_ROT INITIAL DEFINE
         hi def link pam_MBSYS_JOINT_r6_arg pam_Argument
      "Row 5
      syn region      pam_MBSYS_JOINT_r5     transparent contained containedin=pam_MBSYS_JOINT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_JOINT_r6 skipnl keepend
         syn keyword pam_MBSYS_JOINT_r5_arg  contained containedin=pam_MBSYS_JOINT_r5 INITIAL_DIS INITIAL_ROT INITIAL_VEL INITIAL_RVE
         hi def link pam_MBSYS_JOINT_r5_arg pam_Argument
      "Row 4
      syn region      pam_MBSYS_JOINT_r4     transparent contained containedin=pam_MBSYS_JOINT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_JOINT_r5 skipnl keepend
      "Row 3
      syn region      pam_MBSYS_JOINT_r3     transparent contained containedin=pam_MBSYS_JOINT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_JOINT_r4 skipnl keepend
      "Row 2
      syn region      pam_MBSYS_JOINT_r2     transparent contained containedin=pam_MBSYS_JOINT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_JOINT_r3 skipnl keepend
      "Row 1
      syn region      pam_MBSYS_JOINT_r1     transparent contained containedin=pam_MBSYS_JOINT start="\%15c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_JOINT_r2 skipnl keepend
         syn keyword pam_MBSYS_JOINT_r1_arg  contained containedin=pam_MBSYS_JOINT_r1 TRANSLATIONAL REVOLUTE CYLINDRICAL UNIVERSAL SPHERICAL FLEXION-TORSION PLANAR GENERAL BRACKET FREE
         syn match pam_MBSYS_JOINT_r1_arg contained containedin=pam_MBSYS_JOINT_r1 "FLEXION-TORSION"
         hi def link pam_MBSYS_JOINT_r1_arg pam_Argument
   syn region      pam_MBSYS_JOINT transparent contained containedin=pam_MBSYS matchgroup=pam_Argument start="^[ ]\{8\}JOINT"rs=s+14 matchgroup=pam_End end="^[ ]\{8\}END_JOINT" contains=pam_Integer keepend
      "Row 1
      syn region      pam_MBSYS_BASE_BODY_r1     transparent contained containedin=pam_MBSYS_BASE_BODY start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
      "Row 5
      syn region      pam_MBSYS_BASE_BODY_r5     transparent contained containedin=pam_MBSYS_BASE_BODY matchgroup=pam_Argument start="\%1c[ ]\{8\}MOTION" start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
         syn keyword pam_MBSYS_BASE_BODY_r5_arg  contained containedin=pam_MBSYS_BASE_BODY_r5 DIS VEL ACC
         hi def link pam_MBSYS_BASE_BODY_r5_arg pam_Argument
      "Row 4
      syn region      pam_MBSYS_BASE_BODY_r4     transparent contained containedin=pam_MBSYS_BASE_BODY matchgroup=pam_Argument start="\%1c[ ]\{8\}INPOS" start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
      "Row 3
      syn region      pam_MBSYS_BASE_BODY_r3     transparent contained containedin=pam_MBSYS_BASE_BODY matchgroup=pam_Argument start="\%1c[ ]\{8\}INVEL" start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
      "Row 2
      syn region      pam_MBSYS_BASE_BODY_r2     transparent contained containedin=pam_MBSYS_BASE_BODY matchgroup=pam_Argument start="\%1c[ ]\{8\}BOUNC" start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
   syn region      pam_MBSYS_BASE_BODY transparent contained containedin=pam_MBSYS matchgroup=pam_Argument start="^[ ]\{8\}BASE_BODY"rs=s+17 matchgroup=pam_End end="^[ ]\{8\}END_BASE_BODY" contains=pam_Integer keepend
      "Row 1
      syn region      pam_MBSYS_OUTPUT_r1     transparent contained containedin=pam_MBSYS_OUTPUT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
      "Row 5
      syn region      pam_MBSYS_OUTPUT_r5     transparent contained containedin=pam_MBSYS_OUTPUT matchgroup=pam_Argument start="\%1c[ ]\{8\}SPRING" start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
      "Row 2
      syn region      pam_MBSYS_OUTPUT_r2     transparent contained containedin=pam_MBSYS_OUTPUT matchgroup=pam_Argument start="\%1c[ ]\{8\}JOINT" start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
         syn keyword pam_MBSYS_OUTPUT_r2_arg  contained containedin=pam_MBSYS_OUTPUT_r2 GLOBAL LOCAL
         hi def link pam_MBSYS_OUTPUT_r2_arg pam_Argument
   syn region      pam_MBSYS_OUTPUT transparent contained containedin=pam_MBSYS matchgroup=pam_Argument start="^[ ]\{8\}OUTPUT"rs=s+14 matchgroup=pam_End end="^[ ]\{8\}END_OUTPUT" contains=pam_Integer keepend
      "Row 3
      syn region      pam_MBSYS_HPOINT_r3     transparent contained containedin=pam_MBSYS_HPOINT start="\%1c." start="^$\n" end="\%$" contains=@pam_Ident,pam_End,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
      "Row 2
      syn region      pam_MBSYS_HPOINT_r2     transparent contained containedin=pam_MBSYS_HPOINT matchgroup=pam_Argument start="\%1c[ ]\{8\}ASSOCIATE" start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_HPOINT_r3 skipnl keepend
         syn keyword pam_MBSYS_HPOINT_r2_arg  contained containedin=pam_MBSYS_HPOINT_r2 GLOBAL LOCAL
         hi def link pam_MBSYS_HPOINT_r2_arg pam_Argument
      "Row 1
      syn region      pam_MBSYS_HPOINT_r1     transparent contained containedin=pam_MBSYS_HPOINT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MBSYS_HPOINT_r2 skipnl keepend
   syn region      pam_MBSYS_HPOINT transparent contained containedin=pam_MBSYS matchgroup=pam_Argument start="^[ ]\{8\}H_POINT"rs=s+15 matchgroup=pam_End end="^[ ]\{8\}END_ASSOCIATE" contains=pam_Integer keepend
" MBSYS end}}}

" {{{ FPCTRL
syn region      pam_Control_FPCTRL                matchgroup=pam_CardTag start="^\CFPCTRL/" end="^\CEND_FPCTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_Control_VENT_MODEL        contained containedin=pam_Control_FPCTRL matchgroup=pam_HeaderKW start="\CVENT_MODEL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer keepend
syn region      pam_Control_FLUID_MODEL        contained containedin=pam_Control_FPCTRL matchgroup=pam_HeaderKW start="\CFLUID_MODEL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer keepend
syn region      pam_Control_NUMERIC_MODEL        contained containedin=pam_Control_FPCTRL matchgroup=pam_HeaderKW start="\CNUMERIC_MODEL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer keepend
" FPCTRL end}}}

" {{{ CPCTRL

syn region      pam_Control_CPCTRL                matchgroup=pam_CardTag start="^\CCPCTRL/" end="^\CEND_CPCTRL[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_Control_SUBCYCLE_ECL        contained containedin=pam_Control_CPCTRL matchgroup=pam_HeaderKW start="\CSUBCYCLE_ECL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer keepend
syn region      pam_Control_SUBCYCLING_METHOD        contained containedin=pam_Control_CPCTRL matchgroup=pam_HeaderKW start="\CSUBCYCLING_METHOD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer keepend
syn region      pam_Control_MMC_OUTPUT_HYPERCYCLE        contained containedin=pam_Control_CPCTRL matchgroup=pam_HeaderKW start="\CMMC_OUTPUT_HYPERCYCLE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO keepend
syn region      pam_Control_RMSSOL_OUTPUT_SYNCHRO        contained containedin=pam_Control_CPCTRL matchgroup=pam_HeaderKW start="\CRMSSOL_OUTPUT_SYNCHRO" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO,pam_Continue keepend
syn region      pam_Control_RMSSOL_TIED_PRELOAD        contained containedin=pam_Control_CPCTRL matchgroup=pam_HeaderKW start="\CRMSSOL_TIED_PRELOAD" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
syn region      pam_Control_RMSSOL_RBODY_THINNING        contained containedin=pam_Control_CPCTRL matchgroup=pam_HeaderKW start="\CRMSSOL_RBODY_THINNING" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Control_YESNO keepend

" CPCTRL end}}}

" {{{ SUBDF begin
   syn region      pam_SUBDF_Selection   transparent contained containedin=pam_SUBDF start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   syn region      pam_SUBDF_Name        contained containedin=pam_SUBDF matchgroup=pam_NameTag start="^\CNAME" end="\(\%81c&\|\%81c\-\)\@<!$" keepend contains=pam_NameString,pam_Continue
   syn region      pam_SUBFD_File        contained containedin=pam_SUBDF matchgroup=pam_NameTag start="^\CFILE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_String,pam_Continue keepend
   syn region      pam_SUBFD_Path        contained containedin=pam_SUBDF matchgroup=pam_NameTag start="^\CPATH" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_String,pam_Continue keepend
   "Row 1
   syn region      pam_SUBDF_r1          transparent contained containedin=pam_SUBDF start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25i8,@33i8,@41i8,pam_Comment,pam_Comment_Position,pam_Error skipnl keepend
syn region      pam_SUBDF                matchgroup=pam_CardTag start="^\CSUBDF /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue keepend
" SUBDF end}}}

" {{{ IMPFIL begin
   "Row 2
   syn region      pam_IMPFIL_r2          transparent contained containedin=pam_IMPFIL matchgroup=cleared start="\%1c."rs=s+8 start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!\n[\$\#]\@!" contains=pam_String,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 1
   syn region      pam_IMPFIL_r1          transparent contained containedin=pam_IMPFIL start="\%9c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!\n[\$\#]\@!" contains=pam_String,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_IMPFIL_r2 skipnl keepend
syn region      pam_IMPFIL                matchgroup=pam_CardTag start="^\CIMPFIL/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue keepend
" IMPFIL end}}}

" {{{=== ORTHF begin
   " Row 2 (Name)
   syn region      pam_ORTHF_r2     transparent contained containedin=pam_ORTHF start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1
   syn region      pam_ORTHF_r1     transparent contained containedin=pam_ORTHF start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_ORTHF_r2 skipnl keepend
syn region      pam_ORTHF          matchgroup=pam_CardTag start="^\CORTHF /"  skip="^\CNAME.\{3\}" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_ORTHF_r[1-3] fold keepend
" === ORTHF end}}}

" {{{=== DRAPF begin
   " Row 2 (Name)
   syn region      pam_DRAPF_r2     transparent contained containedin=pam_DRAPF start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1
   syn region      pam_DRAPF_r1     transparent contained containedin=pam_DRAPF start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DRAPF_r2 skipnl keepend
syn region      pam_DRAPF          matchgroup=pam_CardTag start="^\CDRAPF /" skip="^\CNAME.\{3\}" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DRAPF_r[1-3] fold keepend
" === DRAPF end}}}

"{{{ === DMPEW begin
   " Row 3 (Node Selection)
   syn region      pam_DMPEW_r3     transparent contained containedin=pam_DMPEW start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_DMPEW_r2     transparent contained containedin=pam_DMPEW start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_DMPEW_r3 skipnl keepend
   " Row 1   
   syn region      pam_DMPEW_r1     transparent contained containedin=pam_DMPEW start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DMPEW_r2 skipnl keepend
syn region      pam_DMPEW            matchgroup=pam_CardTag start="^\CDMPEW /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DMPEW_r[1-2] fold keepend
" === DMPEW end}}}

"{{{ === MODULE begin
   syn match       pam_EndMODULE        display containedin=ALL "^\CEND_MODULE"
   hi def link pam_EndMODULE  pam_CardTag
   "Row 2 (Name)
   syn region      pam_MODULE_r2     transparent contained containedin=pam_MODULE start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1   
   syn region      pam_MODULE_r1     transparent contained containedin=pam_MODULE start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_String,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MODULE_r2 skipnl keepend
syn region      pam_MODULE           matchgroup=pam_CardTag start="^\CMODULE/" end="^\(\$\)\@!.\{6\}\/"me=e-7 end="^\CEND_MODULE" fold keepend 
" === MODULE end}}}

" {{{ === IDEXP
   syn region      pam_IDEXP_r2     transparent contained containedin=pam_IDEXP start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_FreeVar,pam_Integer,pam_Point,pam_IDEXP_r2_arg,pam_Name,pam_Comment,pam_Comment_Position skipnl keepend
      syn keyword     pam_IDEXP_r2_arg          contained containedin=pam_IDEXP_r2 SENSOR FRAME FUNCT NODE DOMAIN
      hi def link pam_IDEXP_r2_arg pam_Argument
   " Row 1   
   syn region      pam_IDEXP_r1     transparent contained containedin=pam_IDEXP start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_IDEXP_r2 skipnl keepend
syn region      pam_IDEXP                matchgroup=pam_CardTag start="^\CIDEXP /" end="^\CEND_IDEXP[ ]*" contains=pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
" IDEXP end }}}

"{{{ === GLOBAL begin
   syn match       pam_EndGLOBAL        display containedin=ALL "^\CEND_GLOBAL"
   hi def link pam_EndGLOBAL  pam_CardTag
   "Row 2 (Name)
   syn region      pam_GLOBAL_r2     transparent contained containedin=pam_GLOBAL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1   
   syn region      pam_GLOBAL_r1     transparent contained containedin=pam_GLOBAL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_String,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_GLOBAL_r2 skipnl keepend
syn region      pam_GLOBAL           matchgroup=pam_CardTag start="^\CGLOBAL/" end="^\(\$\)\@!.\{6\}\/"me=e-7 end="^\CEND_GLOBAL" fold keepend
" === GLOBAL end}}}

"{{{ === MODEL begin
   syn match       pam_EndMODEL        display containedin=ALL "^\CEND_MODEL"
   hi def link pam_EndMODEL  pam_CardTag
   "Row 2 (Name)
   syn region      pam_MODEL_r2     transparent contained containedin=pam_MODEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1   
   syn region      pam_MODEL_r1     transparent contained containedin=pam_MODEL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MODEL_r2 skipnl keepend
syn region      pam_MODEL           matchgroup=pam_CardTag start="^\CMODEL /" end="^\(\$\)\@!.\{6\}\/"me=e-7 end="^\CEND_MODEL" fold keepend
" === MODEL end}}}

"{{{ === MODELSEL begin
"   syn match       pam_EndMODELSEL        display containedin=ALL "^\CEND_MODELSEL"
"   hi def link pam_EndMODELSEL  pam_CardTag
   "Row 2 (Selection)
   syn region      pam_MODELSEL_r2     transparent contained containedin=pam_MODELSEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End skipnl keepend
   " Row 1   
   syn region      pam_MODELSEL_r1     transparent contained containedin=pam_MODELSEL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MODELSEL_r2 skipnl keepend
syn region      pam_MODELSEL           contained containedin=pam_CNTAC34_r9,pam_CNTAC43_r9,pam_CNTAC44_r9,pam_TIED_r3 matchgroup=pam_CardTag start="^\CMODELSEL" end="^\(\$\)\@!.\{6\}\/"me=e-7 end="^\CEND_MODELSEL" fold keepend
" === MODELSEL end}}}

" {{{=== RMSSOL begin
   "Row 4 (Selection)
   syn region      pam_RMSSOL_r4     transparent contained containedin=pam_RMSSOL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MODELSEL,pam_Comment,pam_Comment_Position,pam_End,pam_Error keepend skipnl
   "Row 3
   syn region      pam_RMSSOL_r3     transparent contained containedin=pam_RMSSOL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@33f16,@49f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RMSSOL_r4 skipnl keepend
      syn match    pam_RMSSOL_r3_e1             display contained containedin=pam_RMSSOL_r3 "\%9c.\{,8\}"
      syn match    pam_RMSSOL_r3_a1             display contained containedin=pam_RMSSOL_r3 "\%9c\CVARS    "
      syn match    pam_RMSSOL_r3_a1             display contained containedin=pam_RMSSOL_r3 "\%9c[ ]\{8\}"
      hi def link pam_RMSSOL_r3_a1 pam_evenArgument
      hi def link pam_RMSSOL_r3_e1 pam_evenError
      syn match    pam_RMSSOL_r3_e2             display contained containedin=pam_RMSSOL_r3 "\%17c.\{,8\}"
      syn match    pam_RMSSOL_r3_a2             display contained containedin=pam_RMSSOL_r3 "\%17c\CEPST    \|\CDCDM    \|\CSTRV    \|\CTHIN    \|\CJCFR    "
      syn match    pam_RMSSOL_r3_a2             display contained containedin=pam_RMSSOL_r3 "\%17c[ ]\{8\}"
      hi def link pam_RMSSOL_r3_a2 pam_oddArgument
      hi def link pam_RMSSOL_r3_e2 pam_oddError
      syn match    pam_RMSSOL_r3_e3             display contained containedin=pam_RMSSOL_r3 "\%25c.\{,8\}"
      syn match    pam_RMSSOL_r3_a3             display contained containedin=pam_RMSSOL_r3 "\%25c\CMAXV    \|\CMINV    "
      syn match    pam_RMSSOL_r3_a3             display contained containedin=pam_RMSSOL_r3 "\%25c[ ]\{8\}"
      hi def link pam_RMSSOL_r3_a3 pam_evenArgument
      hi def link pam_RMSSOL_r3_e3 pam_evenError
   "Row 2 (Name)
   syn region      pam_RMSSOL_r2     transparent contained containedin=pam_RMSSOL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RMSSOL_r3 skipnl keepend
   "Row 1
   syn region      pam_RMSSOL_r1     transparent contained containedin=pam_RMSSOL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RMSSOL_r2 skipnl keepend
syn region      pam_RMSSOL                matchgroup=pam_CardTag start="^\CRMSSOL/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RMSSOL_r[1-4] fold keepend
" === RMSSOL end}}}

" {{{ === TRSFM begin
   " Row 2 (Selection)
   syn region      pam_TRSFM_r2     transparent contained containedin=pam_TRSFM start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Transform,pam_Comment,pam_Comment_Position,pam_End keepend skipnl
   "Row 1 (Name)
   syn region      pam_TRSFM_r1     transparent contained containedin=pam_TRSFM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TRSFM_r2 skipnl keepend
   "Row 0 (Dummy)
   syn region      pam_TRSFM_r0     transparent contained containedin=pam_TRSFM matchgroup=pam_CardTag start="\%7c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position nextgroup=pam_TRSFM_r1 skipnl keepend
syn region      pam_TRSFM        matchgroup=pam_CardTag start="^\CTRSFM /"he=e+1,rs=e-1 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_TRSFM_r[0-2] fold keepend
" === TRSFM end}}}

"{{{ === EXPORT/IMPORT begin
   "Row 4 (VARS,VARV,TRANSFORMATION)
         syn keyword  pam_EXPORT_TRANSFORMATION_1_arg contained containedin=pam_EXPORT_TRANSFORMATION_1 ORIEN NODPOS NODE PTS MATRIX TRAROT EULER GLOBAL SYMXY SYMXZ SYMYZ RESET
         syn region   pam_EXPORT_TRANSFORMATION_1 contained containedin=pam_EXPORT_TRANSFORMATION matchgroup=pam_HeaderKW start="^[ ]\{16\}" end="$" contains=pam_EXPORT_TRANSFORMATION_1_arg,pam_Error,pam_Continue,pam_Float,pam_FreeVar keepend
      syn  region     pam_EXPORT_TRANSFORMATION contained containedin=pam_EXPORT_r4 matchgroup=pam_HeaderKW start="^        \CTRANSFORMATION" end="\%$"  contains=pam_EXPORT_TRANSFORMATION_.*,pam_Error,pam_Continue keepend
      syn  region     pam_EXPORT_PART contained containedin=pam_EXPORT_r4 matchgroup=pam_HeaderKW start="^        \CPART" end="\n\(        TRANSFORMATION\)\@="  contains=@pam_Ident_16,pam_Error,pam_Continue,pam_End keepend
         syn region   pam_EXPORT_VARV_r1 contained containedin=pam_EXPORT_VARV matchgroup=pam_HeaderKW start="^[ ]\{16\}\CPORO" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Continue keepend
         syn region   pam_EXPORT_VARV_r1 contained containedin=pam_EXPORT_VARV matchgroup=pam_HeaderKW start="^[ ]\{16\}\CPLAS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Continue keepend
      syn  region     pam_EXPORT_VARV contained containedin=pam_EXPORT_r4 matchgroup=pam_HeaderKW start="^        \CVARV" matchgroup=pam_End end="^                \CEND" contains=pam_EXPORT_VARV_r1,pam_Error,pam_Continue keepend
         syn keyword  pam_Control_EXPORT_VARS_r1_arg contained containedin=pam_EXPORT_VARS_r1 AREA MAXV MINV USER
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}DAMG" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}CRAC" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}KINH" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}STF2" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}STF1" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}FIB2" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}FIB1" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}ORTH" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}STRN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}STRS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}PLAS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
         syn region   pam_EXPORT_VARS_r1 contained containedin=pam_EXPORT_VARS matchgroup=pam_HeaderKW start="^[ ]\{16\}THIC" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Control_EXPORT_VARS_r1_arg,pam_Continue keepend
      syn  region     pam_EXPORT_VARS contained containedin=pam_EXPORT_r4 matchgroup=pam_HeaderKW start="^        \CVARS" matchgroup=pam_End end="^                \CEND" contains=pam_EXPORT_VARS_r1,pam_Error,pam_Continue keepend
   syn region      pam_EXPORT_r4     transparent contained containedin=pam_EXPORT start="\%1c." start="^$\n" end="\%$" contains=pam_EXPORT_VARS,pam_EXPORT_VARV,pam_EXPORT_TRANSFORMATION,pam_EXPORT_PART,pam_Comment,pam_Comment_Position
   "Row 3 (NAME, FILE, PATH,...)
      syn  region     pam_EXPORT_TITLE contained containedin=pam_EXPORT_r3 matchgroup=pam_HeaderKW start="^       ." end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_String,pam_Continue keepend
      syn  region     pam_EXPORT_TITLE contained containedin=pam_EXPORT_r3 matchgroup=pam_HeaderKW start="^        \CCOM[1-6]" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_String,pam_Continue keepend
      syn  region     pam_EXPORT_TITLE contained containedin=pam_EXPORT_r3 matchgroup=pam_HeaderKW start="^        \CTITL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_String,pam_Continue keepend
      syn  region     pam_EXPORT_TITLE contained containedin=pam_EXPORT_r3 matchgroup=pam_HeaderKW start="^        \CPATH" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_String,pam_Continue keepend
      syn  region     pam_EXPORT_TITLE contained containedin=pam_EXPORT_r3 matchgroup=pam_HeaderKW start="^        \CFILE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_String,pam_Continue keepend
      syn  region     pam_EXPORT_TITLE contained containedin=pam_EXPORT_r3 matchgroup=pam_HeaderKW start="^        \CNAME" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_String,pam_Continue keepend
   syn region      pam_EXPORT_r3     transparent contained containedin=pam_EXPORT start="\%1c." start="^$\n" end="\n\(        \(VARS\|VARV\|PART\)\)\@=" contains=pam_EXPORT_TITLE,pam_Comment,pam_Comment_Position nextgroup=pam_EXPORT_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_EXPORT_r2     transparent contained containedin=pam_EXPORT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_EXPORT_r3 skipnl keepend
   " Row 1
   syn region      pam_IMPORT_r1          transparent contained containedin=pam_IMPORT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f16,@33i8x,@41f8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_EXPORT_r2 skipnl keepend
   " Row 1
   syn region      pam_EXPORT_r1          transparent contained containedin=pam_EXPORT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_EXPORT_r2 skipnl keepend
syn region      pam_EXPORT                matchgroup=pam_CardTag start="^\CEXPORT/" end="^\CEND_EXPORT" contains=pam_EXPORT_r[1-4],pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend
syn region      pam_IMPORT                matchgroup=pam_CardTag start="^\CIMPORT/" end="^\CEND_IMPORT" contains=pam_IMPORT_r1,pam_EXPORT_r[2-4],pam_Error,pam_Comment,pam_Comment_Position,pam_Continue fold keepend

hi def link pam_EXPORT_r1_a1 pam_oddArgument
hi def link pam_EXPORT_r1_v1 pam_oddVar
hi def link pam_EXPORT_r1_e1 pam_oddError
hi def link pam_EXPORT_r1_a2 pam_evenArgument
hi def link pam_EXPORT_r1_v2 pam_evenVar
hi def link pam_EXPORT_r1_e2 pam_evenError
hi def link pam_Control_EXPORT_VARS_r1_arg pam_Argument
hi def link pam_EXPORT_TRANSFORMATION_1_arg pam_Argument
" EXPORT/IMPORT end}}}

" {{{ === MSTAGE begin
   syn match       pam_EndSTAGE        display containedin=ALL "^\CEND_STAGE"
   hi def link pam_EndSTAGE  pam_CardTag
   "Row 3 (Name)
   syn region      pam_STAGE_r1     transparent contained containedin=pam_STAGE start="\%1cNAME" start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 2
   syn region      pam_STAGE          matchgroup=pam_CardTag start="^\CSTAGE /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Integer,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue,pam_Control_ANALYSIS,pam_Control_STOPRUN,pam_Control_MAXMEMORY,pam_Control_USE_MODULE,pam_Control_MEMCHECK,pam_Control_RESTARTFILES,pam_Control_PIPE,pam_Control_SOLVER skipnl keepend
      syn keyword      pam_STAGE_arg     contained containedin=pam_STAGE ALTERNATE CONTINUOUS KEEP_BOUNC NEW_BOUNC
      hi def link pam_STAGE_arg pam_Argument
      syn region    pam_STAGE_USE_MODULE        contained containedin=pam_STAGE_r1 matchgroup=pam_Keyword start="USE_MODULE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn region    pam_STAGE_MSTFILES        contained containedin=pam_STAGE_r1 matchgroup=pam_Keyword start="MSTFILES" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn region    pam_STAGE_LOADSTAGE        contained containedin=pam_STAGE_r1 matchgroup=pam_Keyword start="LOADSTAGE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Integer,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      
syn region      pam_Control_MSTAGE                matchgroup=pam_HeaderKW start="^\CMSTAGE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_Integer,pam_Comment keepend
" MSTAGE end}}}

" {{{ === STLOAD begin
   "Row 3 (Name)
   syn region      pam_STLOAD_r1     transparent contained containedin=pam_STLOAD start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position skipnl keepend
   "Row 2
   syn region      pam_STLOAD          matchgroup=pam_CardTag start="^\CSTLOAD/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Comment,pam_Comment_Position,pam_Error,pam_Continue,pam_EndSTLOAD skipnl keepend
      syn region    pam_STLOAD_CNTAC        contained containedin=pam_STLOAD_r1 matchgroup=pam_Keyword start="CNTAC" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Continue,pam_Error,pam_FreeError,pam_FreeVar
      syn keyword pam_STLOAD_CNTAC_arg contained containedin=pam_STLOAD_CNTAC OVERLAP_RESOLVE AUTO CONST REMOVE STABILIZE_DAMP SCALE GAP
      hi def link pam_STLOAD_CNTAC_arg pam_Argument
   syn match       pam_EndSTLOAD        display contained "^\CEND_STLOAD"
   hi def link pam_EndSTLOAD  pam_CardTag
" MSTLOAD end}}}

"{{{ === BAGIN begin
   syn keyword     pam_CHAMBER_Arg  contained containedin=pam_CHAMBER OPEN MIDNTR CLAV HOL FCT
   hi def link pam_CHAMBER_Arg pam_Argument
   syn region      pam_CHAMBER      contained containedin=pam_BAGIN  matchgroup=pam_CardTag start="^[ ]\{8\}\CCHAMBER" end="^[ ]\{8\}\CEND_CHAMBER" contains=pam_Name,pam_EndCHAMBER,pam_Comment,pam_Comment_Position,@pam_Ident_16,pam_Float,pam_End fold keepend
   syn region      pam_CHAMBER_TITLE        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{8\}\(\w\)\@=" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String keepend
   syn region      pam_BAG_GEN_INI_COND        contained containedin=pam_BAGIN matchgroup=pam_HeaderKW start="^[ ]\{8\}\CGEN_INI_COND" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_INI_COND        contained containedin=pam_BAGIN matchgroup=pam_HeaderKW start="^[ ]\{8\}\CINI_COND" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_GAS        contained containedin=pam_BAGIN,pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{16\}\CGAS" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float,pam_String keepend
   syn region      pam_BAG_FPM        contained containedin=pam_BAGIN matchgroup=pam_HeaderKW start="^[ ]\{8\}\CFPM" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_LOCAL_H        contained containedin=pam_BAGIN matchgroup=pam_HeaderKW start="^[ ]\{16\}\CLOCAL_H" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_VENT_MODEL        contained containedin=pam_BAGIN matchgroup=pam_HeaderKW start="^[ ]\{16\}\CVENT_MODEL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_TURBULENCE        contained containedin=pam_BAGIN matchgroup=pam_HeaderKW start="^[ ]\{16\}\CTURBULENCE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
      syn match pam_BAG_TURBULENCE_arg contained containedin=pam_BAG_TURBULENCE "KEPSILON"
      hi def link pam_BAG_TURBULENCE_arg pam_Argument
   syn region      pam_BAG_WALL_LAW        contained containedin=pam_BAGIN matchgroup=pam_HeaderKW start="^[ ]\{16\}\CWALL_LAW" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
      syn match pam_BAG_WALL_LAW_arg contained containedin=pam_BAG_WALL_LAW "MOMENTUM"
      hi def link pam_BAG_WALL_LAW_arg pam_Argument
   syn region      pam_BAG_EXT_SKIN        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{8\}\CEXT_SKIN" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_BAG_WALL_OPENING        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{8\}\CWALL_OPENING" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_BAG_NUL_SHELL        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{16\}\CNUL_SHELL" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_VEN_AREA        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{16\}\CVEN_AREA" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_WALL_FABRIC        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{8\}\CWALL_FABRIC" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_BAG_WALL_STRAP        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{8\}\CWALL_STRAP" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_BAG_LEAKAGE        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{8\}\CLEAKAGE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_INFLATOR        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{8\}\CINFLATOR" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
   syn region      pam_BAG_FPM_HOLE        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{16\}\CFPM_HOLE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_BAG_JET        contained containedin=pam_CHAMBER matchgroup=pam_HeaderKW start="^[ ]\{16\}\CJET" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Float keepend
syn region      pam_BAGIN           matchgroup=pam_CardTag start="^\CBAGIN /" end="^\CEND_BAGIN" contains=pam_CHAMBER,pam_EndBAGIN,pam_Name,pam_Float,pam_Comment,pam_Comment_Position,pam_End,@pam_Ident_16 fold keepend
   syn match       pam_EndBAGIN        display containedin=ALL "^\CEND_BAGIN"
   hi def link pam_EndBAGIN  pam_CardTag
" === BAGIN end}}}

" {{{== *3D begin
   " Node Selection
   syn region       pam_x3D_r4     transparent contained containedin=pam_x3D start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 3 (Name)
   syn region       pam_x3D_r3     transparent contained containedin=pam_x3D start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_x3D_r4 skipnl keepend
   "Row 2
      syn match    pam_x3D_r2_e1             display contained containedin=pam_x3D_r2 "\%57c.\{,8\}"
      syn match    pam_x3D_r2_a1             display contained containedin=pam_x3D_r2 "\%57c[ ]*\(\CDISP\|\CVELO\|\CACCE\)[ ]*\%65c"
      syn match    pam_x3D_r2_a1             display contained containedin=pam_x3D_r2 "\%57c[ ]\{8\}"
      hi def link pam_x3D_r2_a1 pam_evenArgument
      hi def link pam_x3D_r2_e1 pam_evenError
   syn region       pam_x3D_r2             transparent contained containedin=pam_x3D start="\%1c.\(        \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_x3D_r2,pam_x3D_r3 skipnl keepend
   "Row 1
   syn region       pam_x3D_r1             transparent contained containedin=pam_x3D start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,@41f8,@49f8,@57f8,@65i8,@73i8,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_x3D_r2,pam_x3D_r3 skipnl keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CDIS3D /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CDIS3DM/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CDIS3DX/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CVEL3D /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CACC3D /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CRAN3D /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CRAN3DM/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CRAN3DX/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CRVE3D /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
syn region      pam_x3D                matchgroup=pam_CardTag start="^\CRAC3D /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_x3D_r[1-3] fold keepend
" == *3D end}}}

" {{{== FBC3D begin
   " Node Selection
   syn region       pam_FBC3D_r4     transparent contained containedin=pam_FBC3D start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 3 (Name)
   syn region       pam_FBC3D_r3     transparent contained containedin=pam_FBC3D start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_FBC3D_r4 skipnl keepend
   "Row 2
      syn match    pam_FBC3D_r1_e1             display contained containedin=pam_FBC3D_r1 "\%17c.\{,8\}"
      syn match    pam_FBC3D_r1_a1             display contained containedin=pam_FBC3D_r1 "\%17c[ ]*\(\CDISP\|\CVELO\|\CACCE\)[ ]*\%25c"
      syn match    pam_FBC3D_r1_a1             display contained containedin=pam_FBC3D_r1 "\%17c[ ]\{8\}"
      hi def link pam_FBC3D_r1_a1 pam_evenArgument
      hi def link pam_FBC3D_r1_e1 pam_evenError
   syn region       pam_FBC3D_r2             transparent contained containedin=pam_FBC3D start="\%1c.\(        \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FBC3D_r2,pam_FBC3D_r3 skipnl keepend
   "Row 1
   syn region       pam_FBC3D_r1             transparent contained containedin=pam_FBC3D start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49f8,@57f8,@65f8,@73i8,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FBC3D_r2,pam_FBC3D_r3 skipnl keepend
syn region      pam_FBC3D                matchgroup=pam_CardTag start="^\CFBC3D /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FBC3D_r[1-3] fold keepend
" == FBC3D end}}}

" {{{=== DAMP  begin
   "Node Selection
   " Row 3
   syn region      pam_DAMP_r3     transparent contained containedin=pam_DAMP start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f16,@17f16,@33i8x,@41i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DAMP_r4 skipnl keepend
   " Row 4
   syn region      pam_DAMP_r4     transparent contained containedin=pam_DAMP start="\%1c.\(       \u\)\@=" start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 2 (Name)
   syn region      pam_DAMP_r2     transparent contained containedin=pam_DAMP start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_DAMP_r3,pam_DAMP_r4 skipnl keepend
   " Row 1
      syn match    pam_DAMP_r1_a1  contained containedin=pam_DAMP_r1 "\%25c\CSENSOR  "
      hi def link pam_DAMP_r1_a1 pam_oddArgument
      syn match    pam_DAMP_r1_a2  contained containedin=pam_DAMP_r1 "\%17c\CCURVE   "
      hi def link pam_DAMP_r1_a2 pam_evenArgument
   syn region      pam_DAMP_r1     transparent contained containedin=pam_DAMP start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,@25f8,@33f8,@41i8,@49f8,@57f8,@65f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DAMP_r2 skipnl keepend
syn region      pam_DAMP           matchgroup=pam_CardTag start="^\CDAMP  /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DAMP_r[1-4] fold keepend
" === DAMP  end}}}

" {{{=== KINDA  begin
   "Node Selection
   " Row 4
   syn region      pam_KINDA_r4     transparent contained containedin=pam_KINDA start="\%1c.\(       \u\)\@=" start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn region      pam_KINDA_r3     transparent contained containedin=pam_KINDA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_KINDA_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_KINDA_r2     transparent contained containedin=pam_KINDA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_KINDA_r3 skipnl keepend
   " Row 1
      syn match    pam_KINDA_r1_a1  contained containedin=pam_KINDA_r1 "\%17c\CSENSOR  "
      hi def link pam_KINDA_r1_a1 pam_oddArgument
   syn region      pam_KINDA_r1     transparent contained containedin=pam_KINDA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,@25f8,@33f8,@41i8,@49f8,@57f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_KINDA_r2 skipnl keepend
syn region      pam_KINDA           matchgroup=pam_CardTag start="^\CKINDA /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_KINDA_r[1-4] fold keepend
" === KINDA  end}}}

" {{{=== ACFLD begin
   "Node Selection
   syn region      pam_ACFLD_r4     transparent contained containedin=pam_ACFLD start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3 (Name)
   syn region      pam_ACFLD_r3     transparent contained containedin=pam_ACFLD start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_ACFLD_r4 skipnl keepend
   " Row 2
   syn region      pam_ACFLD_r2     transparent contained containedin=pam_ACFLD start="^        " start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_ACFLD_r3 skipnl keepend
   " Row 1
   syn region      pam_ACFLD_r1     transparent contained containedin=pam_ACFLD start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33i8,@41f8,@49i8,@57f8,@65i8,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_ACFLD_r2,pam_ACFLD_r3 skipnl keepend
syn region      pam_ACFLD          matchgroup=pam_CardTag start="^\CACFLD /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_ACFLD_r[1-3] fold keepend
" === ACFLD end}}}

" {{{=== BDFOR begin
   "Node Selection
   syn region      pam_BDFOR_r5     transparent contained containedin=pam_BDFOR start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 4
   syn region      pam_BDFOR_r4     transparent contained containedin=pam_BDFOR start="^        \(\u\)\@!" start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BDFOR_r5 skipnl keepend
   " Row 3 (Name)
   syn region      pam_BDFOR_r3     transparent contained containedin=pam_BDFOR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_BDFOR_r4,pam_BDFOR_r5 skipnl keepend
   " Row 2
   syn region      pam_BDFOR_r2     transparent contained containedin=pam_BDFOR start="^        " start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BDFOR_r3 skipnl keepend
   " Row 1
      " IKFOR
      syn match       pam_BDFOR_r1_e1             display contained containedin=pam_BDFOR_r1 "\%9c.\{,6\}"
      syn match       pam_BDFOR_r1_a1             display contained containedin=pam_BDFOR_r1 "\%9c\CAFIELD\|\CRADIAL\|\CROTACC\|\CPRSTRS\|\CPRFORC\|\CVOLUME\|\CPREND "
      syn match       pam_BDFOR_r1_v1             display contained containedin=pam_BDFOR_r1 "\%9c[ ]*\[[^\[]\{-}\]\%15c"
      syn match       pam_BDFOR_r1_v1             display contained containedin=pam_BDFOR_r1 "\%9c[ ]*<[^<]\{-}>\%15c"
      hi def link pam_BDFOR_r1_a1 pam_oddArgument
      hi def link pam_BDFOR_r1_v1 pam_oddVar
      hi def link pam_BDFOR_r1_e1 pam_oddError
   syn region      pam_BDFOR_r1     transparent contained containedin=pam_BDFOR start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8,@25i8,@33i8,@41f8,@49i8,@73i8,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BDFOR_r2,pam_BDFOR_r3 skipnl keepend
syn region      pam_BDFOR          matchgroup=pam_CardTag start="^\CBDFOR /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_BDFOR_r[1-3] fold keepend
" === BDFOR end}}}

" {{{=== FRAME begin
   " Row 3
   syn region      pam_FRAME45_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_FRAME45_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_FRAME45_r3 skipnl keepend
   " Row 1
   syn region      pam_FRAME45_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRAME45_r2 skipnl keepend
syn region      pam_FRAME45      matchgroup=pam_CardTag start="^\CFRAME / .\{16\}[ ]\{7\}[45]$"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRAME45_r[1-3] fold keepend

   " Row 3
   syn region      pam_FRAME13_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_FRAME13_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_FRAME13_r3 skipnl keepend
   " Row 1
   syn region      pam_FRAME13_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRAME13_r2 skipnl keepend
syn region      pam_FRAME13      matchgroup=pam_CardTag start="^\CFRAME / .\{16\}[ ]\{7\}[13]$"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRAME13_r[1-3] fold keepend

   " Row 4
   syn region      pam_FRAME02_r4     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,@57i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 3
   syn region      pam_FRAME02_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRAME02_r4 skipnl keepend
   " Row 2
   syn region      pam_FRAME02_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_FRAME02_r3 skipnl keepend
   " Row 1
   syn region      pam_FRAME02_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRAME02_r2 skipnl keepend
syn region      pam_FRAME02      matchgroup=pam_CardTag start="^\CFRAME / .\{16\}[ ]\{7\}[02]$"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRAME02_r[1-3] fold keepend
" === FRAME end}}}

" {{{=== SENSOR begin
   " Row 2
   syn region      pam_SENSORX_r2     transparent contained start="\%1c." start="^$\n" end="\%$" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1
   syn region      pam_SENSORX_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSORX_r2 skipnl keepend
syn region      pam_SENSORX      matchgroup=pam_CardTag start="^\CSENSOR/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSORX_r[1-3] fold keepend
" SENSOR 1
   " Row 3
   syn region      pam_SENSOR1_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR1_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR1_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR1_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR1_r2 skipnl keepend
syn region      pam_SENSOR1      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}1"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR1_r[1-3] fold keepend
" SENSOR 2
   " Row 3
   syn region      pam_SENSOR2_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25f8,@33f8,@41f8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR2_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR2_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR2_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR2_r2 skipnl keepend
syn region      pam_SENSOR2      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}2"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR2_r[1-3] fold keepend
" SENSOR 3
   " Row 3
   syn region      pam_SENSOR3_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41f8,@57i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR3_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR3_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR3_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR3_r2 skipnl keepend
syn region      pam_SENSOR3      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}3"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR3_r[1-3] fold keepend
" SENSOR 4
   " Row 3
   syn region      pam_SENSOR4_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR4_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR4_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR4_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR4_r2 skipnl keepend
syn region      pam_SENSOR4      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}4"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR4_r[1-3] fold keepend
" SENSOR 5
   " Row 3
   syn region      pam_SENSOR5_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR5_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR5_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR5_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR5_r2 skipnl keepend
syn region      pam_SENSOR5      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}5"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR5_r[1-3] fold keepend
" SENSOR 6
   " Row 3
   syn region      pam_SENSOR6_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR6_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR6_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR6_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR6_r2 skipnl keepend
syn region      pam_SENSOR6      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}6"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR6_r[1-3] fold keepend
" SENSOR 7
   " Row 3
   syn region      pam_SENSOR7_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41f8,@49f8,@57i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR7_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR7_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR7_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR7_r2 skipnl keepend
syn region      pam_SENSOR7      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}7"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR7_r[1-3] fold keepend
" SENSOR 8
   " Row 3
   syn region      pam_SENSOR8_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR8_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR8_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR8_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR8_r2 skipnl keepend
syn region      pam_SENSOR8      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}8"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR8_r[1-3] fold keepend
" SENSOR 9
   " Row 3
   syn region      pam_SENSOR9_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR9_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR9_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR9_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR9_r2 skipnl keepend
syn region      pam_SENSOR9      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{7\}9"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR9_r[1-3] fold keepend
" SENSOR 10
   " Row 3
   syn region      pam_SENSOR10_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR10_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR10_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR10_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR10_r2 skipnl keepend
syn region      pam_SENSOR10      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{6\}10"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR10_r[1-3] fold keepend
" SENSOR 11
   " Row 3
   syn region      pam_SENSOR11_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR11_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR11_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR11_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR11_r2 skipnl keepend
syn region      pam_SENSOR11      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{6\}11"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR11_r[1-3] fold keepend
" SENSOR 12
   " Row 4
   syn region      pam_SENSOR12_r4     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR12_r4,pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndSens skipnl keepend
   " Row 3
      "COP
      syn match       pam_SENSOR12_r3_e2             display contained containedin=pam_SENSOR12_r3 "\%9c.\{,3\}"
      syn match       pam_SENSOR12_r3_a2             display contained containedin=pam_SENSOR12_r3 "\%9c\COR \|\CAND\|\CAGO\|\COGA"
      syn match       pam_SENSOR12_r3_v2             display contained containedin=pam_SENSOR12_r3 "\%9c[ ]*\[[^\[]\{-}\]\%12c"
      syn match       pam_SENSOR12_r3_v2             display contained containedin=pam_SENSOR12_r3 "\%9c[ ]*<[^<]\{-}>\%12c"
      hi def link pam_SENSOR12_r3_a2 pam_evenArgument
      hi def link pam_SENSOR12_r3_v2 pam_evenVar
      hi def link pam_SENSOR12_r3_e2 pam_evenError
   syn region      pam_SENSOR12_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR12_r4 skipnl keepend
   " Row 2
   syn region      pam_SENSOR12_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR12_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR12_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR12_r2 skipnl keepend
syn region      pam_SENSOR12      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{6\}12"rs=s+8 end="^\CEND_SENS" contains=pam_SENSOR12_r[1-4],pam_EndSens fold keepend
" SENSOR 13
   " Row 3
   syn region      pam_SENSOR13_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_SENSOR13_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR13_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR13_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR13_r2 skipnl keepend
syn region      pam_SENSOR13      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{6\}13"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR13_r[1-3] fold keepend
" SENSOR 14
   " Row 4 (Node Selection)
   syn region      pam_SENSOR14_r4     transparent contained start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn region      pam_SENSOR14_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25f8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR14_r4 skipnl keepend
   " Row 2
   syn region      pam_SENSOR14_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENSOR14_r3 skipnl keepend
   " Row 1
   syn region      pam_SENSOR14_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENSOR14_r2 skipnl keepend
syn region      pam_SENSOR14      matchgroup=pam_CardTag start="^\CSENSOR/ .\{8\}[ ]\{6\}14"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENSOR14_r[1-4] fold keepend
      "END_SENS
      syn match       pam_EndSens          display contained "^        \CEND_SENS"
      hi def link pam_EndSens     pam_CardTag
" === SENSOR end}}}

" {{{=== RUPMO begin
   " Common
      "FILTER
      syn match       pam_RUPMO_r1_e4             display contained containedin=pam_RUPMOX_r1,pam_RUPMO0_r1,pam_RUPMO2_r1,pam_RUPMO3_r1,pam_RUPMO5_r1,pam_RUPMO6_r1 "\%33c.\{,8\}"
      syn match       pam_RUPMO_r1_a4             display contained containedin=pam_RUPMOX_r1,pam_RUPMO0_r1,pam_RUPMO2_r1,pam_RUPMO3_r1,pam_RUPMO5_r1,pam_RUPMO6_r1 "\%33c[ ]*\CCYCLE[ ]*\%41c"
      syn match       pam_RUPMO_r1_a4             display contained containedin=pam_RUPMOX_r1,pam_RUPMO0_r1,pam_RUPMO2_r1,pam_RUPMO3_r1,pam_RUPMO5_r1,pam_RUPMO6_r1 "\%33c[ ]*\%41c"
      syn match       pam_RUPMO_r1_a4             display contained containedin=pam_RUPMOX_r1,pam_RUPMO0_r1,pam_RUPMO2_r1,pam_RUPMO5_r1 "\%33c[ ]*\CTIME[ ]*\%41c"
      syn match       pam_RUPMO_r1_v4             display contained containedin=pam_RUPMOX_r1,pam_RUPMO0_r1,pam_RUPMO2_r1,pam_RUPMO3_r1,pam_RUPMO5_r1,pam_RUPMO6_r1 "\%33c[ ]*\[[^\[]\{-}\]\%41c"
      syn match       pam_RUPMO_r1_v4             display contained containedin=pam_RUPMOX_r1,pam_RUPMO0_r1,pam_RUPMO2_r1,pam_RUPMO3_r1,pam_RUPMO5_r1,pam_RUPMO6_r1 "\%33c[ ]*<[^<]\{-}>\%41c"
      hi def link pam_RUPMO_r1_a4 pam_evenArgument
      hi def link pam_RUPMO_r1_v4 pam_evenVar
      hi def link pam_RUPMO_r1_e4 pam_evenError
   " Row 2
   syn region      pam_RUPMOX_r2     transparent contained start="\%1c." start="^$\n" end="\%$" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1
   syn region      pam_RUPMOX_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMOX_r2 skipnl keepend
syn region      pam_RUPMOX      matchgroup=pam_CardTag start="^\CRUPMO /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RUPMOX_r[1-3] fold keepend
" RUPMO 0
   " Row 3
   syn region      pam_RUPMO0_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_RUPMO0_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RUPMO0_r3 skipnl keepend
   " Row 1
   syn region      pam_RUPMO0_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO0_r2 skipnl keepend
syn region      pam_RUPMO0      matchgroup=pam_CardTag start="^\CRUPMO / .\{8\}[ ]\{7\}[01]"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RUPMO0_r[1-3] fold keepend
" RUPMO 2
   " Row 3
   syn region      pam_RUPMO2_r6     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_RUPMO2_r5     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO2_r6 skipnl keepend
   syn region      pam_RUPMO2_r4     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO2_r5 skipnl keepend
   syn region      pam_RUPMO2_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO2_r4 skipnl keepend
   " Row 2
   syn region      pam_RUPMO2_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RUPMO2_r3 skipnl keepend
   " Row 1
   syn region      pam_RUPMO2_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO2_r2 skipnl keepend
syn region      pam_RUPMO2      matchgroup=pam_CardTag start="^\CRUPMO / .\{8\}[ ]\{7\}2"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RUPMO2_r[1-6] fold keepend
" RUPMO 3
   " Row 3
   syn region      pam_RUPMO3_r4     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_RUPMO3_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO3_r4 skipnl keepend
   " Row 2
   syn region      pam_RUPMO3_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RUPMO3_r3 skipnl keepend
   " Row 1
   syn region      pam_RUPMO3_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO3_r2 skipnl keepend
syn region      pam_RUPMO3      matchgroup=pam_CardTag start="^\CRUPMO / .\{8\}[ ]\{7\}3"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RUPMO3_r[1-4] fold keepend
" RUPMO 5
   " Row 4
   syn region      pam_RUPMO5_r4     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 3
   syn region      pam_RUPMO5_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO5_r4 skipnl keepend
   " Row 2
   syn region      pam_RUPMO5_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RUPMO5_r3 skipnl keepend
   " Row 1
   syn region      pam_RUPMO5_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO5_r2 skipnl keepend
syn region      pam_RUPMO5      matchgroup=pam_CardTag start="^\CRUPMO / .\{8\}[ ]\{7\}[57]"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RUPMO5_r[1-4] fold keepend
" RUPMO 6
   " Row 3
   syn region      pam_RUPMO6_r3     transparent contained start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 2
   syn region      pam_RUPMO6_r2     transparent contained start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RUPMO6_r3 skipnl keepend
   " Row 1
   syn region      pam_RUPMO6_r1     transparent contained  start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RUPMO6_r2 skipnl keepend
syn region      pam_RUPMO6      matchgroup=pam_CardTag start="^\CRUPMO / .\{8\}[ ]\{7\}6"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RUPMO6_r[1-3] fold keepend
" === RUPMO end}}}

" {{{=== MASS begin
   " Row 6 (Node Selection)
   syn region      pam_MASS_r6     transparent contained containedin=pam_MASS start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 5
   syn region      pam_MASS_r5    transparent contained containedin=pam_MASS start="\%1c        [ 0-9\-\.]" start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_MASS_r6 keepend skipnl
   "Row 4
   syn region      pam_MASS_r4     transparent contained containedin=pam_MASS start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_MASS_r5,pam_MASS_r6 keepend skipnl
   "Row 3
   syn region      pam_MASS_r3     transparent contained containedin=pam_MASS start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MASS_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_MASS_r2     transparent contained containedin=pam_MASS start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_MASS_r3 skipnl keepend
   "Row 1
   syn region      pam_MASS_r1     transparent contained containedin=pam_MASS start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@33f16,@49f16,@65f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MASS_r2 skipnl keepend
syn region      pam_MASS                matchgroup=pam_CardTag start="^\CMASS  /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_MASS_r[1-4] fold keepend
" === MASS end}}}

" {{{=== DETOP begin
   " Row 3 (Node Selection)
   syn region      pam_DETOP_r3     transparent contained containedin=pam_DETOP start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_DETOP_r2     transparent contained containedin=pam_DETOP start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_DETOP_r3 skipnl keepend
   "Row 1
   syn region      pam_DETOP_r1     transparent contained containedin=pam_DETOP start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DETOP_r2 skipnl keepend
syn region      pam_DETOP                matchgroup=pam_CardTag start="^\CDETOP /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DETOP_r[1-4] fold keepend
" === DETOP end}}}

" {{{=== DPEEN begin
   "Row 1
   syn region      pam_DPEEN_r1     transparent contained containedin=pam_DPEEN start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
syn region      pam_DPEEN                matchgroup=pam_CardTag start="^\CDPEEN /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DPEEN_r[1-4] fold keepend
" === DPEEN end}}}

" {{{=== DPNQM begin
   "Row 1
   syn region      pam_DPNQM_r1     transparent contained containedin=pam_DPNQM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
syn region      pam_DPNQM                matchgroup=pam_CardTag start="^\CDPNQM /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DPNQM_r[1-4] fold keepend
" === DPNQM end}}}

" {{{=== DPEMA begin
   "Row 1
   syn region      pam_DPEMA_r1     transparent contained containedin=pam_DPEMA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
syn region      pam_DPEMA                matchgroup=pam_CardTag start="^\CDPEMA /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DPEMA_r[1-4] fold keepend
" === DPEMA end}}}

" {{{=== DPEQM begin
   "Row 1
   syn region      pam_DPEQM_r1     transparent contained containedin=pam_DPEQM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
syn region      pam_DPEQM                matchgroup=pam_CardTag start="^\CDPEQM /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DPEQM_r[1-4] fold keepend
" === DPEQM end}}}

" {{{=== MUSC1 begin
   " Row 8 (Node Selection)
   syn region      pam_MUSC1_r8     transparent contained containedin=pam_MUSC1 start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 7
   syn region      pam_MUSC1_r7     transparent contained containedin=pam_MUSC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25f8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MUSC1_r8 keepend skipnl
   "Row 6
   syn region      pam_MUSC1_r6     transparent contained containedin=pam_MUSC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25f8,@33f8,@41f8,@49f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MUSC1_r7 keepend skipnl
   "Row 5
   syn region      pam_MUSC1_r5     transparent contained containedin=pam_MUSC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MUSC1_r6 keepend skipnl
   "Row 4
   syn region      pam_MUSC1_r4     transparent contained containedin=pam_MUSC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25f8,@33f8,@41f8,@49f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MUSC1_r5 keepend skipnl
   "Row 3
   syn region      pam_MUSC1_r3     transparent contained containedin=pam_MUSC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25f8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MUSC1_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_MUSC1_r2     transparent contained containedin=pam_MUSC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_MUSC1_r3 skipnl keepend
   "Row 1
      syn region pam_MUSC1_r1_auto  transparent contained containedin=pam_MUSC1_r1 matchgroup=pam_evenArgument start="\%17c\CAUTO    " end="\%$" contains=@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error
   syn region      pam_MUSC1_r1     transparent contained containedin=pam_MUSC1 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,@25f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MUSC1_r2 skipnl keepend
syn region      pam_MUSC1                matchgroup=pam_CardTag start="^\CMUSC1 /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_MUSC1_r[1-4] fold keepend
" === MUSC1 end}}}

" {{{=== MDBODY begin
   " Row 5 (Node Selection)
   syn region      pam_MDBODY_r3     transparent contained containedin=pam_MDBODY start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_MDBODY_r2     transparent contained containedin=pam_MDBODY start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_MDBODY_r3 skipnl keepend
   "Row 1
   syn region      pam_MDBODY_r1     transparent contained containedin=pam_MDBODY start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25f8,@33f8,@41i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MDBODY_r2 skipnl keepend
      syn match       pam_MDBODY_r1_e1             display contained containedin=pam_MDBODY_r1 "\%17c.\{,8\}"
      syn match       pam_MDBODY_r1_a1             display contained containedin=pam_MDBODY_r1 "\%17c[ ]\{8\}"
      syn match       pam_MDBODY_r1_a1             display contained containedin=pam_MDBODY_r1 "\%17c\CSHELL   "
      syn match       pam_MDBODY_r1_a1             display contained containedin=pam_MDBODY_r1 "\%17c\CSOLID   "
      syn match       pam_MDBODY_r1_a1             display contained containedin=pam_MDBODY_r1 "\%17c\CNODE    "
      hi def link pam_MDBODY_r1_a1 pam_evenArgument
      hi def link pam_MDBODY_r1_e1 pam_evenError
syn region      pam_MDBODY                matchgroup=pam_CardTag start="^\CMDBODY/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_MDBODY_r[1-4] fold keepend
" === MDBODY end}}}

" {{{=== BELTS begin
   "Row 3
   syn region      pam_BELTS_r3     transparent contained containedin=pam_BELTS matchgroup=pam_HeaderKW start="\%1c.[ ]\{7\}SLIPRG" start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BELTS_r3,pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_BELTS_r3     transparent contained containedin=pam_BELTS matchgroup=pam_HeaderKW start="\%1c.[ ]\{7\}STARTP" start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BELTS_r3,pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_BELTS_r3     transparent contained containedin=pam_BELTS matchgroup=pam_HeaderKW start="\%1c.[ ]\{7\}ENDPNT" start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BELTS_r3,pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_BELTS_r3     transparent contained containedin=pam_BELTS matchgroup=pam_HeaderKW start="\%1c.[ ]\{7\}RETRAC" start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BELTS_r3,pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 2 (Name)
   syn region      pam_BELTS_r2     transparent contained containedin=pam_BELTS start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_BELTS_r3 skipnl keepend
   "Row 1
   syn region      pam_BELTS_r1     transparent contained containedin=pam_BELTS start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BELTS_r2 skipnl keepend
syn region      pam_BELTS                matchgroup=pam_CardTag start="^\CBELTS /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_BELTS_r[1-4] fold keepend
" === BELTS end}}}

" {{{=== RETRA begin
   "Row 4
   syn region      pam_RETRA_r4     transparent contained containedin=pam_RETRA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RETRA_r4,pam_RETRA_r5 keepend skipnl
   " Row 5 (Node Selection)
   syn region      pam_RETRA_r5     transparent contained containedin=pam_RETRA start="\%1c.[ ]\{7\}\u" start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 3
   syn region      pam_RETRA_r3     transparent contained containedin=pam_RETRA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RETRA_r4,pam_RETRA_r5 skipnl keepend
   "Row 2 (Name)
   syn region      pam_RETRA_r2     transparent contained containedin=pam_RETRA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RETRA_r3 skipnl keepend
   "Row 1
   syn region      pam_RETRA_r1     transparent contained containedin=pam_RETRA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,@41f8,@57i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RETRA_r2 skipnl keepend
syn region      pam_RETRA                matchgroup=pam_CardTag start="^\CRETRA /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RETRA_r[1-4] fold keepend
" === RETRA end}}}

" {{{=== SLIPR begin
   " Row 3 (Node Selection)
   syn region      pam_SLIPR_r3     transparent contained containedin=pam_SLIPR start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_SLIPR_r2     transparent contained containedin=pam_SLIPR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SLIPR_r3 skipnl keepend
   "Row 1
   syn region      pam_SLIPR_r1     transparent contained containedin=pam_SLIPR start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,@41f8,@49i8,@57i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SLIPR_r2 skipnl keepend
syn region      pam_SLIPR                matchgroup=pam_CardTag start="^\CSLIPR /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SLIPR_r[1-4] fold keepend
" === SLIPR end}}}

" {{{=== GASPEC begin
   "Row 2
   syn region      pam_GASPEC_r2     transparent contained containedin=pam_GASPEC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Float,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 1
   syn region      pam_GASPEC_r1     transparent contained containedin=pam_GASPEC start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=pam_String,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_GASPEC_r2 skipnl keepend
syn region      pam_GASPEC                matchgroup=pam_CardTag start="^\CGASPEC/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_GASPEC_r[1-4] fold keepend
" === GASPEC end}}}

" {{{=== SENPT begin
   " Row 4 (Node Selection)
   syn region      pam_SENPT_r4     transparent contained containedin=pam_SENPT start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 3
   syn region      pam_SENPT_r3     transparent contained containedin=pam_SENPT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENPT_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_SENPT_r2     transparent contained containedin=pam_SENPT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENPT_r3 skipnl keepend
   "Row 1
   syn region      pam_SENPT_r1     transparent contained containedin=pam_SENPT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33i8,@41i8,@49i8,@57i8,@65i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENPT_r2 skipnl keepend
syn region      pam_SENPT                matchgroup=pam_CardTag start="^\CSENPT /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENPT_r[1-4] fold keepend
" === SENPT end}}}

" {{{=== SENPTG begin
   " Row 4 (Node Selection)
   syn region      pam_SENPTG_r4     transparent contained containedin=pam_SENPTG start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 3
   syn region      pam_SENPTG_r3     transparent contained containedin=pam_SENPTG start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENPTG_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_SENPTG_r2     transparent contained containedin=pam_SENPTG start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SENPTG_r3 skipnl keepend
   "Row 1
   syn region      pam_SENPTG_r1     transparent contained containedin=pam_SENPTG start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SENPTG_r2 skipnl keepend
syn region      pam_SENPTG                matchgroup=pam_CardTag start="^\CSENPTG/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SENPTG_r[1-4] fold keepend
" === SENPTG end}}}

" {{{=== MSTRM begin
   "Row 5 (Selection)
   syn region      pam_MSTRM_r5     transparent contained containedin=pam_MSTRM start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 4 (Name)
   syn region      pam_MSTRM_r4     transparent contained containedin=pam_MSTRM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_MSTRM_r5 skipnl keepend
   "Row 3
   syn region      pam_MSTRM_r3     transparent contained containedin=pam_MSTRM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MSTRM_r4 skipnl 
   "Row 2
   syn region      pam_MSTRM_r2     transparent contained containedin=pam_MSTRM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MSTRM_r3 skipnl 
   "Row 1
   syn region      pam_MSTRM_r1     transparent contained containedin=pam_MSTRM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9f16,@25f16,@41f16,@57f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MSTRM_r2 skipnl 
syn region      pam_MSTRM                matchgroup=pam_CardTag start="^\CMSTRM /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_MSTRM_r[1-5] fold keepend
" === MSTRM end}}}

" {{{=== THNOD/THNPO begin
   " Row 3 (Node Selection)
   syn region      pam_THNOD_r3     transparent contained containedin=pam_THNOD start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_THNOD_r2     transparent contained containedin=pam_THNOD start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_THNOD_r3 skipnl keepend
   syn region      pam_THNOD_r1     transparent contained containedin=pam_THNOD start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_THNOD_r2 skipnl keepend
   " Row 1
syn region      pam_THNOD        matchgroup=pam_CardTag start="^\(\CTHNOD\|\CTHNPO\) /"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_THNOD_r[1-3] fold keepend
" === THNOD end}}}

" {{{=== BOUNC begin
   "Node Selection
   syn region      pam_BOUNC_r3     transparent contained containedin=pam_BOUNC start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_BOUNC_r2     transparent contained containedin=pam_BOUNC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_BOUNC_r3 skipnl keepend
      " XYZUVW
      syn match       pam_BOUNC_r1_e2             display contained containedin=pam_BOUNC_r1 "\%19c.\{,6\}"
      syn match       pam_BOUNC_r1_a2             display contained containedin=pam_BOUNC_r1 "\%19c[0-1]\{6\}"
   syn region      pam_BOUNC_r1     transparent contained containedin=pam_BOUNC start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BOUNC_r2 skipnl keepend
   "Row 1
syn region      pam_BOUNC                matchgroup=pam_CardTag start="^\CBOUNC /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_BOUNC_r[1-3] fold keepend

hi def link pam_BOUNC_r1_a2 pam_evenArgument
hi def link pam_BOUNC_r1_e2 pam_evenError
" === BOUNC end}}}

" {{{=== CNTAC X begin
   " Row 2 (Name)
   syn region      pam_CNTACX_r2     transparent contained containedin=pam_CNTACX start="\%1c." start="^$\n" end="\%$" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1
   syn region      pam_CNTACX_r1     transparent contained containedin=pam_CNTACX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTACX_r2 skipnl keepend
syn region      pam_CNTACX        matchgroup=pam_CardTag start="^\CCNTAC /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTACX_r[1-9] fold keepend
" === CNTAC X end}}}

" {{{=== CNTAC 1 begin
   " Row 9 (Selection)
   syn region      pam_CNTAC1_r9     transparent contained containedin=pam_CNTAC1 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC1_r8     transparent contained containedin=pam_CNTAC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC1_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC1_r7     transparent contained containedin=pam_CNTAC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC1_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC1_r6     transparent contained containedin=pam_CNTAC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC1_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC1_r5     transparent contained containedin=pam_CNTAC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC1_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC1_r4     transparent contained containedin=pam_CNTAC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC1_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC1_r3     transparent contained containedin=pam_CNTAC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC1_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC1_r2     transparent contained containedin=pam_CNTAC1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC1_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC1_r1     transparent contained containedin=pam_CNTAC1 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC1_r2 skipnl keepend
syn region      pam_CNTAC1        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{7\}1"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC1_r[1-9] fold keepend
" === CNTAC 1 end}}}

" {{{=== CNTAC 10 begin
   " Row 9 (Selection)
   syn region      pam_CNTAC10_r9     transparent contained containedin=pam_CNTAC10 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC10_r8     transparent contained containedin=pam_CNTAC10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC10_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC10_r7     transparent contained containedin=pam_CNTAC10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC10_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC10_r6     transparent contained containedin=pam_CNTAC10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC10_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC10_r5     transparent contained containedin=pam_CNTAC10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC10_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC10_r4     transparent contained containedin=pam_CNTAC10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC10_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC10_r3     transparent contained containedin=pam_CNTAC10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31i5,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC10_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC10_r2     transparent contained containedin=pam_CNTAC10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC10_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC10_r1     transparent contained containedin=pam_CNTAC10 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC10_r2 skipnl keepend
syn region      pam_CNTAC10        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}10"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC10_r[1-9] fold keepend
" === CNTAC 10 end}}}

" {{{=== CNTAC 21 begin

   " Row 9 (Selection)
   syn region      pam_CNTAC21_r9     transparent contained containedin=pam_CNTAC21 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC21_r8     transparent contained containedin=pam_CNTAC21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC21_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC21_r7     transparent contained containedin=pam_CNTAC21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC21_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC21_r6     transparent contained containedin=pam_CNTAC21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC21_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC21_r5     transparent contained containedin=pam_CNTAC21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC21_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC21_r4     transparent contained containedin=pam_CNTAC21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC21_r5 skipnl keepend
   " Row 3
      syn match       pam_CNTAC21_r3_e1             display contained containedin=pam_CNTAC21_r3 "\%31c.\{,10\}"
      syn match       pam_CNTAC21_r3_a1             display contained containedin=pam_CNTAC21_r3 "\%31c\CFORCE     \|STRESS    "
      hi def link pam_CNTAC21_r3_a1 pam_evenArgument
      hi def link pam_CNTAC21_r3_e1 pam_evenError
   syn region      pam_CNTAC21_r3     transparent contained containedin=pam_CNTAC21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@41i5,@46i5x,@51i5x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC21_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC21_r2     transparent contained containedin=pam_CNTAC21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC21_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC21_r1     transparent contained containedin=pam_CNTAC21 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC21_r2 skipnl keepend
syn region      pam_CNTAC21        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}21"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC21_r[0-9] fold keepend
" === CNTAC 21 end}}}

" {{{=== CNTAC 33,34 begin

   " Row 9 (Selection)
   syn region      pam_CNTAC34_r9     transparent contained containedin=pam_CNTAC34 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC34_r8     transparent contained containedin=pam_CNTAC34 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@6f10,@16f10,@46f10,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC34_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC34_r7     transparent contained containedin=pam_CNTAC34 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,@31i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC34_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC34_r6     transparent contained containedin=pam_CNTAC34 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@6i5x,@11i5x,@16i5x,@36i5,@41f10x,@51f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC34_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC34_r5     transparent contained containedin=pam_CNTAC34 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@41i10,@51i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC34_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC34_r4     transparent contained containedin=pam_CNTAC34 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@6f10,@16f10,@26i5,@31f10x,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC34_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC34_r3     transparent contained containedin=pam_CNTAC34 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,@41i5,@61i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC34_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC34_r2     transparent contained containedin=pam_CNTAC34 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC34_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC34_r1     transparent contained containedin=pam_CNTAC34 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC34_r2 skipnl keepend
syn region      pam_CNTAC34        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}\(33\|34\)"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC34_r[0-9] fold keepend
" === CNTAC 33 end}}}

" {{{=== CNTAC 36 begin
   " Row 9 (Selection)
   syn region      pam_CNTAC36_r9     transparent contained containedin=pam_CNTAC36 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC36_r8     transparent contained containedin=pam_CNTAC36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@46f10,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC36_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC36_r7     transparent contained containedin=pam_CNTAC36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC36_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC36_r6     transparent contained containedin=pam_CNTAC36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@6i5x,@11i5x,@16i5x,@31i5,@36i5,@41f10x,@51f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC36_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC36_r5     transparent contained containedin=pam_CNTAC36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@41i10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC36_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC36_r4     transparent contained containedin=pam_CNTAC36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@6f10,@16f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC36_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC36_r3     transparent contained containedin=pam_CNTAC36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,@41i5,@61i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC36_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC36_r2     transparent contained containedin=pam_CNTAC36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC36_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC36_r1     transparent contained containedin=pam_CNTAC36 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC36_r2 skipnl keepend
syn region      pam_CNTAC36        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}36"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC36_r[0-9] fold keepend
" === CNTAC 33 end}}}

" {{{=== CNTAC 37 begin
   " Row 9 (Selection)
   syn region      pam_CNTAC37_r9     transparent contained containedin=pam_CNTAC37 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC37_r8     transparent contained containedin=pam_CNTAC37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC37_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC37_r7     transparent contained containedin=pam_CNTAC37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC37_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC37_r6     transparent contained containedin=pam_CNTAC37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@11i5x,@31i5,@36i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC37_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC37_r5     transparent contained containedin=pam_CNTAC37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41i10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC37_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC37_r4     transparent contained containedin=pam_CNTAC37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@6f10,@31f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC37_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC37_r3     transparent contained containedin=pam_CNTAC37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,@41i5,@61i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC37_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC37_r2     transparent contained containedin=pam_CNTAC37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC37_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC37_r1     transparent contained containedin=pam_CNTAC37 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC37_r2 skipnl keepend
syn region      pam_CNTAC37        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}37"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC37_r[0-9] fold keepend
" === CNTAC 37 end}}}

" {{{=== CNTAC 43 begin

   " Row 9 (Selection)
   syn region      pam_CNTAC43_r9     transparent contained containedin=pam_CNTAC43 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC43_r8     transparent contained containedin=pam_CNTAC43 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC43_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC43_r7     transparent contained containedin=pam_CNTAC43 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC43_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC43_r6     transparent contained containedin=pam_CNTAC43 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11i5x,@36i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC43_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC43_r5     transparent contained containedin=pam_CNTAC43 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41i10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC43_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC43_r4     transparent contained containedin=pam_CNTAC43 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@6f10,@16f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC43_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC43_r3     transparent contained containedin=pam_CNTAC43 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC43_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC43_r2     transparent contained containedin=pam_CNTAC43 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC43_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC43_r1     transparent contained containedin=pam_CNTAC43 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC43_r2 skipnl keepend
syn region      pam_CNTAC43        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}43"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC43_r[1-9] fold keepend
" === CNTAC 43 end}}}

" {{{=== CNTAC 44 begin

   " Row 9 (Selection)
   syn region      pam_CNTAC44_r9     transparent contained containedin=pam_CNTAC44 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC44_r8     transparent contained containedin=pam_CNTAC44 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC44_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC44_r7     transparent contained containedin=pam_CNTAC44 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC44_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC44_r6     transparent contained containedin=pam_CNTAC44 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@11i5x,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC44_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC44_r5     transparent contained containedin=pam_CNTAC44 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC44_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC44_r4     transparent contained containedin=pam_CNTAC44 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@6f10,@16f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC44_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC44_r3     transparent contained containedin=pam_CNTAC44 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC44_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC44_r2     transparent contained containedin=pam_CNTAC44 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC44_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC44_r1     transparent contained containedin=pam_CNTAC44 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC44_r2 skipnl keepend
syn region      pam_CNTAC44        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}44"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC44_r[1-9] fold keepend
" === CNTAC 44 end}}}

" {{{=== CNTAC 46 begin
   " Row 9 (Selection)
   syn region      pam_CNTAC46_r9     transparent contained containedin=pam_CNTAC46 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC46_r8     transparent contained containedin=pam_CNTAC46 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC46_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC46_r7     transparent contained containedin=pam_CNTAC46 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC46_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC46_r6     transparent contained containedin=pam_CNTAC46 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11i5x,@31i5,@36i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC46_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC46_r5     transparent contained containedin=pam_CNTAC46 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41i10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC46_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC46_r4     transparent contained containedin=pam_CNTAC46 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@6f10,@16f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC46_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC46_r3     transparent contained containedin=pam_CNTAC46 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC46_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC46_r2     transparent contained containedin=pam_CNTAC46 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC46_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC46_r1     transparent contained containedin=pam_CNTAC46 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC46_r2 skipnl keepend
syn region      pam_CNTAC46        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}46"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC46_r[1-9] fold keepend
" === CNTAC 46 end}}}

" {{{=== CNTAC 54 begin

   " Row 9 (Selection)
   syn region      pam_CNTAC54_r9     transparent contained containedin=pam_CNTAC54 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC54_r8     transparent contained containedin=pam_CNTAC54 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@46f10,@66f10,@76i5x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC54_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC54_r7     transparent contained containedin=pam_CNTAC54 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC54_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC54_r6     transparent contained containedin=pam_CNTAC54 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@11i5x,@16i5x,@36i5,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC54_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC54_r5     transparent contained containedin=pam_CNTAC54 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@41i10,@51i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC54_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC54_r4     transparent contained containedin=pam_CNTAC54 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@6f10,@16f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC54_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC54_r3     transparent contained containedin=pam_CNTAC54 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,@41i5,@61i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC54_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC54_r2     transparent contained containedin=pam_CNTAC54 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC54_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC54_r1     transparent contained containedin=pam_CNTAC54 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC54_r2 skipnl keepend
syn region      pam_CNTAC54        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}54"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC54_r[1-9] fold keepend
" === CNTAC 54 end}}}

" {{{=== CNTAC 61 begin
   " Row 9 (Selection)
   syn region      pam_CNTAC61_r9     transparent contained containedin=pam_CNTAC61 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC61_r8     transparent contained containedin=pam_CNTAC61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC61_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC61_r7     transparent contained containedin=pam_CNTAC61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC61_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC61_r6     transparent contained containedin=pam_CNTAC61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC61_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC61_r5     transparent contained containedin=pam_CNTAC61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC61_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC61_r4     transparent contained containedin=pam_CNTAC61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@6f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC61_r5 skipnl keepend
   " Row 3
      syn match       pam_CNTAC61_r3_e2             display contained containedin=pam_CNTAC61_r3 "\%41c.\{,10\}"
      syn match       pam_CNTAC61_r3_a2             display contained containedin=pam_CNTAC61_r3 "\%41cPENALTY   \|LAGRANGE  "
      syn match       pam_CNTAC61_r3_v2             display contained containedin=pam_CNTAC61_r3 "\%41c[ ]*\[[^\[]\{-}\]\%51c"
      syn match       pam_CNTAC61_r3_v2             display contained containedin=pam_CNTAC61_r3 "\%41c[ ]*<[^<]\{-}>\%51c"
      hi def link pam_CNTAC61_r3_a2 pam_oddArgument
      hi def link pam_CNTAC61_r3_v2 pam_oddVar
      hi def link pam_CNTAC61_r3_e2 pam_oddError
      syn match       pam_CNTAC61_r3_e1             display contained containedin=pam_CNTAC61_r3 "\%1c.\{,10\}"
      syn match       pam_CNTAC61_r3_a1             display contained containedin=pam_CNTAC61_r3 "\%1cSPHERE    \|CYLINDER  \|PLANE     "
      syn match       pam_CNTAC61_r3_v1             display contained containedin=pam_CNTAC61_r3 "\%1c[ ]*\[[^\[]\{-}\]\%11c"
      syn match       pam_CNTAC61_r3_v1             display contained containedin=pam_CNTAC61_r3 "\%1c[ ]*<[^<]\{-}>\%11c"
      hi def link pam_CNTAC61_r3_a1 pam_oddArgument
      hi def link pam_CNTAC61_r3_v1 pam_oddVar
      hi def link pam_CNTAC61_r3_e1 pam_oddError
   syn region      pam_CNTAC61_r3     transparent contained containedin=pam_CNTAC61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11i10,@21f10,@31i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC61_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC61_r2     transparent contained containedin=pam_CNTAC61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC61_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC61_r1     transparent contained containedin=pam_CNTAC61 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC61_r2 skipnl keepend
syn region      pam_CNTAC61        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{6\}61"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC61_r[1-9] fold keepend
" === CNTAC 61 end}}}

" {{{=== CNTAC 154 begin

   " Row 9 (Selection)
   syn region      pam_CNTAC154_r9     transparent contained containedin=pam_CNTAC154 start="\%1c." matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 8
   syn region      pam_CNTAC154_r8     transparent contained containedin=pam_CNTAC154 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@56f10,@66f10,@76i5x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC154_r9 skipnl keepend
   " Row 7
   syn region      pam_CNTAC154_r7     transparent contained containedin=pam_CNTAC154 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC154_r8 skipnl keepend
   " Row 6 
   syn region      pam_CNTAC154_r6     transparent contained containedin=pam_CNTAC154 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@16i5x,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC154_r7 skipnl keepend
   " Row 5
   syn region      pam_CNTAC154_r5     transparent contained containedin=pam_CNTAC154 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@51i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC154_r6 skipnl keepend
   " Row 4
   syn region      pam_CNTAC154_r4     transparent contained containedin=pam_CNTAC154 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@6f10,@16f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC154_r5 skipnl keepend
   " Row 3
   syn region      pam_CNTAC154_r3     transparent contained containedin=pam_CNTAC154 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@31f10,@41i5,@46i5x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC154_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_CNTAC154_r2     transparent contained containedin=pam_CNTAC154 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTAC154_r3 skipnl keepend
   " Row 1
   syn region      pam_CNTAC154_r1     transparent contained containedin=pam_CNTAC154 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTAC154_r2 skipnl keepend
syn region      pam_CNTAC154        matchgroup=pam_CardTag start="^\CCNTAC / .\{8\}[ ]\{5\}154"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CNTAC154_r[1-9] fold keepend
" === CNTAC 154 end}}}

" {{{=== CNTPTY begin
   syn match      pam_End_CNTPTY   "\CEND_CNTPTY"
   hi link pam_End_CNTPTY pam_CardTag
   syn region      pam_CNTPTY_r3     transparent contained containedin=pam_CNTPTY start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_End_CNTPTY keepend
      syn region pam_CNTPTY_r3_CONDUCTANCE   contained containedin=pam_CNTPTY_r3 matchgroup=pam_HeaderKW start="\CCONDUCTANCE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_CNTPTY_r3_CONDUCTANCE_arg,pam_Continue,pam_Float keepend
         syn keyword pam_CNTPTY_r3_CONDUCTANCE_arg contained containedin=pam_CNTPTY_r3_CONDUCTANCE GAP CONSTANT
         hi link pam_CNTPTY_r3_CONDUCTANCE_arg pam_Argument
   syn region      pam_CNTPTY_r2     transparent contained containedin=pam_CNTPTY start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CNTPTY_r3 skipnl keepend
   syn region      pam_CNTPTY_r1     transparent contained containedin=pam_CNTPTY start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CNTPTY_r2,pam_CNTPTY_r3 skipnl keepend
syn region      pam_CNTPTY        matchgroup=pam_CardTag start="^\CCNTPTY/" end="^\CEND_CNTPTY" contains=pam_CNTPTY_r[1-4] fold keepend
" === CNTPTY end}}}

" {{{=== SECFO Typ PLANE begin
   " Row 4 (Node Selection)
   syn region      pam_SECFO_PLANE_r4     transparent contained containedin=pam_SECFO_PLANE start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn region      pam_SECFO_PLANE_r3     transparent contained containedin=pam_SECFO_PLANE start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SECFO_PLANE_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_SECFO_PLANE_r2     transparent contained containedin=pam_SECFO_PLANE start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SECFO_PLANE_r3 skipnl keepend
   " Row 1
      " NTYP
      syn match       pam_SECFO_PLANE_r1_e2             display contained containedin=pam_SECFO_PLANE_r1 "\%17c.\{,8\}"
      syn match       pam_SECFO_PLANE_r1_a2             display contained containedin=pam_SECFO_PLANE_r1 "\%17c\CPLANE   "
   syn region      pam_SECFO_PLANE_r1     transparent contained containedin=pam_SECFO_PLANE start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SECFO_PLANE_r2 skipnl keepend
syn region      pam_SECFO_PLANE                matchgroup=pam_CardTag start="^\CSECFO / .\{8\}PLANE   "rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SECFO_PLANE_r[1-4] fold keepend

hi def link pam_SECFO_PLANE_r1_a2 pam_evenArgument
hi def link pam_SECFO_PLANE_r1_v2 pam_evenVar
hi def link pam_SECFO_PLANE_r1_e2 pam_evenError
" === SECFO Typ PLANE end}}}

" {{{=== SECFO Typ DETECT begin
   " Row 4 (Node Selection)
   syn region      pam_SECFO_DETECT_r4     transparent contained containedin=pam_SECFO_DETECT start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn region      pam_SECFO_DETECT_r3     transparent contained containedin=pam_SECFO_DETECT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SECFO_DETECT_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_SECFO_DETECT_r2     transparent contained containedin=pam_SECFO_DETECT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SECFO_DETECT_r3 skipnl keepend
   " Row 1
      " NTYP
      syn match       pam_SECFO_DETECT_r1_e2             display contained containedin=pam_SECFO_DETECT_r1 "\%17c.\{,8\}"
      syn match       pam_SECFO_DETECT_r1_a2             display contained containedin=pam_SECFO_DETECT_r1 "\%17c\CDETECT  "
   syn region      pam_SECFO_DETECT_r1     transparent contained containedin=pam_SECFO_DETECT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SECFO_DETECT_r2 skipnl keepend
syn region      pam_SECFO_DETECT                matchgroup=pam_CardTag start="^\CSECFO / .\{8\}DETECT  "rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SECFO_DETECT_r[1-4] fold keepend

hi def link pam_SECFO_DETECT_r1_a2 pam_evenArgument
hi def link pam_SECFO_DETECT_r1_v2 pam_evenVar
hi def link pam_SECFO_DETECT_r1_e2 pam_evenError
" === SECFO Typ DETECT end}}}

" {{{=== SECFO Typ LINK,CONTACT,SECTION,SUPPORT,CONT_MS  begin
   " Row 3 (Node Selection)
   syn region      pam_SECFO_LINK_r3     transparent contained containedin=pam_SECFO_LINK start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 2 (Name)
   syn region      pam_SECFO_LINK_r2     transparent contained containedin=pam_SECFO_LINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SECFO_LINK_r3 skipnl keepend
   " Row 1
      " NTYP
      syn match       pam_SECFO_LINK_r1_e2             display contained containedin=pam_SECFO_LINK_r1 "\%17c.\{,8\}"
      syn match       pam_SECFO_LINK_r1_a2             display contained containedin=pam_SECFO_LINK_r1 "\%17c\CCONTACT \|\CLINK    \|\CSECTION \|\CSUPPORT \|\CCONT_MS "
   syn region      pam_SECFO_LINK_r1     transparent contained containedin=pam_SECFO_LINK start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SECFO_LINK_r2 skipnl keepend
syn region      pam_SECFO_LINK                matchgroup=pam_CardTag start="^\CSECFO / .\{8\}\(\CCONTACT \|\CLINK    \|\CSECTION \|\CSUPPORT \|\CCONT_MS \)"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SECFO_LINK_r[1-3] fold keepend

hi def link pam_SECFO_LINK_r1_a2 pam_evenArgument
hi def link pam_SECFO_LINK_r1_v2 pam_evenVar
hi def link pam_SECFO_LINK_r1_e2 pam_evenError
" === SECFO Typ LINK,CONTACT,SECTION,SUPPORT,CONT_MS end}}}

" {{{=== SECFO Typ VOLFRAC begin
   " Row 3 (Node Selection)
   syn region      pam_SECFO_VOLFRAC_r4     transparent contained containedin=pam_SECFO_VOLFRAC start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn keyword     pam_SECFO_VOLFRAC_r3_arg CSDM DDM
   hi def link pam_SECFO_VOLFRAC_r3_arg pam_Argument
   syn region      pam_SECFO_VOLFRAC_r3     transparent contained containedin=pam_SECFO_VOLFRAC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_SECFO_VOLFRAC_r3_arg,pam_Float,Comment,pam_Comment_Position,pam_Error nextgroup=pam_SECFO_VOLFRAC_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_SECFO_VOLFRAC_r2     transparent contained containedin=pam_SECFO_VOLFRAC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SECFO_VOLFRAC_r3 skipnl keepend
   " Row 1
      " NTYP
      syn match       pam_SECFO_VOLFRAC_r1_e2             display contained containedin=pam_SECFO_VOLFRAC_r1 "\%17c.\{,8\}"
      syn match       pam_SECFO_VOLFRAC_r1_a2             display contained containedin=pam_SECFO_VOLFRAC_r1 "\%17c\CVOLFRAC "
   syn region      pam_SECFO_VOLFRAC_r1     transparent contained containedin=pam_SECFO_VOLFRAC start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SECFO_VOLFRAC_r2 skipnl keepend
syn region      pam_SECFO_VOLFRAC                matchgroup=pam_CardTag start="^\CSECFO / .\{8\}\CVOLFRAC "rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SECFO_VOLFRAC_r[1-3] fold keepend

hi def link pam_SECFO_VOLFRAC_r1_a2 pam_evenArgument
hi def link pam_SECFO_VOLFRAC_r1_e2 pam_evenError
" === SECFO Typ VOLFRAC end}}}

" {{{=== CONLO begin
   "Row 3 (Name)
   " Node Selection
   syn region      pam_CONLO_r4     transparent contained containedin=pam_CONLO start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   syn region      pam_CONLO_r3     transparent contained containedin=pam_CONLO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CONLO_r4 skipnl keepend
   syn region      pam_CONLO_r2     transparent contained containedin=pam_CONLO start="^        " start="^$\n" end="\n[\$\#]\@!" contains=@9f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CONLO_r3 skipnl keepend
   syn region      pam_CONLO_r1     transparent contained containedin=pam_CONLO start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33f8,@41i8,@49i8,@57i8,@65f16x,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CONLO_r2,pam_CONLO_r3 skipnl keepend
syn region      pam_CONLO        matchgroup=pam_CardTag start="^\CCONLO /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_CONLO_r[1-4] fold keepend
" === CONLO end}}}

" {{{ === INVEL begin
   "Row 3
   syn region      pam_INVEL_r3     transparent contained containedin=pam_INVEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25f8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_INVEL_r4 skipnl keepend
   " Row 4 (Node Selection)
   syn region      pam_INVEL_r4     transparent contained containedin=pam_INVEL start="\%1c.\(       \u\)\@=" start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_INVEL_r2     transparent contained containedin=pam_INVEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_INVEL_r3,pam_INVEL_r4 skipnl keepend
   "Row 1
   syn region      pam_INVEL_r1     transparent contained containedin=pam_INVEL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65i8,@73i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_INVEL_r2 skipnl keepend
syn region      pam_INVEL           matchgroup=pam_CardTag start="^\CINVEL /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_INVEL_r[1-4] fold keepend
"===INVEL end}}}

" {{{ === FUNCT begin
   "Row 3
   syn region      pam_FUNCT_r3     transparent contained containedin=pam_FUNCT start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@17f16dim,@33f16dim,@49f16dim,pam_Comment,pam_Comment_Position,pam_End nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 3 Distance
   syn region      pam_FUNCT_r3d    transparent contained containedin=pam_FUNCT matchgroup=pam_Argument start="^        DISTA   " start="^$\n" end="\n[\$\#]\@!" contains=@17i8,@25i8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FUNCT_r3 skipnl keepend
   syn region      pam_FUNCT_r3a    transparent contained containedin=pam_FUNCT matchgroup=pam_Argument start="^        ANGLE   " start="^$\n" end="\n[\$\#]\@!" contains=@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FUNCT_r3 skipnl keepend
   "Row 2 (Name)
   syn region      pam_FUNCT_r2     transparent contained containedin=pam_FUNCT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_FUNCT_r3d,pam_FUNCT_r3a,pam_FUNCT_r3 skipnl keepend
   "Row 1
      " EPYFUN
      syn match       pam_FUNCT_r1_a1  display contained containedin=pam_FUNCT_r1 "\%17c  EPYFUN"
      " ICOMP
      hi def link pam_FUNCT_r1_a1 pam_evenArgument
   syn region      pam_FUNCT_r1     transparent contained containedin=pam_FUNCT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,@41f8,@49f8,@57i8,@65i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FUNCT_r2 skipnl keepend
syn region      pam_FUNCT                matchgroup=pam_CardTag start="^\CFUNCT /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FUNCT_r[1-3] fold keepend
"===FUNCT end}}}

" {{{ === FUNCSW begin
   syn match       pam_EndFUNCSW        display contained "^\CEND_FUNCSW"
   hi def link pam_EndFUNCSW  pam_CardTag
   "Row 3 
   syn region      pam_FUNCSW_r3     transparent contained containedin=pam_FUNCSW start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,pam_Comment,pam_Comment_Position,pam_Error,pam_EndFUNCSW nextgroup=pam_FUNCSW_r3,pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndFUNCSW skipnl keepend
   "Row 2 (Name)
   syn region      pam_FUNCSW_r2     transparent contained containedin=pam_FUNCSW start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_FUNCSW_r3 skipnl keepend
   "Row 1
   syn region      pam_FUNCSW_r1     transparent contained containedin=pam_FUNCSW start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FUNCSW_r2 skipnl keepend
syn region      pam_FUNCSW                matchgroup=pam_CardTag start="^\CFUNCSW/" end="^END_FUNCSW" contains=pam_FUNCSW_r[1-3] fold keepend
"===FUNCSW end}}}

"{{{=== NSMAS/NSMAS2 begin
   " Row 3 (Node Selection)
   syn region      pam_NSMAS_r3     transparent contained containedin=pam_NSMAS start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_NSMAS_r2     transparent contained containedin=pam_NSMAS start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_NSMAS_r3 skipnl keepend
   " Row 1
   syn region      pam_NSMAS_r1     transparent contained containedin=pam_NSMAS start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f16,@33f16,@49f16,@65f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_NSMAS_r2 skipnl keepend
syn region      pam_NSMAS          matchgroup=pam_CardTag start="^\CNSMAS[ 2]/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_NSMAS_r[1-3] fold keepend
"=== NSMAS end}}}

"{{{=== TIED begin
   " Row 3 (Node Selection)
   syn region      pam_TIED_r3     transparent contained containedin=pam_TIED start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_TIED_r2     transparent contained containedin=pam_TIED start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TIED_r3 skipnl keepend
   "Row 1
   syn region      pam_TIED_r1     transparent contained containedin=pam_TIED start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TIED_r2 skipnl keepend
syn region      pam_TIED          matchgroup=pam_CardTag start="^\CTIED  /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_TIED_r[1-3] fold keepend
"=== TIED end}}}

"{{{=== NODCO begin
   " Row 3 (Node Selection)
   syn region      pam_NODCO_r3     transparent contained containedin=pam_NODCO start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_NODCO_r2     transparent contained containedin=pam_NODCO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_NODCO_r3 skipnl keepend
   "Row 1
   syn region      pam_NODCO_r1     transparent contained containedin=pam_NODCO start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_NODCO_r2 skipnl keepend
syn region      pam_NODCO          matchgroup=pam_CardTag start="^\CNODCO /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_NODCO_r[1-3] fold keepend
"=== NODCO end}}}

"{{{=== LINCO begin
   " Row 3 
   syn region      pam_LINCO_r3     transparent contained containedin=pam_LINCO start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@9i8,@17i8,@25f8,@33i8,pam_Comment,pam_Comment_Position,pam_End,pam_Error keepend
   "Row 2 (Name)
   syn region      pam_LINCO_r2     transparent contained containedin=pam_LINCO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_LINCO_r3 skipnl keepend
   "Row 1
      syn match       pam_LINCO_r1_e1             display contained containedin=pam_LINCO_r1 "\%17c.\{,8\}"
      syn match       pam_LINCO_r1_a1             display contained containedin=pam_LINCO_r1 "\%17c\CSTRUCT  \|ACOUST  \|THERM   "
      syn match       pam_LINCO_r1_v1             display contained containedin=pam_LINCO_r1 "\%17c[ ]*\[[^\[]\{-}\]\%25c"
      syn match       pam_LINCO_r1_v1             display contained containedin=pam_LINCO_r1 "\%17c[ ]*<[^<]\{-}>\%25c"
      hi def link pam_LINCO_r1_a1 pam_evenArgument
      hi def link pam_LINCO_r1_v1 pam_evenVar
      hi def link pam_LINCO_r1_e1 pam_evenError
   syn region      pam_LINCO_r1     transparent contained containedin=pam_LINCO start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_LINCO_r2 skipnl keepend
syn region      pam_LINCO          matchgroup=pam_CardTag start="^\CLINCO /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_LINCO_r[1-5] fold keepend
"=== LINCO end}}}

"{{{=== MTOCO  begin
   " Common
   syn match       pam_MTOCO_r1_e1             display contained containedin=pam_MTOCO_r1,pam_MTOCO1_r1 "\%27c.\{,6\}\%33c"
   syn match       pam_MTOCO_r1_a1             display contained containedin=pam_MTOCO_r1,pam_MTOCO1_r1 "\%27c[ 01]\{6\}\%33c"
   hi def link pam_MTOCO_r1_e1 pam_oddError
   hi def link pam_MTOCO_r1_a1 pam_oddArgument
   " Row 3 (Node Selection)
   syn region      pam_MTOCO_r3     transparent contained containedin=pam_MTOCO start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_MTOCO_r2     transparent contained containedin=pam_MTOCO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_MTOCO_r3 skipnl keepend
   "Row 1
   syn region      pam_MTOCO_r1     transparent contained containedin=pam_MTOCO start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@33i8,@41i8,@49i8,@57f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MTOCO_r2 skipnl keepend
syn region      pam_MTOCO          matchgroup=pam_CardTag start="^\CMTOCO /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_MTOCO_r[1-3] fold keepend

   "Row 4 (Node Selection)
   syn region      pam_MTOCO1_r4     transparent contained containedin=pam_MTOCO1 start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 3
   syn region      pam_MTOCO1_r3     transparent contained containedin=pam_MTOCO1 matchgroup=pam_evenArgument start="\%1c       1" start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MTOCO1_r4 skipnl keepend
   syn region      pam_MTOCO1_r3     transparent contained containedin=pam_MTOCO1 matchgroup=pam_evenArgument start="\%1c       [ 0]" start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@65i8,@73i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MTOCO1_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_MTOCO1_r2     transparent contained containedin=pam_MTOCO1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_MTOCO1_r3 skipnl keepend
   "Row 1
   syn region      pam_MTOCO1_r1     transparent contained containedin=pam_MTOCO1 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@33i8,@41i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MTOCO1_r2 skipnl keepend
syn region      pam_MTOCO1         matchgroup=pam_CardTag start="^\CMTOCO / .\{39\}1"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_MTOCO1_r[1-3] fold keepend
"=== MTOCO end}}}

"{{{=== OTMCO begin
   " END_OTMCO
   syn match       pam_EndOTMCO        display contained "^\CEND_OTMCO"
   hi def link pam_EndOTMCO pam_CardTag
   " Row 3 (Node Selection)
      syn match       pam_OTMCO_r3_a1             display contained containedin=pam_OTMCO_r3 "\%9cWEIGHT"
      hi def link pam_OTMCO_r3_a1 pam_oddArgument
   syn region      pam_OTMCO_r3     transparent contained containedin=pam_OTMCO start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error,pam_Float,pam_EndOTMCO nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndOTMCO keepend
   "Row 2 (Name)
   syn region      pam_OTMCO_r2     transparent contained containedin=pam_OTMCO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_OTMCO_r3 skipnl keepend
   "Row 1
      syn match       pam_OTMCO_r1_e1             display contained containedin=pam_OTMCO_r1 "\%27c.\{,6\}"
      syn match       pam_OTMCO_r1_a1             display contained containedin=pam_OTMCO_r1 "\%27c[ 01]\{6\}"
   syn region      pam_OTMCO_r1     transparent contained containedin=pam_OTMCO start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@33i8,@41f8,@49i8,@57i8,@65f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_OTMCO_r2 skipnl keepend
syn region      pam_OTMCO          matchgroup=pam_CardTag start="^\COTMCO /" end="^\CEND_OTMCO" contains=pam_OTMCO_r[1-3] fold keepend
hi def link pam_OTMCO_r1_a1 pam_oddArgument
hi def link pam_OTMCO_r1_e1 pam_oddError
"=== OTMCO end}}}

"{{{=== CDATA (dummy) begin
syn region      pam_CDATA            matchgroup=pam_CardTag start="^\CCDATA /" end="^\CEND_CDATA" contains=pam_Comment,pam_Comment_Position fold keepend
"=== CDATA end}}}

"{{{=== SECURE begin
syn region      pam_SECURE          transparent matchgroup=pam_CardTag start="^SECURE/" end="^END_SECURE" contains=pam_Secure fold keepend
"=== SECURE end}}}

"{{{=== VARDEF begin
   syn match       pam_EndVARDEF        display contained "^\CEND_VARDEF"
   hi def link pam_EndVARDEF  pam_CardTag
   " Row 3
   syn region      pam_VARDEF_r3     transparent contained containedin=pam_VARDEF matchgroup=pam_oddArgument start="^\CSTATIC  " start="^$\n" end="\n[\$\#]\@!" contains=pam_String,pam_FreeVar,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndVARDEF skipnl keepend
   " Row 2 (Name)
   syn region      pam_VARDEF_r2     transparent contained containedin=pam_VARDEF start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_VARDEF_r3 skipnl keepend
   syn match       pam_VARDEF_r1_a2             display contained containedin=pam_VARDEF_r1 "\%25c[ ]*\[[^\[]\{-}\]\%<81c"
   hi def link pam_VARDEF_r1_a2 pam_oddVar
   syn match       pam_VARDEF_r1_a1             display contained containedin=pam_VARDEF_r1 "\%17c.\{8\}"
   hi def link pam_VARDEF_r1_a1 pam_evenArgument
   " Row 1
   syn region      pam_VARDEF_r1     transparent contained containedin=pam_VARDEF start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VARDEF_r2 skipnl keepend
syn region      pam_VARDEF          matchgroup=pam_CardTag start="^\CVARDEF/" end="^\CEND_VARDEF" contains=pam_VARDEF_r[1-3] fold keepend
"=== VARDEF end}}}

"{{{=== CDATA begin
   " END_CDATA
   syn region      pam_CDATA_r3     transparent contained containedin=pam_CDATA start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=pam_Comment,pam_Comment_Position,pam_Source nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndCDATA keepend
   " Row 2 (Name)
   syn region      pam_CDATA_r2     transparent contained containedin=pam_CDATA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_CDATA_r3,pam_EndCDATA skipnl keepend
   " Row 1
   syn region      pam_CDATA_r1     transparent contained containedin=pam_CDATA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_FreeVar,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_CDATA_r2 skipnl keepend
syn region      pam_CDATA          matchgroup=pam_CardTag start="^\CCDATA /" end="^\CEND_CDATA" contains=pam_CDATA_r[1-3] fold keepend
   syn match       pam_EndCDATA        display contained "^\CEND_CDATA"
   hi def link pam_EndCDATA pam_CardTag
"=== CDATA end}}}

"{{{=== UDATA begin
   " END_UDATA
      syn match       pam_UDATA_r3_e1  display contained containedin=pam_UDATA_r3 "\%9c.\{,8\}"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%9c[ ]\{8\}"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%9c[ ]*\CNODE[ ]*\%17c"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%9c[ ]*\CIPARAM[ ]*\%17c"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%9c[ ]*\CRPARAM[ ]*\%17c"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%9c[ ]*\CCPARAM[ ]*\%17c"
      syn match       pam_UDATA_r3_e1  display contained containedin=pam_UDATA_r3 "\%25c.\{,8\}"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%25c[ ]\{8\}"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%25c[ ]*\CCOO[ ]*\%33c"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%25c[ ]*\CDIS[ ]*\%33c"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%25c[ ]*\CVEL[ ]*\%33c"
      syn match       pam_UDATA_r3_a1  display contained containedin=pam_UDATA_r3 "\%25c[ ]*\CACC[ ]*\%33c"
      hi def link pam_UDATA_r3_a1  pam_oddArgument
      hi def link pam_UDATA_r3_e1  pam_oddError
   syn region      pam_UDATA_r3     transparent contained containedin=pam_UDATA start="\%1c." start="^$\n" end="\n[\$\#]\@!" matchgroup=pam_CardTag end="\%$" contains=@17f8,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_UDATA_r3,pam_End keepend
   " Row 2 (Name)
   syn region      pam_UDATA_r2     transparent contained containedin=pam_UDATA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_UDATA_r3 skipnl keepend
   " Row 1
      syn match       pam_UDATA_r1_e1  display contained containedin=pam_UDATA_r1 "\%41c.\{,8\}"
      syn match       pam_UDATA_r1_a1  display contained containedin=pam_UDATA_r1 "\%41c[ ]\{8\}"
      syn match       pam_UDATA_r1_a1  display contained containedin=pam_UDATA_r1 "\%41c[ ]*\CCURVE[ ]*\%49c"
      hi def link pam_UDATA_r1_a1  pam_oddArgument
      hi def link pam_UDATA_r1_e1  pam_oddError
   syn region      pam_UDATA_r1     transparent contained containedin=pam_UDATA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@49i8,@65i8,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_UDATA_r2 skipnl keepend
syn region      pam_UDATA          matchgroup=pam_CardTag start="^\CUDATA /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_UDATA_r[1-3] fold keepend
"=== UDATA end}}}

"{{{=== PYVAR begin
   syn include @pam_Python syntax/python.vim
   " END_PYVAR
   syn region      pam_PYVAR_r3     transparent contained containedin=pam_PYVAR start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=pam_Comment,pam_Comment_Position,@pam_Python nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPYVAR keepend
   " Row 2 (Name)
   syn region      pam_PYVAR_r2     transparent contained containedin=pam_PYVAR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PYVAR_r3,pam_EndPYVAR skipnl keepend
   " Row 1
   syn region      pam_PYVAR_r1     transparent contained containedin=pam_PYVAR start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Continue,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PYVAR_r2 skipnl keepend
syn region      pam_PYVAR          matchgroup=pam_CardTag start="^\CPYVAR /" end="^\CEND_PYVAR" contains=pam_PYVAR_r[1-3] fold keepend
   syn match       pam_EndPYVAR        display contained "^\CEND_PYVAR"
   hi def link pam_EndPYVAR pam_CardTag
"=== PYVAR end}}}

" {{{=== PART X begin
   " Row 2 (Name)
   syn region      pam_PARTX_r2     transparent contained containedin=pam_PARTX start="\%1c." start="^$\n" end="\%$" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 1
   syn region      pam_PARTX_r1     transparent contained containedin=pam_PARTX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PARTX_r2 skipnl keepend
syn region      pam_PARTX        matchgroup=pam_CardTag start="^\CPART  /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PARTX_r[1-9] fold keepend
" === PART X end}}}

"{{{=== PART Typ SPHEL begin
   " Row 6
   syn region      pam_PART_SPHEL_r6     transparent contained containedin=pam_PART_SPHEL start="\%1c[^E]" start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SPHEL_r6,pam_EndPart skipnl keepend
   " Row 5
   syn region      pam_PART_SPHEL_r5     transparent contained containedin=pam_PART_SPHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41i5,@46i5x,@51f10x,@61f10x,@71i5x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SPHEL_r6 skipnl keepend
   " Row 4
   syn region      pam_PART_SPHEL_r4     transparent contained containedin=pam_PART_SPHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SPHEL_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_SPHEL_r3     transparent contained containedin=pam_PART_SPHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SPHEL_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_SPHEL_r2     transparent contained containedin=pam_PART_SPHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_SPHEL_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_SPHEL_r2a    transparent contained containedin=pam_PART_SPHEL start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_SPHEL_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_SPHEL_r1_a2             display contained containedin=pam_PART_SPHEL_r1 "\%17c[ ]*SPHEL[ ]*\%25c"
   syn region      pam_PART_SPHEL_r1     transparent contained containedin=pam_PART_SPHEL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SPHEL_r2a,pam_PART_SPHEL_r2 skipnl keepend
syn region      pam_PART_SPHEL     matchgroup=pam_CardTag start="^\CPART  / .\{8\}[ ]*SPHEL[ ]*\%25c"rs=s+8 end="^\CEND_PART" contains=pam_PART_SPHEL_r[1-6] fold keepend

hi def link pam_PART_SPHEL_r1_a2 pam_evenArgument
"=== PART Typ SPHEL end}}}

"{{{=== PART Typ BSHEL begin
   " Row 6
   syn region      pam_PART_BSHEL_r5     transparent contained containedin=pam_PART_BSHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_BSHEL_r4     transparent contained containedin=pam_PART_BSHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BSHEL_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_BSHEL_r3     transparent contained containedin=pam_PART_BSHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BSHEL_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_BSHEL_r2     transparent contained containedin=pam_PART_BSHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_BSHEL_r3 skipnl keepend
   " Row 2a (RMAT)
   syn region      pam_PART_BSHEL_r2a    transparent contained containedin=pam_PART_BSHEL start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_BSHEL_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_BSHEL_r1_a2             display contained containedin=pam_PART_BSHEL_r1 "\%17c[ ]*BSHEL[ ]*\%25c"
   syn region      pam_PART_BSHEL_r1     transparent contained containedin=pam_PART_BSHEL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BSHEL_r2a,pam_PART_BSHEL_r2 skipnl keepend
syn region      pam_PART_BSHEL     matchgroup=pam_CardTag start="^\CPART  / .\{8\}[ ]*BSHEL[ ]*\%25c"rs=s+8 end="^\CEND_PART" contains=pam_PART_BSHEL_r[1-6] fold keepend

hi def link pam_PART_BSHEL_r1_a2 pam_evenArgument
"=== PART Typ BSHEL end}}}

"{{{=== PART Typ COS3D begin
   " Row 5
   syn region      pam_PART_COS3D_r5     transparent contained containedin=pam_PART_COS3D start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,@31f10,@41f10,@51i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_COS3D_r4     transparent contained containedin=pam_PART_COS3D start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_COS3D_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_COS3D_r3     transparent contained containedin=pam_PART_COS3D start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_COS3D_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_COS3D_r2     transparent contained containedin=pam_PART_COS3D start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_COS3D_r3 skipnl keepend
   " Row 2a (RMAT)
   syn region      pam_PART_COS3D_r2a    transparent contained containedin=pam_PART_COS3D start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_COS3D_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_COS3D_r1_a2             display contained containedin=pam_PART_COS3D_r1 "\%17c[ ]*COS3D[ ]*\%25c"
   syn region      pam_PART_COS3D_r1     transparent contained containedin=pam_PART_COS3D start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_COS3D_r2a,pam_PART_COS3D_r2 skipnl keepend
syn region      pam_PART_COS3D     matchgroup=pam_CardTag start="^\CPART  / .\{8\}[ ]*COS3D[ ]*\%25c"rs=s+8 end="^\CEND_PART" contains=pam_PART_COS3D_r[1-6] fold keepend

hi def link pam_PART_COS3D_r1_a2 pam_evenArgument
"=== PART Typ COS3D end}}}

"{{{=== PART Typ SOLID/TETRA begin
   " Row 6
   syn region      pam_PART_SOLID_r6     transparent contained containedin=pam_PART_SOLID start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 5
   syn region      pam_PART_SOLID_r5     transparent contained containedin=pam_PART_SOLID start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SOLID_r6 skipnl keepend
   " Row 4
   syn region      pam_PART_SOLID_r4     transparent contained containedin=pam_PART_SOLID start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SOLID_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_SOLID_r3     transparent contained containedin=pam_PART_SOLID start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SOLID_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_SOLID_r2     transparent contained containedin=pam_PART_SOLID start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_SOLID_r3 skipnl keepend
   " Row 2a (RMAT)
   syn region      pam_PART_SOLID_r2a    transparent contained containedin=pam_PART_SOLID start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_SOLID_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_SOLID_r1_a2             display contained containedin=pam_PART_SOLID_r1 "\%17c[ ]*SOLID[ ]*\%25c"
      syn match       pam_PART_SOLID_r1_a2             display contained containedin=pam_PART_SOLID_r1 "\%17c[ ]*TETRA[ ]*\%25c"
   syn region      pam_PART_SOLID_r1     transparent contained containedin=pam_PART_SOLID start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SOLID_r2a,pam_PART_SOLID_r2 skipnl keepend
syn region      pam_PART_SOLID     matchgroup=pam_CardTag start="^\CPART  / .\{8\}[ ]*SOLID[ ]*\%25c"rs=s+8 end="^\CEND_PART" contains=pam_PART_SOLID_r[1-6] fold keepend
syn region      pam_PART_SOLID     matchgroup=pam_CardTag start="^\CPART  / .\{8\}[ ]*TETRA[ ]*\%25c"rs=s+8 end="^\CEND_PART" contains=pam_PART_SOLID_r[1-6] fold keepend

hi def link pam_PART_SOLID_r1_a2 pam_evenArgument
"=== PART Typ SOLID end}}}

"{{{=== PART Typ SHELL begin
" Row 6
syn region      pam_PART_SHELL_r6     transparent contained containedin=pam_PART_SHELL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
" Row 5
syn region      pam_PART_SHELL_r5     transparent contained containedin=pam_PART_SHELL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i5,@16f10,@26i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SHELL_r6 skipnl keepend
" Row 4
syn region      pam_PART_SHELL_r4     transparent contained containedin=pam_PART_SHELL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SHELL_r5 skipnl keepend
" Row 3
syn region      pam_PART_SHELL_r3     transparent contained containedin=pam_PART_SHELL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SHELL_r4 skipnl keepend
" Row 2 (Name)
syn region      pam_PART_SHELL_r2     transparent contained containedin=pam_PART_SHELL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_SHELL_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_SHELL_r2a    transparent contained containedin=pam_PART_SHELL start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_SHELL_r2 skipnl keepend
" Row 1
" ATYPE
syn match       pam_PART_SHELL_r1_a2             display contained containedin=pam_PART_SHELL_r1 "\%17c\CSHELL   \| \CSHELL  \|  \CSHELL \|   \CSHELL"
syn region      pam_PART_SHELL_r1     transparent contained containedin=pam_PART_SHELL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SHELL_r2a,pam_PART_SHELL_r2 skipnl keepend
syn region      pam_PART_SHELL     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CSHELL   \| \CSHELL  \|  \CSHELL \|   \CSHELL\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_SHELL_r[1-6] fold keepend

hi def link pam_PART_SHELL_r1_a2 pam_evenArgument
hi def link pam_PART_SHELL_r1_v2 pam_evenVar
hi def link pam_PART_SHELL_r1_e2 pam_evenError
"=== PART Typ SOLID end}}}

"{{{=== PART Typ MEMBR begin
" Row 6
syn region      pam_PART_MEMBR_r7     transparent contained containedin=pam_PART_MEMBR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
syn region      pam_PART_MEMBR_r6     transparent contained containedin=pam_PART_MEMBR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5x,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_MEMBR_r7 skipnl keepend
" Row 5
syn region      pam_PART_MEMBR_r5     transparent contained containedin=pam_PART_MEMBR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_MEMBR_r6 skipnl keepend
" Row 4
syn region      pam_PART_MEMBR_r4     transparent contained containedin=pam_PART_MEMBR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_MEMBR_r5 skipnl keepend
" Row 3
syn region      pam_PART_MEMBR_r3     transparent contained containedin=pam_PART_MEMBR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_MEMBR_r4 skipnl keepend
" Row 2 (Name)
syn region      pam_PART_MEMBR_r2     transparent contained containedin=pam_PART_MEMBR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_MEMBR_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_MEMBR_r2a    transparent contained containedin=pam_PART_MEMBR start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_MEMBR_r2 skipnl keepend
" Row 1
" ATYPE
syn match       pam_PART_MEMBR_r1_a2             display contained containedin=pam_PART_MEMBR_r1 "\%17c\CMEMBR   \| \CMEMBR  \|  \CMEMBR \|   \CMEMBR"
syn region      pam_PART_MEMBR_r1     transparent contained containedin=pam_PART_MEMBR start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_MEMBR_r2a,pam_PART_MEMBR_r2 skipnl keepend
syn region      pam_PART_MEMBR     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CMEMBR   \| \CMEMBR  \|  \CMEMBR \|   \CMEMBR\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_MEMBR_r[1-7] fold keepend

hi def link pam_PART_MEMBR_r1_a2 pam_evenArgument
hi def link pam_PART_MEMBR_r1_v2 pam_evenVar
hi def link pam_PART_MEMBR_r1_e2 pam_evenError
"=== PART Typ SOLID end}}}

"{{{=== PART Typ GAP begin
   " Row 5
   syn region      pam_PART_GAP_r5     transparent contained containedin=pam_PART_GAP start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_GAP_r4     transparent contained containedin=pam_PART_GAP start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_GAP_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_GAP_r3     transparent contained containedin=pam_PART_GAP start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_GAP_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_GAP_r2     transparent contained containedin=pam_PART_GAP start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_GAP_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_GAP_r2a    transparent contained containedin=pam_PART_GAP start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_GAP_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_GAP_r1_a2             display contained containedin=pam_PART_GAP_r1 "\%17c[ ]*\CGAP[ ]*\%25c"
   syn region      pam_PART_GAP_r1     transparent contained containedin=pam_PART_GAP start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_GAP_r2a,pam_PART_GAP_r2 skipnl keepend
syn region      pam_PART_GAP     matchgroup=pam_CardTag start="^\CPART  / .\{8\}[ ]*\CGAP[ ]*\%25c"rs=s+8 end="^\CEND_PART" contains=pam_PART_GAP_r[1-6] fold keepend

hi def link pam_PART_GAP_r1_a2 pam_evenArgument
hi def link pam_PART_GAP_r1_v2 pam_evenVar
hi def link pam_PART_GAP_r1_e2 pam_evenError
"=== PART Typ GAP end}}}

"{{{=== PART Typ MTOJNT begin
   " Row 5
   syn region      pam_PART_MTOJNT_r5     transparent contained containedin=pam_PART_MTOJNT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_MTOJNT_r4     transparent contained containedin=pam_PART_MTOJNT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_MTOJNT_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_MTOJNT_r3     transparent contained containedin=pam_PART_MTOJNT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_MTOJNT_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_MTOJNT_r2     transparent contained containedin=pam_PART_MTOJNT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_MTOJNT_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_MTOJNT_r2a    transparent contained containedin=pam_PART_MTOJNT start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_MTOJNT_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_MTOJNT_r1_a2             display contained containedin=pam_PART_MTOJNT_r1 "\%17c\CMTOJNT  \| \CMTOJNT \|  \CMTOJNT"
   syn region      pam_PART_MTOJNT_r1     transparent contained containedin=pam_PART_MTOJNT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_MTOJNT_r2a,pam_PART_MTOJNT_r2 skipnl keepend
syn region      pam_PART_MTOJNT     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CMTOJNT  \| \CMTOJNT \|  \CMTOJNT\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_MTOJNT_r[1-6] fold keepend

hi def link pam_PART_MTOJNT_r1_a2 pam_evenArgument
hi def link pam_PART_MTOJNT_r1_v2 pam_evenVar
hi def link pam_PART_MTOJNT_r1_e2 pam_evenError
"=== PART Typ MTOJNT end}}}

"{{{=== PART Typ BAR begin
   " Row 5
   syn region      pam_PART_BAR_r5     transparent contained containedin=pam_PART_BAR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_BAR_r4     transparent contained containedin=pam_PART_BAR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BAR_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_BAR_r3     transparent contained containedin=pam_PART_BAR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BAR_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_BAR_r2     transparent contained containedin=pam_PART_BAR start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_BAR_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_BAR_r2a    transparent contained containedin=pam_PART_BAR start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_BAR_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_BAR_r1_a2             display contained containedin=pam_PART_BAR_r1 "\%17c\CBAR     \| \CBAR    \|  \CBAR   \|   \CBAR  \|    \CBAR \|     \CBAR"
   syn region      pam_PART_BAR_r1     transparent contained containedin=pam_PART_BAR start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BAR_r2a,pam_PART_BAR_r2 skipnl keepend
syn region      pam_PART_BAR     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CBAR     \| \CBAR    \|  \CBAR   \|   \CBAR  \|    \CBAR \|     \CBAR\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_BAR_r[1-6] fold keepend

hi def link pam_PART_BAR_r1_a2 pam_evenArgument
hi def link pam_PART_BAR_r1_v2 pam_evenVar
hi def link pam_PART_BAR_r1_e2 pam_evenError
"=== PART Typ BAR end}}}

"{{{=== PART Typ TSHEL begin
   " Row 5
   syn region      pam_PART_TSHEL_r5     transparent contained containedin=pam_PART_TSHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_TSHEL_r4     transparent contained containedin=pam_PART_TSHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_TSHEL_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_TSHEL_r3     transparent contained containedin=pam_PART_TSHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_TSHEL_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_TSHEL_r2     transparent contained containedin=pam_PART_TSHEL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_TSHEL_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_TSHEL_r2a    transparent contained containedin=pam_PART_TSHEL start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_TSHEL_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_TSHEL_r1_a2             display contained containedin=pam_PART_TSHEL_r1 "\%17c\CTSHEL   \| \CTSHEL  \|  \CTSHEL \|   \CTSHEL"
   syn region      pam_PART_TSHEL_r1     transparent contained containedin=pam_PART_TSHEL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_TSHEL_r2a,pam_PART_TSHEL_r2 skipnl keepend
syn region      pam_PART_TSHEL     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CTSHEL   \| \CTSHEL  \|  \CTSHEL \|   \CTSHEL\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_TSHEL_r[1-6] fold keepend

hi def link pam_PART_TSHEL_r1_a2 pam_evenArgument
hi def link pam_PART_TSHEL_r1_v2 pam_evenVar
hi def link pam_PART_TSHEL_r1_e2 pam_evenError
"=== PART Typ BAR end}}}

"{{{=== PART Typ PLINKL begin
   " Row 5
   syn region      pam_PART_PLINK_r5     transparent contained containedin=pam_PART_PLINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@31i10,@41f10,@51f10,@61i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_PLINK_r4     transparent contained containedin=pam_PART_PLINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_PLINK_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_PLINK_r3     transparent contained containedin=pam_PART_PLINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_PLINK_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_PLINK_r2     transparent contained containedin=pam_PART_PLINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_PLINK_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_PLINK_r2a    transparent contained containedin=pam_PART_PLINK start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_PLINK_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_PLINK_r1_a2             display contained containedin=pam_PART_PLINK_r1 "\%17c\CPLINK   \| \CPLINK  \|  \CPLINK \|   \CPLINK"
   syn region      pam_PART_PLINK_r1     transparent contained containedin=pam_PART_PLINK start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_PLINK_r2a,pam_PART_PLINK_r2 skipnl keepend
syn region      pam_PART_PLINK     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CPLINK   \| \CPLINK  \|  \CPLINK \|   \CPLINK\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_PLINK_r[1-6] fold keepend

hi def link pam_PART_PLINK_r1_a2 pam_evenArgument
hi def link pam_PART_PLINK_r1_v2 pam_evenVar
hi def link pam_PART_PLINK_r1_e2 pam_evenError
"=== PART Typ PLINK end}}}

"{{{=== PART Typ LLINKL begin
   " Row 5
   syn region      pam_PART_LLINK_r5     transparent contained containedin=pam_PART_LLINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_LLINK_r4     transparent contained containedin=pam_PART_LLINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_LLINK_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_LLINK_r3     transparent contained containedin=pam_PART_LLINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_LLINK_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_LLINK_r2     transparent contained containedin=pam_PART_LLINK start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_LLINK_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_LLINK_r2a    transparent contained containedin=pam_PART_LLINK start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_LLINK_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_LLINK_r1_a2             display contained containedin=pam_PART_LLINK_r1 "\%17c\CLLINK   \| \CLLINK  \|  \CLLINK \|   \CLLINK"
   syn region      pam_PART_LLINK_r1     transparent contained containedin=pam_PART_LLINK start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_LLINK_r2a,pam_PART_LLINK_r2 skipnl keepend
syn region      pam_PART_LLINK     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CLLINK   \| \CLLINK  \|  \CLLINK \|   \CLLINK\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_LLINK_r[1-6] fold keepend

hi def link pam_PART_LLINK_r1_a2 pam_evenArgument
hi def link pam_PART_LLINK_r1_v2 pam_evenVar
hi def link pam_PART_LLINK_r1_e2 pam_evenError
"=== PART Typ LLINK end}}}

"{{{=== PART Typ TIED,SLINK,ELINK begin
   " Row 6
   syn region      pam_PART_TIED_r6     transparent contained containedin=pam_PART_TIED start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@11f10,@21f10,@31f10,@41f10,,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 5
   syn region      pam_PART_TIED_r5     transparent contained containedin=pam_PART_TIED start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@71i10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_TIED_r6,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_TIED_r4     transparent contained containedin=pam_PART_TIED start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_TIED_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_TIED_r3     transparent contained containedin=pam_PART_TIED start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_TIED_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_TIED_r2     transparent contained containedin=pam_PART_TIED start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_TIED_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_TIED_r2a    transparent contained containedin=pam_PART_TIED start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_TIED_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_TIED_r1_a2             display contained containedin=pam_PART_TIED_r1 "\%17c\CTIED    \| \CTIED   \|  \CTIED  \|   \CTIED \|    \CTIED\|\C[SE]LINK   \| \C[SE]LINK  \|  \C[SE]LINK \|   \C[SE]LINK"
   syn region      pam_PART_TIED_r1     transparent contained containedin=pam_PART_TIED start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_TIED_r2a,pam_PART_TIED_r2 skipnl keepend
syn region      pam_PART_TIED     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CTIED    \| \CTIED   \|  \CTIED  \|   \CTIED \|    \CTIED\|\C[SE]LINK   \| \C[SE]LINK  \|  \C[SE]LINK \|   \C[SE]LINK\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_TIED_r[1-6] fold keepend

hi def link pam_PART_TIED_r1_a2 pam_evenArgument
hi def link pam_PART_TIED_r1_v2 pam_evenVar
hi def link pam_PART_TIED_r1_e2 pam_evenError
"=== PART Typ TIED,SLINK,ELINK end}}}

"{{{=== PART Typ SPRING, SPRGBM, MBSPR, JOINT, KJOIN, MBKJN (same syntax) begin
   " Row 5
   syn region      pam_PART_SPRING_r5     transparent contained containedin=pam_PART_SPRING start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPart skipnl keepend
   " Row 4
   syn region      pam_PART_SPRING_r4     transparent contained containedin=pam_PART_SPRING start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SPRING_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_SPRING_r3     transparent contained containedin=pam_PART_SPRING start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SPRING_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_SPRING_r2     transparent contained containedin=pam_PART_SPRING start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_SPRING_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_SPRING_r2a    transparent contained containedin=pam_PART_SPRING start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_SPRING_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_SPRING_r1_a2             display contained containedin=pam_PART_SPRING_r1 "\%17c\CSPRING  \| \CSPRING \|  \CSPRING\|\CSPRGBM  \| \CSPRGBM \|  \CSPRGBM\|\CMBSPR   \| \CMBSPR  \|  \CMBSPR \|   \CMBSPR\|\CJOINT   \| \CJOINT  \|  \CJOINT \|   \CJOINT\|\CKJOIN   \| \CKJOIN  \|  \CKJOIN \|   \CKJOIN\|\CMBKJN   \| \CMBKJN  \|  \CMBKJN \|   \CMBKJN"
   syn region      pam_PART_SPRING_r1     transparent contained containedin=pam_PART_SPRING start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_SPRING_r2a,pam_PART_SPRING_r2 skipnl keepend
syn region      pam_PART_SPRING     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CSPRING  \| \CSPRING \|  \CSPRING\|\CSPRGBM  \| \CSPRGBM \|  \CSPRGBM\|\CMBSPR   \| \CMBSPR  \|  \CMBSPR \|   \CMBSPR\|\CJOINT   \| \CJOINT  \|  \CJOINT \|   \CJOINT\|\CKJOIN   \| \CKJOIN  \|  \CKJOIN \|   \CKJOIN\|\CMBKJN   \| \CMBKJN  \|  \CMBKJN \|   \CMBKJN\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_SPRING_r[1-5] fold keepend

hi def link pam_PART_SPRING_r1_a2 pam_evenArgument
hi def link pam_PART_SPRING_r1_v2 pam_evenVar
hi def link pam_PART_SPRING_r1_e2 pam_evenError
"=== PART Typ SPRING, SPRGBM, MBSPR, JOINT, KJOIN (same syntax) end}}}

"{{{=== PART Typ BEAM begin
   " Row 10
   syn region      pam_PART_BEAM_r10     transparent contained containedin=pam_PART_BEAM start="\%1c[^E]" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BEAM_r10,pam_EndPart skipnl keepend
   " Row 9
   syn region      pam_PART_BEAM_r9     transparent contained containedin=pam_PART_BEAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@6i5,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_EndPart,pam_PART_BEAM_r10 skipnl keepend
   " Row 8
   syn region      pam_PART_BEAM_r8     transparent contained containedin=pam_PART_BEAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BEAM_r9 skipnl keepend
   " Row 7
   syn region      pam_PART_BEAM_r7     transparent contained containedin=pam_PART_BEAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BEAM_r8 skipnl keepend
   " Row 6
      " XYZUVW
      syn match       pam_PART_BEAM_r1_e2             display contained containedin=pam_PART_BEAM_r6 "\%35c.\{,6\}"
      syn match       pam_PART_BEAM_r1_a2             display contained containedin=pam_PART_BEAM_r6 "\%35c[ 0-1]\{6\}"
      syn match       pam_PART_BEAM_r1_e2             display contained containedin=pam_PART_BEAM_r6 "\%45c.\{,6\}"
      syn match       pam_PART_BEAM_r1_a2             display contained containedin=pam_PART_BEAM_r6 "\%45c[ 0-1]\{6\}"
      hi def link pam_PART_BEAM_r1_a2 pam_evenArgument
      hi def link pam_PART_BEAM_r1_e2 pam_evenError
   syn region      pam_PART_BEAM_r6     transparent contained containedin=pam_PART_BEAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BEAM_r7 skipnl keepend
   " Row 5
   syn region      pam_PART_BEAM_r5     transparent contained containedin=pam_PART_BEAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@56i5,@61f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BEAM_r6 skipnl keepend
   " Row 4
   syn region      pam_PART_BEAM_r4     transparent contained containedin=pam_PART_BEAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BEAM_r5 skipnl keepend
   " Row 3
   syn region      pam_PART_BEAM_r3     transparent contained containedin=pam_PART_BEAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BEAM_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_PART_BEAM_r2     transparent contained containedin=pam_PART_BEAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PART_BEAM_r3 skipnl keepend
" Row 2a (RMAT)
syn region      pam_PART_BEAM_r2a    transparent contained containedin=pam_PART_BEAM start="\%1cRMAT" end="\n[\$\#]\@!" contains=pam_Rmat,pam_Comment,pam_Comment_Position nextgroup=pam_PART_BEAM_r2 skipnl keepend
   " Row 1
      " ATYPE
      syn match       pam_PART_BEAM_r1_a2             display contained containedin=pam_PART_BEAM_r1 "\%17c\CBEAM    \| \CBEAM   \|  \CBEAM  \|   \CBEAM \|    \CBEAM"
   syn region      pam_PART_BEAM_r1     transparent contained containedin=pam_PART_BEAM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PART_BEAM_r2a,pam_PART_BEAM_r2 skipnl keepend
syn region      pam_PART_BEAM     matchgroup=pam_CardTag start="^\CPART  / .\{8\}\(\CBEAM    \| \CBEAM   \|  \CBEAM  \|   \CBEAM \|    \CBEAM\)"rs=s+8 end="^\CEND_PART" contains=pam_PART_BEAM_r[1-6] fold keepend

hi def link pam_PART_BEAM_r1_a2 pam_evenArgument
hi def link pam_PART_BEAM_r1_v2 pam_evenVar
hi def link pam_PART_BEAM_r1_e2 pam_evenError
"=== PART Typ BEAM end}}}

"{{{=== PART Common
   " END_PART
   syn match       pam_EndPart        display contained "^\CEND_PART"
   hi def link pam_EndPart pam_CardTag
" }}}

"{{{=== METRIC begin
   " Row 3
   syn region      pam_METRIC_r3     transparent contained containedin=pam_METRIC start="\%1c" start="^$\n" end="\%$" contains=pam_Node,pam_Solid,pam_Tetr4,pam_Tetra,pam_Tetr10,pam_Membr,pam_Pent6,pam_Comment_Position,pam_Error,pam_EndMetric nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndMetric skipnl keepend
   "Row 2 (Name)
   syn region      pam_METRIC_r2     transparent contained containedin=pam_METRIC start="\%1c\CNAME" start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_METRIC_r3 skipnl keepend
   " Row 1
   syn region      pam_METRIC_r1     transparent contained containedin=pam_METRIC start="\%9c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_String,pam_Comment_Position,pam_Error nextgroup=pam_METRIC_r2 skipnl keepend
syn region      pam_METRIC          matchgroup=pam_CardTag start="^\CMETRIC/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_METRIC_r[1-3],pam_EndMetric,pam_Comment,pam_Comment_Position keepend
"=== METRIC end}}}

"{{{=== INCLU begin
syn region      pam_INCLU          matchgroup=pam_CardTag start="^\CINCLU /" end="\(\%81c&\|\%81c\-\)\@<!$" skipnl contains=pam_String,pam_FreeVar,pam_Continue keepend
"=== INCLU end}}}

"{{{ === RBODY begin
   " Row 3 (Node Selection)
   syn region      pam_RBODY0_r3     transparent contained containedin=pam_RBODY0 start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_RBODY0_r2     transparent contained containedin=pam_RBODY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RBODY0_r3 skipnl keepend
   " Row 1
   syn region      pam_RBODY0_r1     transparent contained containedin=pam_RBODY0 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@57i8,@65i8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY0_r2 skipnl keepend
syn region      pam_RBODY0        matchgroup=pam_CardTag start="^\CRBODY / .\{16\}[ ]\{7\}0"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RBODY0_r[1-3] fold keepend

   " Row 4 (Node Selection)
   syn region      pam_RBODY1_r4     transparent contained containedin=pam_RBODY1 start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn region      pam_RBODY1_r3     transparent contained containedin=pam_RBODY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57i8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY1_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_RBODY1_r2     transparent contained containedin=pam_RBODY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RBODY1_r3 skipnl keepend
   " Row 1
   syn region      pam_RBODY1_r1     transparent contained containedin=pam_RBODY1 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@57i8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY1_r2 skipnl keepend
syn region      pam_RBODY1        matchgroup=pam_CardTag start="^\CRBODY / .\{16\}[ ]\{7\}1"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RBODY1_r[1-4] fold keepend

   " Row 4 (Node Selection)
   syn region      pam_RBODY2_r4     transparent contained containedin=pam_RBODY2 start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn region      pam_RBODY2_r3     transparent contained containedin=pam_RBODY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY2_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_RBODY2_r2     transparent contained containedin=pam_RBODY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RBODY2_r3 skipnl keepend
   " Row 1
   syn region      pam_RBODY2_r1     transparent contained containedin=pam_RBODY2 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@57i8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY2_r2 skipnl keepend
syn region      pam_RBODY2        matchgroup=pam_CardTag start="^\CRBODY / .\{16\}[ ]\{7\}2"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RBODY2_r[1-4] fold keepend

   " Row 4 (Node Selection)
   syn region      pam_RBODY3_r4     transparent contained containedin=pam_RBODY3 start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn region      pam_RBODY3_r3     transparent contained containedin=pam_RBODY3 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i8,@9f8,@17f8,@25f8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY3_r4 skipnl keepend
   syn region      pam_RBODY3_r3     transparent contained containedin=pam_RBODY3 matchgroup=pam_evenArgument start="^       1" start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY3_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_RBODY3_r2     transparent contained containedin=pam_RBODY3 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RBODY3_r3 skipnl keepend
   " Row 1
   syn region      pam_RBODY3_r1     transparent contained containedin=pam_RBODY3 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@49i8,@57i8,@65i8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY3_r2 skipnl keepend
syn region      pam_RBODY3        matchgroup=pam_CardTag start="^\CRBODY / .\{16\}[ ]\{7\}3"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RBODY3_r[1-4] fold keepend

   " Row 4 (Node Selection)
   syn region      pam_RBODY4_r4     transparent contained containedin=pam_RBODY4 start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3
   syn region      pam_RBODY4_r3     transparent contained containedin=pam_RBODY4 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY4_r4 skipnl keepend
   " Row 2 (Name)
   syn region      pam_RBODY4_r2     transparent contained containedin=pam_RBODY4 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RBODY4_r3 skipnl keepend
   " Row 1
   syn region      pam_RBODY4_r1     transparent contained containedin=pam_RBODY4 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@25i8,@33i8,@41i8,@57i8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RBODY4_r2 skipnl keepend
syn region      pam_RBODY4        matchgroup=pam_CardTag start="^\CRBODY / .\{16\}[ ]\{7\}4"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RBODY4_r[1-4] fold keepend
" === RBODY end}}}

"{{{ === THLOC begin
   " Row 3 (Node Selection)
   syn region      pam_THLOC_r3     transparent contained containedin=pam_THLOC start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_THLOC_r2     transparent contained containedin=pam_THLOC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_THLOC_r3 skipnl keepend
   " Row 1     
   syn region      pam_THLOC_r1     transparent contained containedin=pam_THLOC start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,@41i8,@49i8,@57i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_THLOC_r2 skipnl keepend
syn region      pam_THLOC            matchgroup=pam_CardTag start="^\CTHLOC /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_THLOC_r[1-3] fold keepend
" === THLOC end}}}

"{{{ === VAMPSO begin
   " Row 4 (Node Selection)
   syn region      pam_VAMPSO_r4     transparent contained containedin=pam_VAMPSO start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3     
      syn match       pam_VAMPSO_r3_e1             display contained containedin=pam_VAMPSO_r3 "\%9c.\{,8\}"
      syn match       pam_VAMPSO_r3_a1             display contained containedin=pam_VAMPSO_r3 "\%9c\CPRESSURE\|\CFLOW    "
      hi def link pam_VAMPSO_r3_a1 pam_oddArgument
      hi def link pam_VAMPSO_r3_e1 pam_oddError
   syn region      pam_VAMPSO_r3     transparent contained containedin=pam_VAMPSO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8,@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMPSO_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_VAMPSO_r2     transparent contained containedin=pam_VAMPSO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_VAMPSO_r3 skipnl keepend
   " Row 1     
   syn region      pam_VAMPSO_r1     transparent contained containedin=pam_VAMPSO start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMPSO_r2 skipnl keepend
syn region      pam_VAMPSO            matchgroup=pam_CardTag start="^\CVAMPSO/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAMPSO_r[1-4] fold keepend
" === VAMPSO end}}}

"{{{ === VAABSO begin
   " Row 4 (Node Selection)
   syn region      pam_VAABSO_r4     transparent contained containedin=pam_VAABSO start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3     
      syn match       pam_VAABSO_r3_e1             display contained containedin=pam_VAABSO_r3 "\%9c.\{,8\}"
      syn match       pam_VAABSO_r3_a1             display contained containedin=pam_VAABSO_r3 "\%9c\CIMPED   \|\CSIMPED  \|\CADMIT   \|\CSADMIT  "
      hi def link pam_VAABSO_r3_a1 pam_oddArgument
      hi def link pam_VAABSO_r3_e1 pam_oddError
   syn region      pam_VAABSO_r3     transparent contained containedin=pam_VAABSO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8,@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAABSO_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_VAABSO_r2     transparent contained containedin=pam_VAABSO start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_VAABSO_r3 skipnl keepend
   " Row 1     
   syn region      pam_VAABSO_r1     transparent contained containedin=pam_VAABSO start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAABSO_r2 skipnl keepend
syn region      pam_VAABSO            matchgroup=pam_CardTag start="^\CVAABSO/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAABSO_r[1-4] fold keepend
" === VAABSO end}}}

"{{{ === FBCFA begin
   " Row 4 (Node Selection)
   syn region      pam_FBCFA_r3     transparent contained containedin=pam_FBCFA start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3     
      syn match       pam_FBCFA_r1_e1             display contained containedin=pam_FBCFA_r1 "\%9c.\{,8\}"
      syn match       pam_FBCFA_r1_a1             display contained containedin=pam_FBCFA_r1 "\%9c[ ]*\(\CDISP\|\CVELO\|\CACCE\)[ ]*\%17c" 
      hi def link pam_FBCFA_r1_a1 pam_oddArgument
      hi def link pam_FBCFA_r1_e1 pam_oddError
   "Row 2 (Name)
   syn region      pam_FBCFA_r2     transparent contained containedin=pam_FBCFA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_FBCFA_r3 skipnl keepend
   " Row 1     
   syn region      pam_FBCFA_r1     transparent contained containedin=pam_FBCFA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8,@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FBCFA_r2 skipnl keepend
syn region      pam_FBCFA            matchgroup=pam_CardTag start="^\CFBCFA /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FBCFA_r[1-4] fold keepend
" === FBCFA end}}}

"{{{ === ACTUA begin
   " Row 4 (Node Selection)
   syn region      pam_ACTUA_r3     transparent contained containedin=pam_ACTUA start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_ACTUA_r2     transparent contained containedin=pam_ACTUA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_ACTUA_r3 skipnl keepend
   " Row 1     
      syn match       pam_ACTUA_r1_e2             display contained containedin=pam_ACTUA_r1 "\%57c.\{,8\}"
      syn match       pam_ACTUA_r1_a2             display contained containedin=pam_ACTUA_r1 "\%57c[ ]\{8\}"
      syn match       pam_ACTUA_r1_a2             display contained containedin=pam_ACTUA_r1 "\%57c[ ]*\(\CINITIAL\|STAGE\|DEFORM\)[ ]*\%65c"
      hi def link pam_ACTUA_r1_a2 pam_oddArgument
      hi def link pam_ACTUA_r1_e2 pam_oddError
      syn match       pam_ACTUA_r1_e1             display contained containedin=pam_ACTUA_r1 "\%25c.\{,8\}"
      syn match       pam_ACTUA_r1_a1             display contained containedin=pam_ACTUA_r1 "\%25c[ ]*\(\CDISP\|VELO\|ACCE\|DOPF\)[ ]*\%33c"
      hi def link pam_ACTUA_r1_a1 pam_oddArgument
      hi def link pam_ACTUA_r1_e1 pam_oddError
   syn region      pam_ACTUA_r1     transparent contained containedin=pam_ACTUA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@33i8,@41f8,@49f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_ACTUA_r2 skipnl keepend
syn region      pam_ACTUA            matchgroup=pam_CardTag start="^\CACTUA /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_ACTUA_r[1-4] fold keepend
" === ACTUA end}}}

"{{{=== PFMAT begin 
   "Row 2 (Name)
   syn region      pam_PFMAT_r2     transparent contained containedin=pam_PFMAT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position keepend
   "Row 1
   syn region      pam_PFMAT_r1     transparent contained containedin=pam_PFMAT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PFMAT_r2 skipnl keepend
   syn region      pam_PFMAT_VISCOSITY        contained containedin=pam_PFMAT matchgroup=pam_HeaderKW start="\CVISCOSITY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_PFMAT_GAS_CONSTANT        contained containedin=pam_PFMAT matchgroup=pam_HeaderKW start="\CGAS_CONSTANT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_PFMAT_GAS_TEMPERATURE        contained containedin=pam_PFMAT matchgroup=pam_HeaderKW start="\CGAS_TEMPERATURE" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_PFMAT_POROSITY        contained containedin=pam_PFMAT matchgroup=pam_HeaderKW start="\CPOROSITY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_PFMAT_VELOCITY_COEF        contained containedin=pam_PFMAT matchgroup=pam_HeaderKW start="\CVELOCITY_COEF" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_PFMAT_PERMEABILITY        contained containedin=pam_PFMAT matchgroup=pam_HeaderKW start="\CPERMEABILITY" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_Float,pam_Error,pam_FreeError,pam_FreeVar keepend
      syn keyword     pam_PFMAT_PERMEABILITY_arg         contained containedin=pam_PFMAT_PERMEABILITY CONSTANT CURVE 
      hi def link pam_PFMAT_PERMEABILITY_arg pam_Argument
   " END_PFMAT
   syn match       pam_EndThMat     display contained containedin=pam_PFMAT "^\CEND_PFMAT"
   hi def link     pam_EndThMat pam_CardTag
syn region      pam_PFMAT           matchgroup=pam_CardTag start="^\CPFMAT /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_EndThMat fold keepend
" PFMAT end}}}

"{{{=== THMAT begin 
   "Row 2 (Name)
   syn region      pam_THMAT_r2     transparent contained containedin=pam_THMAT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position keepend
   "Row 1
   syn region      pam_THMAT_r1     transparent contained containedin=pam_THMAT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_THMAT_r2 skipnl keepend
   syn region      pam_THMAT_CONDUCTIVITY_r2     transparent contained containedin=pam_THMAT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error keepend 
   syn region      pam_THMAT_MASS_DENSITY_r2     transparent contained containedin=pam_THMAT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error keepend 
   syn region      pam_THMAT_SPECIFIC_HEAT_r2     transparent contained containedin=pam_THMAT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error keepend 
   syn region      pam_THMAT_CONDUCTIVITY        contained containedin=pam_THMAT matchgroup=pam_HeaderKW start="\CCONDUCTIVITY" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error,pam_FreeError,pam_FreeVar,pam_THMAT_CONDUCTIVITY_arg nextgroup=pam_THMAT_CONDUCTIVITY_r2 skipnl keepend
      syn keyword     pam_THMAT_CONDUCTIVITY_arg         contained containedin=pam_THMAT_CONDUCTIVITY ISOTROPIC ANISOTROPIC NO CONSTANT CURVE
      hi def link pam_THMAT_CONDUCTIVITY_arg pam_Argument
   syn region      pam_THMAT_MASS_DENSITY        contained containedin=pam_THMAT matchgroup=pam_HeaderKW start="\CMASS_DENSITY" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error,pam_FreeError,pam_FreeVar,pam_THMAT_MASS_DENSITY_arg nextgroup=pam_THMAT_MASS_DENSITY_r2 skipnl keepend
      syn keyword     pam_THMAT_MASS_DENSITY_arg         contained containedin=pam_THMAT_MASS_DENSITY CONSTANT CURVE
      hi def link pam_THMAT_MASS_DENSITY_arg pam_Argument
   syn region      pam_THMAT_SPECIFIC_HEAT        contained containedin=pam_THMAT matchgroup=pam_HeaderKW start="\CSPECIFIC_HEAT" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error,pam_FreeError,pam_FreeVar,pam_THMAT_SPECIFIC_HEAT_arg nextgroup=pam_THMAT_SPECIFIC_HEAT_r2 skipnl keepend
      syn keyword     pam_THMAT_SPECIFIC_HEAT_arg         contained containedin=pam_THMAT_SPECIFIC_HEAT CONSTANT CURVE
      hi def link pam_THMAT_SPECIFIC_HEAT_arg pam_Argument
   syn region      pam_THMAT_LATENT_HEAT        contained containedin=pam_THMAT matchgroup=pam_HeaderKW start="\CLATENT_HEAT" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Float,pam_Error,pam_FreeError,pam_FreeVar keepend
   syn region      pam_THMAT_ENTHALPY        contained containedin=pam_THMAT matchgroup=pam_HeaderKW start="\CENTHALPY" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar keepend
   " END_THMAT
   syn match       pam_EndThMat     display contained containedin=pam_THMAT "^\CEND_THMAT"
   hi def link     pam_EndThMat pam_CardTag
syn region      pam_THMAT           matchgroup=pam_CardTag start="^\CTHMAT /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_EndThMat fold keepend
" THMAT end}}}

"{{{ === THNAC begin
   " Row 3 (Node Selection)
   syn region      pam_THNAC_r3     transparent contained containedin=pam_THNAC start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_THNAC_r2     transparent contained containedin=pam_THNAC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_THNAC_r3 skipnl keepend
   " Row 1     
   syn region      pam_THNAC_r1     transparent contained containedin=pam_THNAC start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_THNAC_r2 skipnl keepend
syn region      pam_THNAC            matchgroup=pam_CardTag start="^\CTHNAC /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_THNAC_r[1-3] fold keepend
" === THNAC end}}}

"{{{ === SELOUT begin
   syn match       pam_EndSELOUT        display containedin=ALL "^\CEND_SELOUT"
   hi def link pam_EndSELOUT  pam_CardTag
   " Row 7 (Node Selection)
   syn region      pam_SELOUT_r7     transparent contained containedin=pam_SELOUT start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error,pam_EndSELOUT nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 6
   syn region      pam_SELOUT_r6     transparent contained containedin=pam_SELOUT matchgroup=pam_Keyword start="\%1c[ ]\{8\}NODPLOT" start="^$\n" end="\n[\$\#]\@!" contains=pam_Control_OCTRL_NODPLOT_arg,pam_Comment,pam_Comment_Position nextgroup=pam_SELOUT_r3,pam_SELOUT_r4,pam_SELOUT_r5,pam_SELOUT_r6,pam_SELOUT_r7 skipnl keepend
   "Row 5
   syn region      pam_SELOUT_r5     transparent contained containedin=pam_SELOUT matchgroup=pam_Keyword start="\%1c[ ]\{8\}BEAPLOT" start="^$\n" end="\n[\$\#]\@!" contains=pam_Control_OCTRL_BEAPLOT_arg,pam_Comment,pam_Comment_Position nextgroup=pam_SELOUT_r3,pam_SELOUT_r4,pam_SELOUT_r5,pam_SELOUT_r6,pam_SELOUT_r7 skipnl keepend
   "Row 4
   syn region      pam_SELOUT_r4     transparent contained containedin=pam_SELOUT matchgroup=pam_Keyword start="\%1c[ ]\{8\}SHLPLOT" start="^$\n" end="\n[\$\#]\@!" contains=pam_Control_OCTRL_SHLPLOT_arg,pam_Comment,pam_Comment_Position nextgroup=pam_SELOUT_r3,pam_SELOUT_r4,pam_SELOUT_r5,pam_SELOUT_r6,pam_SELOUT_r7 skipnl keepend
   "Row 3
   syn region      pam_SELOUT_r3     transparent contained containedin=pam_SELOUT matchgroup=pam_Keyword start="\%1c[ ]\{8\}SOLPLOT" start="^$\n" end="\n[\$\#]\@!" contains=pam_Control_OCTRL_SOLPLOT_arg,pam_Comment,pam_Comment_Position nextgroup=pam_SELOUT_r3,pam_SELOUT_r4,pam_SELOUT_r5,pam_SELOUT_r6,pam_SELOUT_r7 skipnl keepend
   "Row 2 (Name)
   syn region      pam_SELOUT_r2     transparent contained containedin=pam_SELOUT start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SELOUT_r3,pam_SELOUT_r4,pam_SELOUT_r5,pam_SELOUT_r6,pam_SELOUT_r7 skipnl keepend
   " Row 1     
   syn region      pam_SELOUT_r1     transparent contained containedin=pam_SELOUT start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SELOUT_r2 skipnl keepend
syn region      pam_SELOUT            matchgroup=pam_CardTag start="^\CSELOUT/" end="^\CEND_SELOUT" contains=pam_SELOUT_r[1-5] fold keepend
" === SELOUT end}}}

"{{{ === FRICT begin
   "Row 2 (Name)
   syn region      pam_FRICTX_r2     transparent contained containedin=pam_FRICTX start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1     
   syn region      pam_FRICTX_r1     transparent contained containedin=pam_FRICTX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICTX_r2 skipnl keepend
syn region      pam_FRICTX            matchgroup=pam_CardTag start="^\CFRICT /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICTX_r[1-3] fold keepend

   "Row 2 (Name)
   syn region      pam_FRICT13_r2     transparent contained containedin=pam_FRICT13 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1     
   syn region      pam_FRICT13_r1     transparent contained containedin=pam_FRICT13 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICT13_r2 skipnl keepend
syn region      pam_FRICT13            matchgroup=pam_CardTag start="^\CFRICT / .\{8\}      13"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICT13_r[1-3] fold keepend

   " Row 3     
   syn region      pam_FRICT12_r3     transparent contained containedin=pam_FRICT12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17f8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 2 (Name)
   syn region      pam_FRICT12_r2     transparent contained containedin=pam_FRICT12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_FRICT12_r3 skipnl keepend
   " Row 1     
   syn region      pam_FRICT12_r1     transparent contained containedin=pam_FRICT12 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,@41f8,@49f8,@57f8,@65f8,@73f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICT12_r2 skipnl keepend
syn region      pam_FRICT12            matchgroup=pam_CardTag start="^\CFRICT / .\{8\}      12"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICT12_r[1-3] fold keepend

   "Row 2 (Name)
   syn region      pam_FRICT11_r2     transparent contained containedin=pam_FRICT11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1     
   syn region      pam_FRICT11_r1     transparent contained containedin=pam_FRICT11 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICT11_r2 skipnl keepend
syn region      pam_FRICT11            matchgroup=pam_CardTag start="^\CFRICT / .\{8\}      11"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICT11_r[1-3] fold keepend

   "Row 2 (Name)
   syn region      pam_FRICT10_r2     transparent contained containedin=pam_FRICT10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1     
   syn region      pam_FRICT10_r1     transparent contained containedin=pam_FRICT10 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICT10_r2 skipnl keepend
syn region      pam_FRICT10            matchgroup=pam_CardTag start="^\CFRICT / .\{8\}      10"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICT10_r[1-3] fold keepend

   "Row 2 (Name)
   syn region      pam_FRICT5_r2     transparent contained containedin=pam_FRICT5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1     
   syn region      pam_FRICT5_r1     transparent contained containedin=pam_FRICT5 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICT5_r2 skipnl keepend
syn region      pam_FRICT5            matchgroup=pam_CardTag start="^\CFRICT / .\{8\}       [56]"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICT5_r[1-3] fold keepend

   "Row 2 (Name)
   syn region      pam_FRICT4_r2     transparent contained containedin=pam_FRICT4 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1     
   syn region      pam_FRICT4_r1     transparent contained containedin=pam_FRICT4 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICT4_r2 skipnl keepend
syn region      pam_FRICT4            matchgroup=pam_CardTag start="^\CFRICT / .\{8\}       4"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICT4_r[1-3] fold keepend

   "Row 2 (Name)
   syn region      pam_FRICT2_r2     transparent contained containedin=pam_FRICT2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1     
   syn region      pam_FRICT2_r1     transparent contained containedin=pam_FRICT2 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICT2_r2 skipnl keepend
syn region      pam_FRICT2            matchgroup=pam_CardTag start="^\CFRICT / .\{8\}       [23]"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICT2_r[1-3] fold keepend

   "Row 2 (Name)
   syn region      pam_FRICT1_r2     transparent contained containedin=pam_FRICT1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1     
   syn region      pam_FRICT1_r1     transparent contained containedin=pam_FRICT1 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_FRICT1_r2 skipnl keepend
syn region      pam_FRICT1            matchgroup=pam_CardTag start="^\CFRICT / .\{8\}       1"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_FRICT1_r[1-3] fold keepend
" === FRICT end}}}

" {{{ === LOOKU begin
   " Row 4
   syn region      pam_LOOKU_r4     transparent contained start="\%1c." start="^$\n" end="\%$" contains=pam_Float,pam_Comment,pam_Comment_Position,pam_Error skipnl
      " Row 3a
         syn match    pam_LOOKU_r3a_a1  display contained containedin=pam_LOOKU_r3a "\%25c.\{,8\}"
         hi def link pam_LOOKU_r3a_a1 pam_oddArgument
      syn region      pam_LOOKU_r3a     transparent contained containedin=pam_LOOKU3 start="\%17c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8,@33i8,@41i8,@49i8,@57f16x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_LOOKU_r4 skipnl
   "Row 2 (Name)
   syn region      pam_LOOKU_r2     transparent contained containedin=pam_LOOKU start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_LOOKU_r3 skipnl keepend
   "Row 1
   syn region      pam_LOOKU_r1     transparent contained containedin=pam_LOOKU start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_LOOKU_r2 skipnl keepend
   " Row 3
   syn region      pam_LOOKU_r3     transparent contained containedin=pam_LOOKU matchgroup=pam_Keyword start="\%1c[ ]\{8\}ARGUMENT"rs=s+16 start="^$\n" matchgroup=pam_End end="^[ ]\{8\}END" contains=pam_LOOKU_r3a keepend
   " Row 3
   syn region      pam_LOOKU_r3     transparent contained containedin=pam_LOOKU matchgroup=pam_Keyword start="\%1c[ ]\{8\}FUNCTION"rs=s+16 start="^$\n" matchgroup=pam_End end="^[ ]\{8\}END" contains=pam_LOOKU_r4,pam_Comment,pam_Comment_Position,pam_Error keepend
syn region      pam_LOOKU            matchgroup=pam_CardTag start="^\CLOOKU /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Comment,pam_Comment_Position fold keepend
" LOOKU end}}}

"{{{ === THELE begin
   " Row 3 (Node Selection)
   syn region      pam_THELE_r3     transparent contained containedin=pam_THELE start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_THELE_r2     transparent contained containedin=pam_THELE start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_THELE_r3 skipnl keepend
   " Row 1   
   syn region      pam_THELE_r1     transparent contained containedin=pam_THELE start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_THELE_r2 skipnl keepend
syn region      pam_THELE            matchgroup=pam_CardTag start="^\CTHELE /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_THELE_r[1-2] fold keepend
" === THELE end}}}

"{{{ === IMPMA begin
   " Row 3 (Node Selection)
   syn region      pam_IMPMA_r3     transparent contained containedin=pam_IMPMA start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=pam_String,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_IMPMA_r2     transparent contained containedin=pam_IMPMA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_IMPMA_r3 skipnl keepend
   " Row 1   
   syn region      pam_IMPMA_r1     transparent contained containedin=pam_IMPMA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@41i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_IMPMA_r2 skipnl keepend
      syn match       pam_IMPMA_r1_e1  display contained containedin=pam_IMPMA_r1 "\%17c.\{1,8\}"
      syn match       pam_IMPMA_r1_a1  display contained containedin=pam_IMPMA_r1 "\%17c[ ]*\CSTIF[ ]*\%25c"
      syn match       pam_IMPMA_r1_a1  display contained containedin=pam_IMPMA_r1 "\%17c[ ]*\CMASS[ ]*\%25c"
      syn match       pam_IMPMA_r1_a1  display contained containedin=pam_IMPMA_r1 "\%17c[ ]*\CVDAM[ ]*\%25c"
      syn match       pam_IMPMA_r1_a1  display contained containedin=pam_IMPMA_r1 "\%17c[ ]\{8\}"
      syn match       pam_IMPMA_r1_e2  display contained containedin=pam_IMPMA_r1 "\%25c.\{1,8\}"
      syn match       pam_IMPMA_r1_a2  display contained containedin=pam_IMPMA_r1 "\%25c[ ]*\CDMIG[ ]*\%33c"
      syn match       pam_IMPMA_r1_a2  display contained containedin=pam_IMPMA_r1 "\%25c[ ]\{8\}"
      syn match       pam_IMPMA_r1_e3  display contained containedin=pam_IMPMA_r1 "\%33c.\{1,8\}"
      syn match       pam_IMPMA_r1_a3  display contained containedin=pam_IMPMA_r1 "\%33c[ ]*\CSYMM[ ]*\%41c"
      syn match       pam_IMPMA_r1_a3  display contained containedin=pam_IMPMA_r1 "\%33c[ ]\{8\}"
      hi def link pam_IMPMA_r1_a1  pam_evenArgument
      hi def link pam_IMPMA_r1_e1  pam_evenError
      hi def link pam_IMPMA_r1_a2  pam_oddArgument
      hi def link pam_IMPMA_r1_e2  pam_oddError
      hi def link pam_IMPMA_r1_a3  pam_evenArgument
      hi def link pam_IMPMA_r1_e3  pam_evenError
syn region      pam_IMPMA            matchgroup=pam_CardTag start="^\CIMPMA /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_IMPMA_r[1-2] fold keepend
" === IMPMA end}}}

"{{{ === THCRS begin
   "Row 2 (Name)
   syn region      pam_THCRS_r2     transparent contained containedin=pam_THCRS start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 1   
      syn match       pam_THCRS_r1_e1             display contained containedin=pam_THCRS_r1 "\%17c.\{,5\}"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%17c[ ]\{5\}"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%17c[ ]*\CNODE[ ]*\%22c"
      syn match       pam_THCRS_r1_e1             display contained containedin=pam_THCRS_r1 "\%43c.\{,5\}"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%43c[ ]\{5\}"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%43c[ ]*\CNODE[ ]*\%48c"
      syn match       pam_THCRS_r1_e1             display contained containedin=pam_THCRS_r1 "\%30c.\{,5\}"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%30c[ ]\{5\}"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%30c[ ]*\CDISP[ ]*\%35c"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%30c[ ]*\CVELO[ ]*\%35c"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%30c[ ]*\CACCE[ ]*\%35c"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%30c[ ]*\CPRES[ ]*\%35c"
      syn match       pam_THCRS_r1_e1             display contained containedin=pam_THCRS_r1 "\%56c.\{,5\}"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%56c[ ]\{5\}"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%56c[ ]*\CDISP[ ]*\%61c"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%56c[ ]*\CVELO[ ]*\%61c"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%56c[ ]*\CACCE[ ]*\%61c"
      syn match       pam_THCRS_r1_a1             display contained containedin=pam_THCRS_r1 "\%56c[ ]*\CPRES[ ]*\%61c"
      hi def link pam_THCRS_r1_a1 pam_evenArgument
      hi def link pam_THCRS_r1_e1 pam_evenError
   syn region      pam_THCRS_r1     transparent contained containedin=pam_THCRS start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@22i8,@35i8,@48i8,@61i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_THCRS_r2 skipnl keepend
syn region      pam_THCRS            matchgroup=pam_CardTag start="^\CTHCRS /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_THCRS_r[1-2] fold keepend
" === THCRS end}}}

"{{{ === LCPSD begin
   "Row 2 (Name)
   syn region      pam_LCPSD_r2     transparent contained containedin=pam_LCPSD start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 1   
   syn region      pam_LCPSD_r1     transparent contained containedin=pam_LCPSD start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_LCPSD_r2 skipnl keepend
syn region      pam_LCPSD            matchgroup=pam_CardTag start="^\CLCPSD /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_LCPSD_r[1-2] fold keepend
" === LCPSD end}}}

"{{{ === VACPL begin
   " Row 4 (Node Selection)
   syn region      pam_VACPL_r4     transparent contained containedin=pam_VACPL start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_EndVACPL,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 3 
   syn region      pam_VACPL_r3     transparent contained containedin=pam_VACPL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position nextgroup=pam_VACPL_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_VACPL_r2     transparent contained containedin=pam_VACPL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_VACPL_r3 skipnl keepend
   " Row 1   
   syn region      pam_VACPL_r1     transparent contained containedin=pam_VACPL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VACPL_r2 skipnl keepend
      syn match       pam_VACPL_r1_e1  display contained containedin=pam_VACPL_r1 "\%17c.\{1,8\}"
      syn match       pam_VACPL_r1_a1  display contained containedin=pam_VACPL_r1 "\%17c[ ]*\CAPM[ ]*\%25c"
      syn match       pam_VACPL_r1_a1  display contained containedin=pam_VACPL_r1 "\%17c[ ]\{8\}"
      syn match       pam_VACPL_r1_e1  display contained containedin=pam_VACPL_r1 "\%25c.\{1,8\}"
      syn match       pam_VACPL_r1_a2  display contained containedin=pam_VACPL_r1 "\%25c[ ]*\CA[SFE]M[ ]*\%33c"
      syn match       pam_VACPL_r1_a2  display contained containedin=pam_VACPL_r1 "\%25c[ ]\{8\}"

      syn match       pam_VACPL_r3_e1  display contained containedin=pam_VACPL_r3 "\%17c.\{1,8\}"
      syn match       pam_VACPL_r3_a1  display contained containedin=pam_VACPL_r3 "\%17c[ ]\{8\}"
      syn match       pam_VACPL_r3_a1  display contained containedin=pam_VACPL_r3 "\%17c[ ]*\CSLIDE[ ]*\%25c"
      syn match       pam_VACPL_r3_a1  display contained containedin=pam_VACPL_r3 "\%17c[ ]*\CPERFO[ ]*\%25c"
      syn match       pam_VACPL_r3_a1  display contained containedin=pam_VACPL_r3 "\%17c[ ]*\CFREE[ ]*\%25c"
      syn match       pam_VACPL_r3_a1  display contained containedin=pam_VACPL_r3 "\%17c[ ]*\CSTICK[ ]*\%25c"
      syn match       pam_VACPL_r3_a1  display contained containedin=pam_VACPL_r3 "\%17c[ ]*\CRIGID[ ]*\%25c"
      hi def link pam_VACPL_r1_a1  pam_evenArgument
      hi def link pam_VACPL_r1_e1  pam_evenError
      hi def link pam_VACPL_r1_a2  pam_oddArgument
      hi def link pam_VACPL_r1_e2  pam_oddError
      hi def link pam_VACPL_r3_a1  pam_oddArgument
      hi def link pam_VACPL_r3_e1  pam_oddError
   " END_VACPL
   syn match       pam_EndVACPL        display contained containedin=pam_VACPL "^\CEND_VACPL"
   hi def link pam_EndVACPL pam_CardTag
syn region      pam_VACPL            matchgroup=pam_CardTag start="^\CVACPL /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VACPL_r[1-3],pam_EndVACPL fold keepend
" === VACPL end}}}

"{{{ === HFLUX begin
   " Row 3 (Node Selection)
   syn region      pam_HFLUX_r3     transparent contained containedin=pam_HFLUX start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_HFLUX_r2     transparent contained containedin=pam_HFLUX start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_HFLUX_r3 skipnl keepend
   " Row 1   
   syn region      pam_HFLUX_r1     transparent contained containedin=pam_HFLUX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17f8,@25i8,@33i8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_HFLUX_r2 skipnl keepend
syn region      pam_HFLUX            matchgroup=pam_CardTag start="^\CHFLUX /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_HFLUX_r[1-3] fold keepend
" === HFLUX,DFLUX end}}}

"{{{ === BFLUX,DFLUX begin
   " Row 3 (Node Selection)
   syn region      pam_BFLUX_r3     transparent contained containedin=pam_BFLUX start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_BFLUX_r2     transparent contained containedin=pam_BFLUX start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_BFLUX_r3 skipnl keepend
   " Row 1   
   syn region      pam_BFLUX_r1     transparent contained containedin=pam_BFLUX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17i8,@25i8,@33f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_BFLUX_r2 skipnl keepend
syn region      pam_BFLUX            matchgroup=pam_CardTag start="^\C[BD]FLUX /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_BFLUX_r[1-3] fold keepend
" === BFLUX,DFLUX end}}}

"{{{ === INTEM begin
   " Row 3 (Node Selection)
   syn region      pam_INTEM_r3     transparent contained containedin=pam_INTEM start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_INTEM_r2     transparent contained containedin=pam_INTEM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_INTEM_r3 skipnl keepend
   " Row 1   
   syn region      pam_INTEM_r1     transparent contained containedin=pam_INTEM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_INTEM_r2 skipnl keepend
syn region      pam_INTEM            matchgroup=pam_CardTag start="^\CINTEM /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_INTEM_r[1-3] fold keepend
" === INTEM end}}}

"{{{ === HTSURF begin
   " Row 5 (Node Selection)
   syn region      pam_HTSURF_r5     transparent contained containedin=pam_HTSURF start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 4
   syn region      pam_HTSURF_r4     transparent contained containedin=pam_HTSURF start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f8,pam_Comment,pam_Comment_Position nextgroup=pam_HTSURF_r5 skipnl keepend
   "Row 3
   syn region      pam_HTSURF_r3     transparent contained containedin=pam_HTSURF start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f8,@9i8,@17i8,@25i8,pam_Comment,pam_Comment_Position nextgroup=pam_HTSURF_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_HTSURF_r2     transparent contained containedin=pam_HTSURF start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_HTSURF_r3 skipnl keepend
   " Row 1   
   syn region      pam_HTSURF_r1     transparent contained containedin=pam_HTSURF start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8,@17i8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_HTSURF_r2 skipnl keepend
syn region      pam_HTSURF            matchgroup=pam_CardTag start="^\CHTSURF/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_HTSURF_r[1-3] fold keepend
" === HTSURF end}}}

"{{{ === TEMBC begin
   " Row 3 (Node Selection)
   syn region      pam_TEMBC_r3     transparent contained containedin=pam_TEMBC start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_TEMBC_r2     transparent contained containedin=pam_TEMBC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TEMBC_r3 skipnl keepend
   " Row 1   
   syn region      pam_TEMBC_r1     transparent contained containedin=pam_TEMBC start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,@25i8,@33f8,@49i8,@57i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TEMBC_r2 skipnl keepend
      syn match       pam_TEMPBC_r1_a1  display contained containedin=pam_TEMBC_r1 "\%57c\CUPPER   "
      syn match       pam_TEMPBC_r1_a1  display contained containedin=pam_TEMBC_r1 "\%57c\CLOWER   "
      syn match       pam_TEMPBC_r1_a1  display contained containedin=pam_TEMBC_r1 "\%41c\CFILE    "
      hi def link pam_TEMPBC_r1_a1 pam_oddArgument
syn region      pam_TEMBC            matchgroup=pam_CardTag start="^\CTEMBC /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_TEMBC_r[1-3] fold keepend
" === TEMBC end}}}

"{{{ === LAYER begin
   " Row 3 
   syn region      pam_LAYER_r3     transparent contained containedin=pam_LAYER start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_LAYER_r2     transparent contained containedin=pam_LAYER start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_LAYER_r3 skipnl keepend
   " Row 1   
   syn region      pam_LAYER_r1     transparent contained containedin=pam_LAYER start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_LAYER_r2 skipnl keepend
syn region      pam_LAYER            matchgroup=pam_CardTag start="^\CLAYER /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_LAYER_r[1-2] fold keepend
" === LAYER end}}}

"{{{ === RMLOAD begin
   " Row 3 (Node Selection)
   syn region      pam_RMLOAD_r3     transparent contained containedin=pam_RMLOAD start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_RMLOAD_r2     transparent contained containedin=pam_RMLOAD start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_RMLOAD_r3 skipnl keepend
   " Row 1   
      syn match       pam_RMLOAD_r1_e1             display contained containedin=pam_RMLOAD_r1 "\%19c.\{,6\}"
      syn match       pam_RMLOAD_r1_a1             display contained containedin=pam_RMLOAD_r1 "\%19c[01]\{6\}"
      hi def link pam_RMLOAD_r1_a1 pam_evenArgument
      hi def link pam_RMLOAD_r1_e1 pam_evenError
   syn region      pam_RMLOAD_r1     transparent contained containedin=pam_RMLOAD start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_RMLOAD_r2 skipnl keepend
syn region      pam_RMLOAD            matchgroup=pam_CardTag start="^\CRMLOAD/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_RMLOAD_r[1-2] fold keepend
" === RMLOAD end}}}

"{{{ === MLOAD begin
   "Row 2 (Name)
   syn region      pam_MLOAD_r2     transparent contained containedin=pam_MLOAD start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_EndMLOAD 
   " Row 1   
   syn region      pam_MLOAD_r1     transparent contained containedin=pam_MLOAD start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MLOAD_r2 skipnl keepend
   " END_MLOAD
   syn match       pam_EndMLOAD     display containedin=ALL "^\CEND_MLOAD"
   hi def link pam_EndMLOAD pam_CardTag
syn region      pam_MLOAD           matchgroup=pam_CardTag start="^\CMLOAD /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_MLOAD_r[1-2] fold keepend
" === MLOAD end}}}

"{{{ === DISLIM begin
   " Row 3 (Node Selection)
   syn region      pam_DISLIM_r3     transparent contained containedin=pam_DISLIM start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_DISLIM_r2     transparent contained containedin=pam_DISLIM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_DISLIM_r3 skipnl keepend
   " Row 1   
      syn match    pam_DISLIM_r1_a1  contained containedin=pam_DISLIM_r1 "\%17c\CCURVE   "
      hi def link pam_DISLIM_r1_a1 pam_evenArgument
   syn region      pam_DISLIM_r1     transparent contained containedin=pam_DISLIM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,@25i8,@33f8,@41i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DISLIM_r2 skipnl keepend
syn region      pam_DISLIM            matchgroup=pam_CardTag start="^\CDISLIM/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DISLIM_r[1-2] fold keepend
" === DISLIM end}}}

"{{{ === INPRES begin
   " Row 3 (Node Selection)
   syn region      pam_INPRES_r3     transparent contained containedin=pam_INPRES start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_INPRES_r2     transparent contained containedin=pam_INPRES start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_INPRES_r3 skipnl keepend
   " Row 1   
   syn region      pam_INPRES_r1     transparent contained containedin=pam_INPRES start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_INPRES_r2 skipnl keepend
syn region      pam_INPRES            matchgroup=pam_CardTag start="^\CINPRES/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_INPRES_r[1-3] fold keepend
" === INPRES end}}}

"{{{ === PRESBC begin
   " Row 3 (Node Selection)
   syn region      pam_PRESBC_r3     transparent contained containedin=pam_PRESBC start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_PRESBC_r2     transparent contained containedin=pam_PRESBC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PRESBC_r3 skipnl keepend
   " Row 1   
      syn match       pam_PRESBC_r1_e1             display contained containedin=pam_PRESBC_r1 "\%57c.\{,3\}"
      syn match       pam_PRESBC_r1_a1             display contained containedin=pam_PRESBC_r1 "\%57c[ ]\{2\}[ 01]"
      syn match       pam_PRESBC_r1_v1             display contained containedin=pam_PRESBC_r1 "\%57c[ ]*\[[^\[]\{-}\]\%60c"
      syn match       pam_PRESBC_r1_v1             display contained containedin=pam_PRESBC_r1 "\%57c[ ]*<[^<]\{-}>\%60c"
      hi def link pam_PRESBC_r1_a1 pam_oddArgument
      hi def link pam_PRESBC_r1_v1 pam_oddVar
      hi def link pam_PRESBC_r1_e1 pam_oddError
   syn region      pam_PRESBC_r1     transparent contained containedin=pam_PRESBC start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33i8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PRESBC_r2 skipnl keepend
syn region      pam_PRESBC            matchgroup=pam_CardTag start="^\CPRESBC/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PRESBC_r[1-3] fold keepend
" === PRESBC end}}}

"{{{ === PREFA/PREBM begin
   " Row 3 (Node Selection)
   syn region      pam_PREFA_r3     transparent contained containedin=pam_PREFA start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_PREFA_r2     transparent contained containedin=pam_PREFA start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PREFA_r3 skipnl keepend
   " Row 1   
   syn region      pam_PREFA_r1     transparent contained containedin=pam_PREFA start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f8,@33i8,@41f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PREFA_r2 skipnl keepend
syn region      pam_PREFA            matchgroup=pam_CardTag start="^\CPREFA\|\CPREBM /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PREFA_r[1-3] fold keepend
" === PREFA end}}}

"{{{ === VAPANL begin
   " END_VAPANL
   syn match       pam_EndVAPANL      display contained "^\CEND_VAPANL"
   hi def link pam_EndVAPANL pam_CardTag
   " Row 3 (Node Selection)
   syn region      pam_VAPANL_r3     transparent contained containedin=pam_VAPANL start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error,pam_EndVAPANL nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_VAPANL_r2     transparent contained containedin=pam_VAPANL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_VAPANL_r3 skipnl keepend
   " Row 1   
   syn region      pam_VAPANL_r1     transparent contained containedin=pam_VAPANL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAPANL_r2 skipnl keepend
syn region      pam_VAPANL            matchgroup=pam_CardTag start="^\CVAPANL/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAPANL_r[1-3] fold keepend
" === VAPANL end}}}

"{{{ === GRPEGM begin
   " Row 3 (Node Selection)
   syn region      pam_GRPEGM_r3     transparent contained containedin=pam_GRPEGM start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_GRPEGM_r2     transparent contained containedin=pam_GRPEGM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_GRPEGM_r3 skipnl keepend
   " Row 1   
   syn region      pam_GRPEGM_r1     transparent contained containedin=pam_GRPEGM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_GRPEGM_r2 skipnl keepend
syn region      pam_GRPEGM            matchgroup=pam_CardTag start="^\CGRPEGM/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_GRPEGM_r[1-2] fold keepend
" === GRPEGM end}}}

"{{{ === GRPDAM begin
   " Row 3 (Node Selection)
   syn region      pam_GRPDAM_r3     transparent contained containedin=pam_GRPDAM start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_GRPDAM_r2     transparent contained containedin=pam_GRPDAM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_GRPDAM_r3 skipnl keepend
   " Row 1   
   syn region      pam_GRPDAM_r1     transparent contained containedin=pam_GRPDAM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_GRPDAM_r2 skipnl keepend
syn region      pam_GRPDAM            matchgroup=pam_CardTag start="^\CGRPDAM/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_GRPDAM_r[1-2] fold keepend
" === GRPDAM end}}}

"{{{ === NLAVE begin
   " Row 4 (Node Selection)
   syn region      pam_NLAVE_r4     transparent contained containedin=pam_NLAVE start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 3   
   syn region      pam_NLAVE_r3     transparent contained containedin=pam_NLAVE start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f16,@17f16,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_NLAVE_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_NLAVE_r2     transparent contained containedin=pam_NLAVE start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_NLAVE_r3 skipnl keepend
   " Row 1   
      syn match       pam_NLAVE_r1_e1             display contained containedin=pam_NLAVE_r1 "\%17c.\{,8\}"
      syn match       pam_NLAVE_r1_a1             display contained containedin=pam_NLAVE_r1 "\%17c\CGLASS_EN"
      hi def link pam_NLAVE_r1_a1 pam_evenArgument
      hi def link pam_NLAVE_r1_e1 pam_evenError
   syn region      pam_NLAVE_r1     transparent contained containedin=pam_NLAVE start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_NLAVE_r2 skipnl keepend
syn region      pam_NLAVE            matchgroup=pam_CardTag start="^\CNLAVE /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_NLAVE_r[1-3] fold keepend
" === NLAVE end}}}

"{{{ === DELEM begin
   " Row 3 (Node Selection)
   syn region      pam_DELEM_r3     transparent contained containedin=pam_DELEM start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_DELEM_r2     transparent contained containedin=pam_DELEM start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_DELEM_r3 skipnl keepend
   " Row 1   
   syn region      pam_DELEM_r1     transparent contained containedin=pam_DELEM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DELEM_r2 skipnl keepend
syn region      pam_DELEM            matchgroup=pam_CardTag start="^\CDELEM /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DELEM_r[1-2] fold keepend
" === DELEM end}}}

"{{{ === PYFUNC begin
   syn region      pam_PYFUNC_r3     transparent contained containedin=pam_PYFUNC start="\%1c." start="\%$" matchgroup=pam_CardTag end="\%$" contains=pam_Comment,pam_Comment_Position,pam_Source nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndPYFUNC keepend
   "Row 2 (Name)
   syn region      pam_PYFUNC_r2     transparent contained containedin=pam_PYFUNC start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_PYFUNC_r3,pam_EndPYFUNC skipnl keepend
   " Row 1   
   syn region      pam_PYFUNC_r1     transparent contained containedin=pam_PYFUNC start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PYFUNC_r2 skipnl keepend
syn region      pam_PYFUNC            matchgroup=pam_CardTag start="^\CPYFUNC/" end="^\CEND_PYFUNC" contains=pam_PYFUNC_r[1-2] fold keepend
   " END_PYFUNC
   syn match       pam_EndPYFUNC        display contained "^\CEND_PYFUNC"
   hi def link pam_EndPYFUNC pam_CardTag
" === PYFUNC end}}}

"{{{ === SEWING begin
   " Row 3 (Node Selection)
   syn region      pam_SEWING_r3     transparent contained containedin=pam_SEWING start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 2 (Name)
   syn region      pam_SEWING_r2     transparent contained containedin=pam_SEWING start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_SEWING_r3 skipnl keepend
   " Row 1   
   syn region      pam_SEWING_r1     transparent contained containedin=pam_SEWING start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17f8,@25f8,@33i8,@41i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SEWING_r2 skipnl keepend
syn region      pam_SEWING            matchgroup=pam_CardTag start="^\CSEWING/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SEWING_r[1-2] fold keepend
" === SEWING end}}}

"{{{ === LLINK begin
   syn region      pam_LLink_r2     transparent contained containedin=pam_LLink start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   syn region      pam_LLink_r1     transparent contained containedin=pam_LLink start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_LLink_r2 skipnl keepend
syn region      pam_LLink          matchgroup=pam_CardTag start="^\CLLINK /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_LLink_r[1-2] fold keepend
" === LLINK end}}}

"{{{ === ELINK begin
   syn region      pam_ELink_r2     transparent contained containedin=pam_ELink start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   syn region      pam_ELink_r1     transparent contained containedin=pam_ELink start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_ELink_r2 skipnl keepend
syn region      pam_ELink          matchgroup=pam_CardTag start="^\CELINK /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_ELink_r[1-2] fold keepend
" === ELINK end}}}

"{{{ === SLINK begin
   syn region      pam_SLink_r2     transparent contained containedin=pam_SLink start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   syn region      pam_SLink_r1     transparent contained containedin=pam_SLink start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,@41i8,@49i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_SLink_r2 skipnl keepend
syn region      pam_SLink          matchgroup=pam_CardTag start="^\CSLINK /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_SLink_r[1-2] fold keepend
" === SLINK end}}}

"{{{ === PLINK begin
   syn region      pam_PLink_r2     transparent contained containedin=pam_PLink start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   syn region      pam_PLink_r1     transparent contained containedin=pam_PLink start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25i8,@33i8,@41i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLink_r2 skipnl keepend
syn region      pam_PLink          matchgroup=pam_CardTag start="^\CPLINK /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PLink_r[1-2] fold keepend
" === PLINK end}}}

"{{{ === GROUP begin
syn region      pam_Group            matchgroup=pam_CardTag start="^\CGROUP /" end="        \CEND" contains=pam_String,@pam_Ident,pam_GroupMeta,pam_Error,pam_Comment,pam_Comment_Position fold keepend
syn region      pam_GroupMeta        matchgroup=pam_CardTag contained start="^\CMETA" end="^\CEND_META" contains=pam_Source fold keepend
" === GROUP end}}}

"{{{ === PLY begin
   syn cluster        pam_PLY          contains=pam_PLY0,pam_PLY1,pam_PLY2,pam_PLY6,pam_PLY7,pam_PLY8
   syn cluster        pam_PLYFAIL      contains=pam_PLYFAILX,pam_PLYFAIL0,pam_PLYFAIL1,pam_PLYFAIL6,pam_PLYFAIL7,pam_PLYFAIL8,pam_PLYFAIL10
   " PLY FAIL X
      syn region      pam_PLYFAILX      transparent contained containedin=@pam_PLY start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYX_r2 skipnl keepend
   " PLYFAIL 0,9
      syn region      pam_PLYFAIL0_r3      transparent contained containedin=pam_PLYFAIL0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
      syn region      pam_PLYFAIL0_r2      transparent contained containedin=pam_PLYFAIL0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL0_r3 skipnl keepend
      syn region      pam_PLYFAIL0_r1      transparent contained containedin=pam_PLYFAIL0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL0_r2 skipnl keepend
      syn region      pam_PLYFAIL0      transparent contained containedin=@pam_PLY start="\%1c.\{19\}[09]"rs=s+10 start="^$\n" end="\%$" contains=pam_PLYFAIL0_r[1-3] skipnl keepend
   " PLYFAIL 1,2,3,4,5
      syn region      pam_PLYFAIL1_r3      transparent contained containedin=pam_PLYFAIL1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
      syn region      pam_PLYFAIL1_r2      transparent contained containedin=pam_PLYFAIL1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL1_r3 skipnl keepend
      syn region      pam_PLYFAIL1_r1      transparent contained containedin=pam_PLYFAIL1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL1_r2 skipnl keepend
      syn region      pam_PLYFAIL1      transparent contained containedin=@pam_PLY start="\%1c.\{19\}[1-5]"rs=s+10 start="^$\n" end="\%$" contains=pam_PLYFAIL1_r[1-3] skipnl keepend
   " PLYFAIL 6
      syn region      pam_PLYFAIL6_r3      transparent contained containedin=pam_PLYFAIL6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
      syn region      pam_PLYFAIL6_r2      transparent contained containedin=pam_PLYFAIL6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL6_r3 skipnl keepend
      syn region      pam_PLYFAIL6_r1      transparent contained containedin=pam_PLYFAIL6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL6_r2 skipnl keepend
      syn region      pam_PLYFAIL6      transparent contained containedin=@pam_PLY start="\%1c.\{19\}6"rs=s+10 start="^$\n" end="\%$" contains=pam_PLYFAIL6_r[1-3] skipnl keepend
   " PLYFAIL 7
      syn region      pam_PLYFAIL7_r3      transparent contained containedin=pam_PLYFAIL7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
      syn region      pam_PLYFAIL7_r2      transparent contained containedin=pam_PLYFAIL7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL7_r3 skipnl keepend
      syn region      pam_PLYFAIL7_r1      transparent contained containedin=pam_PLYFAIL7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL7_r2 skipnl keepend
      syn region      pam_PLYFAIL7      transparent contained containedin=@pam_PLY start="\%1c.\{19\}7"rs=s+10 start="^$\n" end="\%$" contains=pam_PLYFAIL7_r[1-3] skipnl keepend
   " PLYFAIL 8
      syn region      pam_PLYFAIL8_r3      transparent contained containedin=pam_PLYFAIL8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
      syn region      pam_PLYFAIL8_r2      transparent contained containedin=pam_PLYFAIL8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL8_r3 skipnl keepend
      syn region      pam_PLYFAIL8_r1      transparent contained containedin=pam_PLYFAIL8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL8_r2 skipnl keepend
      syn region      pam_PLYFAIL8      transparent contained containedin=@pam_PLY start="\%1c.\{19\}8"rs=s+10 start="^$\n" end="\%$" contains=pam_PLYFAIL8_r[1-3] skipnl keepend
   " PLYFAIL 10
      syn region      pam_PLYFAIL10_r3      transparent contained containedin=pam_PLYFAIL10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
      syn region      pam_PLYFAIL10_r2      transparent contained containedin=pam_PLYFAIL10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL10_r3 skipnl keepend
      syn region      pam_PLYFAIL10_r1      transparent contained containedin=pam_PLYFAIL10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYFAIL10_r2 skipnl keepend
      syn region      pam_PLYFAIL10      transparent contained containedin=@pam_PLY start="\%1c.\{18\}10"rs=s+10 start="^$\n" end="\%$" contains=pam_PLYFAIL10_r[1-3] skipnl keepend
   " PLY X
      syn region      pam_PLYX_r2      transparent contained containedin=pam_PLYX start="\%1c." start="^$\n" end="\%$" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Comment,pam_Commetn_Position skipnl keepend
      syn region      pam_PLYX_r1      transparent contained containedin=pam_PLYX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLYX_r2 skipnl keepend
   syn region      pam_PLYX      matchgroup=pam_CardTag start="^PLY   /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PLYX_r[1-9] fold keepend
   " PLY 0
      syn region      pam_PLY0_r13      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=@pam_PLYFAIL skipnl keepend
      syn region      pam_PLY0_r12      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r13 skipnl keepend
      syn region      pam_PLY0_r11      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r12 skipnl keepend
      syn region      pam_PLY0_r10      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r11 skipnl keepend
      syn region      pam_PLY0_r9      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r10 skipnl keepend
      syn region      pam_PLY0_r8      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r9 skipnl keepend
      syn region      pam_PLY0_r7      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r8 skipnl keepend
      syn region      pam_PLY0_r6      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r7 skipnl keepend
      syn region      pam_PLY0_r5      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r6 skipnl keepend
      syn region      pam_PLY0_r4      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r5 skipnl keepend
      syn region      pam_PLY0_r3      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r4 skipnl keepend
      syn region      pam_PLY0_r2      transparent contained containedin=pam_PLY0 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r3 skipnl keepend
      syn region      pam_PLY0_r1      transparent contained containedin=pam_PLY0 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY0_r2 skipnl keepend
   syn region      pam_PLY0      matchgroup=pam_CardTag start="^PLY   / .\{8\}[ ]\{7\}0"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PLY0_r[1-9] fold keepend
   " PLY 1
      syn region      pam_PLY1_r13      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=@pam_PLYFAIL skipnl keepend
      syn region      pam_PLY1_r12      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r13 skipnl keepend
      syn region      pam_PLY1_r11      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r12 skipnl keepend
      syn region      pam_PLY1_r10      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r11 skipnl keepend
      syn region      pam_PLY1_r9      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r10 skipnl keepend
      syn region      pam_PLY1_r8      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r9 skipnl keepend
      syn region      pam_PLY1_r7      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r8 skipnl keepend
      syn region      pam_PLY1_r6      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31i10,@41i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r7 skipnl keepend
      syn region      pam_PLY1_r5      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r6 skipnl keepend
      syn region      pam_PLY1_r4      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r5 skipnl keepend
      syn region      pam_PLY1_r3      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r4 skipnl keepend
      syn region      pam_PLY1_r2      transparent contained containedin=pam_PLY1 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r3 skipnl keepend
      syn region      pam_PLY1_r1      transparent contained containedin=pam_PLY1 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY1_r2 skipnl keepend
   syn region      pam_PLY1      matchgroup=pam_CardTag start="^PLY   / .\{8\}[ ]\{7\}1"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PLY1_r[1-9] fold keepend
   " PLY 2
      syn region      pam_PLY2_r13      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=@pam_PLYFAIL skipnl keepend
      syn region      pam_PLY2_r12      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r13 skipnl keepend
      syn region      pam_PLY2_r11      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r12 skipnl keepend
      syn region      pam_PLY2_r10      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r11 skipnl keepend
      syn region      pam_PLY2_r9      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r10 skipnl keepend
      syn region      pam_PLY2_r8      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r9 skipnl keepend
      syn region      pam_PLY2_r7      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r8 skipnl keepend
      syn region      pam_PLY2_r6      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r7 skipnl keepend
      syn region      pam_PLY2_r5      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r6 skipnl keepend
      syn region      pam_PLY2c_r5      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r6 skipnl keepend
      syn region      pam_PLY2p_r5      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r6 skipnl keepend
      syn region      pam_PLY2_r4      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r5 skipnl keepend
      syn region      pam_PLY2c_r4      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2c_r5 skipnl keepend
      syn region      pam_PLY2p_r4      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2p_r5 skipnl keepend
      syn region      pam_PLY2_r3      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r4 skipnl keepend
      syn region      pam_PLY2c_r3      transparent contained containedin=pam_PLY2 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2c_r4 skipnl keepend
         syn match    pam_PLY2c_r3_a1  display contained containedin=pam_PLY2c_r3 "\%11c\CCURVE     "
         hi def link pam_PLY2c_r3_a1 pam_evenArgument
      syn region      pam_PLY2p_r3      transparent contained containedin=pam_PLY2 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2p_r4 skipnl keepend
      syn region      pam_PLY2p_r3      transparent contained containedin=pam_PLY2 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2p_r4 skipnl keepend
         syn match    pam_PLY2p_r3_a1  display contained containedin=pam_PLY2p_r3 "\%11c\CPOWER     "
         syn match    pam_PLY2p_r3_a1  display contained containedin=pam_PLY2p_r3 "\%11c\CKRUPK     "
         hi def link pam_PLY2p_r3_a1 pam_evenArgument
      syn region      pam_PLY2_r2      transparent contained containedin=pam_PLY2 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r3,pam_PLY2c_r3,pam_PLY2p_r3 skipnl keepend
      syn region      pam_PLY2_r1      transparent contained containedin=pam_PLY2 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY2_r2 skipnl keepend
   syn region      pam_PLY2      matchgroup=pam_CardTag start="^PLY   / .\{8\}[ ]\{7\}2"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PLY2_r[1-9] fold keepend
   " PLY 6
      syn region      pam_PLY6_r15      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=@pam_PLYFAIL skipnl keepend
      syn region      pam_PLY6_r14      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r15 skipnl keepend
      syn region      pam_PLY6_r13      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r14 skipnl keepend
      syn region      pam_PLY6_r12      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r13 skipnl keepend
      syn region      pam_PLY6_r11      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r12 skipnl keepend
      syn region      pam_PLY6_r10      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r11 skipnl keepend
      syn region      pam_PLY6_r9      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r10 skipnl keepend
      syn region      pam_PLY6_r8      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r9 skipnl keepend
      syn region      pam_PLY6_r7      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r8 skipnl keepend
      syn region      pam_PLY6_r6      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r7 skipnl keepend
      syn region      pam_PLY6_r5      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r6 skipnl keepend
      syn region      pam_PLY6_r4      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r5 skipnl keepend
      syn region      pam_PLY6_r3      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r4 skipnl keepend
      syn region      pam_PLY6_r2      transparent contained containedin=pam_PLY6 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r3 skipnl keepend
      syn region      pam_PLY6_r1      transparent contained containedin=pam_PLY6 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY6_r2 skipnl keepend
   syn region      pam_PLY6      matchgroup=pam_CardTag start="^PLY   / .\{8\}[ ]\{7\}6"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PLY6_r[1-9] fold keepend
   " PLY 7
      syn region      pam_PLY7_r13      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=@pam_PLYFAIL skipnl keepend
      syn region      pam_PLY7_r12      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r13 skipnl keepend
      syn region      pam_PLY7_r11      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r12 skipnl keepend
      syn region      pam_PLY7_r10      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r11 skipnl keepend
      syn region      pam_PLY7_r9      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r10 skipnl keepend
      syn region      pam_PLY7_r8      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r9 skipnl keepend
      syn region      pam_PLY7_r7      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r8 skipnl keepend
      syn region      pam_PLY7_r6      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r7 skipnl keepend
      syn region      pam_PLY7_r5      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r6 skipnl keepend
      syn region      pam_PLY7_r4      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r5 skipnl keepend
      syn region      pam_PLY7_r3      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r4 skipnl keepend
      syn region      pam_PLY7_r2      transparent contained containedin=pam_PLY7 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r3 skipnl keepend
      syn region      pam_PLY7_r1      transparent contained containedin=pam_PLY7 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY7_r2 skipnl keepend
   syn region      pam_PLY7      matchgroup=pam_CardTag start="^PLY   / .\{8\}[ ]\{7\}7"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PLY7_r[1-9] fold keepend
   " PLY 8
      syn region      pam_PLY8_r15      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=@pam_PLYFAIL skipnl keepend
      syn region      pam_PLY8_r14      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r15 skipnl keepend
      syn region      pam_PLY8_r13      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r14 skipnl keepend
      syn region      pam_PLY8_r12      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r13 skipnl keepend
      syn region      pam_PLY8_r11      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r12 skipnl keepend
      syn region      pam_PLY8_r10      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r11 skipnl keepend
      syn region      pam_PLY8_r9      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r10 skipnl keepend
      syn region      pam_PLY8_r8      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r9 skipnl keepend
      syn region      pam_PLY8_r7      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r8 skipnl keepend
      syn region      pam_PLY8_r6      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r7 skipnl keepend
      syn region      pam_PLY8_r5      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r6 skipnl keepend
      syn region      pam_PLY8_r4      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r5 skipnl keepend
      syn region      pam_PLY8_r3      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r4 skipnl keepend
      syn region      pam_PLY8_r2      transparent contained containedin=pam_PLY8 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r3 skipnl keepend
      syn region      pam_PLY8_r1      transparent contained containedin=pam_PLY8 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_PLY8_r2 skipnl keepend
   syn region      pam_PLY8      matchgroup=pam_CardTag start="^PLY   / .\{8\}[ ]\{7\}8"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_PLY8_r[1-9] fold keepend
" PLY end}}}

" {{{=== VAMAT begin
      syn region      pam_VAMATX_r3      transparent contained containedin=pam_VAMATX start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT0_r4 skipnl keepend
      syn region      pam_VAMATX_r2      transparent contained containedin=pam_VAMATX start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMATX_r3 skipnl keepend
      syn region      pam_VAMATX_r1      transparent contained containedin=pam_VAMATX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMATX_r2 skipnl keepend
   syn region      pam_VAMATX      matchgroup=pam_CardTag start="^VAMAT /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAMATX_r[1-9] fold keepend
   " VAMAT 1
      syn region      pam_VAMAT1_r9      transparent contained containedin=pam_VAMAT1 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndVAMAT skipnl keepend
      syn region      pam_VAMAT1_r8      transparent contained containedin=pam_VAMAT1 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT1_r9 skipnl keepend
      syn region      pam_VAMAT1_r7      transparent contained containedin=pam_VAMAT1 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT1_r8 skipnl keepend
      syn region      pam_VAMAT1_r6      transparent contained containedin=pam_VAMAT1 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT1_r7 skipnl keepend
      syn region      pam_VAMAT1_r5      transparent contained containedin=pam_VAMAT1 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT1_r6 skipnl keepend
      syn region      pam_VAMAT1_r4      transparent contained containedin=pam_VAMAT1 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT1_r5 skipnl keepend
      syn region      pam_VAMAT1_r3      transparent contained containedin=pam_VAMAT1 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT1_r4 skipnl keepend
      syn region      pam_VAMAT1_r2      transparent contained containedin=pam_VAMAT1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT1_r3 skipnl keepend
      syn region      pam_VAMAT1_r1      transparent contained containedin=pam_VAMAT1 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT1_r2 skipnl keepend
   syn region      pam_VAMAT1      matchgroup=pam_CardTag start="^VAMAT / .\{8\}[ ]\{7\}1"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAMAT0_r[1-9] fold keepend
   " VAMAT 2
      syn region      pam_VAMAT2_r9      transparent contained containedin=pam_VAMAT2 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndVAMAT skipnl keepend
      syn region      pam_VAMAT2_r8      transparent contained containedin=pam_VAMAT2 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT2_r9 skipnl keepend
      syn region      pam_VAMAT2_r7      transparent contained containedin=pam_VAMAT2 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT2_r8 skipnl keepend
      syn region      pam_VAMAT2_r6      transparent contained containedin=pam_VAMAT2 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT2_r7 skipnl keepend
      syn region      pam_VAMAT2_r5      transparent contained containedin=pam_VAMAT2 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT2_r6 skipnl keepend
      syn region      pam_VAMAT2_r4      transparent contained containedin=pam_VAMAT2 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT2_r5 skipnl keepend
      syn region      pam_VAMAT2_r3      transparent contained containedin=pam_VAMAT2 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT2_r4 skipnl keepend
      syn region      pam_VAMAT2_r2      transparent contained containedin=pam_VAMAT2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT2_r3 skipnl keepend
      syn region      pam_VAMAT2_r1      transparent contained containedin=pam_VAMAT2 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT2_r2 skipnl keepend
   syn region      pam_VAMAT2      matchgroup=pam_CardTag start="^VAMAT / .\{8\}[ ]\{7\}2"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAMAT0_r[1-9] fold keepend
   " VAMAT 3
      syn region      pam_VAMAT3_r9      transparent contained containedin=pam_VAMAT3 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndVAMAT skipnl keepend
      syn region      pam_VAMAT3_r8      transparent contained containedin=pam_VAMAT3 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT3_r9 skipnl keepend
      syn region      pam_VAMAT3_r7      transparent contained containedin=pam_VAMAT3 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT3_r8 skipnl keepend
      syn region      pam_VAMAT3_r6      transparent contained containedin=pam_VAMAT3 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT3_r7 skipnl keepend
      syn region      pam_VAMAT3_r5      transparent contained containedin=pam_VAMAT3 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT3_r6 skipnl keepend
      syn region      pam_VAMAT3_r4      transparent contained containedin=pam_VAMAT3 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT3_r5 skipnl keepend
      syn region      pam_VAMAT3_r3      transparent contained containedin=pam_VAMAT3 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT3_r4 skipnl keepend
      syn region      pam_VAMAT3_r2      transparent contained containedin=pam_VAMAT3 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT3_r3 skipnl keepend
      syn region      pam_VAMAT3_r1      transparent contained containedin=pam_VAMAT3 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT3_r2 skipnl keepend
   syn region      pam_VAMAT3      matchgroup=pam_CardTag start="^VAMAT / .\{8\}[ ]\{7\}3"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAMAT0_r[1-9] fold keepend
   " VAMAT 4
      syn region      pam_VAMAT4_r9      transparent contained containedin=pam_VAMAT4 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndVAMAT skipnl keepend
      syn region      pam_VAMAT4_r8      transparent contained containedin=pam_VAMAT4 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT4_r9 skipnl keepend
      syn region      pam_VAMAT4_r7      transparent contained containedin=pam_VAMAT4 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT4_r8 skipnl keepend
      syn region      pam_VAMAT4_r6      transparent contained containedin=pam_VAMAT4 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT4_r7 skipnl keepend
      syn region      pam_VAMAT4_r5      transparent contained containedin=pam_VAMAT4 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT4_r6 skipnl keepend
      syn region      pam_VAMAT4_r4      transparent contained containedin=pam_VAMAT4 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT4_r5 skipnl keepend
      syn region      pam_VAMAT4_r3      transparent contained containedin=pam_VAMAT4 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT4_r4 skipnl keepend
      syn region      pam_VAMAT4_r2      transparent contained containedin=pam_VAMAT4 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT4_r3 skipnl keepend
      syn region      pam_VAMAT4_r1      transparent contained containedin=pam_VAMAT4 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT4_r2 skipnl keepend
   syn region      pam_VAMAT4      matchgroup=pam_CardTag start="^VAMAT / .\{8\}[ ]\{7\}4"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAMAT0_r[1-9] fold keepend
   " VAMAT 5
      syn region      pam_VAMAT5_r9      transparent contained containedin=pam_VAMAT5 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndVAMAT skipnl keepend
      syn region      pam_VAMAT5_r8      transparent contained containedin=pam_VAMAT5 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT5_r9 skipnl keepend
      syn region      pam_VAMAT5_r7      transparent contained containedin=pam_VAMAT5 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT5_r8 skipnl keepend
      syn region      pam_VAMAT5_r6      transparent contained containedin=pam_VAMAT5 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT5_r7 skipnl keepend
      syn region      pam_VAMAT5_r5      transparent contained containedin=pam_VAMAT5 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT5_r6 skipnl keepend
      syn region      pam_VAMAT5_r4      transparent contained containedin=pam_VAMAT5 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT5_r5 skipnl keepend
      syn region      pam_VAMAT5_r3      transparent contained containedin=pam_VAMAT5 start="\%1c." start="^$\n" end="\(\%81c&\|\%81c\-\)\@<!$\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT5_r4 skipnl keepend
      syn region      pam_VAMAT5_r2      transparent contained containedin=pam_VAMAT5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT5_r3 skipnl keepend
      syn region      pam_VAMAT5_r1      transparent contained containedin=pam_VAMAT5 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_VAMAT5_r2 skipnl keepend
   syn region      pam_VAMAT5      matchgroup=pam_CardTag start="^VAMAT / .\{8\}[ ]\{7\}5"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_VAMAT0_r[1-9] fold keepend
   " END_VAMAT
   syn match       pam_EndVAMAT        display contained "^\CEND_VAMAT"
   hi def link pam_EndVAMAT pam_CardTag
" VAMAT end}}}

" {{{=== DOMAIN begin
 "DOMAIN X
   "Row 2 (Name)
   syn region      pam_DOMAINX_r2     transparent contained containedin=pam_DOMAINX start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1   
   syn region      pam_DOMAINX_r1     transparent contained containedin=pam_DOMAINX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DOMAIN_r2 skipnl keepend
syn region      pam_DOMAINX            matchgroup=pam_CardTag start="^\CDOMAIN/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DOMAINX_r[1-2] fold keepend
 "DOMAIN ASM
   "Row 2 (Name)
   syn region      pam_DOMAIN_ASM_r2     transparent contained containedin=pam_DOMAIN_ASM start="\%1cNAME" start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1   
   syn region      pam_DOMAIN_ASM_r1     transparent contained containedin=pam_DOMAIN_ASM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DOMAIN_r2 skipnl keepend
      syn match       pam_DOMAIN_ASM_r1_a1  display contained containedin=pam_DOMAIN_ASM_r1 "\%17c[ ]*\CASM[ ]*\%25c"
      hi def link pam_DOMAIN_ASM_r1_a1  pam_evenArgument
   "Row 5
   syn region      pam_DOMAIN_ASM_r5     transparent contained containedin=pam_DOMAIN_ASM matchgroup=pam_Keyword start="\CUSE_EIGEN" start="^$\n" end="\n[\$\#]\@!" contains=pam_Integer,pam_Control_UNIT_arg,pam_Comment,pam_Comment_Position skipnl keepend
      syn keyword     pam_DOMAIN_ASM_r3_a2         contained containedin=pam_DOMAIN_ASM_r5 PAM NASTRAN
      hi def link pam_DOMAIN_ASM_r3_a2 pam_Argument

syn region      pam_DOMAIN_ASM            matchgroup=pam_CardTag start="^\CDOMAIN/ .\{8\}[ ]*\CASM[ ]*\%25c"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DOMAIN_ASM_r[1-2],pam_Control_DAMPING_MODAL_VISCOUS,pam_Control_DAMPING_MODAL_STRUCTURAL,pam_Control_DAMPING_MATRIX,pam_Control_DBASE_EIGEN,pam_Control_METHOD,pam_Control_DBASE_DAMP fold keepend
      syn match       pam_DOMAIN_AFM_r1_a1  display contained containedin=pam_DOMAIN_ASM_r1 "\%17c[ ]*\CAFM[ ]*\%25c"
      hi def link pam_DOMAIN_AFM_r1_a1  pam_evenArgument
syn region      pam_DOMAIN_AFM            matchgroup=pam_CardTag start="^\CDOMAIN/ .\{8\}[ ]*\CAFM[ ]*\%25c"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DOMAIN_ASM_r[1-2],pam_Control_DAMPING_MODAL_VISCOUS,pam_Control_DAMPING_MODAL_STRUCTURAL,pam_Control_DAMPING_MATRIX,pam_Control_DBASE_EIGEN,pam_Control_METHOD,pam_Control_DBASE_DAMP,pam_Integer fold keepend
   "Row 2 (Name)
   syn region      pam_DOMAIN_APM_r2     transparent contained containedin=pam_DOMAIN_APM start="\%1cNAME" start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1   
   syn region      pam_DOMAIN_APM_r1     transparent contained containedin=pam_DOMAIN_APM start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_DOMAIN_r2 skipnl keepend
      syn match       pam_DOMAIN_APM_r1_a1  display contained containedin=pam_DOMAIN_APM_r1 "\%17c[ ]*\CAPM[ ]*\%25c"
      hi def link pam_DOMAIN_APM_r1_a1  pam_evenArgument
   "Row 3
   syn region      pam_DOMAIN_APM_r3     transparent contained containedin=pam_DOMAIN_APM matchgroup=pam_Keyword start="\CDBASE_IMPEDANCE" start="^$\n" end="\n[\$\#]\@!" contains=pam_String,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_DOMAIN_APM_r4     transparent contained containedin=pam_DOMAIN_APM matchgroup=pam_Keyword start="\CMETHOD" start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position skipnl keepend
      syn keyword     pam_DOMAIN_APM_r4_a1         contained containedin=pam_DOMAIN_APM_r4 DIRECT
      hi def link pam_DOMAIN_APM_r4_a1 pam_Argument
syn region      pam_DOMAIN_APM            matchgroup=pam_CardTag start="^\CDOMAIN/ .\{8\}[ ]*\CAPM[ ]*\%25c"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_DOMAIN_APM_r[1-2] fold keepend
   " END_DOMAIN
   syn match       pam_EndDOMAIN        display contained "^\CEND_DOMAIN"
   hi def link pam_EndDOMAIN pam_CardTag
" DOMAIN end}}}

"{{{ === TURBL begin
   " Row 6 (Node Selection)
   syn region      pam_TURBL_r6     transparent contained containedin=pam_TURBL start="\%1c." start="^$\n" matchgroup=pam_CardTag end="\%$" contains=@pam_Ident,pam_Comment,pam_Comment_Position,pam_End,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   " Row 5   
   syn region      pam_TURBL_r5     transparent contained containedin=pam_TURBL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i8,@9f8,@17f8,@25i8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TURBL_r6 skipnl keepend
   " Row 4   
   syn region      pam_TURBL_r4     transparent contained containedin=pam_TURBL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i8,@9i8,@17f8,@25i8,@33f8,@41f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TURBL_r5 skipnl keepend
   " Row 3   
   syn region      pam_TURBL_r3     transparent contained containedin=pam_TURBL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i8,@9f8,@17f8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TURBL_r4 skipnl keepend
   "Row 2 (Name)
   syn region      pam_TURBL_r2     transparent contained containedin=pam_TURBL start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_TURBL_r3 skipnl keepend
   " Row 1   
   syn region      pam_TURBL_r1     transparent contained containedin=pam_TURBL start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TURBL_r2 skipnl keepend
      syn match    pam_TURBL_r1_e1  display contained containedin=pam_TURBL_r1  "\%17c.\{,8\}"
      syn match    pam_TURBL_r1_a1  display contained containedin=pam_TURBL_r1  "\%17c[ ]*\CCORCOS[ ]*\%25c"
      syn match    pam_TURBL_r1_v1  display contained containedin=pam_TURBL_r1  "\%17c[ ]*\[[^\[]\{-}\]\%25c"
      syn match    pam_TURBL_r1_v1  display contained containedin=pam_TURBL_r1  "\%17c[ ]*<[^<]\{-}>\%25c"
      hi def link  pam_TURBL_r1_a1  pam_evenArgument
      hi def link  pam_TURBL_r1_e1  pam_evenError
      hi def link  pam_TURBL_r1_v1  pam_evenVar
syn region      pam_TURBL            matchgroup=pam_CardTag start="^\CTURBL /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_TURBL_r[1-6] fold keepend
" === TURBL end}}}

" {{{ Materialien

"{{{ === MPD begin
   " END_MPD
   syn match       pam_EndMPD        display contained "^\CEND_MPD"
   hi def link pam_EndMPD pam_CardTag
   syn region      pam_MPDArg_DAMPING_VISCOUS_r1 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,pam_Comment,pam_Comment_Position
   syn region      pam_MPDArg_DAMPING_STRUCTURAL_r1 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position 
   syn region      pam_MPDArg_DYNAMIC_MODULUS_r1 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position 
   syn region      pam_MPDArg_PLASTIC_STRAIN_RATE_HARDENING_r1 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,pam_Comment,pam_Comment_Position 
   syn region      pam_MPDArg_PLASTIC_ISOTROPIC_HARDENING_r1 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i10,@31f10,@41i10,@51f10,@61i10,@71f10,pam_Comment,pam_Comment_Position    
   syn region      pam_MPDArg_ELASTIC_NONLINEAR_r1 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i10,@31f10,@41i10,@51f10,@61i10,@71f10,pam_Comment,pam_Comment_Position

   syn region      pam_MPDArg_ELASTIC_LINEAR_r2 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position
   syn region      pam_MPDArg_ELASTIC_LINEAR_r1 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position nextgroup=pam_MPDArg_ELASTIC_LINEAR_r2 skipnl keepend

   syn region      pam_MPDArg_EXPANSION_r2 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position
   syn region      pam_MPDArg_EXPANSION_r1 display contained start="\%1c." end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position nextgroup=pam_MPDArg_EXPANSION_r2 skipnl keepend
   syn region      pam_MPDArg_EXPANSION display contained containedin=pam_MPD_r3 matchgroup=pam_Keyword start="\CEXPANSION" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_MPDArg_EXPANSION_arg,pam_Error,pam_FreeError,pam_FreeVar nextgroup=pam_MPDArg_EXPANSION_r1 skipnl keepend
      syn keyword pam_MPDArg_EXPANSION_arg contained containedin=pam_MPDArg_EXPANSION COEFFICIENT STRAIN CURVE 
      hi def link pam_MPDArg_EXPANSION_arg pam_Argument
   syn region      pam_MPDArg_ELASTIC_LINEAR display contained containedin=pam_MPD_r3 matchgroup=pam_Keyword start="\CELASTIC_LINEAR" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_MPDArg_ELASTIC_LINEAR_arg,pam_Error,pam_FreeError,pam_FreeVar nextgroup=pam_MPDArg_ELASTIC_LINEAR_r1 skipnl keepend
      syn keyword pam_MPDArg_ELASTIC_LINEAR_arg contained containedin=pam_MPDArg_ELASTIC_LINEAR ISOTROPIC CURVE
      hi def link pam_MPDArg_ELASTIC_LINEAR_arg pam_Argument
   syn region      pam_MPDArg_ELASTIC_NONLINEAR display contained containedin=pam_MPD_r3 matchgroup=pam_Keyword start="\CELASTIC_NONLINEAR" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_MPDArg_ELASTIC_NONLINEAR_arg,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar nextgroup=pam_MPDArg_ELASTIC_NONLINEAR_r1 skipnl keepend
      syn keyword pam_MPDArg_ELASTIC_NONLINEAR_arg contained containedin=pam_MPDArg_ELASTIC_NONLINEAR CURVE
      hi def link pam_MPDArg_ELASTIC_NONLINEAR_arg pam_Argument
   syn region      pam_MPDArg_PLASTIC_ISOTROPIC_HARDENING display contained containedin=pam_MPD_r3 matchgroup=pam_Keyword start="\CPLASTIC_ISOTROPIC_HARDENING" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_MPDArg_PLASTIC_ISOTROPIC_HARDENING_arg,pam_Integer,pam_Error,pam_FreeError,pam_FreeVar nextgroup=pam_MPDArg_PLASTIC_ISOTROPIC_HARDENING_r1 skipnl keepend
      syn keyword pam_MPDArg_PLASTIC_ISOTROPIC_HARDENING_arg contained containedin=pam_MPDArg_PLASTIC_ISOTROPIC_HARDENING CURVE LOOKUP
      hi def link pam_MPDArg_PLASTIC_ISOTROPIC_HARDENING_arg pam_Argument
   syn region      pam_MPDArg_PLASTIC_STRAIN_RATE_HARDENING display contained containedin=pam_MPD_r3 matchgroup=pam_Keyword start="\CPLASTIC_STRAIN_RATE_HARDENING" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_MPDArg_PLASTIC_STRAIN_RATE_HARDENING_arg,pam_Error,pam_FreeError,pam_FreeVar nextgroup=pam_MPDArg_PLASTIC_STRAIN_RATE_HARDENING_r1 skipnl keepend
      syn keyword pam_MPDArg_PLASTIC_STRAIN_RATE_HARDENING_arg contained containedin=pam_MPDArg_PLASTIC_STRAIN_RATE_HARDENING PARAMETER
      hi def link pam_MPDArg_PLASTIC_STRAIN_RATE_HARDENING_arg pam_Argument
   syn region      pam_MPDArg_DYNAMIC_MODULUS display contained containedin=pam_MPD_r3 matchgroup=pam_Keyword start="\CDYNAMIC_MODULUS" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_MPDArg_DYNAMIC_MODULUS_arg,pam_Error,pam_FreeError,pam_FreeVar nextgroup=pam_MPDArg_DYNAMIC_MODULUS_r1 skipnl keepend
      syn keyword pam_MPDArg_DYNAMIC_MODULUS_arg contained containedin=pam_MPDArg_DYNAMIC_MODULUS LOOKU
      hi def link pam_MPDArg_DYNAMIC_MODULUS_arg pam_Argument
   syn region      pam_MPDArg_DAMPING_STRUCTURAL display contained containedin=pam_MPD_r3 matchgroup=pam_Keyword start="\CDAMPING_STRUCTURAL" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_MPDArg_DAMPING_STRUCTURAL_arg,pam_Error,pam_FreeError,pam_FreeVar nextgroup=pam_MPDArg_DAMPING_STRUCTURAL_r1 skipnl keepend
      syn keyword pam_MPDArg_DAMPING_STRUCTURAL_arg contained containedin=pam_MPDArg_DAMPING_STRUCTURAL ISOTROPIC CURVE LOOKU
      hi def link pam_MPDArg_DAMPING_STRUCTURAL_arg pam_Argument
   syn region      pam_MPDArg_DAMPING_VISCOUS display contained containedin=pam_MPD_r3 matchgroup=pam_Keyword start="\CDAMPING_VISCOUS" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_MPDArg_DAMPING_VISCOUS_arg,pam_Error,pam_FreeError,pam_FreeVar nextgroup=pam_MPDArg_DAMPING_VISCOUS_r1 skipnl keepend
      syn keyword pam_MPDArg_DAMPING_VISCOUS_arg contained containedin=pam_MPDArg_DAMPING_VISCOUS DISCRETE CURVE
      hi def link pam_MPDArg_DAMPING_VISCOUS_arg pam_Argument
   " Row 3
   syn region      pam_MPD_r3     transparent contained containedin=pam_MPD start="\%1c." start="^$\n" end="\%$" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position,pam_EndMPD skipnl keepend
   " Row 2 (Name)
   syn region      pam_MPD_r2     transparent contained containedin=pam_MPD start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_MPD_r3 skipnl keepend
      syn match       pam_MPD_r1_e1             display contained containedin=pam_MPD_r1 "\%17c.\{,8\}"
      syn match       pam_MPD_r1_a1             display contained containedin=pam_MPD_r1 "\%17c[ ]\{8\}"
      syn match       pam_MPD_r1_a1             display contained containedin=pam_MPD_r1 "\%17c[ ]*TEMP[ ]*\%25c"
      syn match       pam_MPD_r1_a1             display contained containedin=pam_MPD_r1 "\%17c[ ]*FREQ[ ]*\%25c"
      hi def link pam_MPD_r1_a1 pam_evenArgument
      hi def link pam_MPD_r1_v1 pam_evenVar
      hi def link pam_MPD_r1_e1 pam_evenError
   " Row 1
   syn region      pam_MPD_r1     transparent contained containedin=pam_MPD start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MPD_r2 skipnl keepend
syn region      pam_MPD     matchgroup=pam_CardTag start="^\CMPD   /" end="^\CEND_MPD" contains=pam_MPD_r[1-6] fold keepend
" MPD end}}}

"{{{=== MATER Common
   syn cluster     pam_Mater_r2a                   contains=pam_Mater1_r2a,pam_Mater2_r2a,pam_Mater5_r2a,pam_Mater6_r2a,pam_Mater7_r2a,pam_Mater8_r2a,pam_Mater11_r2a,pam_Mater12_r2a,pam_Mater15_r2a,pam_Mater16_r2a,pam_Mater17_r2a,pam_Mater18_r2a,pam_Mater19_r2a,pam_Mater20_r2a,pam_Mater21_r2a,pam_Mater22_r2a,pam_Mater24_r2a,pam_Mater25_r2a,pam_Mater26_r2a,pam_Mater28_r2a,pam_Mater30_r2a,pam_Mater31_r2a,pam_Mater35_r2a,pam_Mater36_r2a,pam_Mater37_r2a,pam_Mater38_r2a,pam_Mater41_r2a,pam_Mater42_r2a,pam_Mater45_r2a,pam_Mater47_r2a,pam_Mater51_r2a,pam_Mater52_r2a,pam_Mater61_r2a,pam_Mater62_r2a,pam_Mater71_r2a,pam_Mater99_r2a,pam_Mater100_r2a,pam_Mater101_r2a,pam_Mater103_r2a,pam_Mater105_r2a,pam_Mater106_r2a,pam_Mater108_r2a,pam_Mater109_r2a,pam_Mater110_r2a,pam_Mater115_r2a,pam_Mater116_r2a,pam_Mater117_r2a,pam_Mater118_r2a,pam_Mater121_r2a,pam_Mater126_r2a,pam_Mater127_r2a,pam_Mater128_r2a,pam_Mater130_r2a,pam_Mater143_r2a,pam_Mater150_r2a,pam_Mater151_r2a,pam_Mater152_r2a,pam_Mater161_r2a,pam_Mater162_r2a,pam_Mater171_r2a,pam_Mater200_r2a,pam_Mater201_r2a,pam_Mater202_r2a,pam_Mater203_r2a,pam_Mater204_r2a,pam_Mater205_r2a,pam_Mater212_r2a,pam_Mater213_r2a,pam_Mater214_r2a,pam_Mater220_r2a,pam_Mater221_r2a,pam_Mater222_r2a,pam_Mater223_r2a,pam_Mater224_r2a,pam_Mater225_r2a,pam_Mater226_r2a,pam_Mater230_r2a,pam_Mater301_r2a,pam_Mater302_r2a,pam_Mater303_r2a,pam_Mater304_r2a
   "FILTER
   syn match       pam_MaterX_r2a_e1             display contained containedin=@pam_Mater_r2a "\%9c.\{,8\}"
   syn match       pam_MaterX_r2a_a1             display contained containedin=@pam_Mater_r2a "\%9c[ ]\{8\}"
   syn match       pam_MaterX_r2a_a1             display contained containedin=@pam_Mater_r2a "\%9c[ ]*TIME[ ]*\%17c"
   syn match       pam_MaterX_r2a_a1             display contained containedin=@pam_Mater_r2a "\%9c[ ]*CYCLE[ ]*\%17c"
   hi def link pam_MaterX_r2a_a1 pam_oddArgument
   hi def link pam_MaterX_r2a_v1 pam_oddVar
   hi def link pam_MaterX_r2a_e1 pam_oddError
   " KEYWORD
   syn match       pam_Mater103_r9_e1             display contained containedin=pam_Mater103_r9,pam_Mater105_r9,pam_Mater106_r9,pam_Mater116_r9,pam_Mater143_r9,pam_Mater162_r9 "\%1c.\{2,10\}"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater103_r9,pam_Mater105_r9,pam_Mater106_r9,pam_Mater116_r9,pam_Mater143_r9,pam_Mater162_r9 "\%1c[ ]\{10\}"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater103_r9,pam_Mater105_r9,pam_Mater106_r9,pam_Mater116_r9,pam_Mater143_r9,pam_Mater162_r9 "\%1c[ ]*\CEPMX[ ]*\%11c"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater103_r9,pam_Mater105_r9,pam_Mater106_r9,pam_Mater116_r9,pam_Mater143_r9,pam_Mater162_r9 "\%1c[ ]*\CTHIC[ ]*\%11c"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater105_r9,pam_Mater116_r9,pam_Mater143_r9,pam_Mater162_r9 "\%1c[ ]*\CDMG[ ]*\%11c"
   syn match       pam_Mater103_r9_v1             display contained containedin=pam_Mater103_r9,pam_Mater105_r9,pam_Mater106_r9,pam_Mater116_r9 "\%1c[ ]*\[[^\[]\{-}\]\%11c"
   syn match       pam_Mater103_r9_v1             display contained containedin=pam_Mater103_r9,pam_Mater105_r9,pam_Mater106_r9,pam_Mater116_r9 "\%1c[ ]*<[^<]\{-}>\%11c"
   syn match       pam_Mater103_r9_e1             display contained containedin=pam_Mater108_r9,pam_Mater115_r9,pam_Mater118_r9 "\%41c.\{,10\}"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater108_r9,pam_Mater115_r9,pam_Mater118_r9 "\%41c[ ]\{10\}"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater108_r9,pam_Mater115_r9,pam_Mater118_r9 "\%41c[ ]*\CEPMX[ ]*\%51c"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater115_r9,pam_Mater118_r9 "\%41c[ ]*\CDMG[ ]*\%51c"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater108_r9,pam_Mater115_r9,pam_Mater118_r9 "\%41c[ ]*\CTHIC[ ]*\%51c"
   syn match       pam_Mater103_r9_v1             display contained containedin=pam_Mater108_r9,pam_Mater115_r9,pam_Mater118_r9 "\%41c[ ]*\[[^\[]\{-}\]\%51c"
   syn match       pam_Mater103_r9_v1             display contained containedin=pam_Mater108_r9,pam_Mater115_r9,pam_Mater118_r9 "\%41c[ ]*<[^<]\{-}>\%51c"
   syn match       pam_Mater103_r9_e1             display contained containedin=pam_Mater130_r6 "\%21c.\{,10\}"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater130_r6 "\%21c[ ]\{10\}"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater130_r6 "\%21c[ ]*\CDMG[ ]*\%31c"
   syn match       pam_Mater103_r9_a1             display contained containedin=pam_Mater130_r6 "\%21c[ ]*\CTHIC[ ]*\%31c"
   hi def link pam_Mater103_r9_a1 pam_oddArgument
   hi def link pam_Mater103_r9_v1 pam_oddVar
   hi def link pam_Mater103_r9_e1 pam_oddError
"}}}

" {{{=== MATER X begin
   " Row 2 (Name)
   syn region      pam_MATERX_r2     transparent contained containedin=pam_MATERX start="\%1c." start="^$\n" end="\%$" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Comment,pam_Comment_Position skipnl keepend
   " Row 1
   syn region      pam_MATERX_r1     transparent contained containedin=pam_MATERX start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_MATERX_r2 skipnl keepend
syn region      pam_MATERX        matchgroup=pam_CardTag start="^\CMATER /" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_MATERX_r[1-9] fold keepend
" === MATER X end}}}

"{{{ === MATER 1 begin
   "Row 14
   syn region      pam_Mater1_r14     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 13
   syn region      pam_Mater1_r13     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater1_r12     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater1_r11     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater1_r10     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater1_r9     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r10 skipnl keepend
   syn region      pam_Mater1e_r9     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r10 keepend
   "Row 8
   syn region      pam_Mater1_r8     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r9 skipnl keepend
   syn region      pam_Mater1e_r8     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1e_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater1_r7     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r8 skipnl keepend
   syn region      pam_Mater1e_r7     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1e_r8 skipnl keepend
   syn region      pam_Mater1b_r7     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater1_r6     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r7 skipnl keepend
   syn region      pam_Mater1c_r6     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1b_r7 skipnl keepend
   syn region      pam_Mater1p_r6     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r7 skipnl keepend
   syn region      pam_Mater1e_r6     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1e_r7 skipnl keepend
   syn region      pam_Mater1b_r6     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1b_r7 skipnl keepend
   syn region      pam_Mater1l_r6     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r7 skipnl keepend
   syn region      pam_Mater1v_r6     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1b_r7 skipnl keepend
   "Row 5
      syn match       pam_Mater1_r5_e1  display contained containedin=pam_Mater1_r5,pam_Mater1c_r5,pam_Mater1p_r5,pam_Mater1b_r5,pam_Mater1l_r5,pam_Mater1v_r5 "\%11c.\{,10\}"
      syn match       pam_Mater1_r5_a1  display contained containedin=pam_Mater1_r5,pam_Mater1c_r5,pam_Mater1p_r5,pam_Mater1b_r5,pam_Mater1l_r5,pam_Mater1v_r5 "\%11c[ ]\{10\}"
      syn match       pam_Mater1_r5_a1  display contained containedin=pam_Mater1_r5,pam_Mater1c_r5,pam_Mater1p_r5,pam_Mater1b_r5,pam_Mater1l_r5,pam_Mater1v_r5 "\%11c[ ]*\CAFCHA[ ]*\%21c"
      syn match       pam_Mater1_r5_a1  display contained containedin=pam_Mater1_r5,pam_Mater1c_r5,pam_Mater1p_r5,pam_Mater1b_r5,pam_Mater1l_r5,pam_Mater1v_r5 "\%11c[ ]*\COWANG[ ]*\%21c"
      hi def link pam_Mater1_r5_e1 pam_evenError
      hi def link pam_Mater1_r5_a1 pam_evenArgument
   syn region      pam_Mater1_r5     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r6 skipnl keepend
   syn region      pam_Mater1c_r5     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1c_r6 skipnl keepend
   syn region      pam_Mater1p_r5     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1p_r6 skipnl keepend
   syn region      pam_Mater1e_r5     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1e_r6 skipnl keepend
   syn region      pam_Mater1b_r5     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1b_r6 skipnl keepend
   syn region      pam_Mater1l_r5     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1l_r6 skipnl keepend
   syn region      pam_Mater1v_r5     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1v_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater1_r4     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r5 skipnl keepend
   syn match       pam_Mater1c_r4_a1  display contained containedin=pam_Mater1c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater1c_r4_a1  pam_evenArgument
   syn region      pam_Mater1c_r4     transparent contained containedin=pam_Mater1 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1c_r5 skipnl keepend
   syn match       pam_Mater1p_r4_a1  display contained containedin=pam_Mater1p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater1p_r4_a1  display contained containedin=pam_Mater1p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater1p_r4_a1  pam_evenArgument
   syn region      pam_Mater1p_r4     transparent contained containedin=pam_Mater1 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1p_r5 skipnl keepend
   syn region      pam_Mater1p_r4     transparent contained containedin=pam_Mater1 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1p_r5 skipnl keepend
   syn match       pam_Mater1e_r4_a1  display contained containedin=pam_Mater1e_r4 "\%11c\CECURV     "
   hi def link pam_Mater1e_r4_a1  pam_evenArgument
   syn region      pam_Mater1e_r4     transparent contained containedin=pam_Mater1 start="\%1c.\(.\{9\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1e_r5 skipnl keepend
   syn match       pam_Mater1v_r4_a1  display contained containedin=pam_Mater1v_r4 "\%11c\CVOCEG     "
   hi def link pam_Mater1v_r4_a1  pam_evenArgument
   syn region      pam_Mater1v_r4     transparent contained containedin=pam_Mater1 start="\%1c.\(.\{9\}\CVOCEG     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1v_r5 skipnl keepend
   syn match       pam_Mater1l_r4_a1  display contained containedin=pam_Mater1l_r4 "\%11c\CLOOKU     "
   hi def link pam_Mater1l_r4_a1  pam_evenArgument
   syn region      pam_Mater1l_r4     transparent contained containedin=pam_Mater1 start="\%1c.\(.\{9\}\CLOOKU     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1l_r5 skipnl keepend
   syn region      pam_Mater1b_r4     transparent contained containedin=pam_Mater1 start="\%1c.\(.\{9\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater1_r3     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater1_r4,pam_Mater1c_r4,pam_Mater1p_r4,pam_Mater1e_r4,pam_Mater1b_r4,pam_Mater1l_r4,pam_Mater1v_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater1_r2a    transparent contained containedin=pam_Mater1 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater1_r2     transparent contained containedin=pam_Mater1 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater1_r2a,pam_Mater1_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater1_r1     transparent contained containedin=pam_Mater1 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater1_r2 skipnl keepend
syn region      pam_Mater1        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{7\}1"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater1_r[1-9] fold keepend
" === MATER 1 end}}}

"{{{ === MATER 2 begin
   "Row 9
   syn region      pam_Mater2_r9     transparent contained containedin=pam_Mater2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater2_r8     transparent contained containedin=pam_Mater2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater2_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater2_r7     transparent contained containedin=pam_Mater2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater2_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater2_r6     transparent contained containedin=pam_Mater2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater2_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater2_r5     transparent contained containedin=pam_Mater2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater2_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater2_r4     transparent contained containedin=pam_Mater2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater2_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater2_r3     transparent contained containedin=pam_Mater2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater2_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater2_r2a    transparent contained containedin=pam_Mater2 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater2_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater2_r2     transparent contained containedin=pam_Mater2 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater2_r2a,pam_Mater2_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater2_r1     transparent contained containedin=pam_Mater2 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater2_r2 skipnl keepend
syn region      pam_Mater2        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{7\}2"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater2_r[1-9] fold keepend
" === MATER 2 end}}}

"{{{ === MATER 5 begin
   "Row 9
   syn region      pam_Mater5_r9     transparent contained containedin=pam_Mater5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater5_r8     transparent contained containedin=pam_Mater5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater5_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater5_r7     transparent contained containedin=pam_Mater5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater5_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater5_r6     transparent contained containedin=pam_Mater5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater5_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater5_r5     transparent contained containedin=pam_Mater5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater5_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater5_r4     transparent contained containedin=pam_Mater5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater5_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater5_r3     transparent contained containedin=pam_Mater5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater5_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater5_r2a    transparent contained containedin=pam_Mater5 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater5_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater5_r2     transparent contained containedin=pam_Mater5 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater5_r2a,pam_Mater5_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater5_r1     transparent contained containedin=pam_Mater5 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater5_r2 skipnl keepend
syn region      pam_Mater5        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{7\}5"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater5_r[1-9] fold keepend
" === MATER 5 end}}}

"{{{ === MATER 6 begin
   "Row 9
   syn region      pam_Mater6_r9     transparent contained containedin=pam_Mater6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater6_r8     transparent contained containedin=pam_Mater6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater6_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater6_r7     transparent contained containedin=pam_Mater6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater6_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater6_r6     transparent contained containedin=pam_Mater6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater6_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater6_r5     transparent contained containedin=pam_Mater6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater6_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater6_r4     transparent contained containedin=pam_Mater6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater6_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater6_r3     transparent contained containedin=pam_Mater6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater6_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater6_r2a    transparent contained containedin=pam_Mater6 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater6_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater6_r2     transparent contained containedin=pam_Mater6 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater6_r2a,pam_Mater6_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater6_r1     transparent contained containedin=pam_Mater6 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater6_r2 skipnl keepend
syn region      pam_Mater6        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{7\}6"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater6_r[1-9] fold keepend
" === MATER 6 end}}}

"{{{ === MATER 7 begin
   "Row 9
   syn region      pam_Mater7_r9     transparent contained containedin=pam_Mater7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater7_r8     transparent contained containedin=pam_Mater7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater7_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater7_r7     transparent contained containedin=pam_Mater7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater7_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater7_r6     transparent contained containedin=pam_Mater7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater7_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater7_r5     transparent contained containedin=pam_Mater7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater7_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater7_r4     transparent contained containedin=pam_Mater7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater7_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater7_r3     transparent contained containedin=pam_Mater7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater7_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater7_r2a    transparent contained containedin=pam_Mater7 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater7_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater7_r2     transparent contained containedin=pam_Mater7 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater7_r2a,pam_Mater7_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater7_r1     transparent contained containedin=pam_Mater7 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater7_r2 skipnl keepend
syn region      pam_Mater7        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{7\}7"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater7_r[1-9] fold keepend
" === MATER 7 end}}}

"{{{ === MATER 8 begin
   "Row 9
   syn region      pam_Mater8_r9     transparent contained containedin=pam_Mater8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater8_r8     transparent contained containedin=pam_Mater8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater8_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater8_r7     transparent contained containedin=pam_Mater8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater8_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater8_r6     transparent contained containedin=pam_Mater8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater8_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater8_r5     transparent contained containedin=pam_Mater8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater8_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater8_r4     transparent contained containedin=pam_Mater8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater8_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater8_r3     transparent contained containedin=pam_Mater8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater8_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater8_r2a    transparent contained containedin=pam_Mater8 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater8_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater8_r2     transparent contained containedin=pam_Mater8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater8_r2a,pam_Mater8_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater8_r1     transparent contained containedin=pam_Mater8 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater8_r2 skipnl keepend
syn region      pam_Mater8        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{7\}8"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater8_r[1-9] fold keepend
" === MATER 8 end}}}

"{{{ === MATER 11 begin
   "Row 9
   syn region      pam_Mater11_r9     transparent contained containedin=pam_Mater11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater11_r8     transparent contained containedin=pam_Mater11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater11_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater11_r7     transparent contained containedin=pam_Mater11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater11_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater11_r6     transparent contained containedin=pam_Mater11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater11_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater11_r5     transparent contained containedin=pam_Mater11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater11_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater11_r4     transparent contained containedin=pam_Mater11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater11_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater11_r3     transparent contained containedin=pam_Mater11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater11_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater11_r2a    transparent contained containedin=pam_Mater11 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater11_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater11_r2     transparent contained containedin=pam_Mater11 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater11_r2a,pam_Mater11_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater11_r1     transparent contained containedin=pam_Mater11 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater11_r2 skipnl keepend
syn region      pam_Mater11        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}11"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater11_r[1-9] fold keepend
" === MATER 11 end}}}

"{{{ === MATER 12 begin
   "Row 9
   syn region      pam_Mater12_r9     transparent contained containedin=pam_Mater12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater12_r8     transparent contained containedin=pam_Mater12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater12_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater12_r7     transparent contained containedin=pam_Mater12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater12_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater12_r6     transparent contained containedin=pam_Mater12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater12_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater12_r5     transparent contained containedin=pam_Mater12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater12_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater12_r4     transparent contained containedin=pam_Mater12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater12_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater12_r3     transparent contained containedin=pam_Mater12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater12_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater12_r2a    transparent contained containedin=pam_Mater12 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater12_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater12_r2     transparent contained containedin=pam_Mater12 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater12_r2a,pam_Mater12_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater12_r1     transparent contained containedin=pam_Mater12 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater12_r2 skipnl keepend
syn region      pam_Mater12        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}12"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater12_r[1-9] fold keepend
" === MATER 12 end}}}

"{{{ === MATER 15 begin
   "Row 9
   syn region      pam_Mater15_r9     transparent contained containedin=pam_Mater15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater15_r8     transparent contained containedin=pam_Mater15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater15_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater15_r7     transparent contained containedin=pam_Mater15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater15_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater15_r6     transparent contained containedin=pam_Mater15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater15_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater15_r5     transparent contained containedin=pam_Mater15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater15_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater15_r4     transparent contained containedin=pam_Mater15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater15_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater15_r3     transparent contained containedin=pam_Mater15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater15_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater15_r2a    transparent contained containedin=pam_Mater15 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater15_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater15_r2     transparent contained containedin=pam_Mater15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater15_r2a,pam_Mater15_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater15_r1     transparent contained containedin=pam_Mater15 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater15_r2 skipnl keepend
syn region      pam_Mater15        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}15"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater15_r[1-9] fold keepend
" === MATER 15 end}}}

"{{{ === MATER 16 begin
   "Row 9
   syn region      pam_Mater16_r9     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater16e_r9     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater16_r8     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r9 skipnl keepend
   syn region      pam_Mater16e_r8     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16e_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater16_r7     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r8 skipnl keepend
   syn region      pam_Mater16e_r7     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16e_r8 skipnl keepend
   syn region      pam_Mater16b_r7     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater16_r6     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r7 skipnl keepend
   syn region      pam_Mater16c_r6     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16b_r7 skipnl keepend
   syn region      pam_Mater16p_r6     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r7 skipnl keepend
   syn region      pam_Mater16e_r6     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16e_r7 skipnl keepend
   syn region      pam_Mater16b_r6     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16b_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater16_r5     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r6 skipnl keepend
   syn region      pam_Mater16c_r5     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16c_r6 skipnl keepend
   syn region      pam_Mater16p_r5     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16p_r6 skipnl keepend
   syn region      pam_Mater16e_r5     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16e_r6 skipnl keepend
   syn region      pam_Mater16b_r5     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16b_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater16_r4     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r5 skipnl keepend
   syn match       pam_Mater16c_r4_a1  display contained containedin=pam_Mater16c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater16c_r4_a1  pam_evenArgument
   syn region      pam_Mater16c_r4     transparent contained containedin=pam_Mater16 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16c_r5 skipnl keepend
   syn match       pam_Mater16p_r4_a1  display contained containedin=pam_Mater16p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater16p_r4_a1  display contained containedin=pam_Mater16p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater16p_r4_a1  pam_evenArgument
   syn region      pam_Mater16p_r4     transparent contained containedin=pam_Mater16 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16p_r5 skipnl keepend
   syn region      pam_Mater16p_r4     transparent contained containedin=pam_Mater16 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16p_r5 skipnl keepend
   syn match       pam_Mater16e_r4_a1  display contained containedin=pam_Mater16e_r4 "\%11c\CECURV     "
   hi def link pam_Mater16e_r4_a1  pam_evenArgument
   syn region      pam_Mater16e_r4     transparent contained containedin=pam_Mater16 start="\%1c.\(.\{9\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16e_r5 skipnl keepend
   syn region      pam_Mater16b_r4     transparent contained containedin=pam_Mater16 start="\%1c.\(.\{9\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater16_r3     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater16_r4,pam_Mater16c_r4,pam_Mater16p_r4,pam_Mater16e_r4,pam_Mater16b_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater16_r2a    transparent contained containedin=pam_Mater16 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater16_r2     transparent contained containedin=pam_Mater16 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater16_r2a,pam_Mater16_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater16_r1     transparent contained containedin=pam_Mater16 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater16_r2 skipnl keepend
syn region      pam_Mater16        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}16"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater16_r[1-9] fold keepend
" === MATER 16 end}}}

"{{{ === MATER 17 begin
   "Row 9
   syn region      pam_Mater17_r9     transparent contained containedin=pam_Mater17 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater17_r8     transparent contained containedin=pam_Mater17 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater17_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater17_r7     transparent contained containedin=pam_Mater17 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater17_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater17_r6     transparent contained containedin=pam_Mater17 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater17_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater17_r5     transparent contained containedin=pam_Mater17 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater17_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater17_r4     transparent contained containedin=pam_Mater17 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater17_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater17_r3     transparent contained containedin=pam_Mater17 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater17_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater17_r2a    transparent contained containedin=pam_Mater17 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater17_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater17_r2     transparent contained containedin=pam_Mater17 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater17_r2a,pam_Mater17_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater17_r1     transparent contained containedin=pam_Mater17 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater17_r2 skipnl keepend
syn region      pam_Mater17        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}17"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater17_r[1-9] fold keepend
" === MATER 17 end}}}

"{{{ === MATER 18 begin
   "Row 9
   syn region      pam_Mater18_r9     transparent contained containedin=pam_Mater18 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater18_r8     transparent contained containedin=pam_Mater18 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater18_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater18_r7     transparent contained containedin=pam_Mater18 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater18_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater18_r6     transparent contained containedin=pam_Mater18 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater18_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater18_r5     transparent contained containedin=pam_Mater18 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater18_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater18_r4     transparent contained containedin=pam_Mater18 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater18_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater18_r3     transparent contained containedin=pam_Mater18 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater18_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater18_r2a    transparent contained containedin=pam_Mater18 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater18_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater18_r2     transparent contained containedin=pam_Mater18 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater18_r2a,pam_Mater18_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater18_r1     transparent contained containedin=pam_Mater18 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater18_r2 skipnl keepend
syn region      pam_Mater18        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}18"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater18_r[1-9] fold keepend
" === MATER 18 end}}}

"{{{ === MATER 19 begin
   "Row 9
   syn region      pam_Mater19_r9     transparent contained containedin=pam_Mater19 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater19_r8     transparent contained containedin=pam_Mater19 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater19_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater19_r7     transparent contained containedin=pam_Mater19 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater19_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater19_r6     transparent contained containedin=pam_Mater19 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater19_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater19_r5     transparent contained containedin=pam_Mater19 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater19_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater19_r4     transparent contained containedin=pam_Mater19 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater19_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater19_r3     transparent contained containedin=pam_Mater19 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater19_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater19_r2a    transparent contained containedin=pam_Mater19 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater19_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater19_r2     transparent contained containedin=pam_Mater19 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater19_r2a,pam_Mater19_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater19_r1     transparent contained containedin=pam_Mater19 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater19_r2 skipnl keepend
syn region      pam_Mater19        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}19"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater19_r[1-9] fold keepend
" === MATER 19 end}}}

"{{{ === MATER 20 begin
   "Row 9
   syn region      pam_Mater20_r9     transparent contained containedin=pam_Mater20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater20_r8     transparent contained containedin=pam_Mater20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater20_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater20_r7     transparent contained containedin=pam_Mater20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater20_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater20_r6     transparent contained containedin=pam_Mater20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater20_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater20_r5     transparent contained containedin=pam_Mater20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater20_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater20_r4     transparent contained containedin=pam_Mater20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater20_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater20_r3     transparent contained containedin=pam_Mater20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater20_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater20_r2a    transparent contained containedin=pam_Mater20 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater20_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater20_r2     transparent contained containedin=pam_Mater20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater20_r2a,pam_Mater20_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater20_r1     transparent contained containedin=pam_Mater20 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater20_r2 skipnl keepend
syn region      pam_Mater20        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}20"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater20_r[1-9] fold keepend
" === MATER 20 end}}}

"{{{ === MATER 21 begin
   "Row 9
   syn region      pam_Mater21_r9     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f5,@26f5,@31f5x,@36f5x,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 8
   syn region      pam_Mater21c_r8     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21_r9 skipnl keepend
   syn region      pam_Mater21_r8     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater21c_r7     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21c_r8 skipnl keepend
   syn region      pam_Mater21_r7     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater21_r6     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21_r7 skipnl keepend
   syn region      pam_Mater21c_r6     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21c_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater21_r5     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21_r6 skipnl keepend
   syn region      pam_Mater21c_r5     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21c_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater21_r4     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i5,@56f10x,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21_r5 skipnl keepend
   syn region      pam_Mater21c_r4     transparent contained containedin=pam_Mater21 start="\%1c.\(.\{78\}1\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i5,@56f10x,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21c_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater21_r3     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater21_r4,pam_Mater21c_r4,pam_Mater21p_r4,pam_Mater21e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater21_r2a    transparent contained containedin=pam_Mater21 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater21_r2     transparent contained containedin=pam_Mater21 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater21_r2a,pam_Mater21_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater21_r1     transparent contained containedin=pam_Mater21 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater21_r2 skipnl keepend
syn region      pam_Mater21        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}21"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater21_r[1-9] fold keepend
" === MATER 21 end}}}

"{{{ === MATER 22 begin
   "Row 9
   syn region      pam_Mater22_r9     transparent contained containedin=pam_Mater22 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater22_r8     transparent contained containedin=pam_Mater22 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater22_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater22_r7     transparent contained containedin=pam_Mater22 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater22_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater22_r6     transparent contained containedin=pam_Mater22 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater22_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater22_r5     transparent contained containedin=pam_Mater22 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater22_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater22_r4     transparent contained containedin=pam_Mater22 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater22_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater22_r3     transparent contained containedin=pam_Mater22 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater22_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater22_r2a    transparent contained containedin=pam_Mater22 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater22_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater22_r2     transparent contained containedin=pam_Mater22 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater22_r2a,pam_Mater22_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater22_r1     transparent contained containedin=pam_Mater22 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater22_r2 skipnl keepend
syn region      pam_Mater22        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}22"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater22_r[1-9] fold keepend
" === MATER 22 end}}}

"{{{ === MATER 24 begin
   "Row 9
   syn region      pam_Mater24_r9     transparent contained containedin=pam_Mater24 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater24_r8     transparent contained containedin=pam_Mater24 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater24_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater24_r7     transparent contained containedin=pam_Mater24 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater24_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater24_r6     transparent contained containedin=pam_Mater24 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater24_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater24_r5     transparent contained containedin=pam_Mater24 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater24_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater24_r4     transparent contained containedin=pam_Mater24 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater24_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater24_r3     transparent contained containedin=pam_Mater24 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater24_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater24_r2a    transparent contained containedin=pam_Mater24 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater24_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater24_r2     transparent contained containedin=pam_Mater24 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater24_r2a,pam_Mater24_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater24_r1     transparent contained containedin=pam_Mater24 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater24_r2 skipnl keepend
syn region      pam_Mater24        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}24"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater24_r[1-9] fold keepend
" === MATER 24 end}}}

"{{{ === MATER 25 begin
   "Row 9
   syn region      pam_Mater25_r9     transparent contained containedin=pam_Mater25 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater25_r8     transparent contained containedin=pam_Mater25 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater25_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater25_r7     transparent contained containedin=pam_Mater25 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater25_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater25_r6     transparent contained containedin=pam_Mater25 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater25_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater25_r5     transparent contained containedin=pam_Mater25 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater25_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater25_r4     transparent contained containedin=pam_Mater25 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater25_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater25_r3     transparent contained containedin=pam_Mater25 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater25_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater25_r2a    transparent contained containedin=pam_Mater25 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater25_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater25_r2     transparent contained containedin=pam_Mater25 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater25_r2a,pam_Mater25_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater25_r1     transparent contained containedin=pam_Mater25 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater25_r2 skipnl keepend
syn region      pam_Mater25        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}25"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater25_r[1-9] fold keepend
" === MATER 25 end}}}

"{{{ === MATER 26 begin
   "Row 9
   syn region      pam_Mater26_r9     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 8
   syn region      pam_Mater26_r8     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater26_r7     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r8 skipnl keepend
   syn region      pam_Mater26b_r7     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater26_r6     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r7 skipnl keepend
   syn region      pam_Mater26c_r6     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26b_r7 skipnl keepend
   syn region      pam_Mater26p_r6     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r7 skipnl keepend
   syn region      pam_Mater26b_r6     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26b_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater26_r5     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r6 skipnl keepend
   syn region      pam_Mater26c_r5     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26c_r6 skipnl keepend
   syn region      pam_Mater26p_r5     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26p_r6 skipnl keepend
   syn region      pam_Mater26b_r5     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26b_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater26_r4     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r5 skipnl keepend
   syn match       pam_Mater26c_r4_a1  display contained containedin=pam_Mater26c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater26c_r4_a1  pam_evenArgument
   syn region      pam_Mater26c_r4     transparent contained containedin=pam_Mater26 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26c_r5 skipnl keepend
   syn match       pam_Mater26p_r4_a1  display contained containedin=pam_Mater26p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater26p_r4_a1  display contained containedin=pam_Mater26p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater26p_r4_a1  pam_evenArgument
   syn region      pam_Mater26p_r4     transparent contained containedin=pam_Mater26 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26p_r5 skipnl keepend
   syn region      pam_Mater26p_r4     transparent contained containedin=pam_Mater26 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26p_r5 skipnl keepend
   syn region      pam_Mater26b_r4     transparent contained containedin=pam_Mater26 start="\%1c.\(.\{9\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater26_r3     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater26_r4,pam_Mater26c_r4,pam_Mater26p_r4,pam_Mater26e_r4,pam_Mater26b_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater26_r2a    transparent contained containedin=pam_Mater26 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater26_r2     transparent contained containedin=pam_Mater26 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater26_r2a,pam_Mater26_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater26_r1     transparent contained containedin=pam_Mater26 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater26_r2 skipnl keepend
syn region      pam_Mater26        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}26"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater26_r[1-9] fold keepend
" === MATER 26 end}}}

"{{{ === MATER 28 begin
   "Row 9
   syn region      pam_Mater28_r9     transparent contained containedin=pam_Mater28 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater28_r8     transparent contained containedin=pam_Mater28 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater28_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater28_r7     transparent contained containedin=pam_Mater28 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater28_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater28_r6     transparent contained containedin=pam_Mater28 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater28_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater28_r5     transparent contained containedin=pam_Mater28 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater28_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater28_r4     transparent contained containedin=pam_Mater28 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater28_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater28_r3     transparent contained containedin=pam_Mater28 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater28_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater28_r2a    transparent contained containedin=pam_Mater28 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater28_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater28_r2     transparent contained containedin=pam_Mater28 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater28_r2a,pam_Mater28_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater28_r1     transparent contained containedin=pam_Mater28 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater28_r2 skipnl keepend
syn region      pam_Mater28        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}28"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater28_r[1-9] fold keepend
" === MATER 28 end}}}

"{{{ === MATER 30 begin
   "Row 9
   syn region      pam_Mater30_r9     transparent contained containedin=pam_Mater30 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater30_r8     transparent contained containedin=pam_Mater30 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater30_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater30_r7     transparent contained containedin=pam_Mater30 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater30_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater30_r6     transparent contained containedin=pam_Mater30 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater30_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater30_r5     transparent contained containedin=pam_Mater30 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i5,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater30_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater30_r4     transparent contained containedin=pam_Mater30 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater30_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater30_r3     transparent contained containedin=pam_Mater30 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater30_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater30_r2a    transparent contained containedin=pam_Mater30 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater30_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater30_r2     transparent contained containedin=pam_Mater30 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater30_r2a,pam_Mater30_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater30_r1     transparent contained containedin=pam_Mater30 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater30_r2 skipnl keepend
syn region      pam_Mater30        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}30"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater30_r[1-9] fold keepend
" === MATER 30 end}}}

"{{{ === MATER 31 begin
   "Row 9
   syn region      pam_Mater31_r9     transparent contained containedin=pam_Mater31 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater31_r8     transparent contained containedin=pam_Mater31 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater31_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater31_r7     transparent contained containedin=pam_Mater31 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater31_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater31_r6     transparent contained containedin=pam_Mater31 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater31_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater31_r5     transparent contained containedin=pam_Mater31 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i5,@26i5,@31i5x,@36i5x,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater31_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater31_r4     transparent contained containedin=pam_Mater31 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater31_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater31_r3     transparent contained containedin=pam_Mater31 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater31_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater31_r2a    transparent contained containedin=pam_Mater31 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater31_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater31_r2     transparent contained containedin=pam_Mater31 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater31_r2a,pam_Mater31_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater31_r1     transparent contained containedin=pam_Mater31 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater31_r2 skipnl keepend
syn region      pam_Mater31        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}31"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater31_r[1-9] fold keepend
" === MATER 31 end}}}

"{{{ === MATER 35 begin
   "Row 9
   syn region      pam_Mater35_r9     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 8
   syn region      pam_Mater35_r8     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater35_r7     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r8 skipnl keepend
   syn region      pam_Mater35b_r7     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater35_r6     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r7 skipnl keepend
   syn region      pam_Mater35c_r6     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35b_r7 skipnl keepend
   syn region      pam_Mater35p_r6     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r7 skipnl keepend
   syn region      pam_Mater35b_r6     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35b_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater35_r5     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r6 skipnl keepend
   syn region      pam_Mater35c_r5     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35c_r6 skipnl keepend
   syn region      pam_Mater35p_r5     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35p_r6 skipnl keepend
   syn region      pam_Mater35b_r5     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35b_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater35_r4     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r5 skipnl keepend
   syn match       pam_Mater35c_r4_a1  display contained containedin=pam_Mater35c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater35c_r4_a1  pam_evenArgument
   syn region      pam_Mater35c_r4     transparent contained containedin=pam_Mater35 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35c_r5 skipnl keepend
   syn match       pam_Mater35p_r4_a1  display contained containedin=pam_Mater35p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater35p_r4_a1  display contained containedin=pam_Mater35p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater35p_r4_a1  pam_evenArgument
   syn region      pam_Mater35p_r4     transparent contained containedin=pam_Mater35 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35p_r5 skipnl keepend
   syn region      pam_Mater35p_r4     transparent contained containedin=pam_Mater35 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35p_r5 skipnl keepend
   syn region      pam_Mater35b_r4     transparent contained containedin=pam_Mater35 start="\%1c.\(.\{9\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater35_r3     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater35_r4,pam_Mater35c_r4,pam_Mater35p_r4,pam_Mater35e_r4,pam_Mater35b_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater35_r2a    transparent contained containedin=pam_Mater35 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater35_r2     transparent contained containedin=pam_Mater35 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater35_r2a,pam_Mater35_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater35_r1     transparent contained containedin=pam_Mater35 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater35_r2 skipnl keepend
syn region      pam_Mater35        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}35"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater35_r[1-9] fold keepend
" === MATER 35 end}}}

"{{{ === MATER 36 begin
   "Row 9
   syn region      pam_Mater36_r9     transparent contained containedin=pam_Mater36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater36_r8     transparent contained containedin=pam_Mater36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater36_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater36_r7     transparent contained containedin=pam_Mater36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater36_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater36_r6     transparent contained containedin=pam_Mater36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater36_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater36_r5     transparent contained containedin=pam_Mater36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater36_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater36_r4     transparent contained containedin=pam_Mater36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater36_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater36_r3     transparent contained containedin=pam_Mater36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater36_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater36_r2a    transparent contained containedin=pam_Mater36 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater36_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater36_r2     transparent contained containedin=pam_Mater36 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater36_r2a,pam_Mater36_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater36_r1     transparent contained containedin=pam_Mater36 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater36_r2 skipnl keepend
syn region      pam_Mater36        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}36"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater36_r[1-9] fold keepend
" === MATER 36 end}}}

"{{{ === MATER 37 begin
   "Row 9
   syn region      pam_Mater37_r9     transparent contained containedin=pam_Mater37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater37_r8     transparent contained containedin=pam_Mater37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater37_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater37_r7     transparent contained containedin=pam_Mater37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater37_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater37_r6     transparent contained containedin=pam_Mater37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater37_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater37_r5     transparent contained containedin=pam_Mater37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater37_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater37_r4     transparent contained containedin=pam_Mater37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21i10,@31f10,@51i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater37_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater37_r3     transparent contained containedin=pam_Mater37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater37_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater37_r2a    transparent contained containedin=pam_Mater37 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater37_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater37_r2     transparent contained containedin=pam_Mater37 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater37_r2a,pam_Mater37_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater37_r1     transparent contained containedin=pam_Mater37 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater37_r2 skipnl keepend
syn region      pam_Mater37        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}37"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater37_r[1-9] fold keepend
" === MATER 37 end}}}

"{{{ === MATER 38 begin
   "Row 15
   syn region      pam_Mater38_r15     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 14
   syn region      pam_Mater38_r14     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r15 skipnl keepend
   "Row 13
   syn region      pam_Mater38_r13     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater38_r12     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater38_r11     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater38_r10     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater38_r9     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater38_r8     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater38_r7     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater38_r6     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater38_r5     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater38_r4     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21i10,@31i10,@41i10,@51i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater38_r3     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater38_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater38_r2a    transparent contained containedin=pam_Mater38 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater38_r2     transparent contained containedin=pam_Mater38 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater38_r2a,pam_Mater38_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater38_r1     transparent contained containedin=pam_Mater38 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater38_r2 skipnl keepend
syn region      pam_Mater38        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}38"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater38_r[1-9] fold keepend
" === MATER 38 end}}}

"{{{ === MATER 41 begin
   "Row 9
   syn region      pam_Mater41_r9     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater41s_r9     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 8
   syn region      pam_Mater41_r8     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41_r9 skipnl keepend
   syn region      pam_Mater41s_r8     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41s_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater41_r7     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41_r8 skipnl keepend
   syn region      pam_Mater41s_r7     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41s_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater41_r6     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41_r7 skipnl keepend
   syn region      pam_Mater41s_r6     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41s_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater41_r5     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41_r6 skipnl keepend
   syn region      pam_Mater41s_r5     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41s_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater41_r4     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41_r5 skipnl keepend
   syn match       pam_Mater41s_r4_a1  display contained containedin=pam_Mater41s_r4 "\%11c\CSIMPLE INP"
   hi def link pam_Mater41s_r4_a1  pam_evenArgument
   syn region      pam_Mater41s_r4     transparent contained containedin=pam_Mater41 start="\%1c.\(.\{9\}\CSIMPLE INP\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41s_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater41_r3     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater41_r4,pam_Mater41s_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater41_r2a    transparent contained containedin=pam_Mater41 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater41_r2     transparent contained containedin=pam_Mater41 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater41_r2a,pam_Mater41_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater41_r1     transparent contained containedin=pam_Mater41 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater41_r2 skipnl keepend
syn region      pam_Mater41        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}41"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater41_r[1-9] fold keepend
" === MATER 41 end}}}

"{{{ === MATER 42 begin
   "Row 15
   syn region      pam_Mater42_r15     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31i10,@41i10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 14
   syn region      pam_Mater42_r14     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r15 skipnl keepend
   "Row 13
   syn region      pam_Mater42_r13     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater42_r12     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater42_r11     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater42_r10     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater42_r9     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater42_r8     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater42_r7     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater42_r6     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater42_r5     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater42_r4     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r5 skipnl keepend
   syn match       pam_Mater42_r4_e1  display contained containedin=pam_Mater42_r4,pam_Mater42_r5,pam_Mater42_r6,pam_Mater42_r7,pam_Mater42_r8,pam_Mater42_r9,pam_Mater42_r10,pam_Mater42_r11,pam_Mater42_r12 "\%11c.\{,10\}"
   syn match       pam_Mater42_r4_a1  display contained containedin=pam_Mater42_r4,pam_Mater42_r5,pam_Mater42_r6,pam_Mater42_r7,pam_Mater42_r8,pam_Mater42_r9,pam_Mater42_r10,pam_Mater42_r11,pam_Mater42_r12 "\%11c          \|\CCURVE     \|\CSRFXY     \|CSRFYZ     \|\CSRFXZ     \|\CUNIDX     \|\CUNIDY     \|\CUNIDZ     \|\CCRITE     \|\CEQSHR     "
   hi def link pam_Mater42_r4_a1  pam_evenArgument
   hi def link pam_Mater42_r4_e1  pam_evenError
   "Row 3 (Name)
   syn region      pam_Mater42_r3     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater42_r4,pam_Mater42c_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater42_r2a    transparent contained containedin=pam_Mater42 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater42_r2     transparent contained containedin=pam_Mater42 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater42_r2a,pam_Mater42_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater42_r1     transparent contained containedin=pam_Mater42 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater42_r2 skipnl keepend
syn region      pam_Mater42        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}42"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater42_r[1-9] fold keepend
" === MATER 42 end}}}

"{{{ === MATER 45 begin
   "Row 16
   syn region      pam_Mater45_r16     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 15
   syn region      pam_Mater45_r15     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r16 skipnl keepend
   "Row 14
   syn region      pam_Mater45_r14     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r15 skipnl keepend
   "Row 13
   syn region      pam_Mater45_r13     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater45_r12     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater45_r11     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater45_r10     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater45_r9     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21f20,@41f10x,@51f10x,@61f10x,@71i10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r10 keepend
   "Row 8
   syn region      pam_Mater45_r8     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater45_r7     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater45_r6     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater45_r5     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater45_r4     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater45_r3     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater45_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater45_r2a    transparent contained containedin=pam_Mater45 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater45_r2     transparent contained containedin=pam_Mater45 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater45_r2a,pam_Mater45_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater45_r1     transparent contained containedin=pam_Mater45 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater45_r2 skipnl keepend
syn region      pam_Mater45        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}45"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater45_r[1-9] fold keepend
" === MATER 45 end}}}

"{{{ === MATER 47 begin
   "Row 9
   syn region      pam_Mater47_r9     transparent contained containedin=pam_Mater47 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater47_r8     transparent contained containedin=pam_Mater47 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater47_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater47_r7     transparent contained containedin=pam_Mater47 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater47_r8 skipnl keepend
   syn match       pam_Mater47_r7_e1  display contained containedin=pam_Mater47_r7 "\%1c.\{,10\}"
   syn match       pam_Mater47_r7_a1  display contained containedin=pam_Mater47_r7 "\%1c[ ]*DYNAMIC[ ]*\%11c"
   hi def link pam_Mater47_r7_a1  pam_oddArgument
   hi def link pam_Mater47_r7_e1  pam_oddError
   "Row 6
   syn region      pam_Mater47_r6     transparent contained containedin=pam_Mater47 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater47_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater47_r5     transparent contained containedin=pam_Mater47 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater47_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater47_r4     transparent contained containedin=pam_Mater47 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11i10,@21i10,@31i10,@41i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater47_r5 skipnl keepend
   syn match       pam_Mater47_r4_e1  display contained containedin=pam_Mater47_r4 "\%1c.\{,10\}"
   syn match       pam_Mater47_r4_a1  display contained containedin=pam_Mater47_r4 "\%1c[ ]*STATIC[ ]*\%11c"
   hi def link pam_Mater47_r4_a1  pam_oddArgument
   hi def link pam_Mater47_r4_e1  pam_oddError
   "Row 3 (Name)
   syn region      pam_Mater47_r3     transparent contained containedin=pam_Mater47 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater47_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater47_r2a    transparent contained containedin=pam_Mater47 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater47_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater47_r2     transparent contained containedin=pam_Mater47 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater47_r2a,pam_Mater47_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater47_r1     transparent contained containedin=pam_Mater47 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater47_r2 skipnl keepend
syn region      pam_Mater47        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}47"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater47_r[1-9] fold keepend
" === MATER 47 end}}}

"{{{ === MATER 51 begin
   "Row 9
   syn region      pam_Mater51_r9     transparent contained containedin=pam_Mater51 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater51_r8     transparent contained containedin=pam_Mater51 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater51_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater51_r7     transparent contained containedin=pam_Mater51 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater51_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater51_r6     transparent contained containedin=pam_Mater51 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater51_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater51_r5     transparent contained containedin=pam_Mater51 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater51_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater51_r4     transparent contained containedin=pam_Mater51 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater51_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater51_r3     transparent contained containedin=pam_Mater51 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater51_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater51_r2a    transparent contained containedin=pam_Mater51 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater51_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater51_r2     transparent contained containedin=pam_Mater51 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater51_r2a,pam_Mater51_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater51_r1     transparent contained containedin=pam_Mater51 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater51_r2 skipnl keepend
syn region      pam_Mater51        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}51"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater51_r[1-9] fold keepend
" === MATER 51 end}}}

"{{{ === MATER 52 begin
   "Row 13
   syn region      pam_Mater52_r13     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 12
   syn region      pam_Mater52_r12     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater52_r11     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater52_r10     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater52_r9     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r10 skipnl keepend
   syn region      pam_Mater52e_r9     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn match       pam_Mater52_r8_e1  display contained containedin=pam_Mater52_r8 "\%1c.\{,10\}"
   syn match       pam_Mater52_r8_a1  display contained containedin=pam_Mater52_r8 "\%1c[ ]\{10\}"
   syn match       pam_Mater52_r8_a1  display contained containedin=pam_Mater52_r8 "\%1c\CJCFRC     "
   syn match       pam_Mater52_r8_a1  display contained containedin=pam_Mater52_r8 "\%1c\CLOOKU     "
   syn match       pam_Mater52_r8_e2  display contained containedin=pam_Mater52_r8 "\%11c.\{,10\}"
   syn match       pam_Mater52_r8_a2  display contained containedin=pam_Mater52_r8 "\%11c[ ]\{10\}"
   syn match       pam_Mater52_r8_a2  display contained containedin=pam_Mater52_r8 "\%11c\CJCFRC     "
   syn match       pam_Mater52_r8_a2  display contained containedin=pam_Mater52_r8 "\%11c\CLOOKU     "
   hi def link pam_Mater52_r8_e1  pam_oddError
   hi def link pam_Mater52_r8_a1  pam_oddArgument
   hi def link pam_Mater52_r8_e2  pam_evenError
   hi def link pam_Mater52_r8_a2  pam_evenArgument
   syn region      pam_Mater52_r8     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r9 skipnl keepend
   syn region      pam_Mater52e_r8     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52e_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater52_r7     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r8 skipnl keepend
   syn region      pam_Mater52c_r7     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r8 skipnl keepend
   syn region      pam_Mater52e_r7     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52e_r8 skipnl keepend
   syn region      pam_Mater52b_r7     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater52_r6     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r7 skipnl keepend
   syn region      pam_Mater52c_r6     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52c_r7 skipnl keepend
   syn region      pam_Mater52p_r6     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r7 skipnl keepend
   syn region      pam_Mater52e_r6     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52e_r7 skipnl keepend
   syn region      pam_Mater52b_r6     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52b_r7 skipnl keepend
   syn region      pam_Mater52l_r6     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater52_r5     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r6 skipnl keepend
   syn region      pam_Mater52c_r5     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52c_r6 skipnl keepend
   syn region      pam_Mater52p_r5     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52p_r6 skipnl keepend
   syn region      pam_Mater52e_r5     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52e_r6 skipnl keepend
   syn region      pam_Mater52b_r5     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52b_r6 skipnl keepend
   syn region      pam_Mater52l_r5     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52l_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater52_r4     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r5 skipnl keepend
   syn match       pam_Mater52c_r4_a1  display contained containedin=pam_Mater52c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater52c_r4_a1  pam_evenArgument
   syn region      pam_Mater52c_r4     transparent contained containedin=pam_Mater52 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52c_r5 skipnl keepend
   syn match       pam_Mater52p_r4_a1  display contained containedin=pam_Mater52p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater52p_r4_a1  display contained containedin=pam_Mater52p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater52p_r4_a1  pam_evenArgument
   syn region      pam_Mater52p_r4     transparent contained containedin=pam_Mater52 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52p_r5 skipnl keepend
   syn region      pam_Mater52p_r4     transparent contained containedin=pam_Mater52 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52p_r5 skipnl keepend
   syn match       pam_Mater52e_r4_a1  display contained containedin=pam_Mater52e_r4 "\%11c\CECURV     "
   hi def link pam_Mater52e_r4_a1  pam_evenArgument
   syn region      pam_Mater52e_r4     transparent contained containedin=pam_Mater52 start="\%1c.\(.\{9\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52e_r5 skipnl keepend
   syn match       pam_Mater52l_r4_a1  display contained containedin=pam_Mater52l_r4 "\%11c\CLOOKU     "
   hi def link pam_Mater52l_r4_a1  pam_evenArgument
   syn region      pam_Mater52l_r4     transparent contained containedin=pam_Mater52 start="\%1c.\(.\{9\}\CLOOKU     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52l_r5 skipnl keepend
   syn match       pam_Mater52b_r4_a1  display contained containedin=pam_Mater52b_r4 "\%11c[ ]\{10\}"
   hi def link pam_Mater52b_r4_a1  pam_evenArgument
   syn region      pam_Mater52b_r4     transparent contained containedin=pam_Mater52 start="\%1c.\(.\{9\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater52_r3     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater52_r4,pam_Mater52c_r4,pam_Mater52p_r4,pam_Mater52e_r4,pam_Mater52b_r4,pam_Mater52l_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater52_r2a    transparent contained containedin=pam_Mater52 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater52_r2     transparent contained containedin=pam_Mater52 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater52_r2a,pam_Mater52_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater52_r1     transparent contained containedin=pam_Mater52 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater52_r2 skipnl keepend
syn region      pam_Mater52        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}52"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater52_r[1-9] fold keepend
" === MATER 52 end}}}

"{{{ === MATER 61 begin
   "Row 9
   syn region      pam_Mater61_r9     transparent contained containedin=pam_Mater61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater61_r8     transparent contained containedin=pam_Mater61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater61_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater61_r7     transparent contained containedin=pam_Mater61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater61_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater61_r6     transparent contained containedin=pam_Mater61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater61_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater61_r5     transparent contained containedin=pam_Mater61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater61_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater61_r4     transparent contained containedin=pam_Mater61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater61_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater61_r3     transparent contained containedin=pam_Mater61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater61_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater61_r2a    transparent contained containedin=pam_Mater61 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater61_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater61_r2     transparent contained containedin=pam_Mater61 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater61_r2a,pam_Mater61_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater61_r1     transparent contained containedin=pam_Mater61 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater61_r2 skipnl keepend
syn region      pam_Mater61        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}61"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater61_r[1-9] fold keepend
" === MATER 61 end}}}

"{{{ === MATER 62 begin
   "Row 9
   syn region      pam_Mater62_r9     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 8
   syn region      pam_Mater62_r8     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater62_r7     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater62_r6     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r7 skipnl keepend
   syn region      pam_Mater62c_r6     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r7 skipnl keepend
   syn region      pam_Mater62p_r6     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater62_r5     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r6 skipnl keepend
   syn region      pam_Mater62c_r5     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62c_r6 skipnl keepend
   syn region      pam_Mater62p_r5     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62p_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater62_r4     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r5 skipnl keepend
   syn match       pam_Mater62c_r4_a1  display contained containedin=pam_Mater62c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater62c_r4_a1  pam_evenArgument
   syn region      pam_Mater62c_r4     transparent contained containedin=pam_Mater62 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62c_r5 skipnl keepend
   syn match       pam_Mater62p_r4_a1  display contained containedin=pam_Mater62p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater62p_r4_a1  display contained containedin=pam_Mater62p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater62p_r4_a1  pam_evenArgument
   syn region      pam_Mater62p_r4     transparent contained containedin=pam_Mater62 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62p_r5 skipnl keepend
   syn region      pam_Mater62p_r4     transparent contained containedin=pam_Mater62 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62p_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater62_r3     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater62_r4,pam_Mater62c_r4,pam_Mater62p_r4,pam_Mater62e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater62_r2a    transparent contained containedin=pam_Mater62 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater62_r2     transparent contained containedin=pam_Mater62 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater62_r2a,pam_Mater62_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater62_r1     transparent contained containedin=pam_Mater62 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater62_r2 skipnl keepend
syn region      pam_Mater62        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}62"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater62_r.* fold keepend
" === MATER 62 end}}}

"{{{ === MATER 71 begin
   "Row 13
   syn region      pam_Mater71_r13     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 12
   syn region      pam_Mater71_r12     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater71_r11     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater71_r10     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater71_r9     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r10 skipnl keepend
   syn region      pam_Mater71e_r9     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater71_r8     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r9 skipnl keepend
   syn region      pam_Mater71e_r8     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71e_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater71_r7     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r8 skipnl keepend
   syn region      pam_Mater71c_r7     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r8 skipnl keepend
   syn region      pam_Mater71e_r7     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71e_r8 skipnl keepend
   syn region      pam_Mater71b_r7     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater71_r6     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r7 skipnl keepend
   syn region      pam_Mater71c_r6     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71c_r7 skipnl keepend
   syn region      pam_Mater71p_r6     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r7 skipnl keepend
   syn region      pam_Mater71e_r6     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71e_r7 skipnl keepend
   syn region      pam_Mater71b_r6     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71b_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater71_r5     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r6 skipnl keepend
   syn region      pam_Mater71c_r5     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71c_r6 skipnl keepend
   syn region      pam_Mater71p_r5     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71p_r6 skipnl keepend
   syn region      pam_Mater71e_r5     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71e_r6 skipnl keepend
   syn region      pam_Mater71b_r5     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71b_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater71_r4     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r5 skipnl keepend
   syn match       pam_Mater71c_r4_a1  display contained containedin=pam_Mater71c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater71c_r4_a1  pam_evenArgument
   syn region      pam_Mater71c_r4     transparent contained containedin=pam_Mater71 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71c_r5 skipnl keepend
   syn match       pam_Mater71p_r4_a1  display contained containedin=pam_Mater71p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater71p_r4_a1  display contained containedin=pam_Mater71p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater71p_r4_a1  pam_evenArgument
   syn region      pam_Mater71p_r4     transparent contained containedin=pam_Mater71 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71p_r5 skipnl keepend
   syn region      pam_Mater71p_r4     transparent contained containedin=pam_Mater71 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71p_r5 skipnl keepend
   syn match       pam_Mater71e_r4_a1  display contained containedin=pam_Mater71e_r4 "\%11c\CECURV     "
   hi def link pam_Mater71e_r4_a1  pam_evenArgument
   syn region      pam_Mater71e_r4     transparent contained containedin=pam_Mater71 start="\%1c.\(.\{9\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71e_r5 skipnl keepend
   syn match       pam_Mater71b_r4_a1  display contained containedin=pam_Mater71b_r4 "\%11c[ ]\{10\}"
   hi def link pam_Mater71b_r4_a1  pam_evenArgument
   syn region      pam_Mater71b_r4     transparent contained containedin=pam_Mater71 start="\%1c.\(.\{9\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater71_r3     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater71_r4,pam_Mater71c_r4,pam_Mater71p_r4,pam_Mater71e_r4,pam_Mater71b_r4,pam_Mater71l_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater71_r2a    transparent contained containedin=pam_Mater71 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater71_r2     transparent contained containedin=pam_Mater71 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater71_r2a,pam_Mater71_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater71_r1     transparent contained containedin=pam_Mater71 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater71_r2 skipnl keepend
syn region      pam_Mater71        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}71"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater71_r[1-9] fold keepend
" === MATER 71 end}}}

"{{{ === MATER 99 begin
   "Row 9
   syn region      pam_Mater99_r9     transparent contained containedin=pam_Mater99 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater99_r8     transparent contained containedin=pam_Mater99 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater99_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater99_r7     transparent contained containedin=pam_Mater99 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater99_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater99_r6     transparent contained containedin=pam_Mater99 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater99_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater99_r5     transparent contained containedin=pam_Mater99 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater99_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater99_r4     transparent contained containedin=pam_Mater99 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater99_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater99_r3     transparent contained containedin=pam_Mater99 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater99_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater99_r2a    transparent contained containedin=pam_Mater99 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater99_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater99_r2     transparent contained containedin=pam_Mater99 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater99_r2a,pam_Mater99_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater99_r1     transparent contained containedin=pam_Mater99 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater99_r2 skipnl keepend
syn region      pam_Mater99        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{6\}99"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater99_r[1-9] fold keepend
" === MATER 99 end}}}

"{{{ === MATER 100 begin
   "Row 9
   syn region      pam_Mater100_r9     transparent contained containedin=pam_Mater100 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater100_r8     transparent contained containedin=pam_Mater100 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater100_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater100_r7     transparent contained containedin=pam_Mater100 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater100_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater100_r6     transparent contained containedin=pam_Mater100 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater100_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater100_r5     transparent contained containedin=pam_Mater100 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater100_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater100_r4     transparent contained containedin=pam_Mater100 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater100_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater100_r3     transparent contained containedin=pam_Mater100 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater100_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater100_r2a    transparent contained containedin=pam_Mater100 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater100_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater100_r2     transparent contained containedin=pam_Mater100 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater100_r2a,pam_Mater100_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater100_r1     transparent contained containedin=pam_Mater100 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater100_r2 skipnl keepend
syn region      pam_Mater100        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}100"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater100_r[1-9] fold keepend
" === MATER 100 end}}}

"{{{ === MATER 101 begin
   "Row 9
   syn region      pam_Mater101_r9     transparent contained containedin=pam_Mater101 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater101_r8     transparent contained containedin=pam_Mater101 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater101_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater101_r7     transparent contained containedin=pam_Mater101 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater101_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater101_r6     transparent contained containedin=pam_Mater101 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater101_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater101_r5     transparent contained containedin=pam_Mater101 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater101_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater101_r4     transparent contained containedin=pam_Mater101 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater101_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater101_r3     transparent contained containedin=pam_Mater101 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater101_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater101_r2a    transparent contained containedin=pam_Mater101 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater101_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater101_r2     transparent contained containedin=pam_Mater101 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater101_r2a,pam_Mater101_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater101_r1     transparent contained containedin=pam_Mater101 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater101_r2 skipnl keepend
syn region      pam_Mater101        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}101"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater101_r[1-9] fold keepend
" === MATER 101 end}}}

"{{{ === MATER 102/103 begin
   "Row 9
   syn region      pam_Mater103_r9     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater103e_r9     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater103_r8     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r9 skipnl keepend
   syn region      pam_Mater103e_r8     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103e_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater103_r7     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r8 skipnl keepend
   syn region      pam_Mater103e_r7     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103e_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater103_r6     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r7 skipnl keepend
   syn region      pam_Mater103c_r6     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r7 skipnl keepend
   syn region      pam_Mater103p_r6     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r7 skipnl keepend
   syn region      pam_Mater103e_r6     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103e_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater103_r5     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r6 skipnl keepend
   syn region      pam_Mater103c_r5     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103c_r6 skipnl keepend
   syn region      pam_Mater103p_r5     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103p_r6 skipnl keepend
   syn region      pam_Mater103e_r5     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103e_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater103_r4     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r5 skipnl keepend
   syn match       pam_Mater103c_r4_a1  display contained containedin=pam_Mater103c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater103c_r4_a1  pam_evenArgument
   syn region      pam_Mater103c_r4     transparent contained containedin=pam_Mater103 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103c_r5 skipnl keepend
   syn match       pam_Mater103p_r4_a1  display contained containedin=pam_Mater103p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater103p_r4_a1  display contained containedin=pam_Mater103p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater103p_r4_a1  pam_evenArgument
   syn region      pam_Mater103p_r4     transparent contained containedin=pam_Mater103 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103p_r5 skipnl keepend
   syn region      pam_Mater103p_r4     transparent contained containedin=pam_Mater103 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103p_r5 skipnl keepend
   syn match       pam_Mater103e_r4_a1  display contained containedin=pam_Mater103e_r4 "\%11c\CECURV     "
   hi def link pam_Mater103e_r4_a1  pam_evenArgument
   syn region      pam_Mater103e_r4     transparent contained containedin=pam_Mater103 start="\%1c.\(.\{9\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103e_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater103_r3     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater103_r4,pam_Mater103c_r4,pam_Mater103p_r4,pam_Mater103e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater103_r2a    transparent contained containedin=pam_Mater103 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater103_r2     transparent contained containedin=pam_Mater103 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater103_r2a,pam_Mater103_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater103_r1     transparent contained containedin=pam_Mater103 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater103_r2 skipnl keepend
syn region      pam_Mater103        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}10[23]"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater103_r[1-9] fold keepend
" === MATER 102/103 end}}}

"{{{ === MATER 105 begin
   "Row 10
   syn region      pam_Mater105_r10    transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 9
   syn region      pam_Mater105_r9     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r10 skipnl keepend
   syn region      pam_Mater105e_r9     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater105_r8     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r9 skipnl keepend
   syn region      pam_Mater105e_r8     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105e_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater105_r7     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r8 skipnl keepend
   syn region      pam_Mater105_r7_arg     transparent contained containedin=pam_Mater105_r7 matchgroup=pam_evenArgument start="\%31c\CJCDTYP    " end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error  keepend
   syn region      pam_Mater105_r7_arg     transparent contained containedin=pam_Mater105_r7 matchgroup=pam_evenArgument start="\%31c\CHSRDTYP   " end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error  keepend
   syn region      pam_Mater105e_r7     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105e_r8 skipnl  keepend
   "Row 6
   syn region      pam_Mater105_r6     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r7 skipnl keepend
   syn region      pam_Mater105c_r6     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r7 skipnl keepend
   syn region      pam_Mater105p_r6     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r7 skipnl keepend
   syn region      pam_Mater105e_r6     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105e_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater105_r5     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r6 skipnl keepend
   syn region      pam_Mater105c_r5     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105c_r6 skipnl keepend
   syn region      pam_Mater105p_r5     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105p_r6 skipnl keepend
   syn region      pam_Mater105e_r5     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105e_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater105_r4     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r5 skipnl keepend
   syn match       pam_Mater105c_r4_a1  display contained containedin=pam_Mater105c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater105c_r4_a1  pam_evenArgument
   syn region      pam_Mater105c_r4     transparent contained containedin=pam_Mater105 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105c_r5 skipnl keepend
   syn match       pam_Mater105p_r4_a1  display contained containedin=pam_Mater105p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater105p_r4_a1  display contained containedin=pam_Mater105p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater105p_r4_a1  pam_evenArgument
   syn region      pam_Mater105p_r4     transparent contained containedin=pam_Mater105 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105p_r5 skipnl keepend
   syn region      pam_Mater105p_r4     transparent contained containedin=pam_Mater105 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105p_r5 skipnl keepend
   syn match       pam_Mater105e_r4_a1  display contained containedin=pam_Mater105e_r4 "\%11c\CECURV     "
   hi def link pam_Mater105e_r4_a1  pam_evenArgument
   syn region      pam_Mater105e_r4     transparent contained containedin=pam_Mater105 start="\%1c.\(.\{9\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105e_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater105_r3     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater105_r4,pam_Mater105c_r4,pam_Mater105p_r4,pam_Mater105e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater105_r2a    transparent contained containedin=pam_Mater105 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater105_r2     transparent contained containedin=pam_Mater105 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater105_r2a,pam_Mater105_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater105_r1     transparent contained containedin=pam_Mater105 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater105_r2 skipnl keepend
syn region      pam_Mater105        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}105"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater105_r.* fold keepend
" === MATER 105 end}}}

"{{{ === MATER 106 begin
   "Row 9
   syn region      pam_Mater106_r9     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   syn region      pam_Mater106e_r9     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater106_r8     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r9 skipnl keepend
   syn region      pam_Mater106e_r8     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106e_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater106_r7     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r8 skipnl keepend
   syn region      pam_Mater106e_r7     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106e_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater106_r6     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r7 skipnl keepend
   syn region      pam_Mater106c_r6     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r7 skipnl keepend
   syn region      pam_Mater106p_r6     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r7 skipnl keepend
   syn region      pam_Mater106e_r6     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106e_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater106_r5     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r6 skipnl keepend
   syn region      pam_Mater106c_r5     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106c_r6 skipnl keepend
   syn region      pam_Mater106p_r5     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106p_r6 skipnl keepend
   syn region      pam_Mater106e_r5     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106e_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater106_r4     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r5 skipnl keepend
   syn match       pam_Mater106c_r4_a1  display contained containedin=pam_Mater106c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater106c_r4_a1  pam_evenArgument
   syn region      pam_Mater106c_r4     transparent contained containedin=pam_Mater106 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106c_r5 skipnl keepend
   syn match       pam_Mater106p_r4_a1  display contained containedin=pam_Mater106p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater106p_r4_a1  display contained containedin=pam_Mater106p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater106p_r4_a1  pam_evenArgument
   syn region      pam_Mater106p_r4     transparent contained containedin=pam_Mater106 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106p_r5 skipnl keepend
   syn region      pam_Mater106p_r4     transparent contained containedin=pam_Mater106 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106p_r5 skipnl keepend
   syn match       pam_Mater106e_r4_a1  display contained containedin=pam_Mater106e_r4 "\%11c\CECURV     "
   hi def link pam_Mater106e_r4_a1  pam_evenArgument
   syn region      pam_Mater106e_r4     transparent contained containedin=pam_Mater106 start="\%1c.\(.\{9\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106e_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater106_r3     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater106_r4,pam_Mater106c_r4,pam_Mater106p_r4,pam_Mater106e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater106_r2a    transparent contained containedin=pam_Mater106 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater106_r2     transparent contained containedin=pam_Mater106 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater106_r2a,pam_Mater106_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater106_r1     transparent contained containedin=pam_Mater106 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater106_r2 skipnl keepend
syn region      pam_Mater106        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}106"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater106_r[1-9] fold keepend
" === MATER 106 end}}}

"{{{ === MATER 108 begin
   "Row 9
   syn region      pam_Mater108_r9     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@11f10,@21f10,@31f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater108_r8     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r9 skipnl keepend
   "Row 7
      syn region   pam_Mater108_r7_arg transparent contained containedin=pam_Mater108_r7 matchgroup=pam_oddArgument start="\%41c[ ]\{9\}2" end="\n[\$\#]\@!" contains=@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error  keepend
   syn region      pam_Mater108_r7     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater108_r6     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r7 skipnl keepend
   syn region      pam_Mater108c_r6     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r7 skipnl keepend
   syn region      pam_Mater108p_r6     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r7 skipnl keepend
   syn region      pam_Mater108e_r6     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108e_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater108_r5     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r6 skipnl keepend
   syn region      pam_Mater108c_r5     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108c_r6 skipnl keepend
   syn region      pam_Mater108p_r5     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108p_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater108_r4     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r5 skipnl keepend
   syn match       pam_Mater108c_r4_a1  display contained containedin=pam_Mater108c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater108c_r4_a1  pam_evenArgument
   syn region      pam_Mater108c_r4     transparent contained containedin=pam_Mater108 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108c_r5 skipnl keepend
   syn match       pam_Mater108p_r4_a1  display contained containedin=pam_Mater108p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater108p_r4_a1  display contained containedin=pam_Mater108p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater108p_r4_a1  pam_evenArgument
   syn region      pam_Mater108p_r4     transparent contained containedin=pam_Mater108 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108p_r5 skipnl keepend
   syn region      pam_Mater108p_r4     transparent contained containedin=pam_Mater108 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108p_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater108_r3     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater108_r4,pam_Mater108c_r4,pam_Mater108p_r4,pam_Mater108e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater108_r2a    transparent contained containedin=pam_Mater108 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater108_r2     transparent contained containedin=pam_Mater108 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater108_r2a,pam_Mater108_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater108_r1     transparent contained containedin=pam_Mater108 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater108_r2 skipnl keepend
syn region      pam_Mater108        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}108"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater108_r[1-9] fold keepend
" === MATER 108 end}}}

"{{{ === MATER 109 begin
   "Row 10
   syn region      pam_Mater109_r10     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
      syn region pam_Mater109_r10_Arg  transparent contained containedin=pam_Mater109_r10 matchgroup=pam_oddArgument start="^\C     CURVE" end="\n[\$\#]\@!" contains=@11i10,pam_Comment,pam_Comment_Position,pam_Error keepend
   "Row 9
   syn region      pam_Mater109_r9     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater109_r8     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater109_r7     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater109_r6     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r7 skipnl keepend
   syn region      pam_Mater109c_r6     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r7 skipnl keepend
   syn region      pam_Mater109p_r6     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r7 skipnl keepend
   syn region      pam_Mater109k_r6     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r7 skipnl keepend
   syn region      pam_Mater109y_r6     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater109_r5     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r6 skipnl keepend
   syn region      pam_Mater109c_r5     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109c_r6 skipnl keepend
   syn region      pam_Mater109p_r5     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109p_r6 skipnl keepend
   syn region      pam_Mater109k_r5     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109k_r6 skipnl keepend
   syn region      pam_Mater109y_r5     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109y_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater109_r4     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r5 skipnl keepend
   syn match       pam_Mater109c_r4_a1  display contained containedin=pam_Mater109c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater109c_r4_a1  pam_evenArgument
   syn region      pam_Mater109c_r4     transparent contained containedin=pam_Mater109 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109c_r5 skipnl keepend
   syn match       pam_Mater109p_r4_a1  display contained containedin=pam_Mater109p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater109p_r4_a1  display contained containedin=pam_Mater109p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater109p_r4_a1  pam_evenArgument
   syn region      pam_Mater109p_r4     transparent contained containedin=pam_Mater109 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109p_r5 skipnl keepend
   syn region      pam_Mater109p_r4     transparent contained containedin=pam_Mater109 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109p_r5 skipnl keepend
   syn match       pam_Mater109k_r4_a1  display contained containedin=pam_Mater109k_r4 "\%11c\CKINEM     "
   hi def link pam_Mater109k_r4_a1  pam_evenArgument
   syn region      pam_Mater109k_r4     transparent contained containedin=pam_Mater109 start="\%1c.\(.\{9\}\CKINEM     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109k_r5 skipnl keepend
   syn match       pam_Mater109y_r4_a1  display contained containedin=pam_Mater109y_r4 "\%11c\CYOSHD     "
   hi def link pam_Mater109y_r4_a1  pam_evenArgument
   syn region      pam_Mater109y_r4     transparent contained containedin=pam_Mater109 start="\%1c.\(.\{9\}\CYOSHD     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109y_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater109_r3     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater109_r4,pam_Mater109c_r4,pam_Mater109p_r4,pam_Mater109e_r4,pam_Mater109k_r4,pam_Mater109y_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater109_r2a    transparent contained containedin=pam_Mater109 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater109_r2     transparent contained containedin=pam_Mater109 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater109_r2a,pam_Mater109_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater109_r1     transparent contained containedin=pam_Mater109 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater109_r2 skipnl keepend
syn region      pam_Mater109        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}109"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater109_r[1-9] fold keepend
" === MATER 109 end}}}

"{{{ === MATER 110 begin
   "Row 9
   syn region      pam_Mater110_r9     transparent contained containedin=pam_Mater110 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater110_r8     transparent contained containedin=pam_Mater110 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater110_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater110_r7     transparent contained containedin=pam_Mater110 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater110_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater110_r6     transparent contained containedin=pam_Mater110 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater110_r7 skipnl keepend
   "Row 5
      syn match       pam_Mater110_r5_e1  display contained containedin=pam_Mater110_r5 "\%21c.\{,10\}"
      syn match       pam_Mater110_r5_a1  display contained containedin=pam_Mater110_r5 "\%21c\CCURVE     "
      syn match       pam_Mater110_r5_a1  display contained containedin=pam_Mater110_r5 "\%21c[ ]\{10\}"
      hi def link pam_Mater110_r5_a1 pam_oddArgument
      hi def link pam_Mater110_r5_e1 pam_oddError
   syn region      pam_Mater110_r5     transparent contained containedin=pam_Mater110 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31i10,@41i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater110_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater110_r4     transparent contained containedin=pam_Mater110 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater110_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater110_r3     transparent contained containedin=pam_Mater110 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater110_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater110_r2a    transparent contained containedin=pam_Mater110 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater110_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater110_r2     transparent contained containedin=pam_Mater110 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater110_r2a,pam_Mater110_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater110_r1     transparent contained containedin=pam_Mater110 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater110_r2 skipnl keepend
syn region      pam_Mater110        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}110"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater110_r[1-9] fold keepend
" === MATER 110 end}}}

"{{{ === MATER 115 begin
   "Row 9
   syn region      pam_Mater115_r9     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater115_r8     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater115_r7     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater115_r6     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r7 skipnl keepend
   syn region      pam_Mater115c_r6     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r7 skipnl keepend
   syn region      pam_Mater115p_r6     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater115_r5     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r6 skipnl keepend
   syn region      pam_Mater115c_r5     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115c_r6 skipnl keepend
   syn region      pam_Mater115p_r5     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115p_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater115_r4     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r5 skipnl keepend
   syn match       pam_Mater115c_r4_a1  display contained containedin=pam_Mater115c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater115c_r4_a1  pam_evenArgument
   syn region      pam_Mater115c_r4     transparent contained containedin=pam_Mater115 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115c_r5 skipnl keepend
   syn match       pam_Mater115p_r4_a1  display contained containedin=pam_Mater115p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater115p_r4_a1  display contained containedin=pam_Mater115p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater115p_r4_a1  pam_evenArgument
   syn region      pam_Mater115p_r4     transparent contained containedin=pam_Mater115 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115p_r5 skipnl keepend
   syn region      pam_Mater115p_r4     transparent contained containedin=pam_Mater115 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115p_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater115_r3     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater115_r4,pam_Mater115c_r4,pam_Mater115p_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater115_r2a    transparent contained containedin=pam_Mater115 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater115_r2     transparent contained containedin=pam_Mater115 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater115_r2a,pam_Mater115_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater115_r1     transparent contained containedin=pam_Mater115 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater115_r2 skipnl keepend
syn region      pam_Mater115        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}115"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater115_r[1-9] fold keepend
" === MATER 115 end}}}

"{{{ === MATER 116 begin
   "Row 13
   syn region      pam_Mater116_r13     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 12
   syn region      pam_Mater116_r12     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r13 skipnl keepend
   syn region      pam_Mater116c_r12     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r13 skipnl keepend
   syn region      pam_Mater116p_r12     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater116_r11     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r12 skipnl keepend
   syn region      pam_Mater116c_r11     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116c_r12 skipnl keepend
   syn region      pam_Mater116p_r11     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116p_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater116_r10     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r11 skipnl keepend
   syn match       pam_Mater116c_r10_a1  display contained containedin=pam_Mater116c_r10 "\%11c\CCURVE     "
   hi def link pam_Mater116c_r10_a1  pam_evenArgument
   syn region      pam_Mater116c_r10     transparent contained containedin=pam_Mater116 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116c_r11 skipnl keepend
   syn match       pam_Mater116p_r10_a1  display contained containedin=pam_Mater116p_r10 "\%11c\CPOWER     "
   syn match       pam_Mater116p_r10_a1  display contained containedin=pam_Mater116p_r10 "\%11c\CKRUPK     "
   hi def link pam_Mater116p_r10_a1  pam_evenArgument
   syn region      pam_Mater116p_r10     transparent contained containedin=pam_Mater116 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116p_r11 skipnl keepend
   syn region      pam_Mater116p_r10     transparent contained containedin=pam_Mater116 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116p_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater116_r9     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r10,pam_Mater116c_r10,pam_Mater116p_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater116_r8     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater116_r7     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater116_r6     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r7 skipnl keepend
   syn region      pam_Mater116c_r6     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r7 skipnl keepend
   syn region      pam_Mater116p_r6     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater116_r5     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r6 skipnl keepend
   syn region      pam_Mater116c_r5     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116c_r6 skipnl keepend
   syn region      pam_Mater116p_r5     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116p_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater116_r4     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r5 skipnl keepend
   syn match       pam_Mater116c_r4_a1  display contained containedin=pam_Mater116c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater116c_r4_a1  pam_evenArgument
   syn region      pam_Mater116c_r4     transparent contained containedin=pam_Mater116 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116c_r5 skipnl keepend
   syn match       pam_Mater116p_r4_a1  display contained containedin=pam_Mater116p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater116p_r4_a1  display contained containedin=pam_Mater116p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater116p_r4_a1  pam_evenArgument
   syn region      pam_Mater116p_r4     transparent contained containedin=pam_Mater116 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116p_r5 skipnl keepend
   syn region      pam_Mater116p_r4     transparent contained containedin=pam_Mater116 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116p_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater116_r3     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater116_r4,pam_Mater116c_r4,pam_Mater116p_r4,pam_Mater116e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater116_r2a    transparent contained containedin=pam_Mater116 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater116_r2     transparent contained containedin=pam_Mater116 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater116_r2a,pam_Mater116_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater116_r1     transparent contained containedin=pam_Mater116 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater116_r2 skipnl keepend
syn region      pam_Mater116        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}116"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater116_r[1-9] fold keepend
" === MATER 116 end}}}

"{{{ === MATER 117 begin
   "Row 10
   syn region      pam_Mater117_r10     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
      syn region pam_Mater117_r10_Arg  transparent contained containedin=pam_Mater117_r10 matchgroup=pam_oddArgument start="^\C     CURVE" end="\n[\$\#]\@!" contains=@11i10,pam_Comment,pam_Comment_Position,pam_Error keepend
   "Row 9
   syn region      pam_Mater117_r9     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater117_r8     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater117_r7     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61i10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater117_r6     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r7 skipnl keepend
   syn region      pam_Mater117c_r6     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r7 skipnl keepend
   syn region      pam_Mater117p_r6     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r7 skipnl keepend
   syn region      pam_Mater117k_r6     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r7 skipnl keepend
   syn region      pam_Mater117y_r6     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r7 skipnl keepend
   syn region      pam_Mater117l_r6     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater117_r5     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r6 skipnl keepend
   syn region      pam_Mater117c_r5     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117c_r6 skipnl keepend
   syn region      pam_Mater117p_r5     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117p_r6 skipnl keepend
   syn region      pam_Mater117k_r5     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117k_r6 skipnl keepend
   syn region      pam_Mater117y_r5     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117y_r6 skipnl keepend
   syn region      pam_Mater117l_r5     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117l_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater117_r4     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r5 skipnl keepend
   syn match       pam_Mater117c_r4_a1  display contained containedin=pam_Mater117c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater117c_r4_a1  pam_evenArgument
   syn region      pam_Mater117c_r4     transparent contained containedin=pam_Mater117 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117c_r5 skipnl keepend
   syn match       pam_Mater117p_r4_a1  display contained containedin=pam_Mater117p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater117p_r4_a1  display contained containedin=pam_Mater117p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater117p_r4_a1  pam_evenArgument
   syn region      pam_Mater117p_r4     transparent contained containedin=pam_Mater117 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117p_r5 skipnl keepend
   syn region      pam_Mater117p_r4     transparent contained containedin=pam_Mater117 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117p_r5 skipnl keepend
   syn match       pam_Mater117k_r4_a1  display contained containedin=pam_Mater117k_r4 "\%11c\CKINEM     "
   hi def link pam_Mater117k_r4_a1  pam_evenArgument
   syn region      pam_Mater117k_r4     transparent contained containedin=pam_Mater117 start="\%1c.\(.\{9\}\CKINEM     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117k_r5 skipnl keepend
   syn match       pam_Mater117y_r4_a1  display contained containedin=pam_Mater117y_r4 "\%11c\CYOSHD     "
   hi def link pam_Mater117y_r4_a1  pam_evenArgument
   syn region      pam_Mater117y_r4     transparent contained containedin=pam_Mater117 start="\%1c.\(.\{9\}\CYOSHD     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117y_r5 skipnl keepend
   syn match       pam_Mater117l_r4_a1  display contained containedin=pam_Mater117l_r4 "\%11c\CLOOKU     "
   hi def link pam_Mater117l_r4_a1  pam_evenArgument
   syn region      pam_Mater117l_r4     transparent contained containedin=pam_Mater117 start="\%1c.\(.\{9\}\CLOOKU     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117l_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater117_r3     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater117_r4,pam_Mater117c_r4,pam_Mater117p_r4,pam_Mater117e_r4,pam_Mater117k_r4,pam_Mater117y_r4,pam_Mater117l_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater117_r2a    transparent contained containedin=pam_Mater117 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater117_r2     transparent contained containedin=pam_Mater117 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater117_r2a,pam_Mater117_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater117_r1     transparent contained containedin=pam_Mater117 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater117_r2 skipnl keepend
syn region      pam_Mater117        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}117"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater117_r[1-9] fold keepend
" === MATER 117 end}}}

"{{{ === MATER 118 begin
   "Row 10
   syn region      pam_Mater118_r10     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 9
   syn region      pam_Mater118_r9     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@11f10,@21f10,@31f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r10 keepend
   "Row 8
   syn region      pam_Mater118_r8     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater118_r7     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater118_r6     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r7 skipnl keepend
   syn region      pam_Mater118c_r6     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r7 skipnl keepend
   syn region      pam_Mater118p_r6     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater118_r5     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r6 skipnl keepend
   syn region      pam_Mater118c_r5     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118c_r6 skipnl keepend
   syn region      pam_Mater118p_r5     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118p_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater118_r4     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r5 skipnl keepend
   syn match       pam_Mater118c_r4_a1  display contained containedin=pam_Mater118c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater118c_r4_a1  pam_evenArgument
   syn region      pam_Mater118c_r4     transparent contained containedin=pam_Mater118 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118c_r5 skipnl keepend
   syn match       pam_Mater118p_r4_a1  display contained containedin=pam_Mater118p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater118p_r4_a1  display contained containedin=pam_Mater118p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater118p_r4_a1  pam_evenArgument
   syn region      pam_Mater118p_r4     transparent contained containedin=pam_Mater118 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118p_r5 skipnl keepend
   syn region      pam_Mater118p_r4     transparent contained containedin=pam_Mater118 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118p_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater118_r3     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater118_r4,pam_Mater118c_r4,pam_Mater118p_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater118_r2a    transparent contained containedin=pam_Mater118 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater118_r2     transparent contained containedin=pam_Mater118 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater118_r2a,pam_Mater118_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater118_r1     transparent contained containedin=pam_Mater118 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater118_r2 skipnl keepend
syn region      pam_Mater118        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}118"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater118_r[1-9] fold keepend
" === MATER 118 end}}}

"{{{ === MATER 121 begin
   "Row 10
   syn region      pam_Mater121_r10     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 9
   syn region      pam_Mater121_r9     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater121_r8     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater121_r7     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater121_r6     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater121_r5     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r6 skipnl keepend
   syn region      pam_Mater121_r5     transparent contained containedin=pam_Mater121 matchgroup=pam_oddArgument start="\%1c\CCURVE     " start="^$\n" end="\n[\$\#]\@!" contains=@11i10,@21i10,@31i10,@41i10,@51i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r6 skipnl keepend
   syn region      pam_Mater121_r5     transparent contained containedin=pam_Mater121 matchgroup=pam_oddArgument start="\%1c\CCONST     " start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater121_r4     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater121_r3     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater121_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater121_r2a    transparent contained containedin=pam_Mater121 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater121_r2     transparent contained containedin=pam_Mater121 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater121_r2a,pam_Mater121_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater121_r1     transparent contained containedin=pam_Mater121 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater121_r2 skipnl keepend
syn region      pam_Mater121        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}121"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater121_r[1-9] fold keepend
" === MATER 121 end}}}

"{{{ === MATER 126 begin
   "Row 9
   syn region      pam_Mater126_r9     transparent contained containedin=pam_Mater126 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater126_r8     transparent contained containedin=pam_Mater126 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater126_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater126_r7     transparent contained containedin=pam_Mater126 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater126_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater126_r6     transparent contained containedin=pam_Mater126 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater126_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater126_r5     transparent contained containedin=pam_Mater126 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater126_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater126_r4     transparent contained containedin=pam_Mater126 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater126_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater126_r3     transparent contained containedin=pam_Mater126 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater126_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater126_r2a    transparent contained containedin=pam_Mater126 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater126_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater126_r2     transparent contained containedin=pam_Mater126 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater126_r2a,pam_Mater126_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater126_r1     transparent contained containedin=pam_Mater126 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater126_r2 skipnl keepend
syn region      pam_Mater126        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}126"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater126_r[1-9] fold keepend
" === MATER 126 end}}}

"{{{ === MATER 127 begin
   "Row 18
   syn region      pam_Mater127_r18     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 17
   syn region      pam_Mater127_r17     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r18 skipnl keepend
   "Row 16
   syn region      pam_Mater127_r16     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r17 skipnl keepend
   "Row 15
   syn region      pam_Mater127_r15     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r16 skipnl keepend
   "Row 14
   syn region      pam_Mater127_r14     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r15 skipnl keepend
   "Row 13
   syn region      pam_Mater127_r13     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater127_r12     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater127_r11     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater127_r10     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater127_r9     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater127_r8     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater127_r7     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater127_r6     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r7 skipnl keepend
   syn region      pam_Mater127c_r6     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r7 skipnl keepend
   syn region      pam_Mater127p_r6     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r7 skipnl keepend
   syn region      pam_Mater127e_r6     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater127_r5     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r6 skipnl keepend
   syn region      pam_Mater127c_r5     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127c_r6 skipnl keepend
   syn region      pam_Mater127p_r5     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127p_r6 skipnl keepend
   syn region      pam_Mater127e_r5     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127e_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater127_r4     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r5 skipnl keepend
   syn match       pam_Mater127c_r4_a1  display contained containedin=pam_Mater127c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater127c_r4_a1  pam_evenArgument
   syn region      pam_Mater127c_r4     transparent contained containedin=pam_Mater127 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127c_r5 skipnl keepend
   syn match       pam_Mater127p_r4_a1  display contained containedin=pam_Mater127p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater127p_r4_a1  display contained containedin=pam_Mater127p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater127p_r4_a1  pam_evenArgument
   syn region      pam_Mater127p_r4     transparent contained containedin=pam_Mater127 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127p_r5 skipnl keepend
   syn region      pam_Mater127p_r4     transparent contained containedin=pam_Mater127 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127p_r5 skipnl keepend
   syn match       pam_Mater127e_r4_a1  display contained containedin=pam_Mater127e_r4 "\%11c\CVOCEG     "
   hi def link pam_Mater127e_r4_a1  pam_evenArgument
   syn region      pam_Mater127e_r4     transparent contained containedin=pam_Mater127 start="\%1c.\(.\{9\}\CVOCEG     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127e_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater127_r3     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater127_r4,pam_Mater127c_r4,pam_Mater127p_r4,pam_Mater127e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater127_r2a    transparent contained containedin=pam_Mater127 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater127_r2     transparent contained containedin=pam_Mater127 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater127_r2a,pam_Mater127_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater127_r1     transparent contained containedin=pam_Mater127 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater127_r2 skipnl keepend
syn region      pam_Mater127        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}127"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater127_r[1-9] fold keepend
" === MATER 127 end}}}

"{{{ === MATER 128 begin
   "Row 14
   syn region      pam_Mater128_r14     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 13
   syn region      pam_Mater128_r13     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater128_r12     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater128_r11     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater128_r10     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater128_r9     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater128_r8     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41i10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater128_r7     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,@31f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater128_r6     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r7 skipnl keepend
   syn region      pam_Mater128c_r6     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r7 skipnl keepend
   syn region      pam_Mater128p_r6     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r7 skipnl keepend
   syn region      pam_Mater128e_r6     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater128_r5     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r6 skipnl keepend
   syn region      pam_Mater128c_r5     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128c_r6 skipnl keepend
   syn region      pam_Mater128p_r5     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128p_r6 skipnl keepend
   syn region      pam_Mater128e_r5     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128e_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater128_r4     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r5 skipnl keepend
   syn match       pam_Mater128c_r4_a1  display contained containedin=pam_Mater128c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater128c_r4_a1  pam_evenArgument
   syn region      pam_Mater128c_r4     transparent contained containedin=pam_Mater128 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128c_r5 skipnl keepend
   syn match       pam_Mater128p_r4_a1  display contained containedin=pam_Mater128p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater128p_r4_a1  display contained containedin=pam_Mater128p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater128p_r4_a1  pam_evenArgument
   syn region      pam_Mater128p_r4     transparent contained containedin=pam_Mater128 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128p_r5 skipnl keepend
   syn region      pam_Mater128p_r4     transparent contained containedin=pam_Mater128 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128p_r5 skipnl keepend
   syn match       pam_Mater128e_r4_a1  display contained containedin=pam_Mater128e_r4 "\%11c\CKINEM     "
   hi def link pam_Mater128e_r4_a1  pam_evenArgument
   syn region      pam_Mater128e_r4     transparent contained containedin=pam_Mater128 start="\%1c.\(.\{9\}\CKINEM     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128e_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater128_r3     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater128_r4,pam_Mater128c_r4,pam_Mater128p_r4,pam_Mater128e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater128_r2a    transparent contained containedin=pam_Mater128 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater128_r2     transparent contained containedin=pam_Mater128 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater128_r2a,pam_Mater128_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater128_r1     transparent contained containedin=pam_Mater128 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater128_r2 skipnl keepend
syn region      pam_Mater128        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}128"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater128_r[1-9] fold keepend
" === MATER 128 end}}}

"{{{ === MATER 130/131/132 begin
   "Row 12
   syn region      pam_Mater130_r12     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@6i5,@11i5,@16i5,@21i5x,@26i5x,@31i5,@36i5,@41i5x,@46i5,@51i5,@56i5,@61i5,@66i5,@71i5,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 11
   syn region      pam_Mater130_r11     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@6i5,@11i5,@16i5,@21i5x,@26i5x,@31i5,@36i5,@41i5x,@46i5,@51i5,@56i5,@61i5,@66i5,@71i5,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater130_r10     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@6i5,@11i5,@16i5,@21i5x,@26i5x,@31i5,@36i5,@41i5x,@46i5,@51i5,@56i5,@61i5,@66i5,@71i5,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater130_r9     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@6i5,@11i5,@16i5,@21i5x,@26i5x,@31i5,@36i5,@41i5x,@46i5,@51i5,@56i5,@61i5,@66i5,@71i5,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater130_r8     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@6i5,@11i5,@16i5,@21i5x,@26i5x,@31i5,@36i5,@41i5x,@46i5,@51i5,@56i5,@61i5,@66i5,@71i5,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater130_r7     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i5,@6i5,@11i5,@16i5,@21i5x,@26i5x,@31i5,@36i5,@41i5x,@46i5,@51i5,@56i5,@61i5,@66i5,@71i5,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r8 skipnl keepend
   "Row 5
   syn region      pam_Mater130_r5     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r6,pam_Mater130_r5 skipnl keepend
   "Row 6
   syn region      pam_Mater130_r6     transparent contained containedin=pam_Mater130 start="\%1c          " start="^$\n" end="\n[\$\#]\@!" contains=@11i5,@31f10,@41i5,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r7 skipnl keepend
   "Row 4
   syn region      pam_Mater130_r4     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i5,@26i5,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater130_r3     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater130_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater130_r2a    transparent contained containedin=pam_Mater130 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater130_r2     transparent contained containedin=pam_Mater130 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater130_r2a,pam_Mater130_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater130_r1     transparent contained containedin=pam_Mater130 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater130_r2 skipnl keepend
syn region      pam_Mater130        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}13[0-2]"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater130_r[1-9] fold keepend
" === MATER 130/131/132 end}}}

"{{{ === MATER 143 begin
   "Row 9
   syn region      pam_Mater143_r9     transparent contained containedin=pam_Mater143 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater143_r8     transparent contained containedin=pam_Mater143 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater143_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater143_r7     transparent contained containedin=pam_Mater143 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater143_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater143c_r6     transparent contained containedin=pam_Mater143 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater143_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater143c_r5     transparent contained containedin=pam_Mater143 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater143c_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater143_r4     transparent contained containedin=pam_Mater143 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@21f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater143c_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater143_r3     transparent contained containedin=pam_Mater143 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater143_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater143_r2a    transparent contained containedin=pam_Mater143 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater143_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater143_r2     transparent contained containedin=pam_Mater143 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater143_r2a,pam_Mater143_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater143_r1     transparent contained containedin=pam_Mater143 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater143_r2 skipnl keepend
syn region      pam_Mater143        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}143"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater143_r[1-9] fold keepend
" === MATER 143 end}}}

"{{{ === MATER 150 begin
   "Row 9
   syn region      pam_Mater150_r9     transparent contained containedin=pam_Mater150 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater150_r8     transparent contained containedin=pam_Mater150 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater150_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater150_r7     transparent contained containedin=pam_Mater150 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater150_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater150_r6     transparent contained containedin=pam_Mater150 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater150_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater150_r5     transparent contained containedin=pam_Mater150 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater150_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater150_r4     transparent contained containedin=pam_Mater150 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,@51f10,@61f10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater150_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater150_r3     transparent contained containedin=pam_Mater150 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater150_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater150_r2a    transparent contained containedin=pam_Mater150 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater150_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater150_r2     transparent contained containedin=pam_Mater150 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater150_r2a,pam_Mater150_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater150_r1     transparent contained containedin=pam_Mater150 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater150_r2 skipnl keepend
syn region      pam_Mater150        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}150"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater150_r[1-9] fold keepend
" === MATER 150 end}}}

"{{{ === MATER 151 begin
   "Row 13
   syn region      pam_Mater151_r13     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 12
   syn region      pam_Mater151_r12     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r13 keepend
   "Row 11
   syn region      pam_Mater151_r11     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r12 keepend
   "Row 10
   syn region      pam_Mater151_r10     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r11 keepend
   "Row 9
   syn region      pam_Mater151_r9     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r10 keepend
   "Row 8
   syn region      pam_Mater151_r8     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater151_r7     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater151_r6     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater151_r5     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r6 skipnl keepend
   "Row 4
      syn region   pam_Mater151_r4_arg transparent contained containedin=pam_Mater151_r4 matchgroup=pam_evenArgument start="\%31cCURVE     " end="$" contains=@41i10,@71i5,@76i5 keepend
   syn region      pam_Mater151_r4     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,@31f10,@41f10,@51f10,@71i5,@76i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater151_r3     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater151_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater151_r2a    transparent contained containedin=pam_Mater151 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater151_r2     transparent contained containedin=pam_Mater151 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater151_r2a,pam_Mater151_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater151_r1     transparent contained containedin=pam_Mater151 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater151_r2 skipnl keepend
syn region      pam_Mater151        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}151"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater151_r[1-9] fold keepend
" === MATER 151 end}}}

"{{{ === MATER 152 begin
   "Row 9
   syn region      pam_Mater152_r9     transparent contained containedin=pam_Mater152 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater152_r8     transparent contained containedin=pam_Mater152 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater152_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater152_r7     transparent contained containedin=pam_Mater152 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater152_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater152_r6     transparent contained containedin=pam_Mater152 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater152_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater152_r5     transparent contained containedin=pam_Mater152 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@41i5x,@46f10,@56f10,@66f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater152_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater152_r4     transparent contained containedin=pam_Mater152 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater152_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater152_r3     transparent contained containedin=pam_Mater152 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater152_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater152_r2a    transparent contained containedin=pam_Mater152 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater152_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater152_r2     transparent contained containedin=pam_Mater152 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater152_r2a,pam_Mater152_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater152_r1     transparent contained containedin=pam_Mater152 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater152_r2 skipnl keepend
syn region      pam_Mater152        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}152"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater152_r[1-9] fold keepend
" === MATER 152 end}}}

"{{{ === MATER 161 begin
   "Row 9
   syn region      pam_Mater161_r9     transparent contained containedin=pam_Mater161 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater161_r8     transparent contained containedin=pam_Mater161 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater161_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater161_r7     transparent contained containedin=pam_Mater161 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater161_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater161_r6     transparent contained containedin=pam_Mater161 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater161_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater161_r5     transparent contained containedin=pam_Mater161 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater161_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater161_r4     transparent contained containedin=pam_Mater161 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater161_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater161_r3     transparent contained containedin=pam_Mater161 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater161_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater161_r2a    transparent contained containedin=pam_Mater161 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater161_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater161_r2     transparent contained containedin=pam_Mater161 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater161_r2a,pam_Mater161_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater161_r1     transparent contained containedin=pam_Mater161 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater161_r2 skipnl keepend
syn region      pam_Mater161        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}161"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater161_r[1-9] fold keepend
" === MATER 161 end}}}

"{{{ === MATER 162 begin
   "Row 9
   syn region      pam_Mater162_r9     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 8
   syn region      pam_Mater162_r8     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater162_r7     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater162_r6     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r7 skipnl keepend
   syn region      pam_Mater162c_r6     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r7 skipnl keepend
   syn region      pam_Mater162p_r6     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater162_r5     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r6 skipnl keepend
   syn region      pam_Mater162c_r5     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162c_r6 skipnl keepend
   syn region      pam_Mater162p_r5     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162p_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater162_r4     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31i10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r5 skipnl keepend
   syn match       pam_Mater162c_r4_a1  display contained containedin=pam_Mater162c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater162c_r4_a1  pam_evenArgument
   syn region      pam_Mater162c_r4     transparent contained containedin=pam_Mater162 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31i10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162c_r5 skipnl keepend
   syn match       pam_Mater162p_r4_a1  display contained containedin=pam_Mater162p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater162p_r4_a1  display contained containedin=pam_Mater162p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater162p_r4_a1  pam_evenArgument
   syn region      pam_Mater162p_r4     transparent contained containedin=pam_Mater162 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162p_r5 skipnl keepend
   syn region      pam_Mater162p_r4     transparent contained containedin=pam_Mater162 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162p_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater162_r3     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater162_r4,pam_Mater162c_r4,pam_Mater162p_r4,pam_Mater162e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater162_r2a    transparent contained containedin=pam_Mater162 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater162_r2     transparent contained containedin=pam_Mater162 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater162_r2a,pam_Mater162_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater162_r1     transparent contained containedin=pam_Mater162 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater162_r2 skipnl keepend
syn region      pam_Mater162        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}162"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater162_r[1-9] fold keepend
" === MATER 162 end}}}

"{{{ === MATER 171 begin
   "Row 10
   syn region      pam_Mater171_r10     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 9
      syn match       pam_Mater171c_r9_a1  display contained containedin=pam_Mater171_r9 "\%11c\CCURDC     "
      hi def link pam_Mater171c_r9_a1  pam_evenArgument
   syn region      pam_Mater171_r9     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r10 skipnl keepend
   syn region      pam_Mater171e_r9     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater171_r8     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r9 skipnl keepend
   syn region      pam_Mater171e_r8     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171e_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater171_r7     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r8 skipnl keepend
   syn region      pam_Mater171e_r7     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171e_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater171_r6     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r7 skipnl keepend
   syn region      pam_Mater171c_r6     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r7 skipnl keepend
   syn region      pam_Mater171p_r6     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r7 skipnl keepend
   syn region      pam_Mater171e_r6     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171e_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater171_r5     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r6 skipnl keepend
   syn region      pam_Mater171c_r5     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171c_r6 skipnl keepend
   syn region      pam_Mater171p_r5     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171p_r6 skipnl keepend
   syn region      pam_Mater171e_r5     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171e_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater171_r4     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r5 skipnl keepend
   syn match       pam_Mater171c_r4_a1  display contained containedin=pam_Mater171c_r4 "\%11c\CCURVE     "
   hi def link pam_Mater171c_r4_a1  pam_evenArgument
   syn region      pam_Mater171c_r4     transparent contained containedin=pam_Mater171 start="\%1c.\(.\{9\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171c_r5 skipnl keepend
   syn match       pam_Mater171p_r4_a1  display contained containedin=pam_Mater171p_r4 "\%11c\CPOWER     "
   syn match       pam_Mater171p_r4_a1  display contained containedin=pam_Mater171p_r4 "\%11c\CKRUPK     "
   hi def link pam_Mater171p_r4_a1  pam_evenArgument
   syn region      pam_Mater171p_r4     transparent contained containedin=pam_Mater171 start="\%1c.\(.\{9\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171p_r5 skipnl keepend
   syn region      pam_Mater171p_r4     transparent contained containedin=pam_Mater171 start="\%1c.\(.\{9\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171p_r5 skipnl keepend
   syn match       pam_Mater171e_r4_a1  display contained containedin=pam_Mater171e_r4 "\%11c\CECURV     "
   hi def link pam_Mater171e_r4_a1  pam_evenArgument
   syn region      pam_Mater171e_r4     transparent contained containedin=pam_Mater171 start="\%1c.\(.\{9\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171e_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater171_r3     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater171_r4,pam_Mater171c_r4,pam_Mater171p_r4,pam_Mater171e_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater171_r2a    transparent contained containedin=pam_Mater171 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater171_r2     transparent contained containedin=pam_Mater171 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater171_r2a,pam_Mater171_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater171_r1     transparent contained containedin=pam_Mater171 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater171_r2 skipnl keepend
syn region      pam_Mater171        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}171"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater171_r[1-9] fold keepend
" === MATER 171 end}}}

"{{{ === MATER 200 begin
   "Row 9
   syn region      pam_Mater200_r9     transparent contained containedin=pam_Mater200 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater200_r8     transparent contained containedin=pam_Mater200 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater200_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater200_r7     transparent contained containedin=pam_Mater200 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater200_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater200_r6     transparent contained containedin=pam_Mater200 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater200_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater200_r5     transparent contained containedin=pam_Mater200 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater200_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater200_r4     transparent contained containedin=pam_Mater200 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater200_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater200_r3     transparent contained containedin=pam_Mater200 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater200_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater200_r2a    transparent contained containedin=pam_Mater200 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater200_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater200_r2     transparent contained containedin=pam_Mater200 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater200_r2a,pam_Mater200_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater200_r1     transparent contained containedin=pam_Mater200 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater200_r2 skipnl keepend
syn region      pam_Mater200        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}200"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater200_r[1-9] fold keepend
" === MATER 200 end}}}

"{{{ === MATER 201 begin
   "Row 9
   syn region      pam_Mater201_r9     transparent contained containedin=pam_Mater201 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater201_r8     transparent contained containedin=pam_Mater201 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater201_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater201_r7     transparent contained containedin=pam_Mater201 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater201_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater201_r6     transparent contained containedin=pam_Mater201 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater201_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater201_r5     transparent contained containedin=pam_Mater201 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater201_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater201_r4     transparent contained containedin=pam_Mater201 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater201_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater201_r3     transparent contained containedin=pam_Mater201 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater201_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater201_r2a    transparent contained containedin=pam_Mater201 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater201_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater201_r2     transparent contained containedin=pam_Mater201 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater201_r2a,pam_Mater201_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater201_r1     transparent contained containedin=pam_Mater201 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater201_r2 skipnl keepend
syn region      pam_Mater201        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}201"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater201_r[1-9] fold keepend
" === MATER 201 end}}}

"{{{ === MATER 202 begin
   "Row 9
   syn region      pam_Mater202_r9     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater202b_r9     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater202c_r9     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 8
   syn region      pam_Mater202_r8     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r9 skipnl keepend
   syn region      pam_Mater202e_r8     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r9 skipnl keepend
   syn region      pam_Mater202b_r8     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202b_r9 skipnl keepend
   syn region      pam_Mater202p_r8     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r9 skipnl keepend
   syn region      pam_Mater202c_r8     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202c_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater202_r7     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r8 skipnl keepend
   syn region      pam_Mater202c_r7     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202c_r8 skipnl keepend
   syn region      pam_Mater202p_r7     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202p_r8 skipnl keepend
   syn region      pam_Mater202e_r7     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202e_r8 skipnl keepend
   syn region      pam_Mater202b_r7     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202b_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater202_r6     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r7 skipnl keepend
   syn region      pam_Mater202c_r6     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202c_r7 skipnl keepend
   syn region      pam_Mater202p_r6     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202p_r7 skipnl keepend
   syn region      pam_Mater202e_r6     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202e_r7 skipnl keepend
   syn region      pam_Mater202b_r6     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202b_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater202_r5     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r6 skipnl keepend
   syn region      pam_Mater202c_r5     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202c_r6 skipnl keepend
   syn region      pam_Mater202p_r5     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202p_r6 skipnl keepend
   syn region      pam_Mater202e_r5     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202e_r6 skipnl keepend
   syn region      pam_Mater202b_r5     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202b_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater202_r4     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r5 skipnl keepend
   syn match       pam_Mater202c_r4_a1  display contained containedin=pam_Mater202c_r4 "\%21c\CCURVE     "
   hi def link pam_Mater202c_r4_a1  pam_oddArgument
   syn region      pam_Mater202c_r4     transparent contained containedin=pam_Mater202 start="\%1c.\(.\{19\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202c_r5 skipnl keepend
   syn match       pam_Mater202p_r4_a1  display contained containedin=pam_Mater202p_r4 "\%21c\CPOWER     "
   syn match       pam_Mater202p_r4_a1  display contained containedin=pam_Mater202p_r4 "\%21c\CKRUPK     "
   hi def link pam_Mater202p_r4_a1  pam_oddArgument
   syn region      pam_Mater202p_r4     transparent contained containedin=pam_Mater202 start="\%1c.\(.\{19\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202p_r5 skipnl keepend
   syn region      pam_Mater202p_r4     transparent contained containedin=pam_Mater202 start="\%1c.\(.\{19\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202p_r5 skipnl keepend
   syn match       pam_Mater202e_r4_a1  display contained containedin=pam_Mater202e_r4 "\%21c\CECURV     "
   hi def link pam_Mater202e_r4_a1  pam_oddArgument
   syn region      pam_Mater202e_r4     transparent contained containedin=pam_Mater202 start="\%1c.\(.\{19\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202e_r5 skipnl keepend
   syn match       pam_Mater202b_r4_a1  display contained containedin=pam_Mater202b_r4 "\%21c[ ]\{10\}"
   hi def link pam_Mater202b_r4_a1  pam_oddArgument
   syn region      pam_Mater202b_r4     transparent contained containedin=pam_Mater202 start="\%1c.\(.\{19\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater202_r3     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater202_r4,pam_Mater202c_r4,pam_Mater202p_r4,pam_Mater202e_r4,pam_Mater202b_r4,pam_Mater202l_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater202_r2a    transparent contained containedin=pam_Mater202 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater202_r2     transparent contained containedin=pam_Mater202 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater202_r2a,pam_Mater202_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater202_r1     transparent contained containedin=pam_Mater202 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater202_r2 skipnl keepend
syn region      pam_Mater202        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}202"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater202_r[1-9] fold keepend
" === MATER 202 end}}}

"{{{ === MATER 203 begin
   "Row 9
   syn region      pam_Mater203_r9     transparent contained containedin=pam_Mater203 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater203_r8     transparent contained containedin=pam_Mater203 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater203_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater203_r7     transparent contained containedin=pam_Mater203 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater203_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater203_r6     transparent contained containedin=pam_Mater203 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater203_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater203_r5     transparent contained containedin=pam_Mater203 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@11i5,@16i5,@21i5x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater203_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater203_r4     transparent contained containedin=pam_Mater203 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21f10,@31f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater203_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater203_r3     transparent contained containedin=pam_Mater203 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater203_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater203_r2a    transparent contained containedin=pam_Mater203 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater203_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater203_r2     transparent contained containedin=pam_Mater203 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater203_r2a,pam_Mater203_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater203_r1     transparent contained containedin=pam_Mater203 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater203_r2 skipnl keepend
syn region      pam_Mater203        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}203"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater203_r[1-9] fold keepend
" === MATER 203 end}}}

"{{{ === MATER 204 begin
   "Row 9
   syn region      pam_Mater204_r9     transparent contained containedin=pam_Mater204 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater204_r8     transparent contained containedin=pam_Mater204 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater204_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater204_r7     transparent contained containedin=pam_Mater204 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater204_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater204_r6     transparent contained containedin=pam_Mater204 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater204_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater204_r5     transparent contained containedin=pam_Mater204 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i10,@31f10,@41i10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater204_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater204_r4     transparent contained containedin=pam_Mater204 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater204_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater204_r3     transparent contained containedin=pam_Mater204 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater204_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater204_r2a    transparent contained containedin=pam_Mater204 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater204_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater204_r2     transparent contained containedin=pam_Mater204 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater204_r2a,pam_Mater204_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater204_r1     transparent contained containedin=pam_Mater204 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater204_r2 skipnl keepend
syn region      pam_Mater204        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}204"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater204_r[1-9] fold keepend
" === MATER 204 end}}}

"{{{ === MATER 205 begin
   "Row 9
   syn region      pam_Mater205_r9     transparent contained containedin=pam_Mater205 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater205_r8     transparent contained containedin=pam_Mater205 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater205_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater205_r7     transparent contained containedin=pam_Mater205 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater205_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater205_r6     transparent contained containedin=pam_Mater205 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater205_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater205_r5     transparent contained containedin=pam_Mater205 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater205_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater205_r4     transparent contained containedin=pam_Mater205 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater205_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater205_r3     transparent contained containedin=pam_Mater205 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater205_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater205_r2a    transparent contained containedin=pam_Mater205 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater205_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater205_r2     transparent contained containedin=pam_Mater205 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater205_r2a,pam_Mater205_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater205_r1     transparent contained containedin=pam_Mater205 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater205_r2 skipnl keepend
syn region      pam_Mater205        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}205"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater205_r[1-9] fold keepend
" === MATER 205 end}}}

"{{{ === MATER 212 begin
   "Row 9
   syn region      pam_Mater212_r9     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater212b_r9     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater212c_r9     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 8
   syn region      pam_Mater212_r8     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r9 skipnl keepend
   syn region      pam_Mater212e_r8     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r9 skipnl keepend
   syn region      pam_Mater212b_r8     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212b_r9 skipnl keepend
   syn region      pam_Mater212p_r8     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r9 skipnl keepend
   syn region      pam_Mater212c_r8     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212c_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater212_r7     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r8 skipnl keepend
   syn region      pam_Mater212c_r7     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212c_r8 skipnl keepend
   syn region      pam_Mater212p_r7     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212p_r8 skipnl keepend
   syn region      pam_Mater212e_r7     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212e_r8 skipnl keepend
   syn region      pam_Mater212b_r7     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212b_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater212_r6     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r7 skipnl keepend
   syn region      pam_Mater212c_r6     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212c_r7 skipnl keepend
   syn region      pam_Mater212p_r6     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212p_r7 skipnl keepend
   syn region      pam_Mater212e_r6     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212e_r7 skipnl keepend
   syn region      pam_Mater212b_r6     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212b_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater212_r5     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r6 skipnl keepend
   syn region      pam_Mater212c_r5     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212c_r6 skipnl keepend
   syn region      pam_Mater212p_r5     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212p_r6 skipnl keepend
   syn region      pam_Mater212e_r5     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212e_r6 skipnl keepend
   syn region      pam_Mater212b_r5     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212b_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater212_r4     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r5 skipnl keepend
   syn match       pam_Mater212c_r4_a1  display contained containedin=pam_Mater212c_r4 "\%21c\CCURVE     "
   hi def link pam_Mater212c_r4_a1  pam_oddArgument
   syn region      pam_Mater212c_r4     transparent contained containedin=pam_Mater212 start="\%1c.\(.\{19\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212c_r5 skipnl keepend
   syn match       pam_Mater212p_r4_a1  display contained containedin=pam_Mater212p_r4 "\%21c\CPOWER     "
   syn match       pam_Mater212p_r4_a1  display contained containedin=pam_Mater212p_r4 "\%21c\CKRUPK     "
   hi def link pam_Mater212p_r4_a1  pam_oddArgument
   syn region      pam_Mater212p_r4     transparent contained containedin=pam_Mater212 start="\%1c.\(.\{19\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212p_r5 skipnl keepend
   syn region      pam_Mater212p_r4     transparent contained containedin=pam_Mater212 start="\%1c.\(.\{19\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212p_r5 skipnl keepend
   syn match       pam_Mater212e_r4_a1  display contained containedin=pam_Mater212e_r4 "\%21c\CECURV     "
   hi def link pam_Mater212e_r4_a1  pam_oddArgument
   syn region      pam_Mater212e_r4     transparent contained containedin=pam_Mater212 start="\%1c.\(.\{19\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212e_r5 skipnl keepend
   syn match       pam_Mater212b_r4_a1  display contained containedin=pam_Mater212b_r4 "\%21c[ ]\{10\}"
   hi def link pam_Mater212b_r4_a1  pam_oddArgument
   syn region      pam_Mater212b_r4     transparent contained containedin=pam_Mater212 start="\%1c.\(.\{19\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater212_r3     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater212_r4,pam_Mater212c_r4,pam_Mater212p_r4,pam_Mater212e_r4,pam_Mater212b_r4,pam_Mater212l_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater212_r2a    transparent contained containedin=pam_Mater212 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater212_r2     transparent contained containedin=pam_Mater212 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater212_r2a,pam_Mater212_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater212_r1     transparent contained containedin=pam_Mater212 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater212_r2 skipnl keepend
syn region      pam_Mater212        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}212"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater212_r[1-9] fold keepend
" === MATER 212 end}}}

"{{{ === MATER 213 begin
   "Row 11
   syn region      pam_Mater213c_r11     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater213b_r11     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater213p_r11     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 10
   syn region      pam_Mater213b_r10     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213b_r11 skipnl keepend
   syn region      pam_Mater213c_r10     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213c_r11 skipnl keepend
   syn region      pam_Mater213p_r10     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r11 skipnl keepend
   syn region      pam_Mater213e_r10     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater213_r9     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Mater213b_r9     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213b_r10 skipnl keepend
   syn region      pam_Mater213c_r9     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213c_r10 skipnl keepend
   syn region      pam_Mater213p_r9     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r10 skipnl keepend
   syn region      pam_Mater213e_r9     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213e_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater213_r8     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213_r9 skipnl keepend
   syn region      pam_Mater213e_r8     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213e_r9 skipnl keepend
   syn region      pam_Mater213b_r8     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213b_r9 skipnl keepend
   syn region      pam_Mater213p_r8     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r9 skipnl keepend
   syn region      pam_Mater213c_r8     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213c_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater213_r7     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213_r8 skipnl keepend
   syn region      pam_Mater213c_r7     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213c_r8 skipnl keepend
   syn region      pam_Mater213p_r7     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r8 skipnl keepend
   syn region      pam_Mater213e_r7     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213e_r8 skipnl keepend
   syn region      pam_Mater213b_r7     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213b_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater213_r6     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213_r7 skipnl keepend
   syn region      pam_Mater213c_r6     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213c_r7 skipnl keepend
   syn region      pam_Mater213p_r6     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r7 skipnl keepend
   syn region      pam_Mater213e_r6     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213e_r7 skipnl keepend
   syn region      pam_Mater213b_r6     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213b_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater213_r5     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213_r6 skipnl keepend
   syn region      pam_Mater213c_r5     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213c_r6 skipnl keepend
   syn region      pam_Mater213p_r5     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r6 skipnl keepend
   syn region      pam_Mater213e_r5     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213e_r6 skipnl keepend
   syn region      pam_Mater213b_r5     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213b_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater213_r4     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213_r5 skipnl keepend
   syn match       pam_Mater213c_r4_a1  display contained containedin=pam_Mater213c_r4 "\%21c\CCURVE     "
   hi def link pam_Mater213c_r4_a1  pam_oddArgument
   syn region      pam_Mater213c_r4     transparent contained containedin=pam_Mater213 start="\%1c.\(.\{19\}\CCURVE     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213c_r5 skipnl keepend
   syn match       pam_Mater213p_r4_a1  display contained containedin=pam_Mater213p_r4 "\%21c\CPOWER     "
   syn match       pam_Mater213p_r4_a1  display contained containedin=pam_Mater213p_r4 "\%21c\CKRUPK     "
   hi def link pam_Mater213p_r4_a1  pam_oddArgument
   syn region      pam_Mater213p_r4     transparent contained containedin=pam_Mater213 start="\%1c.\(.\{19\}\CPOWER     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r5 skipnl keepend
   syn region      pam_Mater213p_r4     transparent contained containedin=pam_Mater213 start="\%1c.\(.\{19\}\CKRUPK     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213p_r5 skipnl keepend
   syn match       pam_Mater213e_r4_a1  display contained containedin=pam_Mater213e_r4 "\%21c\CECURV     "
   hi def link pam_Mater213e_r4_a1  pam_oddArgument
   syn region      pam_Mater213e_r4     transparent contained containedin=pam_Mater213 start="\%1c.\(.\{19\}\CECURV     \)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213e_r5 skipnl keepend
   syn match       pam_Mater213b_r4_a1  display contained containedin=pam_Mater213b_r4 "\%21c[ ]\{10\}"
   hi def link pam_Mater213b_r4_a1  pam_oddArgument
   syn region      pam_Mater213b_r4     transparent contained containedin=pam_Mater213 start="\%1c.\(.\{19\}[ ]\{10\}\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213b_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater213_r3     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater213_r4,pam_Mater213c_r4,pam_Mater213p_r4,pam_Mater213e_r4,pam_Mater213b_r4,pam_Mater213l_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater213_r2a    transparent contained containedin=pam_Mater213 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater213_r2     transparent contained containedin=pam_Mater213 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater213_r2a,pam_Mater213_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater213_r1     transparent contained containedin=pam_Mater213 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater213_r2 skipnl keepend
syn region      pam_Mater213        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}213"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater213_r[1-9] fold keepend
" === MATER 213 end}}}

"{{{ === MATER 214 begin
   "Row 9
   syn region      pam_Mater214_r9     transparent contained containedin=pam_Mater214 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater214_r8     transparent contained containedin=pam_Mater214 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater214_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater214_r7     transparent contained containedin=pam_Mater214 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,@41i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater214_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater214_r6     transparent contained containedin=pam_Mater214 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater214_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater214_r5     transparent contained containedin=pam_Mater214 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater214_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater214_r4     transparent contained containedin=pam_Mater214 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21i10,@31f10,@41i10,@51f10,@61i5x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater214_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater214_r3     transparent contained containedin=pam_Mater214 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater214_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater214_r2a    transparent contained containedin=pam_Mater214 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater214_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater214_r2     transparent contained containedin=pam_Mater214 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater214_r2a,pam_Mater214_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater214_r1     transparent contained containedin=pam_Mater214 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater214_r2 skipnl keepend
syn region      pam_Mater214        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}214"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater214_r[1-9] fold keepend
" === MATER 214 end}}}

"{{{ === MATER 220 begin
   "Row 15
   syn region      pam_Mater220_r15     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 14
   syn region      pam_Mater220_r14     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,@66i5x,@71f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r15 skipnl keepend
   "Row 13
   syn region      pam_Mater220_r13     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater220_r12     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,@66i5x,@71f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater220_r11     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater220_r10     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,@66i5x,@71f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater220_r9     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater220_r8     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,@66i5x,@71f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater220_r7     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater220_r6     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,@66i5x,@71f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater220_r5     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater220_r4     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,@66i5x,@71f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater220_r3     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater220_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater220_r2a    transparent contained containedin=pam_Mater220 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater220_r2     transparent contained containedin=pam_Mater220 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater220_r2a,pam_Mater220_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater220_r1     transparent contained containedin=pam_Mater220 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater220_r2 skipnl keepend
syn region      pam_Mater220        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}220"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater220_r[1-9] fold keepend
" === MATER 220 end}}}

"{{{ === MATER 221 begin
   "Row 11
   syn region      pam_Mater221_r11     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 10
   syn region      pam_Mater221_r10     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater221_r9     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater221_r8     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater221_r7     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater221_r6     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater221_r5     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater221_r4     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater221_r3     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater221_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater221_r2a    transparent contained containedin=pam_Mater221 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater221_r2     transparent contained containedin=pam_Mater221 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater221_r2a,pam_Mater221_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater221_r1     transparent contained containedin=pam_Mater221 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater221_r2 skipnl keepend
syn region      pam_Mater221        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}221"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater221_r[1-9] fold keepend
" === MATER 221 end}}}

"{{{ === MATER 222 begin
   "Row 10
   syn region      pam_Mater222_r10     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 9
   syn region      pam_Mater222_r9     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater222_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater222_r8     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater222_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater222_r7     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater222_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater222_r6     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater222_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater222_r5     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater222_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater222_r4     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater222_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater222_r3     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater222_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater222_r2a    transparent contained containedin=pam_Mater222 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater222_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater222_r2     transparent contained containedin=pam_Mater222 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater222_r2a,pam_Mater222_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater222_r1     transparent contained containedin=pam_Mater222 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater222_r2 skipnl keepend
syn region      pam_Mater222        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}222"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater222_r[1-9] fold keepend
" === MATER 222 end}}}

"{{{ === MATER 223 begin
   "Row 15
   syn region      pam_Mater223_r15     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 14
   syn region      pam_Mater223_r14     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r15 skipnl keepend
   "Row 13
   syn region      pam_Mater223_r13     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater223_r12     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater223_r11     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater223_r10     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater223_r9     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater223_r8     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46f10x,@56f10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater223_r7     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater223_r6     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46i10,@56f10x,@71i10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater223_r5     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater223_r4     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i5,@26f10,@36f10,@46i10,@56f10x,@66i5x,@71i10x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater223_r3     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater223_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater223_r2a    transparent contained containedin=pam_Mater223 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater223_r2     transparent contained containedin=pam_Mater223 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater223_r2a,pam_Mater223_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater223_r1     transparent contained containedin=pam_Mater223 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater223_r2 skipnl keepend
syn region      pam_Mater223        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}223"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater223_r[1-9] fold keepend
" === MATER 223 end}}}

"{{{ === MATER 224 begin
   "Row 9
   syn region      pam_Mater224_r9     transparent contained containedin=pam_Mater224 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater224_r8     transparent contained containedin=pam_Mater224 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater224_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater224_r7     transparent contained containedin=pam_Mater224 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater224_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater224_r6     transparent contained containedin=pam_Mater224 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater224_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater224_r5     transparent contained containedin=pam_Mater224 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater224_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater224_r4     transparent contained containedin=pam_Mater224 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,@61i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater224_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater224_r3     transparent contained containedin=pam_Mater224 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater224_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater224_r2a    transparent contained containedin=pam_Mater224 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater224_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater224_r2     transparent contained containedin=pam_Mater224 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater224_r2a,pam_Mater224_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater224_r1     transparent contained containedin=pam_Mater224 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater224_r2 skipnl keepend
syn region      pam_Mater224        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}224"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater224_r[1-9] fold keepend
" === MATER 224 end}}}

"{{{ === MATER 225 begin
   "Row 11
   syn region      pam_Mater225_r11     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
      syn match       pam_Mater225_r11_e1             display contained containedin=pam_Mater225_r11 "\%8c.\{,3\}"
      syn match       pam_Mater225_r11_a1             display contained containedin=pam_Mater225_r11 "\%8c[ 0-1]\{3\}"
      syn match       pam_Mater225_r11_e1             display contained containedin=pam_Mater225_r11 "\%18c.\{,3\}"
      syn match       pam_Mater225_r11_a1             display contained containedin=pam_Mater225_r11 "\%18c[ 0-1]\{3\}"
      hi def link pam_Mater225_r11_a1 pam_evenArgument
      hi def link pam_Mater225_r11_e1 pam_evenError
   "Row 10
   syn region      pam_Mater225_r10     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r11 skipnl keepend
   syn region      pam_Mater225x_r10     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater225_r9     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r10 skipnl keepend
   syn region      pam_Mater225x_r9     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225x_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater225_r8     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r9 skipnl keepend
   syn region      pam_Mater225x_r8     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225x_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater225_r7     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r8 skipnl keepend
   syn region      pam_Mater225x_r7     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225x_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater225_r6     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r7 skipnl keepend
   syn region      pam_Mater225x_r6     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225x_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater225_r5     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r6 skipnl keepend
   syn region      pam_Mater225x_r5     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225x_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater225_r4     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r5 skipnl keepend
   syn region      pam_Mater225x_r4     transparent contained containedin=pam_Mater225 matchgroup=pam_oddArgument start="\%1cCONSTANT  " start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225x_r5 skipnl keepend
   syn match       pam_Mater225_r4_a1  display contained containedin=pam_Mater225_r4 "\%1c\CCURVE     "
   hi def link pam_Mater225_r4_a1  pam_oddArgument
   "Row 3 (Name)
   syn region      pam_Mater225_r3     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater225_r4,pam_Mater225x_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater225_r2a    transparent contained containedin=pam_Mater225 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater225_r2     transparent contained containedin=pam_Mater225 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater225_r2a,pam_Mater225_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater225_r1     transparent contained containedin=pam_Mater225 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater225_r2 skipnl keepend
syn region      pam_Mater225        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}225"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater225_r[1-9] fold keepend
" === MATER 225 end}}}

"{{{ === MATER 226 begin
   "Row 9
   syn region      pam_Mater226_r9     transparent contained containedin=pam_Mater226 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Positionskipnl keepend
   "Row 8
   syn region      pam_Mater226_r8     transparent contained containedin=pam_Mater226 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater226_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater226_r7     transparent contained containedin=pam_Mater226 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater226_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater226_r6     transparent contained containedin=pam_Mater226 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater226_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater226_r5     transparent contained containedin=pam_Mater226 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater226_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater226_r4     transparent contained containedin=pam_Mater226 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21f10,@31i10,@41f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater226_r5 skipnl keepend
   hi def link pam_Mater226_r4_a1  pam_oddArgument
   "Row 3 (Name)
   syn region      pam_Mater226_r3     transparent contained containedin=pam_Mater226 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater226_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater226_r2a    transparent contained containedin=pam_Mater226 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater226_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater226_r2     transparent contained containedin=pam_Mater226 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater226_r2a,pam_Mater226_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater226_r1     transparent contained containedin=pam_Mater226 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater226_r2 skipnl keepend
syn region      pam_Mater226        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}226"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater226_r[1-9] fold keepend
" === MATER 225 end}}}

"{{{ === MATER 230 begin
   "Row 15
   syn region      pam_Mater230_r15     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   "Row 14
   syn region      pam_Mater230_r14     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r15 skipnl keepend
   "Row 13
   syn region      pam_Mater230_r13     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r14 skipnl keepend
   "Row 12
   syn region      pam_Mater230_r12     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r13 skipnl keepend
   "Row 11
   syn region      pam_Mater230_r11     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r12 skipnl keepend
   "Row 10
   syn region      pam_Mater230_r10     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r11 skipnl keepend
   "Row 9
   syn region      pam_Mater230_r9     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r10 skipnl keepend
   "Row 8
   syn region      pam_Mater230_r8     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater230_r7     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater230_r6     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater230_r5     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater230_r4     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21f10,@31f10,@41i5,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater230_r3     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater230_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater230_r2a    transparent contained containedin=pam_Mater230 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater230_r2     transparent contained containedin=pam_Mater230 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater230_r2a,pam_Mater230_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater230_r1     transparent contained containedin=pam_Mater230 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater230_r2 skipnl keepend
syn region      pam_Mater230        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}230"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater230_r[1-9] fold keepend
" === MATER 230 end}}}

"{{{ === MATER 301 begin
   "Row 9
   syn region      pam_Mater301_r9     transparent contained containedin=pam_Mater301 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater301_r8     transparent contained containedin=pam_Mater301 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater301_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater301_r7     transparent contained containedin=pam_Mater301 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater301_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater301_r6     transparent contained containedin=pam_Mater301 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater301_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater301_r5     transparent contained containedin=pam_Mater301 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@41f10,@51f10,@61f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater301_r6 skipnl keepend
      syn match       pam_Mater301_r5_e1             display contained containedin=pam_Mater301_r5 "\%38c.\{,3\}"
      syn match       pam_Mater301_r5_a1             display contained containedin=pam_Mater301_r5 "\%38c[ 0-1]\{3\}"
      hi def link pam_Mater301_r5_a1 pam_evenArgument
      hi def link pam_Mater301_r5_e1 pam_evenError
   "Row 4
   syn region      pam_Mater301_r4     transparent contained containedin=pam_Mater301 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater301_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater301_r3     transparent contained containedin=pam_Mater301 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater301_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater301_r2a    transparent contained containedin=pam_Mater301 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater301_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater301_r2     transparent contained containedin=pam_Mater301 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater301_r2a,pam_Mater301_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater301_r1     transparent contained containedin=pam_Mater301 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater301_r2 skipnl keepend
syn region      pam_Mater301        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}301"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater301_r[1-9] fold keepend
" === MATER 301 end}}}

"{{{ === MATER 302 begin
   "Row 9
   syn region      pam_Mater302_r9     transparent contained containedin=pam_Mater302 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater302_r8     transparent contained containedin=pam_Mater302 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater302_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater302_r7     transparent contained containedin=pam_Mater302 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater302_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater302_r6     transparent contained containedin=pam_Mater302 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater302_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater302_r5     transparent contained containedin=pam_Mater302 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11f10,@21i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater302_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater302_r4     transparent contained containedin=pam_Mater302 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater302_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater302_r3     transparent contained containedin=pam_Mater302 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater302_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater302_r2a    transparent contained containedin=pam_Mater302 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater302_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater302_r2     transparent contained containedin=pam_Mater302 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater302_r2a,pam_Mater302_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater302_r1     transparent contained containedin=pam_Mater302 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater302_r2 skipnl keepend
syn region      pam_Mater302        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}302"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater302_r[1-9] fold keepend
" === MATER 302 end}}}

"{{{ === MATER 303 begin
   "Row 9
   syn region      pam_Mater303_r9     transparent contained containedin=pam_Mater303 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater303_r8     transparent contained containedin=pam_Mater303 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater303_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater303_r7     transparent contained containedin=pam_Mater303 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater303_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater303_r6     transparent contained containedin=pam_Mater303 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater303_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater303_r5     transparent contained containedin=pam_Mater303 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater303_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater303_r4     transparent contained containedin=pam_Mater303 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@41i10,@51i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater303_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater303_r3     transparent contained containedin=pam_Mater303 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater303_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater303_r2a    transparent contained containedin=pam_Mater303 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater303_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater303_r2     transparent contained containedin=pam_Mater303 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater303_r2a,pam_Mater303_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater303_r1     transparent contained containedin=pam_Mater303 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater303_r2 skipnl keepend
syn region      pam_Mater303        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}303"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater303_r[1-9] fold keepend
" === MATER 303 end}}}

"{{{ === MATER 304 begin
   "Row 12
   syn region      pam_Mater304_r12     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 11
   syn region      pam_Mater304_r11     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r12 keepend
   "Row 10
   syn region      pam_Mater304_r10     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r11 keepend
   "Row 9
   syn region      pam_Mater304_r9     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21i10,@31i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r10 keepend
   "Row 8
   syn region      pam_Mater304_r8     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater304_r7     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater304_r6     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater304_r5     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@21i10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r6 skipnl keepend
   syn match       pam_Mater304_r5_e1  display contained containedin=pam_Mater304_r5,pam_Mater304_r6,pam_Mater304_r7,pam_Mater304_r8 "\%11c.\{,10\}"
   syn match       pam_Mater304_r5_a1  display contained containedin=pam_Mater304_r5,pam_Mater304_r6,pam_Mater304_r7,pam_Mater304_r8 "\%11c[ ]\{10\}"
   syn match       pam_Mater304_r5_a1  display contained containedin=pam_Mater304_r5,pam_Mater304_r6,pam_Mater304_r7,pam_Mater304_r8 "\%11c\CCURVE     "
   hi def link pam_Mater304_r5_a1  pam_evenArgument
   hi def link pam_Mater304_r5_e1  pam_evenError
   "Row 4
   syn region      pam_Mater304_r4     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@31f10,@41f10,@51i10,@61i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater304_r3     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater304_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater304_r2a    transparent contained containedin=pam_Mater304 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater304_r2     transparent contained containedin=pam_Mater304 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater304_r2a,pam_Mater304_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater304_r1     transparent contained containedin=pam_Mater304 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater304_r2 skipnl keepend
syn region      pam_Mater304        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}304"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater304_r[1-9] fold keepend
" === MATER 304 end}}}

"{{{ === MATER 305 begin
   "Row 9
   syn region      pam_Mater305_r9     transparent contained containedin=pam_Mater305 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater305_r8     transparent contained containedin=pam_Mater305 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater305_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater305_r7     transparent contained containedin=pam_Mater305 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater305_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater305_r6     transparent contained containedin=pam_Mater305 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,@21f10,@31f10,@41f10,@51f10,@61f10,@71f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater305_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater305_r5     transparent contained containedin=pam_Mater305 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater305_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater305_r4     transparent contained containedin=pam_Mater305 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1f10,@11i10,@21i10,@31f10,@41i10,@51i10,@71i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater305_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater305_r3     transparent contained containedin=pam_Mater305 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater305_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater305_r2a    transparent contained containedin=pam_Mater305 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater305_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater305_r2     transparent contained containedin=pam_Mater305 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater305_r2a,pam_Mater305_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater305_r1     transparent contained containedin=pam_Mater305 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater305_r2 skipnl keepend
syn region      pam_Mater305        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}305"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater305_r[1-9] fold keepend
" === MATER 305 end}}}

"{{{ === MATER 371 begin
   "Row 9
   syn region      pam_Mater371_r9     transparent contained containedin=pam_Mater371 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend
   "Row 8
   syn region      pam_Mater371_r8     transparent contained containedin=pam_Mater371 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater371_r9 skipnl keepend
   "Row 7
   syn region      pam_Mater371_r7     transparent contained containedin=pam_Mater371 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater371_r8 skipnl keepend
   "Row 6
   syn region      pam_Mater371_r6     transparent contained containedin=pam_Mater371 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater371_r7 skipnl keepend
   "Row 5
   syn region      pam_Mater371_r5     transparent contained containedin=pam_Mater371 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@1i10,@11i10,@21f10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater371_r6 skipnl keepend
   "Row 4
   syn region      pam_Mater371_r4     transparent contained containedin=pam_Mater371 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@41i10,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater371_r5 skipnl keepend
   "Row 3 (Name)
   syn region      pam_Mater371_r3     transparent contained containedin=pam_Mater371 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Name,pam_Comment,pam_Comment_Position nextgroup=pam_Mater371_r4 skipnl keepend
   " Row 2a
   syn region      pam_Mater371_r2a    transparent contained containedin=pam_Mater371 start="\%1c.\([ ]\)\@=" start="^$\n" end="\n[\$\#]\@!" contains=@17f8,@25i8,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater371_r3 skipnl keepend
   " Row 2
   syn region      pam_Mater371_r2     transparent contained containedin=pam_Mater371 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8,@17i8,@25i8,@33i8,@41i8,@49i8,@57f8,@73i8,pam_Comment,pam_Comment_Position,pam_Error,pam_Continue nextgroup=pam_Mater371_r2a,pam_Mater371_r3 skipnl keepend
   " Row 1
   syn region      pam_Mater371_r1     transparent contained containedin=pam_Mater371 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8,@25f16x,@41i8x,@49i8x,@57i8x,@65i8x,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mater371_r2 skipnl keepend
syn region      pam_Mater371        matchgroup=pam_CardTag start="^\CMATER / .\{8\}[ ]\{5\}371"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mater371_r[1-9] fold keepend
" === MATER 371 end}}}

" MATERIALIEN end}}}

"{{{ === Elemente begin

"{{{ Ident begin
syn region      pam_Element        display contained matchgroup=pam_Part start="^[ ]\{8\}\CELE" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_Grp            display contained matchgroup=pam_Part start="^[ ]\{8\}\CGRP" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_FreeVar keepend
syn region      pam_OGrp           display contained matchgroup=pam_Part start="^[ ]\{8\}\COGRP" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_FreeVar keepend
syn region      pam_Part           display contained matchgroup=pam_Part start="^[ ]\{8\}\CPART" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_Nod            display contained matchgroup=pam_Part start="^[ ]\{8\}\CNOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_Seg            display contained matchgroup=pam_Part start="^[ ]\{8\}\CSEG" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_Edg            display contained matchgroup=pam_Part start="^[ ]\{8\}\CEDG" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_EleNod         display contained matchgroup=pam_Part start="^[ ]\{8\}\CELE>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_PartNod        display contained matchgroup=pam_Part start="^[ ]\{8\}\CPART>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_GrpNod         display contained matchgroup=pam_Part start="^[ ]\{8\}\CGRP>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Colon,pam_FreeVar keepend
syn region      pam_DelNod         display contained matchgroup=pam_Part start="^[ ]\{8\}\CDELNOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelEle         display contained matchgroup=pam_Part start="^[ ]\{8\}\CDELELE" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelPart        display contained matchgroup=pam_Part start="^[ ]\{8\}\CDELPART" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelGrp         display contained matchgroup=pam_Part start="^[ ]\{8\}\CDELGRP" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_FreeVar keepend
syn region      pam_DelTNod        display contained matchgroup=pam_Part start="^[ ]\{8\}\CDELELE>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelTPart       display contained matchgroup=pam_Part start="^[ ]\{8\}\CDELPART>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelTGrp        display contained matchgroup=pam_Part start="^[ ]\{8\}\CDELGRP>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Colon,pam_FreeVar keepend

syn region      pam_Element_16        display contained matchgroup=pam_Part start="^[ ]\{16\}\CELE" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_Grp_16            display contained matchgroup=pam_Part start="^[ ]\{16\}\CGRP" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_FreeVar keepend
syn region      pam_OGrp_16           display contained matchgroup=pam_Part start="^[ ]\{16\}\COGRP" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_FreeVar keepend
syn region      pam_Part_16           display contained matchgroup=pam_Part start="^[ ]\{16\}\CPART" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_Nod_16            display contained matchgroup=pam_Part start="^[ ]\{16\}\CNOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_Seg_16            display contained matchgroup=pam_Part start="^[ ]\{16\}\CSEG" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_Edg_16            display contained matchgroup=pam_Part start="^[ ]\{16\}\CEDG" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_EleNod_16         display contained matchgroup=pam_Part start="^[ ]\{16\}\CELE>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_PartNod_16        display contained matchgroup=pam_Part start="^[ ]\{16\}\CPART>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_GrpNod_16         display contained matchgroup=pam_Part start="^[ ]\{16\}\CGRP>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_Colon,pam_FreeVar keepend
syn region      pam_DelNod_16         display contained matchgroup=pam_Part start="^[ ]\{16\}\CDELNOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelEle_16         display contained matchgroup=pam_Part start="^[ ]\{16\}\CDELELE" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelPart_16        display contained matchgroup=pam_Part start="^[ ]\{16\}\CDELPART" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelGrp_16         display contained matchgroup=pam_Part start="^[ ]\{16\}\CDELGRP" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_String,pam_FreeVar keepend
syn region      pam_DelTNod_16        display contained matchgroup=pam_Part start="^[ ]\{16\}\CDELELE>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelTPart_16       display contained matchgroup=pam_Part start="^[ ]\{16\}\CDELPART>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend
syn region      pam_DelTGrp_16        display contained matchgroup=pam_Part start="^[ ]\{16\}\CDELGRP>NOD" end="$" contains=pam_Error,pam_FreeError,pam_FreeVar,pam_Integer,pam_Colon,pam_FreeVar keepend

syn region      pam_Transform      display contained matchgroup=pam_Part start="^[ ]\{8\}\(\CMOVE\|\CROTA\|\CSCAL\|\CNPOS\)" end="$" contains=pam_Float,pam_FreeVar keepend

syn cluster     pam_Ident          contains=pam_FreeError,pam_FreeVar,pam_Element,pam_Grp,pam_OGrp,pam_Part,pam_Nod,pam_Seg,pam_Edg,pam_EleNod,pam_PartNod,pam_GrpNod,pam_DelNod,pam_DelEle,pam_DelPart,pam_DelGrp,pam_DelTNod,pam_DelTPart,pam_DelTGrp,pam_Modular
syn cluster     pam_Ident_16          contains=pam_FreeError,pam_FreeVar,pam_Element_16,pam_Grp_16,pam_OGrp_16,pam_Part_16,pam_Nod_16,pam_Seg_16,pam_Edg_16,pam_EleNod_16,pam_PartNod_16,pam_GrpNod_16,pam_DelNod_16,pam_DelEle_16,pam_DelPart_16,pam_DelGrp_16,pam_DelTNod_16,pam_DelTPart_16,pam_DelTGrp_16

syn region      pam_Modular           contained matchgroup=pam_Modular start="^[ ]\{8\}\CMOD" end="^[ ]\{8\}\CEND_MOD" contains=pam_FreeError,pam_EndModular,pam_Integer,pam_Point,pam_ModString,pam_Element,pam_Grp,pam_OGrp,pam_Part,pam_Nod,pam_Seg,pam_Edg,pam_EleNod,pam_PartNod,pam_GrpNod,pam_DelNod,pam_DelEle,pam_DelPart,pam_DelGrp,pam_DelTNod,pam_DelTPart,pam_DelTGrp keepend
" Ident end}}}

syn region      pam_Tetr4          display matchgroup=pam_Part start="^\CTETR4 /" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,pam_Error keepend

syn region      pam_Sprgbm         display matchgroup=pam_Part start="^\CSPRGBM/" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,pam_Error keepend

syn region      pam_Penta6         display matchgroup=pam_Part start="^\CPENTA6/" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65i8dim,pam_Error keepend

syn region      pam_Shel6         display matchgroup=pam_Part start="^\CSHEL6 /" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65i8dim,pam_Error keepend

" {{{ KJOIN Begin
syn match       pam_KJoin_e3             display contained containedin=pam_KJoin "\%25c.\{,8\}\%33c"
syn match       pam_KJoin_a3             display contained containedin=pam_KJoin "\%25c\(SPHERICA\|TRANSLAT\|REVOLUTE\|CYLINDRI\|PLANAR[ _][ _]\|UNIVERSA\|FLEX-TOR\)\%33c"
syn region      pam_KJoin          display matchgroup=pam_Part start="^\CKJOIN /" end="$" contains=@9i8id,@17i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65f8dim keepend
hi def link pam_KJoin_a3 pam_oddArgumentDimmed
hi def link pam_KJoin_e3 pam_oddError
" KJOIN End}}}

"{{{ KJOIN - GENERAL begin
      syn match       pam_KJoin_general_r2_e1             display contained containedin=pam_KJoin_general_r2 "\%11c.\{,6\}\%17c"
      syn match       pam_KJoin_general_r2_a1             display contained containedin=pam_KJoin_general_r2 "\%11c[ 01]\{6\}\%17c"
   syn region      pam_KJoin_general_r2     transparent contained containedin=pam_KJoin_general start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend skipnl
      syn match       pam_KJoin_general_r1_e3             display contained containedin=pam_KJoin_general_r1 "\%25c.\{,8\}\%33c"
      syn match       pam_KJoin_general_r1_a3             display contained containedin=pam_KJoin_general_r1 "\%25c\CGENERAL[ _]\%33c"
   syn region      pam_KJoin_general_r1     transparent contained containedin=pam_KJoin_general start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65f8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_KJoin_general_r2 skipnl keepend
syn region      pam_KJoin_general        matchgroup=pam_Part start="^\CKJOIN / .\{16\}GENERAL[ _]"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_KJoin_general_r[1-2] fold keepend

hi def link pam_KJoin_general_r1_a3 pam_oddArgumentDimmed
hi def link pam_KJoin_general_r1_e3 pam_oddError
hi def link pam_KJoin_general_r2_a1 pam_oddArgumentDimmed
hi def link pam_KJoin_general_r2_e1 pam_oddError
"KJOIN - GENERAL end}}}

"{{{ MTOJNT begin
      syn match       pam_Mtojnt_r2_e1             display contained containedin=pam_Mtojnt_r2 "\%11c.\{,6\}\%17c"
      syn match       pam_Mtojnt_r2_a1             display contained containedin=pam_Mtojnt_r2 "\%11c[ 01]\{6\}\%17c"
   syn region      pam_Mtojnt_r2     transparent contained containedin=pam_Mtojnt start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position keepend skipnl
      syn match       pam_Mtojnt_r1_e3             display contained containedin=pam_Mtojnt_r1 "\%25c.\{,8\}\%33c"
      syn match       pam_Mtojnt_r1_a3             display contained containedin=pam_Mtojnt_r1 "\%25c\(\CSPHERICA\|\CTRANSLAT\|\CREVOLUTE\|\CCYLINDRI\|\CPLANAR[ _]\{2\}\|\CUNIVERSA\|\CGENERAL[ _]\|\CFLEX-TOR\|\CPIN[ _]\{5\}\|\CBRACKET[ _]\|\CFREE[ _]\{4\}\)"
   syn region      pam_Mtojnt_r1     transparent contained containedin=pam_Mtojnt start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Mtojnt_r2 skipnl keepend
syn region      pam_Mtojnt        matchgroup=pam_Part start="^\CMTOJNT/" end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Mtojnt_r[1-2] fold keepend

hi def link pam_Mtojnt_r1_a3 pam_oddArgumentDimmed
hi def link pam_Mtojnt_r1_e3 pam_oddError
hi def link pam_Mtojnt_r2_a1 pam_oddArgumentDimmed
hi def link pam_Mtojnt_r2_e1 pam_oddError
"MTOJNT end}}}

syn region      pam_Joint          display matchgroup=pam_Part start="^\CJOINT /" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57f8dim,@65f8dim,@73f8dim,pam_Error keepend

syn region      pam_Spring          display matchgroup=pam_Part start="^\CSPRING/" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,pam_Error keepend

syn region      pam_Membr          display matchgroup=pam_Part start="^\CMEMBR /" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@65f8dim,@73f8dim,pam_Error keepend

syn region      pam_Shell          display matchgroup=pam_Part start="^\CTSHEL /" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@65f8dim,pam_Error keepend

syn region      pam_Shell          display matchgroup=pam_Part start="^\CSHELL /" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@65f8dim,pam_Error keepend

syn region      pam_Bar            display matchgroup=pam_Part start="^\CBAR   /" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,pam_Error keepend

syn region      pam_Gap            display matchgroup=pam_Part start="^\CGAP   /" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8,pam_Error keepend

syn region      pam_Sphel          display matchgroup=pam_Part start="^\CSPHEL[ O]/" end="$" contains=@9i8id,@17i8dim,@25i8dim,@33f8dim,pam_Error keepend

"{{{ SOLID/BSHEL begin
   syn region      pam_Solid_r2     transparent contained containedin=pam_Solid start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65i8dim,@73i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Solid_r1     transparent contained containedin=pam_Solid start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Solid_r2 skipnl keepend
syn region      pam_Solid        matchgroup=pam_Part start="^\CSOLID /"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Solid_r[1-2] fold keepend
syn region      pam_Solid        matchgroup=pam_Part start="^\CBSHEL /"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Solid_r[1-2] fold keepend
" SOLID/BSHEL end}}}

"{{{ SHEL8 begin
   syn region      pam_Shel8_r2     transparent contained containedin=pam_Shel8 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@25i8dim,@33i8dim,@41i8dim,@49i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Shel8_r1     transparent contained containedin=pam_Shel8 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Shel8_r2 skipnl keepend
syn region      pam_Shel8        matchgroup=pam_Part start="^\CSHEL8 /"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Shel8_r[1-2] fold keepend
" SHEL8 end}}}

"{{{ HEXA20 begin
   syn region      pam_Hexa20_r4     transparent contained containedin=pam_Hexa20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8dim,@25i8dim,@33i8dim,@41i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Hexa20_r3     transparent contained containedin=pam_Hexa20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65i8dim,@73i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Hexa20_r4 skipnl keepend
   syn region      pam_Hexa20_r2     transparent contained containedin=pam_Hexa20 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65i8dim,@73i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Hexa20_r3 skipnl keepend
   syn region      pam_Hexa20_r1     transparent contained containedin=pam_Hexa20 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Hexa20_r2 skipnl keepend
syn region      pam_Hexa20        matchgroup=pam_Part start="^\CHEXA20/"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Hexa20_r[1-4] fold keepend
" HEXA20 end}}}

"{{{ BEAM begin
   syn region      pam_Beam_r3     transparent contained containedin=pam_Beam start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8dim,@17f8dim,@25f8dim,@33f8dim,@41f8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Beam_r2     transparent contained containedin=pam_Beam start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@9f8dim,@17f8dim,@25f8dim,@33f8dim,@41f8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Beam_r3 skipnl keepend
      syn match       pam_Beam_r1_e2             display contained containedin=pam_Beam_r1 "\%67c.\{,6\}"
      syn match       pam_Beam_r1_a2             display contained containedin=pam_Beam_r1 "\%67c[ 01]\{6\}"
      syn match       pam_Beam_r1_e1             display contained containedin=pam_Beam_r1 "\%59c.\{,6\}"
      syn match       pam_Beam_r1_a1             display contained containedin=pam_Beam_r1 "\%59c[ 01]\{6\}"
   syn region      pam_Beam_r1     transparent contained containedin=pam_Beam start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8dim,@25i8dim,@33i8dim,@41i8dim,@73i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Beam_r2 skipnl keepend
syn region      pam_Beam        matchgroup=pam_Part start="^\CBEAM  /"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Beam_r[1-4] fold keepend
hi def link pam_Beam_r1_a1 pam_oddArgumentDimmed
hi def link pam_Beam_r1_e1 pam_oddError
hi def link pam_Beam_r1_a2 pam_evenArgumentDimmed
hi def link pam_Beam_r1_e2 pam_evenError
" BEAM end}}}

"{{{ PENTA15 begin
   syn region      pam_Penta15_r3     transparent contained containedin=pam_Penta15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Penta15_r2     transparent contained containedin=pam_Penta15 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65i8dim,@73i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Penta15_r3 skipnl keepend
   syn region      pam_Penta15_r1     transparent contained containedin=pam_Penta15 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Penta15_r2 skipnl keepend
syn region      pam_Penta15        matchgroup=pam_Part start="^\CPENT15/"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Penta15_r[1-4] fold keepend
" PENTA15 end}}}

"{{{ TETRA10 begin
   syn region      pam_Tetra10_r3     transparent contained containedin=pam_Tetra10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8dim,@25i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_TrailingError,pam_Comment,pam_Comment_Position skipnl keepend
   syn region      pam_Tetra10_r2     transparent contained containedin=pam_Tetra10 start="\%1c." start="^$\n" end="\n[\$\#]\@!" contains=@17i8dim,@25i8dim,@33i8dim,@41i8dim,@49i8dim,@57i8dim,@65i8dim,@73i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Tetra10_r3 skipnl keepend
   syn region      pam_Tetra10_r1     transparent contained containedin=pam_Tetra10 start="\%9c." start="^$\n" end="\n[\$\#]\@!" contains=@9i8id,@17i8dim,pam_Comment,pam_Comment_Position,pam_Error nextgroup=pam_Tetra10_r2 skipnl keepend
syn region      pam_Tetra10        matchgroup=pam_Part start="^\CTETRA /"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Tetra10_r[1-3] fold keepend
syn region      pam_Tetra10        matchgroup=pam_Part start="^\CTETR10/"rs=s+8 end="^\(\$\)\@!.\{6\}\/"me=e-7 contains=pam_Tetra10_r[1-3] fold keepend
" TETRA10 end}}}

syn region      pam_Node           display matchgroup=pam_Part start="^\CNODE  /" end="$" contains=@9i8id,@17f16dim,@33f16dim,@49f16dim,pam_Error keepend

syn region      pam_CNode          display matchgroup=pam_Part start="^\CCNODE /" end="$" contains=@9i8id,@17f16dim,@33f16dim,@49f16dim,pam_Error keepend
" === Elemente end}}}

syn region      pam_Name           contained matchgroup=pam_NameTag start="^\CNAME" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_NameString,pam_Continue keepend
syn region      pam_Name           contained matchgroup=pam_NameTag start="^[ ]\{8\}\CNAME" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_NameString,pam_Continue keepend
syn region      pam_Rmat           contained matchgroup=pam_NameTag start="^\CRMAT" end="\(\%81c&\|\%81c\-\)\@<!$" contains=pam_NameString,pam_Continue keepend
syn match       pam_End            display "^        \CEND"
syn match       pam_End            display "^                \CEND"
syn match       pam_EndModular     display contained containedin=pam_Modular "\CEND_MOD"
"syn match       pam_Error          display containedin=ALLBUT,pam_Comment,pam_Comment_Position "\%81c[^&\-].*"
"syn match       pam_Error          display containedin=ALLBUT,pam_Comment,pam_Comment_Position "\%82c.*"
syn match       pam_Error          display containedin=ALLBUT,pam_Comment,pam_Comment_Position,pam_EndData,pam_Continue,pam_Source "\%>80c\S.*"
syn match       pam_Continue       contained "\%81c[&\-]"


syn region pam_Comment             display start="^[\$\#]" end="$" contains=NONE keepend
syn region pam_Comment_Position    display start="^[\$\#]---+---" end="$" contains=NONE keepend
syn region pam_Comment_Position    display start="^[\$\#]---5---" end="$" contains=NONE keepend

syn match       pam_EndMetric     display containedin=ALL "^\CEND_METRIC"
hi def link pam_EndMetric  pam_CardTag

syn region      pam_EndData        containedin=ALLBUT,pam_Comment,pam_Comment_Position matchgroup=pam_EndDataHeader start="^\CENDDATA" end="\%$" contains=NONE extend

"{{{ Highlighting Colors begin
set t_Co=256
if &background == "dark"
   "{{{ dark
   hi def pam_Error ctermfg=15 ctermbg=9 guifg=#ffffff guibg=#ff0000
   hi def pam_FreeVar ctermfg=135 guifg=#af5fff
   hi def pam_Comment ctermfg=27 guifg=#005fff
   hi def pam_Comment_Position ctermfg=33 guifg=#0087ff
   hi def pam_Integer ctermfg=130 guifg=#af5f00
   hi def pam_NameTag ctermfg=34 guifg=#00af00
   hi def pam_NameString ctermfg=178 guifg=#dfaf00
   hi def pam_String ctermfg=178 guifg=#dfaf00
   hi def pam_Continue ctermfg=11 ctermbg=4 guifg=#ffff00 guibg=#000080
   hi def pam_Float ctermfg=130 guifg=#af5f00
   hi def pam_CardTag cterm=bold ctermfg=250 gui=bold guifg=#bcbcbc
   hi def pam_End ctermfg=250 guifg=#bcbcbc
   hi def pam_Part ctermfg=94 guifg=#875f00
   hi def pam_HeaderKW ctermfg=2 guifg=#008000
   hi def pam_HeaderArg ctermfg=28 guifg=#008700
   hi def pam_Element ctermfg=130 guifg=#af5f00
   hi def pam_Keyword ctermfg=2 guifg=#008000
   hi def pam_Argument ctermfg=28 guifg=#008700
   hi def pam_oddId ctermfg=245 ctermbg=17 guifg=#8a8a8a guibg=#00005f
   hi def pam_oddArgument ctermbg=17 ctermfg=245 guifg=#8a8a8a guibg=#00005f
   hi def pam_evenArgument ctermbg=19 ctermfg=245 guifg=#8a8a8a guibg=#0000af
   hi def pam_oddVar ctermbg=17 ctermfg=135 guibg=#00005f guifg=#af5fff
   hi def pam_evenVar ctermbg=19 ctermfg=135 guibg=#0000af guifg=#af5fff
   hi def pam_oddArgumentDimmed ctermbg=17 ctermfg=243 guibg=#00005f guifg=#767676
   hi def pam_evenArgumentDimmed ctermbg=19 ctermfg=243 guibg=#0000af guifg=#767676
   hi def pam_oddError ctermfg=15 ctermbg=9 guifg=#ffffff guibg=#ff0000
   hi def pam_evenError ctermfg=15 ctermbg=124 guifg=#ffffff guibg=#af0000
   hi def pam_EndDataHeader ctermfg=0 ctermbg=11 guifg=#000000 guibg=#ffff00
   hi def pam_Source ctermfg=104 guifg=#8787df
   hi def pam_Secure ctermfg=236 guifg=#303030
   hi def pam_Modular ctermfg=100
   hi Pmenu ctermbg=23 ctermfg=245
   hi PmenuSel ctermbg=245 ctermfg=3
   hi pam_Hint term=bold,reverse cterm=bold,reverse gui=bold,reverse ctermfg=12 ctermbg=226 guibg=yellow
   "}}}
else
   "{{{ light
   hi def pam_Error ctermfg=15 ctermbg=9 guifg=#ffffff guibg=#ff0000
   hi def pam_FreeVar ctermfg=55 guifg=#d75f00
   hi def pam_Comment ctermfg=246 guifg=#949494
   hi def pam_Comment_Position ctermfg=246 guifg=#949494
   hi def pam_Integer ctermfg=22 guifg=#005f00
   hi def pam_NameTag ctermfg=19 guifg=#0000af
   hi def pam_NameString ctermfg=27 guifg=#005fff
   hi def pam_String ctermfg=27 guifg=#005fff
   hi def pam_Continue ctermfg=11 ctermbg=4 guifg=#ffff00 guibg=#000080
   hi def pam_Float ctermfg=22 guifg=#005f00
   hi def pam_CardTag cterm=bold gui=bold
   hi def pam_End ctermfg=22 guifg=#005f00
   hi def pam_Part cterm=bold ctermfg=22 gui=bold guifg=#005f00
   hi def pam_HeaderKW cterm=bold ctermfg=94 gui=bold guifg=#875f00
   hi def pam_HeaderArg ctermfg=22 guifg=#005f00
   hi def pam_Element ctermfg=5 guifg=#800080
   hi def pam_Keyword cterm=bold ctermfg=94 gui=bold guifg=#875f00
   hi def pam_Argument ctermfg=94 guifg=#875f00
   hi def pam_oddId ctermbg=254 guibg=#e4e4e4
   hi def pam_oddArgument ctermbg=254 guibg=#e4e4e4
   hi def pam_oddVar ctermbg=254 ctermfg=55 guibg=#e4e4e4 guifg=#5f00af
   hi def pam_oddArgumentDimmed ctermbg=254 guibg=#e4e4e4
   hi def pam_oddError ctermfg=15 ctermbg=9 guifg=#ffffff guibg=#ff0000
   hi def pam_evenArgument ctermbg=229 guibg=#ffffcf
   hi def pam_evenVar ctermbg=229 ctermfg=55 guibg=#ffffcf guifg=#5f00af
   hi def pam_evenArgumentDimmed ctermbg=229 guibg=#ffffcf
   hi def pam_evenError ctermfg=15 ctermbg=124 guifg=#ffffff guibg=#af0000
   hi def pam_EndDataHeader ctermfg=0 ctermbg=11 guifg=#000000 guibg=#ffff00
   hi def pam_Source ctermfg=39 guifg=#00afff
   hi def pam_Secure ctermfg=250 guifg=#bcbcbc
   hi def pam_Modular ctermfg=100
   hi Pmenu ctermbg=225
   hi PmenuSel ctermbg=7
   hi pam_Hint term=bold,reverse cterm=bold,reverse gui=bold,reverse ctermbg=226 ctermfg=239 guibg=yellow
   hi StatusLine term=bold,reverse cterm=bold,reverse ctermfg=239
   "}}}
endif
"Highlighting Colors end}}}

" Highlight Links
hi def link pam_Control_YESNO pam_Argument
hi def link pam_Colon pam_Integer
hi def link pam_Point pam_Integer
hi def link pam_EndData pam_Comment
hi def link pam_FreeError pam_Error
hi def link pam_TrailingError pam_Error
hi def link pam_ModString pam_String
hi def link pam_EndModular pam_Modular

syn sync linebreaks=1000
syn sync maxlines=500
syn sync match sync_Card grouphere NONE ".\(\n[^\$\#]\(\u\|[ ]\|\d\)\{5\}\/\)\@="
"syn sync match sync_Comment grouphere pam_Comment "^[\$\#]\(\u\|[ ]\)\{5\}\/"

let b:current_syntax = "pamcrash"
