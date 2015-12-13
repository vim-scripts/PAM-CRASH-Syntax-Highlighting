" Vim completion script
" Language:     ESI VPS (Pam-Crash)
" Maintainer:   Roman Firt

function! pamcomplete#Complete(findstart, base)
   let elements = ['pam_Solid','pam_Hexa20','pam_Penta6','pam_Penta15','pam_Tetra10','pam_Tetr4','pam_Shell','pam_Shel6','pam_Shel8','pam_Membr','pam_Bar','pam_Sphel','pam_ELink','pam_LLink','pam_SLink']
" {{{ first part, return the beginning of the matching
   if a:findstart
      let line = getline('.')
      let start = col('.') - 1
      let slist = synstack (line("."), col("."))
" {{{ Entity Selection
      " [O]GRP
      if strpart(line,8,3) == "GRP" || strpart(line,8,4) == "OGRP" || strpart(line,8,6) == "DELGRP"
         while start > 11
            if line[start - 1] != "'"
               let start -= 1
            else
               let start -= 1
               break
            endif
         endwhile
         if start == 11
            let start = col('.') - 1
         endif
      " PART
      elseif strpart(line,8,4) == "PART" || strpart(line,8,7) == "DELPART"
         while start > 0
            if line[start - 1] == ':'
               break
            endif
            if line[start - 1] =~ '\S'
               let start -= 1
            else
               break
            endif
         endwhile
      " MODULE
      elseif strpart(line,8,3) == "MOD"
         while start > 0
            if line[start - 1] == '.'
               break
            endif
            if line[start - 1] =~ '\S'
               let start -= 1
            else
               break
            endif
         endwhile
      endif
" }}}
      if len (slist) == 0
         return start
      elseif len (slist) == 1
         call add (slist,'')
         call add (slist,'')
         call add (slist,'')
      elseif len (slist) == 2
         call add (slist,'')
         call add (slist,'')
      elseif len (slist) == 3
         call add (slist,'')
      endif
" {{{ Elements IDPRT
      if index(elements, synIDattr(slist[0], "name")) > -1
         if synIDattr(slist[1], "name") =~ ".*_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_17.*"
            let start = 16
         endif
" }}}
" {{{ PLINK
      elseif synIDattr(slist[0], "name") =~ "pam_PLink"
         if synIDattr(slist[1], "name") =~ "pam_PLink_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
            " ITPR
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         endif
" }}}
" {{{ FUNCT
      elseif synIDattr(slist[0], "name") =~ "pam_FUNCT"
         if synIDattr(slist[1], "name") =~ "pam_FUNCT_r1"
            " IFLMEAS
            if synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            " ICOMP
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let start = 64
            endif
         endif
" }}}
" {{{ RBODY[0-2]
      elseif synIDattr(slist[0], "name") =~ "pam_RBODY[0-2]"
         if synIDattr(slist[1], "name") =~ "pam_RBODY[0-2]_r1"
            " ITRB
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " ICOG
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         endif
" }}}
" {{{ RBODY[3-4]
      elseif synIDattr(slist[0], "name") =~ "pam_RBODY[3-4]"
         if synIDattr(slist[1], "name") =~ "pam_RBODY[3-4]_r1"
            " ITRB
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let start = 64
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_RBODY3_r3"
            " IT3FL
            if col('.') <= 8
               let start = 0
            endif
         endif
" }}}
" {{{ SEWING
      elseif synIDattr(slist[0], "name") =~ "pam_SEWING"
         if synIDattr(slist[1], "name") =~ "pam_SEWING_r1"
            " IFINT
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
            " ISENS
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            endif
         endif
" }}}
" {{{ TIED
      elseif synIDattr(slist[0], "name") =~ "pam_TIED"
         if synIDattr(slist[1], "name") =~ "pam_TIED_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
            " ITPR
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         endif
" }}}
" {{{ THLOC
      elseif synIDattr(slist[0], "name") =~ "pam_THLOC"
         if synIDattr(slist[1], "name") =~ "pam_THLOC_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " ACFLG
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " IDAFLG
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            endif
         endif
" }}}
" {{{ HTSURF
      elseif synIDattr(slist[0], "name") =~ "pam_HTSURF"
         if synIDattr(slist[1], "name") =~ "pam_HTSURF_r1"
            " AMBTLCUR
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_HTSURF_r3"
            " TEMCUR
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " TIMCUR
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
" }}}
" {{{ BFLUX
      elseif synIDattr(slist[0], "name") =~ "pam_BFLUX"
         if synIDattr(slist[1], "name") =~ "pam_BFLUX_r1"
            " TLCUR
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
" }}}
" {{{ HFLUX
      elseif synIDattr(slist[0], "name") =~ "pam_HFLUX"
         if synIDattr(slist[1], "name") =~ "pam_HFLUX_r1"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         endif
" }}}
"  {{{ THNAC
      elseif synIDattr(slist[0], "name") =~ "pam_THNAC"
         if synIDattr(slist[1], "name") =~ "pam_THNAC_r1"
            " IPANEL
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
"  }}}
"  {{{ TEMBC
      elseif synIDattr(slist[0], "name") =~ "pam_TEMBC"
         if synIDattr(slist[1], "name") =~ "pam_TEMBC_r1"
            " TFIMP
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " TDOF
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         endif
"  }}}
" {{{ LINCO
      elseif synIDattr(slist[0], "name") =~ "pam_LINCO"
         if synIDattr(slist[1], "name") =~ "pam_LINCO_r1"
            " DOFTYP
            if col('.') >= 17 && col('.') <= 24
               let start = 16
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_LINCO_r3"
            " IDOF
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         endif
" }}}
" {{{ MTOCO1
      elseif synIDattr(slist[0], "name") =~ "pam_MTOCO1"
         if synIDattr(slist[1], "name") =~ "pam_MTOCO1_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " ITMTO
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_MTOCO1_r3"
            "IT1FL
            if col('.') <= 8
               let start = 0
            "IFRA2
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let start = 64
            endif  
         endif
" }}}
"  {{{ NLAVE
      elseif synIDattr(slist[0], "name") =~ "pam_NLAVE"
         if synIDattr(slist[1], "name") =~ "pam_NLAVE_r1"
            if col('.') >= 17 && col('.') <= 24 && synIDattr(slist[2], "name") =~ "pam_NLAVE_r1_a1*"
               let start = 16
            endif
         endif
"  }}}
" {{{ MTOCO0
      elseif synIDattr(slist[0], "name") =~ "pam_MTOCO"
         if synIDattr(slist[1], "name") =~ "pam_MTOCO_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " ITMTO
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            endif
         endif
" }}}
" {{{ OTMCO
      elseif synIDattr(slist[0], "name") =~ "pam_OTMCO"
         if synIDattr(slist[1], "name") =~ "pam_OTMCO_r1"
            " IMETH
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IELIM
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " ITYP
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         endif
" }}}
" {{{ BEAM
      elseif synIDattr(slist[0], "name") =~ "pam_Beam"
         if synIDattr(slist[1], "name") =~ "pam_Beam_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
            " ITPR
            if synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         endif
" }}}
" {{{ SPRING
      elseif synIDattr(slist[0], "name") =~ "pam_Spring"
         " IDPRT
         if synIDattr(slist[1], "name") =~ "pam_17.*"
            let start = 16
         endif
         " IFRA
         if synIDattr(slist[1], "name") =~ "pam_41.*"
            let start = 40
         endif
" }}}
" {{{ DELEM
      elseif synIDattr(slist[0], "name") =~ "pam_DELEM"
         " ISENS
         if synIDattr(slist[1], "name") =~ "pam_DELEM_r1"
            if synIDattr(slist[2], "name") =~ "pam_17.8.*"
               let start = 16
            endif
         endif
" }}}
"  {{{ THMAT
      elseif synIDattr(slist[0], "name") =~ "pam_THMAT"
         if synIDattr(slist[1], "name") =~ "pam_THMAT_MASS_DENSITY_r2"
            " FUN
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_THMAT_CONDUCTIVITY_r2"
            " FUN
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let start = 10
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               let start = 20
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               let start = 30
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_THMAT_SPECIFIC_HEAT_r2"
            " FUN
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            endif
         endif
"  }}}
" {{{ LAYER
      elseif synIDattr(slist[0], "name") =~ "pam_LAYER"
         " IDPLY
         if synIDattr(slist[1], "name") =~ "pam_LAYER_r3"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            endif
         endif
" }}}
" {{{ DPNQM
      elseif synIDattr(slist[0], "name") =~ "pam_DPNQM"
         if synIDattr(slist[1], "name") =~ "pam_DPNQM_r1"
            " IDIR
            if synIDattr(slist[2], "name") =~ "pam_17.8.*"
               let start = 16
            " IFUN
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         endif
" }}}
" {{{ DPEEN
      elseif synIDattr(slist[0], "name") =~ "pam_DPEEN"
         if synIDattr(slist[1], "name") =~ "pam_DPEEN_r1"
            " ITYP
            if synIDattr(slist[2], "name") =~ "pam_17.8.*"
               let start = 16
            " IFUN
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         endif
" }}}
" {{{ DPEMA
      elseif synIDattr(slist[0], "name") =~ "pam_DPEMA"
         if synIDattr(slist[1], "name") =~ "pam_DPEMA_r1"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
" }}}
" {{{ MDBODY
      elseif synIDattr(slist[0], "name") =~ "pam_MDBODY"
         " CTYPE
         if synIDattr(slist[1], "name") =~ "pam_MDBODY_r1"
            if synIDattr(slist[2], "name") =~ "pam_MDBODY_r1_[ae]1"
               let start = 16
            endif
         endif
" }}}
" {{{ IMPMA
      elseif synIDattr(slist[0], "name") =~ "pam_IMPMA"
         if synIDattr(slist[1], "name") =~ "pam_IMPMA_r1"
            " QUAL1
            if col('.') >= 17 && col('.') <= 24
               let start = 16
            " QUAL2
            elseif col('.') >= 25 && col('.') <= 32
               let start = 24
            " QUAL3
            elseif col('.') >= 33 && col('.') <= 40
               let start = 32
            " IMATYP
            elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
               let start = 40
            endif
         endif
" }}}
" {{{ MTOJNT
      elseif synIDattr(slist[0], "name") =~ "pam_Mtojnt"
         if synIDattr(slist[1], "name") =~ "pam_Mtojnt_r1"
            " IDMTOJ
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " JTYP
            elseif col('.') >= 25 && col('.') <= 32
               let start = 24
            " IFRA1
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " IFRA2
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         endif
" }}}
" {{{ KJOIN
      elseif synIDattr(slist[0], "name") =~ "pam_KJoin.*"
         if synIDattr(slist[1], "name") =~ "pam_KJoin_general_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " JTYP
            elseif col('.') >= 25 && col('.') <= 32
               let start = 24
            " IFRA1
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " IFRA2
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         " IDPRT
         elseif synIDattr(slist[1], "name") =~ "pam_17.*"
            let start = 16
         " JTYP
         elseif col('.') >= 25 && col('.') <= 32
            let start = 24
         " IFRA1
         elseif synIDattr(slist[1], "name") =~ "pam_49.*"
            let start = 48
         " IFRA2
         elseif synIDattr(slist[1], "name") =~ "pam_57.*"
            let start = 56
         endif
" }}}
" {{{ JOINT
      elseif synIDattr(slist[0], "name") =~ "pam_Joint"
         " IDPRT
         if synIDattr(slist[1], "name") =~ "pam_17.*"
            let start = 16
         endif
         " IFRA
         if synIDattr(slist[1], "name") =~ "pam_41.*"
            let start = 40
         endif
" }}}
" {{{ GAP
      elseif synIDattr(slist[0], "name") =~ "pam_Gap"
         " IDPRT
         if synIDattr(slist[1], "name") =~ "pam_17.*"
            let start = 16
         endif
         " IFRA
         if synIDattr(slist[1], "name") =~ "pam_41.*"
            let start = 40
         endif
" }}}
" {{{ SPRGBM
      elseif synIDattr(slist[0], "name") =~ "pam_Sprgbm"
         " IDPRT
         if synIDattr(slist[1], "name") =~ "pam_17.*"
            let start = 16
         endif
         " IFRA
         if synIDattr(slist[1], "name") =~ "pam_49.*"
            let start = 48
         endif
" }}}
" {{{ CNTAC Card Common
      elseif synIDattr(slist[0], "name") =~ "pam_CNTAC.*"
         if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r1"
            " NTYPE
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
         " {{{ CNTAC 37/43/46
         if synIDattr(slist[0], "name") =~ "pam_CNTAC37" || synIDattr(slist[0], "name") =~ "pam_CNTAC4[36]" 
            if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
               " ISENS
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " ITPTR
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r5"
               " ICOUFR
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
               " ILEAK
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let start = 0
               " IRMV
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " IOMIT
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " IFRED
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  let start = 35
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
               " IPRES
               if synIDattr(slist[2], "name") =~ "pam_76.*"
                  let start = 75
               endif
            endif
      " }}}
         " {{{ CNTAC 33/34/36/44/54/154
         elseif synIDattr(slist[0], "name") =~ "pam_CNTAC3[46]" || synIDattr(slist[0], "name") =~ "pam_CNTAC[45]4" || synIDattr(slist[0], "name") =~ "pam_CNTAC154"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
               " ISENS
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " ITPTR
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " IORI
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  let start = 45
               " IEDGE
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r4"
               " IPCP
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let start = 0
               " IKFOR
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  let start = 25
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r5"
               " IDFRIC
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " ICOUFR
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " IDCNTPTY
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
               " IRMV
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let start = 0
               " IEROD
               elseif synIDattr(slist[2], "name") =~ "pam_6.5.*"
                  let start = 5
               " ILEAK
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " IAC32
               elseif synIDattr(slist[2], "name") =~ "pam_16.*"
                  let start = 15
               " ITHKSV
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " IOMIT
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " IFRED
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  let start = 35
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r7"
               " IUPA
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
               " IHTR
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let start = 0
               " IPRES
               elseif synIDattr(slist[2], "name") =~ "pam_76.*"
                  let start = 75
               endif
            endif
         " }}}
         " {{{ CNTAC 61
         elseif synIDattr(slist[0], "name") =~ "pam_CNTAC61"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
               " MASTG
               if col('.') <= 10
                  let start = 0
               " IFRA
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " SOLU
               elseif col('.') >= 41 && col('.') <= 50
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
               " IRMV
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
               " IPRES
               if synIDattr(slist[2], "name") =~ "pam_76.*"
                  let start = 75
               endif
            endif
         " }}}
         " {{{ CNTAC 21
         elseif synIDattr(slist[0], "name") =~ "pam_CNTAC21"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC21_r3"
               " ISENS
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " IMOD
               elseif col('.') >= 31 && col('.') <= 40
                  let start = 30
               " IHYST
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " IPEN
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  let start = 45
               " INFI
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC21_r4"
               " IFUNFsd
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IFUNHd
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " IFUND0d
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC21_r5"
               " IFUNMCd
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC21_r6"
               " IFUNMUd
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
      " }}}
      " {{{ CNTAC 10
         elseif synIDattr(slist[0], "name") =~ "pam_CNTAC10"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC10_r3"
               " ISENS
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            endif
         endif
      " }}}
" }}}
"  {{{ PLY
      elseif synIDattr(slist[0], "name") =~ "pam_PLY.*"
         if synIDattr(slist[1], "name") =~ "pam_PLY.*_r1$"
            " ITYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " FAILNP
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ISTRAT
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            endif
         " {{{ PLY0
         elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r[56]" || synIDattr(slist[1], "name") =~ "pam_PLY0_r1[12]"
            " IFUNm*s
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r7" || synIDattr(slist[1], "name") =~ "pam_PLY0_r13"
            " IFUNf*
            if synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         " }}}
         " {{{ PLY1
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r4"
            " ISHD
            if synIDattr(slist[2], "name") =~ "pam_61.*"
               let start = 60
            " ITRD
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r7"
            " IFUNd1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            " IFUNd2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let start = 10
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r9"
            " IBUCK
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r1[12]"
            " ILAW*
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r13"
            " ILAWTYPR0
            if synIDattr(slist[2], "name") =~ "pam_31.*"
               let start = 30
            endif
         " }}}
         " {{{ PLY2
         elseif synIDattr(slist[1], "name") =~ "pam_PLY2c_r4"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            " LC2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let start = 10
            " LC3
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               let start = 20
            " LC4
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               let start = 30
            " LC5
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " LC6
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            " LC7
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               let start = 60
            " LC8
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         " }}}
         " {{{ PLY7
         elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r11"
            " ILAW*
            if synIDattr(slist[2], "name") =~ "pam_31.*"
               let start = 30
            " ILAWTYP11c
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r1[23]"
            " ILAW*
            if synIDattr(slist[2], "name") =~ "pam_31.*"
               let start = 30
            endif
         " }}}
         " {{{ PLY8
         elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r[56]" || synIDattr(slist[1], "name") =~ "pam_PLY8_r1[23]"
            " IFUNm*s
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r9"
            " IDAMCR
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " IWARP
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r[78]" || synIDattr(slist[1], "name") =~ "pam_PLY8_r1[45]"
            " IFUNf*
            if synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         " }}}
         " {{{ PLYFAILX
         elseif synIDattr(slist[1], "name") =~ "pam_PLYFAIL"
            " FAILDAM
            if synIDattr(slist[2], "name") =~ "pam_1.10.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_1.10.*")
               let start = 0
            " FAILTYP
            elseif synIDattr(slist[2], "name") =~ "pam_11.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_11.*")
               let start = 10
            " IFUNmfc
            elseif synIDattr(slist[2], "name") =~ "pam_41.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_41.*")
               let start = 40
            " IDAMm
            elseif synIDattr(slist[2], "name") =~ "pam_51.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_51.*")
               let start = 50
            " IFUNffc
            elseif synIDattr(slist[2], "name") =~ "pam_61.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_61.*")
               let start = 60
            " IDAMf
            elseif synIDattr(slist[2], "name") =~ "pam_71.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_71.*")
               let start = 70
            " YSFTYP
            elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL10_r3" && synIDattr(slist[3], "name") =~ "pam_1.10.*"
               let start = 0
            endif
         " }}}
         endif
"  }}}
"  {{{ PART
      elseif synIDattr(slist[0], "name") =~ "pam_PART.*"
         if synIDattr(slist[1], "name") =~ "pam_PART.*_r1"
            " ATYPE
            if synIDattr(slist[2], "name") =~ "pam_PART.*_r1_[ae]2"
               let start = 16
            " IDMAT
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IDVAMAT
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IDTHMAT
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " IDPMAT
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            endif
         " {{{ SOLID
         elseif synIDattr(slist[1], "name") =~ "pam_PART_SOLID_r5"
            " IORT1
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               let start = 0
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PART_SOLID_r6"
            " IORT2
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               let start = 0
            endif
         " }}}
         " {{{ COS3D
         elseif synIDattr(slist[1], "name") =~ "pam_PART_COS3D_r5"
            " IMETH
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            endif
      " }}}
         " {{{ SHELL
         elseif synIDattr(slist[1], "name") =~ "pam_PART_SHELL_r6"
            " IORT1
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               let start = 0
            endif
         " }}}
         " {{{ MEMBR
         elseif synIDattr(slist[1], "name") =~ "pam_PART_MEMBR_r[67]"
            " IORT12
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               let start = 0
            endif
         " }}}
         " {{{ BEAM
         elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r5"
            " ITPR
            if synIDattr(slist[2], "name") =~ "pam_56.*"
               let start = 55
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r9"
            " IDSEC
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               let start = 0
            endif
         " }}}
         " {{{ TIED/SLINK/ELINK
         elseif synIDattr(slist[1], "name") =~ "pam_PART_TIED_r5"
            " INEXT
            if synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PART_TIED_r6"
            " IORT
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               let start = 0
            endif
         " }}}
         " {{{ PLINK
         elseif synIDattr(slist[1], "name") =~ "pam_PART_PLINK_r5"
            " IRADBEN
            if synIDattr(slist[2], "name") =~ "pam_61.*"
               let start = 60
            endif
         " }}}
         endif
"  }}}
"  {{{ MATER 1D+LINK
      elseif synIDattr(slist[0], "name") =~ "pam_Mater[23][0-9][0-9]"
         if synIDattr(slist[1], "name") =~ "pam_Mater.*_r1$"
            " ISINT
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ISTRA
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2a"
            " FILTER
            if synIDattr(slist[2], "name") =~ "pam_MaterX_r2a_[ae]1"
               let start = 8
            " INTERP
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2"
            " IMPD
            if synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         " {{{ CURVE Definition
         elseif synIDattr(slist[1], "name") =~ "pam_MATER.*c_r8" || synIDattr(slist[1], "name") =~ "pam_MATER.*c_r10"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            " LC2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let start = 10
            " LC3
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               let start = 20
            " LC4
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               let start = 30
            " LC5
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " LC6
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            " LC7
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               let start = 60
            " LC8
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         " }}}
         " {{{ ECURV Definition
         elseif synIDattr(slist[1], "name") =~ "pam_MATER.*e_r8" || synIDattr(slist[1], "name") =~ "pam_MATER.*e_r10"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            endif
         " }}}
         " {{{ MATER 204
         elseif synIDattr(slist[1], "name") =~ "pam_Mater204.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER204.*_r4" 
               " NLOAD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IHYST
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER204.*_r5" 
               " NUNLD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " NDAMP
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " NMULT
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            endif
            " }}}
         " {{{ MATER 205
         elseif synIDattr(slist[1], "name") =~ "pam_Mater205.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER205.*_r4" 
               " NLOAD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IHYST
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
            " }}}
         " {{{ MATER 212
         elseif synIDattr(slist[1], "name") =~ "pam_Mater212.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER212.*_r7" 
               " FLIM
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            endif
            " }}}
         " {{{ MATER 214
         elseif synIDattr(slist[1], "name") =~ "pam_Mater214.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER214.*_r4" 
               " LCMs
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LCMt
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " ITYPM
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER214.*_r7" 
               " LYR
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LYS1
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LYS2
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LYT1
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LYT2
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER214.*_r8" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            endif
            " }}}
         " {{{ MATER 220/221/222
         elseif synIDattr(slist[1], "name") =~ "pam_Mater22[012].*"
            if synIDattr(slist[1], "name") =~ "pam_MATER22[01].*_r[468]" || synIDattr(slist[1], "name") =~ "pam_MATER220.*_r1[024]" || synIDattr(slist[1], "name") =~ "pam_MATER222.*_r[47]"
               " NLOAD*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IHt*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " DOFt*
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  let start = 65
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER22[01].*_r[579]" || synIDattr(slist[1], "name") =~ "pam_MATER220.*_r1[135]" || synIDattr(slist[1], "name") =~ "pam_MATER222.*_r[58]"
               " NUNL*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 223
         elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER223.*_r4"
               " NLOAD*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IHt*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " NM**
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  let start = 45
               " INDOF
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  let start = 65
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER223.*_r[68]" || synIDattr(slist[1], "name") =~ "pam_MATER223.*_r1[024]"
               " NLOAD*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IHt*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " NM**
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  let start = 45
               " ILENG
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER223.*_r[579]" || synIDattr(slist[1], "name") =~ "pam_MATER223.*_r1[135]"
               " NUNL*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " NDAMP*
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               endif
            endif
            " }}}
         " {{{ MATER 224
         elseif synIDattr(slist[1], "name") =~ "pam_Mater224.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER224.*_r4" 
               " INDOF
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " IFLGP
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            endif
            " }}}
         " {{{ MATER 225
         elseif synIDattr(slist[1], "name") =~ "pam_Mater225.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER225_r[5-9]" || synIDattr(slist[1], "name") =~ "pam_MATER225_r10"
               " NLOADUP*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " NLOADLW
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " NDAMP*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            endif
            " }}}
         " {{{ MATER 226
         elseif synIDattr(slist[1], "name") =~ "pam_Mater226.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER226_r4"
               " IDVU
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IDAU
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " ICHANNEL
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               endif
            endif
            " }}}
         " {{{ MATER 230
         elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER230.*_r[468]" || synIDattr(slist[1], "name") =~ "pam_MATER230.*_r1[024]"
               " NLOAD*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IHt*
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER230.*_r[579]" || synIDattr(slist[1], "name") =~ "pam_MATER230.*_r1[135]"
               " NUNL*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " NDAMP*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            endif
            " }}}
         " {{{ MATER 301
         elseif synIDattr(slist[1], "name") =~ "pam_Mater301.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER301.*_r4"
               " IDEABEN
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER301.*_r5"
               " IDOF
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " ITENT
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            endif
            " }}}
         " {{{ MATER 302
         elseif synIDattr(slist[1], "name") =~ "pam_Mater302.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER302.*_r4"
               " LSTNOR
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LSTTAN
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " IFLGC
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER302.*_r5"
               " IDOF
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            endif
            " }}}
         " {{{ MATER 303
         elseif synIDattr(slist[1], "name") =~ "pam_Mater303.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER303.*_r4"
               " IDEABEN
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " IDELBEND
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER303.*_r5"
               " IDOF
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IDELA
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER303.*_r8"
               " IFUNGcont
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
            " }}}
         " {{{ MATER 304
         elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER304.*_r4"
               " IDEABEN
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER304.*_r[5-8]"
               " ICUC*
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER304.*_r9" || synIDattr(slist[1], "name") =~ "pam_MATER304.*_r1[0-2]"
               " LKC*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 305
         elseif synIDattr(slist[1], "name") =~ "pam_Mater305.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER305.*_r4"
               " IELAST
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " IDEAL
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            endif
            " }}}
         endif
"  }}}
"  {{{ MATER 2D
      elseif synIDattr(slist[0], "name") =~ "pam_Mater1[0-9][0-9]"
         if synIDattr(slist[1], "name") =~ "pam_Mater.*_r1$"
            " ISINT
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ISH
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " ISTRA
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2a"
            " FILTER
            if synIDattr(slist[2], "name") =~ "pam_MaterX_r2a_[ae]1"
               let start = 8
            " INTERP
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2"
            " IMPD
            if synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         " {{{ CURVE Definition
         elseif synIDattr(slist[1], "name") =~ "pam_MATER.*c_r5" || synIDattr(slist[1], "name") =~ "pam_MATER.*c_r11"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            " LC2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let start = 10
            " LC3
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               let start = 20
            " LC4
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               let start = 30
            " LC5
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " LC6
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            " LC7
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               let start = 60
            " LC8
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         " }}}
         " {{{ MATER 103
         elseif synIDattr(slist[1], "name") =~ "pam_Mater103.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER103e_r5" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER103.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 105/106
         elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56].*"
            if synIDattr(slist[1], "name") =~ "pam_MATER10[56]e_r5" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER10[56].*_r7" 
               " FAILURE
               if synIDattr(slist[2], "name") =~ "pam_31.*" || synIDattr(slist[2], "name") =~ "pam_MATER10[56].*_r7_arg"
                  let start = 30
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER10[56].*_r8" 
               " IFELIM
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER10[56].*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 108
         elseif synIDattr(slist[1], "name") =~ "pam_Mater108.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER108.*_r7" 
               " IORE
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER108.*_r9" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let start = 0
               " KEYWORD
               elseif synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  let start = 40
               endif
            endif
            " }}}
         " {{{ MATER 109
         elseif synIDattr(slist[1], "name") =~ "pam_Mater109.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER109.*_r4" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER109.*_r10" 
               " ICUR
               if synIDattr(slist[2], "name") =~ "pam_MATER109.*_r10_Arg"
                  if synIDattr(slist[3], "name") =~ "pam_11.*"
                     let start = 10
                  endif
               endif
            endif
            " }}}
         " {{{ MATER 110
         elseif synIDattr(slist[1], "name") =~ "pam_Mater110.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER110.*_r5" 
               " FNUM
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " RNUM
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            endif
            " }}}
         " {{{ MATER 115
         elseif synIDattr(slist[1], "name") =~ "pam_Mater115.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER115.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  let start = 40
               endif
            endif
            " }}}
         " {{{ MATER 116
         elseif synIDattr(slist[1], "name") =~ "pam_Mater116.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER116.*_r8" 
               " IFELIM
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER116.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 117
         elseif synIDattr(slist[1], "name") =~ "pam_Mater117.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER117.*l_r5" 
               " ILUTYD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER117.*_r7" 
               " ILANK
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER117.*_r9" 
               " NASSSPL
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER117.*_r10" 
               " ICUR
               if synIDattr(slist[2], "name") =~ "pam_MATER117.*_r10_Arg"
                  if synIDattr(slist[3], "name") =~ "pam_11.*"
                     let start = 10
                  endif
               endif
            endif
            " }}}
         " {{{ MATER 118
         elseif synIDattr(slist[1], "name") =~ "pam_Mater118.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER118.*_r9" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let start = 0
               " KEYWORD
               elseif synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  let start = 40
               endif
            endif
            " }}}
         " {{{ MATER 126
         elseif synIDattr(slist[1], "name") =~ "pam_Mater126.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER126.*_r8" 
               " IELIM
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " ICC
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
            " }}}
         " {{{ MATER 127
         elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater127.*_r8" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r9" 
               " IFAIL
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " IKINH
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r1[02]" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r14" 
               " IFUNFLD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IFUNMSO
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " IFILTMSO
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            endif
            " }}}
         " {{{ MATER 128
         elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater128.*_r9" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 130/131/132
         elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater130.*_r4" 
               " ILAY
               if synIDattr(slist[2], "name") =~ "pam_26.*"
                  let start = 25
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r5" 
               " IDPLY
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r6" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_Mater103_r9_[ae]1"
                  let start = 20
               " IFAIL
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r[7-9]" || synIDattr(slist[1], "name") =~ "pam_Mater130.*_r1[0-2]"
               " IDPLY1
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let start = 0
               " IDPLY2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " IDPLY3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " IDPLY4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " IDPLY5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " IDPLY6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " IDPLY7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " IDPLY8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            endif
            " }}}
         " {{{ MATER 143
         elseif synIDattr(slist[1], "name") =~ "pam_Mater143.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER143_r7" 
               " LCmax
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " IFAIL
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " IFELIM
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER143.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 150
         elseif synIDattr(slist[1], "name") =~ "pam_Mater150.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER150_r4" 
               " IFLA90
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER150_r[56]" 
               " IWR1/2
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER150_r8" 
               " IMATLAW
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  let start = 0
               " LCLEAK
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
            " }}}
         " {{{ MATER 151
         elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER151_r4" 
               if synIDattr(slist[2], "name") =~ "pam_MATER151_r4_arg"
                  " IFUN
                  if synIDattr(slist[3], "name") =~ "pam_41.*"
                     let start = 40
                  " IHARD
                  elseif synIDattr(slist[3], "name") =~ "pam_71.*"
                     let start = 70
                  " IHYST
                  elseif synIDattr(slist[3], "name") =~ "pam_76.*"
                     let start = 75
                  endif
               " IHARD
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               " IHYST
               elseif synIDattr(slist[2], "name") =~ "pam_76.*"
                  let start = 75
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER151_r[56]" 
               " LCload
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LCunl
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER151_r8" 
               " LCLEAK
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LCSTRS
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LCRAT1
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LCRAT2
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER151_r1[02]"
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            endif
            " }}}
         " {{{ MATER 152
         elseif synIDattr(slist[1], "name") =~ "pam_Mater152.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER152_r5" 
               " IWR1/2
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER152_r8" 
               " LCLEAK
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
            " }}}
         " {{{ MATER 161
         elseif synIDattr(slist[1], "name") =~ "pam_Mater161.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER161_r5" 
               " IFLAW
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 162
         elseif synIDattr(slist[1], "name") =~ "pam_Mater162.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER162.*_r8" 
               " IFELIM
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER162.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 171
         elseif synIDattr(slist[1], "name") =~ "pam_Mater171.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER171e_r5" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER171_r9" 
               " IW1
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               endif
            endif
            " }}}
         endif
"  }}}
"  {{{ MATER 3D 
      elseif synIDattr(slist[0], "name") =~ "pam_Mater.*"
         if synIDattr(slist[1], "name") =~ "pam_Mater.*_r1$"
            " ISINT
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ISH
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " ISTRA
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2a"
            " FILTER
            if synIDattr(slist[2], "name") =~ "pam_MaterX_r2a_[ae]1"
               let start = 8
            " INTERP
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2"
            " IMPD
            if synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         " {{{ CURVE Definition
         " 
         elseif synIDattr(slist[1], "name") =~ "pam_MATER.*c_r6" || synIDattr(slist[1], "name") =~ "pam_MATER62c_r5"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let start = 0
            " LC2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let start = 10
            " LC3
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               let start = 20
            " LC4
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               let start = 30
            " LC5
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " LC6
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            " LC7
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               let start = 60
            " LC8
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               let start = 70
            endif
         " }}}
         " {{{ MATER 17
         elseif synIDattr(slist[1], "name") =~ "pam_Mater17.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER17.*_r5" 
               " LTCload
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LTCunl
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
         " }}}
         " {{{ MATER 16
         elseif synIDattr(slist[1], "name") =~ "pam_Mater16.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER16.*_r4" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_41."
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER16e_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 24
         elseif synIDattr(slist[1], "name") =~ "pam_Mater24.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER24.*_r5" 
               " NCRV1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " NCRV2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " NCRV3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               endif
            endif
            " }}}
         " {{{ MATER 30
         elseif synIDattr(slist[1], "name") =~ "pam_Mater30.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER30.*_r4" 
               " IDPLY
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER30.*_r5" 
               " IFAIL
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            endif
            " }}}
         " {{{ MATER 31
         elseif synIDattr(slist[1], "name") =~ "pam_Mater31.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER31.*_r4" 
               " IDPLY
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 36
         elseif synIDattr(slist[1], "name") =~ "pam_Mater36.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER36_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater36_r8" 
               " LCmaxelim
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
            " }}}
         " {{{ MATER 37
         elseif synIDattr(slist[1], "name") =~ "pam_Mater37.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER37_r4" 
               " LTCsoft
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER37_r9" 
               " LTCuniax
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LTCbiax
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LTCpshear
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LTCvol
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               endif
            endif
            " }}}
         " {{{ MATER 38
         elseif synIDattr(slist[1], "name") =~ "pam_Mater38.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER38_r4" 
               " LTCsoft
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               endif
            endif
            " }}}
         " {{{ MATER 42
         elseif synIDattr(slist[1], "name") =~ "pam_Mater42.*"
            " A_*
            if synIDattr(slist[2], "name") =~ "pam_MATER42_r4_[ae]1" 
               let start = 10
            elseif synIDattr(slist[1], "name") =~ "pam_MATER42_r[4-9]" || synIDattr(slist[1], "name") =~ "pam_MATER42_r1[0-2]" 
               " IC*
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " MV*
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER42_r13" 
               " STRATfac
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER42_r15" 
               " LCy
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LCdam
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " Iswi
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            endif
            " }}}
         " {{{ MATER 45
         elseif synIDattr(slist[1], "name") =~ "pam_Mater45.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER45_r4"
               " IRATEXT
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER45_r[57]" || synIDattr(slist[1], "name") =~ "pam_MATER45_r1[01]"
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER45_r9"
               " LCC_ul
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LCT_ul
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER45_r1[346]"
               " LCt11/LCt_ul11/IDFUNDYN
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " IDFUNDAMP
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
            " }}}
         " {{{ MATER 47
         elseif synIDattr(slist[1], "name") =~ "pam_Mater47.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER47_r4"
               " LCc
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LCcunl
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LCt
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LCtunl
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER47_r7"
               " ISENS
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER47_r8"
               " IFUNDYN
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER47_r9"
               " IFUNDAMP
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 52
         elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER52e_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER52.*_r8" 
               " DUDATYP
               if synIDattr(slist[2], "name") =~ "pam_MATER52.*_r8_[ae]1"
                  let start = 0
               " SHDATYP
               elseif synIDattr(slist[2], "name") =~ "pam_MATER52.*_r8_[ae]2"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER52.*_r10" 
               " LCd1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LCd2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LCd3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LCd4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LCd5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " LCd6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " LCd7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " LCd8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER52.*_r12" 
               " LCs1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               " LCs2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               " LCs3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let start = 20
               " LCs4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               " LCs5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let start = 40
               " LCs6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let start = 50
               " LCs7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let start = 60
               " LCs8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let start = 70
               endif
            endif
            " }}}
         " {{{ MATER 62
         elseif synIDattr(slist[1], "name") =~ "pam_Mater62.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER62.*_r4" 
               " IFLAW
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  let start = 30
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER62_r8" 
               " IFELIM
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let start = 10
               endif
            endif
            " }}}
         " {{{ MATER 71
         elseif synIDattr(slist[1], "name") =~ "pam_Mater71.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER71e_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         " {{{ MATER 1
         elseif synIDattr(slist[1], "name") =~ "pam_Mater1.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER1.*_r5" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER1.*_r5_[ae]1"
                  let start = 10
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER1l_r6" 
               " IDLUTYD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER1e_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let start = 0
               endif
            endif
            " }}}
         endif
"  }}}
"  {{{ VAMAT
      elseif synIDattr(slist[0], "name") =~ "pam_VAMAT.*"
         if synIDattr(slist[1], "name") =~ "pam_VAMAT.*_r1$"
            " VAMATYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_VAMAT2.*_r6" || synIDattr(slist[1], "name") =~ "pam_VAMAT4.*_r4"
            " IFUNe
            if synIDattr(slist[2], "name") =~ "pam_21.*"
               let start = 20
            " IFUNd
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let start = 50
            endif
         endif
"  }}}
" {{{ FRICT
      elseif synIDattr(slist[0], "name") =~ "pam_FRICT.*" 
         if synIDattr(slist[1], "name") =~ "pam_FRICT.*_r1"
            " IFROPT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               " IPCUR/IVCIR
               if synIDattr(slist[1], "name") =~ "pam_FRICT2_r1"
                  let start = 24
               " IPCUR
               elseif synIDattr(slist[1], "name") =~ "pam_FRICT4_r1"
                  let start = 24
               " IDLKU
               elseif synIDattr(slist[1], "name") =~ "pam_FRICT13_r1"
                  let start = 24
               endif
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               " IDVCUR
               if synIDattr(slist[1], "name") =~ "pam_FRICT4_r1"
                  let start = 32
               endif
            endif
         endif
" }}}
" {{{ RUPMO
      elseif synIDattr(slist[0], "name") =~ "pam_RUPMO.*" 
         if synIDattr(slist[1], "name") =~ "pam_RUPMO.*_r1"
            " IRUPT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " IFMON
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " FILTER
            elseif col('.') >= 33 && col('.') <= 40
               let start = 32
            endif
         endif
" }}}
" {{{ SENSOR
      elseif synIDattr(slist[0], "name") =~ "pam_SENSOR.*" 
         if synIDattr(slist[1], "name") =~ "pam_SENSOR.*_r1"
            " ITYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " ISREV
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR2_r3"
            " IACC
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " ISIG
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " IRESP
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR3_r3"
            " ISIG
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " IRESP
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR4_r3"
            " IRET
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " IRETPOS
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR5_r3"
            " LCS
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR6_r3"
            " IDCTC
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR7_r3"
            " IDNT
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IDNC
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IMOTION
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR8_r3"
            " IDBAG
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " IQUALI
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR9_r3"
            " ISENS1
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " ISENS2
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " ILOGI
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR10_r3"
            " ISENS1
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR11_r3"
            " IDSEW
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR12_r3"
            " COP
            if col('.') >= 9 && col('.') <= 11
               let start = 8
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR12_r4"
            " ISENS1
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR13_r3"
            " KINTYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR14_r3"
            " IMOTION
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         endif
" }}}
" {{{ SECFO
      elseif synIDattr(slist[0], "name") =~ "pam_SECFO.*" 
         if synIDattr(slist[1], "name") =~ "pam_SECFO.*_r1"
            " NTYPE
            if synIDattr(slist[2], "name") =~ "pam_SECFO_.*_r1_[ae]2"
               let start = 16
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SECFO_DETECT_r3"
            " IDESPH
            if synIDattr(slist[2], "name") =~ "pam_9.8.*"
               let start = 8
            endif
         endif
" }}}
" {{{ FRAME
      elseif synIDattr(slist[0], "name") =~ "pam_FRAME.*" 
         if synIDattr(slist[1], "name") =~ "pam_FRAME.*_r1"
            " IFRATY
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " IAXIS
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         endif
" }}}
" {{{ MASS Card
      elseif synIDattr(slist[0], "name") =~ "pam_MASS"
         if synIDattr(slist[1], "name") =~ "pam_MASS_r1"
             " IFRA
             if col('.') >= 17 && col('.') <= 24
                let start = 16
             endif
         endif
" }}}
"  {{{ UDATA
      elseif synIDattr(slist[0], "name") =~ "pam_UDATA"
         if synIDattr(slist[1], "name") =~ "pam_UDATA_r1"
            " IUDTYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " CUDSEL
            elseif col('.') >= 41 && col('.') <= 48
               let start = 40
            " IDCUD
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_UDATA_r3"
            " IDENT
            if col('.') >= 25 && col('.') <= 32
               let start = 24
            endif
         endif
"  }}}
"  {{{ LOOKU
      elseif synIDattr(slist[0], "name") =~ "pam_LOOKU"
         if synIDattr(slist[2], "name") =~ "pam_LOOKU_r3a"
            " IINT
            if synIDattr(slist[3], "name") =~ "pam_33.*"
               let start = 32
            elseif synIDattr(slist[3], "name") =~ "pam_41.*"
               let start = 40
            elseif synIDattr(slist[3], "name") =~ "pam_49.*"
               let start = 48
            endif
         endif
"  }}}
"  {{{ SENPT
      elseif synIDattr(slist[0], "name") =~ "pam_SENPT"
         if synIDattr(slist[1], "name") =~ "pam_SENPT_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " ACFLG
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            " IDAFLG
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let start = 64
            endif
         endif
"  }}}
"  {{{ CONLO
      elseif synIDattr(slist[0], "name") =~ "pam_CONLO"
         if synIDattr(slist[1], "name") =~ "pam_CONLO_r1"
            " IDIR
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " LCUR
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " ILDTYPE
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         endif
"  }}}
"  {{{ THCRS
      elseif synIDattr(slist[0], "name") =~ "pam_THCRS"
         if synIDattr(slist[1], "name") =~ "pam_THCRS_r1"
            " TYPE1
            if synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 17 && col ('.') <= 21
               let start = 16
            " VAR1
            elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 30 && col ('.') <= 34
               let start = 29
            " COMP1
            elseif synIDattr(slist[2], "name") =~ "pam_35.*"
               let start = 34
            " TYPE2
            elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 43 && col ('.') <= 47
               let start = 42
            " VAR2
            elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 56 && col ('.') <= 60
               let start = 55
            " COMP2
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               let start = 60
            endif
         endif
"  }}}
"  {{{ PREFA/PREBM
      elseif synIDattr(slist[0], "name") =~ "pam_PREFA"
         if synIDattr(slist[1], "name") =~ "pam_PREFA_r1"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         endif
"  }}}
"  {{{ PRESBC
      elseif synIDattr(slist[0], "name") =~ "pam_PRESBC"
         if synIDattr(slist[1], "name") =~ "pam_PRESBC_r1"
            " IFUNPR
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IOB
            elseif synIDattr(slist[2], "name") =~ "pam_PRESBC_r1_[ae]1"
               let start = 56
            endif
         endif
"  }}}
"  {{{ ACFLD
      elseif synIDattr(slist[0], "name") =~ "pam_ACFLD"
         if synIDattr(slist[1], "name") =~ "pam_ACFLD_r1"
            " IFUN1
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IFUN3
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let start = 64
            endif
         endif
"  }}}
"  {{{ BDFOR
      elseif synIDattr(slist[0], "name") =~ "pam_BDFOR"
         if synIDattr(slist[1], "name") =~ "pam_BDFOR_r1"
            " KEYWORD
            if synIDattr(slist[2], "name") =~ "pam_BDFOR_r1_[ae]1"
               let start = 8
            " IFUN1
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IFUN3
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         endif
"  }}}
"  {{{ DAMP
      elseif synIDattr(slist[0], "name") =~ "pam_DAMP"
         if synIDattr(slist[1], "name") =~ "pam_DAMP_r1"
            " ISENS
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IDAMP
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " IMODE
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_DAMP_r3"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         endif
"  }}}
"  {{{ KINDA
      elseif synIDattr(slist[0], "name") =~ "pam_KINDA"
         if synIDattr(slist[1], "name") =~ "pam_KINDA_r1"
            " ISENS
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IDAMP
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_KINDA_r3"
            " KINTYP
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            endif
         endif
"  }}}
"  {{{ INVEL
      elseif synIDattr(slist[0], "name") =~ "pam_INVEL"
         if synIDattr(slist[1], "name") =~ "pam_INVEL_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_65.*"
               let start = 64
            " IRIGB
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         endif
"  }}}
"  {{{ DISLIM
      elseif synIDattr(slist[0], "name") =~ "pam_DISLIM"
         if synIDattr(slist[1], "name") =~ "pam_DISLIM_r1"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            endif
         endif
"  }}}
"  {{{ BOUNC
      elseif synIDattr(slist[0], "name") =~ "pam_BOUNC"
         if synIDattr(slist[1], "name") =~ "pam_BOUNC_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         endif
"  }}}
"  {{{ SLIPR
      elseif synIDattr(slist[0], "name") =~ "pam_SLIPR"
         if synIDattr(slist[1], "name") =~ "pam_SLIPR_r1"
            " IDFRIC
            if synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            " ILOCK
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         endif
"  }}}
"  {{{ MUSC1
      elseif synIDattr(slist[0], "name") =~ "pam_MUSC1"
         if synIDattr(slist[1], "name") =~ "pam_MUSC1_r[3-6]"
            " N*
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_MUSC1_r7"
            " ITRIG
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            endif
         endif
"  }}}
"  {{{ RETRA
      elseif synIDattr(slist[0], "name") =~ "pam_RETRA"
         if synIDattr(slist[1], "name") =~ "pam_RETRA_r1"
            " NBW2
            if synIDattr(slist[2], "name") =~ "pam_57.*"
               let start = 56
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_RETRA_r3"
            " ISENSR
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " ISPOOL
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " ISENSP
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IREELR
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IREELC
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " ICOURFR
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_RETRA_r4"
            " LLCURV
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " LLSENS
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " LLFLAG
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         endif
"  }}}
"  {{{ x3D
      elseif synIDattr(slist[0], "name") =~ "pam_x3D"
         if synIDattr(slist[1], "name") =~ "pam_x3D_r1"
            " IFUN1
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IFUN3
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let start = 64
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_x3D_r2"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_x3D_r2_[ae]1"
               let start = 56
            endif
         endif
"  }}}
"  {{{ VAMPSO
      elseif synIDattr(slist[0], "name") =~ "pam_VAMPSO"
         if synIDattr(slist[1], "name") =~ "pam_VAMPSO_r3"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_VAMPSO_r3_[ae]1"
               let start = 8
            " IFUNC
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
"  }}}
"  {{{ VAABSO
      elseif synIDattr(slist[0], "name") =~ "pam_VAABSO"
         if synIDattr(slist[1], "name") =~ "pam_VAABSO_r3"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_VAABSO_r3_[ae]1"
               let start = 8
            " IFUNC
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
"  }}}
"  {{{ FBC3D
      elseif synIDattr(slist[0], "name") =~ "pam_FBC3D"
         if synIDattr(slist[1], "name") =~ "pam_FBC3D_r1"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_FBC3D_r1_[ae]1"
               let start = 16
            " IFUN1
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               let start = 72
            endif
         endif
"  }}}
"  {{{ FBCFA
      elseif synIDattr(slist[0], "name") =~ "pam_FBCFA"
         if synIDattr(slist[1], "name") =~ "pam_FBCFA_r1"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_FBCFA_r1_[ae]1"
               let start = 8
            " IFUNC
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
"  }}}
"  {{{ ACTUA
      elseif synIDattr(slist[0], "name") =~ "pam_ACTUA"
         if synIDattr(slist[1], "name") =~ "pam_ACTUA_r1"
            " QUALIFIER1
            if synIDattr(slist[2], "name") =~ "pam_ACTUA_r1_[ae]1"
               let start = 24
            " IFUN
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " QUALIFIER2
            elseif synIDattr(slist[2], "name") =~ "pam_ACTUA_r1_[ae]2"
               let start = 56
            endif
         endif
"  }}}
"  {{{ LCPSD
      elseif synIDattr(slist[0], "name") =~ "pam_LCPSD"
         if synIDattr(slist[1], "name") =~ "pam_LCPSD_r1"
            " LCUR
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         endif
"  }}}
"  {{{ DRAPF
      elseif synIDattr(slist[0], "name") =~ "pam_DRAPF"
         if synIDattr(slist[1], "name") =~ "pam_DRAPF_r1"
            " IDLAYER
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " IMPORT
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
"  }}}
"  {{{ MSTRM
      elseif synIDattr(slist[0], "name") =~ "pam_MSTRM"
         if synIDattr(slist[1], "name") =~ "pam_MSTRM_r3"
            " IFLG
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IOUT
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         endif
"  }}}
"  {{{ SUBDF
      elseif synIDattr(slist[0], "name") =~ "pam_SUBDF"
         if synIDattr(slist[1], "name") =~ "pam_SUBDF_r1"
            " IDEFNOD
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " IFRAM
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IFRB
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            endif
         endif
"  }}}
"  {{{ IMPORT
      elseif synIDattr(slist[0], "name") =~ "pam_IMPORT"
         if synIDattr(slist[1], "name") =~ "pam_IMPORT_r1"
            " IPLOT
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " IPF
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            endif
         endif
"  }}}
"  {{{ EXPORT
      elseif synIDattr(slist[0], "name") =~ "pam_EXPORT"
         if synIDattr(slist[1], "name") =~ "pam_EXPORT_r1"
            " IFILE
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " IOUTFRAM
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
"  }}}
"  {{{ RMSSOL
      elseif synIDattr(slist[0], "name") =~ "pam_RMSSOL"
         if synIDattr(slist[1], "name") =~ "pam_RMSSOL_r1"
            " IDTIED
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_RMSSOL_r3"
            " CRIT
            if synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]1"
               let start = 8
            " KW1
            elseif synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]2"
               let start = 16
            " KW2
            elseif synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]3"
               let start = 24
            endif
         endif
"  }}}
"  {{{ FUNCSW
      elseif synIDattr(slist[0], "name") =~ "pam_FUNCSW"
         if synIDattr(slist[1], "name") =~ "pam_FUNCSW_r1"
            " ISWTYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            " INOSNS
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            " IFUNNO
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let start = 32
            " IMUSNS
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let start = 40
            " IFUNMU
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let start = 48
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_FUNCSW_r3"
            " ISENS
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " IFUN
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
            endif
         endif
"  }}}
"  {{{ TURBL
      elseif synIDattr(slist[0], "name") =~ "pam_TURBL"
         if synIDattr(slist[1], "name") =~ "pam_TURBL_r1"
            " MODEL
            if synIDattr(slist[2], "name") =~ "pam_TURBL_r1_[ae]1"
               let start = 16
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r3"
            " IFUNpsd
            if synIDattr(slist[2], "name") =~ "pam_1.8.*"
               let start = 0
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r4"
            " IDIR
            if synIDattr(slist[2], "name") =~ "pam_1.8.*"
               let start = 0
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_9.*"
               let start = 8
            " IFUNuc
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r5"
            " IFUNc1
            if synIDattr(slist[2], "name") =~ "pam_1.8.*"
               let start = 0
            " IFUNc2
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let start = 24
            endif
         endif
"  }}}
      endif
      return start
   else
" }}}
"{{{ second part, return the list of the completition candidates
      let items = []
      let line = getline('.')
      let slist = synstack (line("."), col("."))
      let g:dictlist = taglist (".*")
" {{{ Entity Selection
      " PART list
      if strpart(line,8,4) == "PART" || strpart(line,8,7) == "DELPART"
         if a:base != ''
            let g:dictlist = taglist (a:base)
         endif
         for i in range (len (g:dictlist))
            if g:dictlist[i]['pamkind'] == "PART" 
              call add (items,{'word':g:dictlist[i]['name'],'menu':g:dictlist[i]['pamname']})
            endif
         endfor   
      " GROUP list
      elseif strpart(line,8,3) == "GRP" || strpart(line,8,4) == "OGRP" || strpart(line,8,6) == "DELGRP"
         if a:base != ''
            let g:dictlist = taglist (a:base)
               call add (items,{'word':a:base})
         endif
         for i in range (len (g:dictlist))
            if g:dictlist[i]['pamkind'] == "GROUP" 
               call add (items,{'word':g:dictlist[i]['pamname']})
            endif
         endfor   
      " MODULE list
      elseif strpart(line,8,3) == "MOD" 
         if a:base != ''
            let g:dictlist = taglist (a:base)
               call add (items,{'word':a:base})
         endif
         for i in range (len (g:dictlist))
            if g:dictlist[i]['pamkind'] == "MODULE" 
               call add (items,{'word':g:dictlist[i]['name'],'menu':g:dictlist[i]['pamname']})
            endif
         endfor   
      endif
" }}}
      if len (slist) == 0
          return sort(items)
      elseif len (slist) == 1
         call add (slist,'')
         call add (slist,'')
         call add (slist,'')
      elseif len (slist) == 2
         call add (slist,'')
         call add (slist,'')
      elseif len (slist) == 3
         call add (slist,'')
      endif
" {{{ Elements IDPRT
      if index(elements, synIDattr(slist[0], "name")) > -1
         if synIDattr(slist[1], "name") =~ ".*_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("PART",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_17.*"
            let items = s:getTags("PART",8)
         endif
" }}}
" {{{ SPRING
      elseif synIDattr(slist[0], "name") =~ "pam_Spring"
         " IDPRT
         if synIDattr(slist[1], "name") =~ "pam_17.*"
            let items = s:getTags("PART",8)
         endif
         " IFRA
         if synIDattr(slist[1], "name") =~ "pam_41.*"
            let items = s:getTags("FRAME",8)
         endif
" }}}
" {{{ JOINT
      elseif synIDattr(slist[0], "name") =~ "pam_Joint"
         " IDPRT
         if synIDattr(slist[1], "name") =~ "pam_17.*"
            let items = s:getTags("PART",8)
         endif
         " IFRA
         if synIDattr(slist[1], "name") =~ "pam_41.*"
            let items = s:getTags("FRAME",8)
         endif
" }}}
" {{{ GAP
      elseif synIDattr(slist[0], "name") =~ "pam_Gap"
         " IDPRT
         if synIDattr(slist[1], "name") =~ "pam_17.*"
            let items = s:getTags("PART",8)
         endif
         " IFRA
         if synIDattr(slist[1], "name") =~ "pam_41.*"
            let items = s:getTags("FRAME",8)
         endif
" }}}
" {{{ SPRGBM
      elseif synIDattr(slist[0], "name") =~ "pam_Sprgbm"
         " IDPRT
         if synIDattr(slist[1], "name") =~ "pam_17.*"
            let items = s:getTags("PART",8)
         endif
         " IFRA
         if synIDattr(slist[1], "name") =~ "pam_49.*"
            let items = s:getTags("FRAME",8)
         endif
" }}}
" {{{ SECFO
      elseif synIDattr(slist[0], "name") =~ "pam_SECFO.*" 
         if synIDattr(slist[1], "name") =~ "pam_SECFO.*_r1"
            " NTYPE
            if synIDattr(slist[2], "name") =~ "pam_SECFO_.*_r1_[ae]2"
               call add (items,{'word':'CONTACT ','menu':'Contact Forces'})
               call add (items,{'word':'LINK    ','menu':'Link Forces'})
               call add (items,{'word':'PLANE   ','menu':'Cutting Plane Transmission Forces'})
               call add (items,{'word':'SECTION ','menu':'Section Transmission Forces'})
               call add (items,{'word':'SUPPORT ','menu':'Support Reaction Forces'})
               call add (items,{'word':'VOLFRAC ','menu':'Fraction of Volume Affected by Defined Criterion'})
               call add (items,{'word':'CONT_MS ','menu':'Master-Slave Contact Forces'})
               call add (items,{'word':'DETECT  ','menu':'Accumulated Nodal Mass in Volume'})
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FRAME",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SECFO_DETECT_r3"
            " IDESPH
            if synIDattr(slist[2], "name") =~ "pam_9.8.*"
               call add (items,{'word':'       0','menu':'No Deactivation of SPH Elements'})
               call add (items,{'word':'       1','menu':'SPH Elements Deactivated'})
            endif
         endif
" }}}
" {{{ MTOCO1
      elseif synIDattr(slist[0], "name") =~ "pam_MTOCO1"
         if synIDattr(slist[1], "name") =~ "pam_MTOCO1_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FRAME",8)
            " ITMTO
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'Regular MTOCO'})
               call add (items,{'word':'       1','menu':'User Imposed Mass and Inertia MTOCO'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_MTOCO1_r3"
            "IT1FL
            if col('.') <= 8
               call add (items,{'word':'       0','menu':'Principal Moments of Inertia'})
               call add (items,{'word':'       1','menu':'Global Inertia Tensor'})
            "IFRA2
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let items = s:getTags("FRAME",8)
            endif  
         endif
" }}}
" {{{ MTOCO0
      elseif synIDattr(slist[0], "name") =~ "pam_MTOCO"
         if synIDattr(slist[1], "name") =~ "pam_MTOCO_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FRAME",8)
            " ITMTO
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'Regular MTOCO'})
               call add (items,{'word':'       1','menu':'User Imposed Mass and Inertia MTOCO'})
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("SENSOR",8)
            endif
         endif
" }}}
" {{{ OTMCO
      elseif synIDattr(slist[0], "name") =~ "pam_OTMCO"
         if synIDattr(slist[1], "name") =~ "pam_OTMCO_r1"
            " IMETH
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'Only Translations are Accounted'})
               call add (items,{'word':'       1','menu':'Translations and Rotations are Accounted'})
            " IELIM
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               call add (items,{'word':'       0','menu':'OTMCO Removed after first Independent Node Becomes Free'})
               call add (items,{'word':'       1','menu':'OTMCO Removed after all Independent Nodes Become Free'})
            " ITYP
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'general OTMCO'})
               call add (items,{'word':'       1','menu':'OTMCO Type Barycenter'})
            endif
         endif
" }}}
"  {{{ NLAVE
      elseif synIDattr(slist[0], "name") =~ "pam_NLAVE"
         if synIDattr(slist[1], "name") =~ "pam_NLAVE_r1"
            if col('.') >= 17 && col('.') <= 24 && synIDattr(slist[2], "name") =~ "pam_NLAVE_r1_a1*"
               call add (items,{'word':'GLASS_EN','menu':'Non-Local Refinement for MAT 126'})
            endif
         endif
"  }}}
" {{{ LINCO
      elseif synIDattr(slist[0], "name") =~ "pam_LINCO"
         if synIDattr(slist[1], "name") =~ "pam_LINCO_r1"
            " DOFTYP
            if col('.') >= 17 && col('.') <= 24
               call add (items,{'word':'STRUCT  ','menu':'Structural DOF'})
               call add (items,{'word':'ACOUST  ','menu':'Acoustic DOF'})
               call add (items,{'word':'THERM   ','menu':'Temperature DOF'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_LINCO_r3"
            " IDOF
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       1','menu':'Translation in X | Acoustic Pressure | Temperature DOF 1'})
               call add (items,{'word':'       2','menu':'Translation in Y | Temperature DOF 2'})
               call add (items,{'word':'       3','menu':'Translation in Z | Temperature DOF 3'})
               call add (items,{'word':'       4','menu':'Rotation in X | Temperature DOF 4'})
               call add (items,{'word':'       5','menu':'Rotation in Y | Temperature DOF 5'})
               call add (items,{'word':'       6','menu':'Rotation in Z | Temperature DOF 6'})
               call add (items,{'word':'       7','menu':'Temperature DOF 7'})
               call add (items,{'word':'       8','menu':'Temperature DOF 8'})
               call add (items,{'word':'       9','menu':'Temperature DOF 9'})
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FRAME",8)
            endif
         endif
" }}}
" {{{ BEAM
      elseif synIDattr(slist[0], "name") =~ "pam_Beam"
         if synIDattr(slist[1], "name") =~ "pam_Beam_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("PART",8)
            " ITPRT
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               call add (items,{'word':'       0','menu':'Constant Section beam (default)'})
               call add (items,{'word':'       1','menu':'Tapered Beam'})
            endif
         endif
" }}}
" {{{ RBODY[0-2]
      elseif synIDattr(slist[0], "name") =~ "pam_RBODY[0-2]"
         if synIDattr(slist[1], "name") =~ "pam_RBODY[0-2]_r1"
            " ITRB
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Regular Rigid Body'})
               call add (items,{'word':'       1','menu':'Rigid Body Spotweld'})
               call add (items,{'word':'       2','menu':'Rigid Body Rivel'})
               call add (items,{'word':'       3','menu':'User-Defined Rigid Body'})
               call add (items,{'word':'       4','menu':'Simplified Rigid Body'})
            " ICOG
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'Automatic Calculation'})
               call add (items,{'word':'       1','menu':'Keep COG Coordinates'})
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let items = s:getTags("SENSOR",8)
            endif
         endif
" }}}
" {{{ RBODY[3-4]
      elseif synIDattr(slist[0], "name") =~ "pam_RBODY[3-4]"
         if synIDattr(slist[1], "name") =~ "pam_RBODY[3-4]_r1"
            " ITRB
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Regular Rigid Body'})
               call add (items,{'word':'       1','menu':'Rigid Body Spotweld'})
               call add (items,{'word':'       2','menu':'Rigid Body Rivel'})
               call add (items,{'word':'       3','menu':'User-Defined Rigid Body'})
               call add (items,{'word':'       4','menu':'Simplified Rigid Body'})
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let items = s:getTags("SENSOR",8)
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let items = s:getTags("FRAME",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_RBODY3_r3"
            " IT3FL
            if col('.') <= 8
               call add (items,{'word':'       0','menu':'Prescribe Principial Inertia'})
               call add (items,{'word':'       1','menu':'Prescribe Full Inertia Tensor'})
            endif
         endif
" }}}
" {{{ TIED
      elseif synIDattr(slist[0], "name") =~ "pam_TIED"
         if synIDattr(slist[1], "name") =~ "pam_TIED_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("PART",8)
            " IPCHK
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Stops if Projection Fails for All Nodes (default)'})
               call add (items,{'word':'       1','menu':'Stops if Projection Fails for at least One Node'})
               call add (items,{'word':'      -1','menu':'No Stop'})
            endif
         endif
" }}}
" {{{ SEWING
      elseif synIDattr(slist[0], "name") =~ "pam_SEWING"
         if synIDattr(slist[1], "name") =~ "pam_SEWING_r1"
            " IFINT
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'Internal Forces are not used'})
               call add (items,{'word':'       1','menu':'Internal Forces are used'})
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("SENSOR",8)
            endif
         endif
" }}}
" {{{ PLINK
      elseif synIDattr(slist[0], "name") =~ "pam_PLink"
         if synIDattr(slist[1], "name") =~ "pam_PLink_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("PART",8)
            " ITPRT
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'No Preselection'})
               call add (items,{'word':'       1','menu':'Preselection Specified in Next Keyword'})
            endif
         endif
" }}}
" {{{ DELEM
      elseif synIDattr(slist[0], "name") =~ "pam_DELEM"
         if synIDattr(slist[1], "name") =~ "pam_DELEM_r1"
            " ISENS
            if synIDattr(slist[2], "name") =~ "pam_17.8.*"
               let items = s:getTags("SENSOR",8)
            endif
         endif
" }}}
" {{{ LAYER
      elseif synIDattr(slist[0], "name") =~ "pam_LAYER"
         " IDPLY
         if synIDattr(slist[1], "name") =~ "pam_LAYER_r3"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let items = s:getTags("PLY",10)
            endif
         endif
" }}}
"  {{{ THMAT
      elseif synIDattr(slist[0], "name") =~ "pam_THMAT"
         if synIDattr(slist[1], "name") =~ "pam_THMAT_MASS_DENSITY_r2"
            " FUN
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let items = s:getTags("FUNCT",10)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_THMAT_CONDUCTIVITY_r2"
            " FUN
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let items = s:getTags("FUNCT",10)
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let items = s:getTags("FUNCT",10)
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               let items = s:getTags("FUNCT",10)
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               let items = s:getTags("FUNCT",10)
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("FUNCT",10)
            " FUN
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let items = s:getTags("FUNCT",10)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_THMAT_SPECIFIC_HEAT_r2"
            " FUN
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let items = s:getTags("FUNCT",10)
            endif
         endif
"  }}}
"  {{{ TEMBC
      elseif synIDattr(slist[0], "name") =~ "pam_TEMBC"
         if synIDattr(slist[1], "name") =~ "pam_TEMBC_r1"
            " TFIMP
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("SENSOR",8)
            " TDOF
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'        ','menu':'Uniform Temperature Throught Thickness'})
               call add (items,{'word':'UPPER   ','menu':'Temperature Imposed to the Upper Surface'})
               call add (items,{'word':'LOWER   ','menu':'Temperature Imposed to the Lower Surface'})
            endif
         endif
"  }}}
" {{{ THLOC
      elseif synIDattr(slist[0], "name") =~ "pam_THLOC"
         if synIDattr(slist[1], "name") =~ "pam_THLOC_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FRAME",8)
            " ACFLG
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'No Correction Applied'})
               call add (items,{'word':'       1','menu':'Imposed Acceleration Field is Substracted'})
               call add (items,{'word':'       2','menu':'Initial Acceleration Field is Substracted'})
            " IDAFLG
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("ACFLD",8)
            endif
         endif
" }}}
" {{{ HTSURF
      elseif synIDattr(slist[0], "name") =~ "pam_HTSURF"
         if synIDattr(slist[1], "name") =~ "pam_HTSURF_r1"
            " AMBTLCUR
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_HTSURF_r3"
            " TEMCUR
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("FUNCT",8)
            " TIMCUR
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
" }}}
" {{{ BFLUX
      elseif synIDattr(slist[0], "name") =~ "pam_BFLUX"
         if synIDattr(slist[1], "name") =~ "pam_BFLUX_r1"
            " TLCUR
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
" }}}
" {{{ HFLUX
      elseif synIDattr(slist[0], "name") =~ "pam_HFLUX"
         if synIDattr(slist[1], "name") =~ "pam_HFLUX_r1"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
" }}}
"  {{{ THNAC
      elseif synIDattr(slist[0], "name") =~ "pam_THNAC"
         if synIDattr(slist[1], "name") =~ "pam_THNAC_r1"
            " IPANEL
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       0','menu':'No Panel Contribution'})
               call add (items,{'word':'       1','menu':'With Panel Contribution'})
            endif
         endif
"  }}}
" {{{ DPNQM
      elseif synIDattr(slist[0], "name") =~ "pam_DPNQM"
         if synIDattr(slist[1], "name") =~ "pam_DPNQM_r1"
            " ITYP
            if synIDattr(slist[2], "name") =~ "pam_17.8.*"
               call add (items,{'word':'       1','menu':'Along X-Axis'})
               call add (items,{'word':'       2','menu':'Along Y-Axis'})
               call add (items,{'word':'       3','menu':'Along Z-Axis'})
            " IFUN
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
" }}}
" {{{ DPEEN
      elseif synIDattr(slist[0], "name") =~ "pam_DPEEN"
         if synIDattr(slist[1], "name") =~ "pam_DPEEN_r1"
            " ITYP
            if synIDattr(slist[2], "name") =~ "pam_17.8.*"
               call add (items,{'word':'       1','menu':'Internal Energy pae Mass Unit'})
               call add (items,{'word':'       2','menu':'Non-Specific Internal Energy'})
            " IFUN
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
" }}}
" {{{ DPEMA
      elseif synIDattr(slist[0], "name") =~ "pam_DPEMA"
         if synIDattr(slist[1], "name") =~ "pam_DPEMA_r1"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
" }}}
"  {{{ CONLO
      elseif synIDattr(slist[0], "name") =~ "pam_CONLO"
         if synIDattr(slist[1], "name") =~ "pam_CONLO_r1"
            " IDIR
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       1','menu':'Force in X (or R) Axis Direction'})
               call add (items,{'word':'       2','menu':'Force in Y (or S) Axis Direction'})
               call add (items,{'word':'       3','menu':'Force in Z (or T) Axis Direction'})
               call add (items,{'word':'       4','menu':'Force in Local Frame T Axis Direction'})
               call add (items,{'word':'       5','menu':'Moment in X (or R) Axis Direction'})
               call add (items,{'word':'       6','menu':'Moment in Y (or S) Axis Direction'})
               call add (items,{'word':'       7','menu':'Moment in Z (or T) Axis Direction'})
               call add (items,{'word':'       8','menu':'Moment in Local Frame T Axis Direction'})
            " LCUR
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("FRAME",8)
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("SENSOR",8)
            " ILDTYPE
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       1','menu':'Load is Applied on Each Node in Selection'})
               call add (items,{'word':'       2','menu':'Load is Distributed over all Nodes in Selection'})
            endif
         endif
"  }}}
"  {{{ MUSC1
      elseif synIDattr(slist[0], "name") =~ "pam_MUSC1"
         if synIDattr(slist[1], "name") =~ "pam_MUSC1_r[3-6]"
            " N*
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("FUNCT",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_MUSC1_r7"
            " ITRIG
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               call add (items,{'word':'       0','menu':'Triggering by Stretch Reflex NOT Activated'})
               call add (items,{'word':'       1','menu':'Triggering by Stretch Reflex Activated'})
            endif
         endif
"  }}}
" {{{ MDBODY
      elseif synIDattr(slist[0], "name") =~ "pam_MDBODY"
         " CTYPE
         if synIDattr(slist[1], "name") =~ "pam_MDBODY_r1"
            if synIDattr(slist[2], "name") =~ "pam_MDBODY_r1_[ae]1"
               call add (items,{'word':'SHELL   ','menu':'Shell'})
               call add (items,{'word':'SOLID   ','menu':'Solid'})
               call add (items,{'word':'NODE    ','menu':'Node'})
            endif
         endif
" }}}
" {{{ IMPMA
      elseif synIDattr(slist[0], "name") =~ "pam_IMPMA"
         if synIDattr(slist[1], "name") =~ "pam_IMPMA_r1"
            " QUAL1
            if col('.') >= 17 && col('.') <= 24
               call add (items,{'word':'STIF    ','menu':'Stiffness'})
               call add (items,{'word':'MASS    ','menu':'Mass'})
               call add (items,{'word':'VDAM    ','menu':'Viscous Damping'})
            " QUAL2
            elseif col('.') >= 25 && col('.') <= 32
               call add (items,{'word':'DMIG    ','menu':'NASTRAN Direct Matrix Input'})
            " QUAL2
            elseif col('.') >= 33 && col('.') <= 40
               call add (items,{'word':'SYMM    ','menu':'Symmetric'})
            " IMATYP
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'Real Matrix'})
            endif
         " IDPRT
         elseif synIDattr(slist[1], "name") =~ "pam_17.*"
            let items = s:getTags("FRAME",8)
         " JTYP
         elseif col('.') >= 25 && col('.') <= 32
            call add (items,{'word':'SPHERICA','menu':'Spherical Joint'})
            call add (items,{'word':'TRANSLAT','menu':'Translational Joint'})
            call add (items,{'word':'REVOLUTE','menu':'Revolute Joint'})
            call add (items,{'word':'CYLINDRI','menu':'Cylindrical Joint'})
            call add (items,{'word':'PLANAR  ','menu':'Planar Joint'})
            call add (items,{'word':'UNIVERSA','menu':'Universal Joint'})
            call add (items,{'word':'GENERAL ','menu':'General Joint'})
            call add (items,{'word':'FLEX-TOR','menu':'Flexion-Torsion Joint'})
         " IFRA1
         elseif synIDattr(slist[1], "name") =~ "pam_49.*"
            let items = s:getTags("FRAME",8)
         " IFRA2
         elseif synIDattr(slist[1], "name") =~ "pam_57.*"
            let items = s:getTags("FRAME",8)
         endif
" }}}
" {{{ MTOJNT
      elseif synIDattr(slist[0], "name") =~ "pam_Mtojnt"
         if synIDattr(slist[1], "name") =~ "pam_Mtojnt_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("PART",8)
            " JTYP
            elseif col('.') >= 25 && col('.') <= 32
               call add (items,{'word':'SPHERICA','menu':'Spherical Joint'})
               call add (items,{'word':'TRANSLAT','menu':'Translational Joint'})
               call add (items,{'word':'REVOLUTE','menu':'Revolute Joint'})
               call add (items,{'word':'CYLINDRI','menu':'Cylindrical Joint'})
               call add (items,{'word':'PLANAR  ','menu':'Planar Joint'})
               call add (items,{'word':'UNIVERSA','menu':'Universal Joint'})
               call add (items,{'word':'GENERAL ','menu':'General Joint'})
               call add (items,{'word':'FLEX-TOR','menu':'Flexion-Torsion Joint'})
               call add (items,{'word':'PIN     ','menu':'Spherical-Spherical Joint'})
               call add (items,{'word':'BRACKET ','menu':'Bracket Joint'})
               call add (items,{'word':'FREE    ','menu':'Free Joint'})
            " IFRA1
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("FRAME",8)
            " IFRA2
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let items = s:getTags("FRAME",8)
            endif
         " IDPRT
         elseif synIDattr(slist[1], "name") =~ "pam_17.*"
            let items = s:getTags("FRAME",8)
         " JTYP
         elseif col('.') >= 25 && col('.') <= 32
            call add (items,{'word':'SPHERICA','menu':'Spherical Joint'})
            call add (items,{'word':'TRANSLAT','menu':'Translational Joint'})
            call add (items,{'word':'REVOLUTE','menu':'Revolute Joint'})
            call add (items,{'word':'CYLINDRI','menu':'Cylindrical Joint'})
            call add (items,{'word':'PLANAR  ','menu':'Planar Joint'})
            call add (items,{'word':'UNIVERSA','menu':'Universal Joint'})
            call add (items,{'word':'GENERAL ','menu':'General Joint'})
            call add (items,{'word':'FLEX-TOR','menu':'Flexion-Torsion Joint'})
         " IFRA1
         elseif synIDattr(slist[1], "name") =~ "pam_49.*"
            let items = s:getTags("FRAME",8)
         " IFRA2
         elseif synIDattr(slist[1], "name") =~ "pam_57.*"
            let items = s:getTags("FRAME",8)
         endif
" }}}
" {{{ KJOIN
      elseif synIDattr(slist[0], "name") =~ "pam_KJoin.*"
         if synIDattr(slist[1], "name") =~ "pam_KJoin_general_r1"
            " IDPRT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("PART",8)
            " JTYP
            elseif col('.') >= 25 && col('.') <= 32
               call add (items,{'word':'SPHERICA','menu':'Spherical Joint'})
               call add (items,{'word':'TRANSLAT','menu':'Translational Joint'})
               call add (items,{'word':'REVOLUTE','menu':'Revolute Joint'})
               call add (items,{'word':'CYLINDRI','menu':'Cylindrical Joint'})
               call add (items,{'word':'PLANAR  ','menu':'Planar Joint'})
               call add (items,{'word':'UNIVERSA','menu':'Universal Joint'})
               call add (items,{'word':'GENERAL ','menu':'General Joint'})
               call add (items,{'word':'FLEX-TOR','menu':'Flexion-Torsion Joint'})
            " IFRA1
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("FRAME",8)
            " IFRA2
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               let items = s:getTags("FRAME",8)
            endif
         " IDPRT
         elseif synIDattr(slist[1], "name") =~ "pam_17.*"
            let items = s:getTags("FRAME",8)
         " JTYP
         elseif col('.') >= 25 && col('.') <= 32
            call add (items,{'word':'SPHERICA','menu':'Spherical Joint'})
            call add (items,{'word':'TRANSLAT','menu':'Translational Joint'})
            call add (items,{'word':'REVOLUTE','menu':'Revolute Joint'})
            call add (items,{'word':'CYLINDRI','menu':'Cylindrical Joint'})
            call add (items,{'word':'PLANAR  ','menu':'Planar Joint'})
            call add (items,{'word':'UNIVERSA','menu':'Universal Joint'})
            call add (items,{'word':'GENERAL ','menu':'General Joint'})
            call add (items,{'word':'FLEX-TOR','menu':'Flexion-Torsion Joint'})
         " IFRA1
         elseif synIDattr(slist[1], "name") =~ "pam_49.*"
            let items = s:getTags("FRAME",8)
         " IFRA2
         elseif synIDattr(slist[1], "name") =~ "pam_57.*"
            let items = s:getTags("FRAME",8)
         endif
" }}}
" {{{ CNTAC Card Common
      elseif synIDattr(slist[0], "name") =~ "pam_CNTAC.*"
         if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r1"
            " NTYPE
            if col('.') >= 17 && col('.') <= 24
               call add (items,{'word':'       1','menu':'Special Sliding without Separation'})
               call add (items,{'word':'      10','menu':'Internal Solid Anti-Collapse Contact'})
               call add (items,{'word':'      21','menu':'Body-to-Multiplane Contact'})
               call add (items,{'word':'      33','menu':'Symmetric Node-to-Segment Contact with Edge Treatment'})
               call add (items,{'word':'      34','menu':'Non-Symmetric Node-to-Segment Contact with Edge Treatment'})
               call add (items,{'word':'      36','menu':'Self-Impacting Node-to-Segment Contact with Edge Treatment'})
               call add (items,{'word':'      37','menu':'Enhanced Self-Impacting Contact fuer Airbag'})
               call add (items,{'word':'      43','menu':'Edge-to-Edge Master-Slave Contact'})
               call add (items,{'word':'      44','menu':'Node-to-Segment Contact with Smooth Contact Surface'})
               call add (items,{'word':'      46','menu':'Edge-to-Edge Self-Impacting Contact'})
               call add (items,{'word':'      54','menu':'Non-Symmetric Node-to-Segment Oriented Contact with Edge Treatment'})
               call add (items,{'word':'      61','menu':'Note-to-Analytical Surface Contact'})
               call add (items,{'word':'     154','menu':'Implicit Small Sliding Contact'})
            endif
         endif
         " {{{ CNTAC 37/43/46
         if synIDattr(slist[0], "name") =~ "pam_CNTAC37" || synIDattr(slist[0], "name") =~ "pam_CNTAC4[36]"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("SENSOR",10)
               " ITPTR
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'    0','menu':'Constant Thickness (Hcont)'})
                  call add (items,{'word':'    2','menu':'Thickness by PART (Tcont), no Zero Thickness'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r5"
               " ICOUFR
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'         0','menu':'FRICT used'})
                  call add (items,{'word':'         1','menu':'Friction Averaged from COULFRIC Values'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
               " ILEAK
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  call add (items,{'word':'    0','menu':'No Obstruction'})
                  call add (items,{'word':'    1','menu':'Obstruction is Considered'})
               " IRMV
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'    0','menu':'No Penetration Removal'})
                  call add (items,{'word':'    2','menu':'Modify Contact Thickness'})
               " IOMIT
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  call add (items,{'word':'   -1','menu':'Deactivated'})
                  call add (items,{'word':'    0','menu':'Same as 2'})
                  call add (items,{'word':'    1','menu':'Activated, based on Topology'})
                  call add (items,{'word':'    2','menu':'Activated, based on Element Connectivity'})
                  call add (items,{'word':'    3','menu':'Activated, based on Element Connectivity, Size and Contact Thickness'})
               " IFRED
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  call add (items,{'word':'    0','menu':'Deactivated'})
                  call add (items,{'word':'    1','menu':'Activated'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
               " IPRES
               if synIDattr(slist[2], "name") =~ "pam_76.*"
                  call add (items,{'word':'    0','menu':'Interface Contribution taken into Account'})
                  call add (items,{'word':'    1','menu':'Interface Contribution NOT taken into Account'})
                  call add (items,{'word':'    2','menu':'Interface Contribution taken into Account + Output Activated'})
               endif
            endif
         " }}}
         " {{{ CNTAC 33/34/36/44/54/154
         elseif synIDattr(slist[0], "name") =~ "pam_CNTAC3[46]" || synIDattr(slist[0], "name") =~ "pam_CNTAC[45]4" || synIDattr(slist[0], "name") =~ "pam_CNTAC154"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("SENSOR",10)
               " ITPRT
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'    0','menu':'Constant Thickness (Hcont)'})
                  call add (items,{'word':'    1','menu':'Thickness by PART (Tcont)'})
                  if synIDattr(slist[1], "name") != "pam_CNTAC54_r3" && synIDattr(slist[1], "name") != "pam_CNTAC154_r3"
                     call add (items,{'word':'    2','menu':'Thickness by PART (Tcont), no Zero Thickness'})
                  endif
                  if synIDattr(slist[1], "name") == "pam_CNTAC154_r3"
                     call add (items,{'word':'   10','menu':'Gap Distance'})
                  endif
               " IORI
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  call add (items,{'word':'    0','menu':'Master Surface Towards Slave'})
                  call add (items,{'word':'    1','menu':'No Oriantation Used, Relative Position instead'})
               " IEDGE
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  call add (items,{'word':'         0','menu':'Activated'})
                  call add (items,{'word':'         1','menu':'Deactivated'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r4"
               " IPCP
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  call add (items,{'word':'    0','menu':'Deactivated (EXPL only)'})
                  call add (items,{'word':'    1','menu':'With Penalty Constraint'})
               " IKFOR
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  call add (items,{'word':'    0','menu':'Deactivated'})
                  call add (items,{'word':'    1','menu':'Activated'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r5"
               " IDFRIC
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FRICT",10)
               " ICOUFR
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'         0','menu':'FRICT used'})
                  call add (items,{'word':'         1','menu':'Friction Averaged from COULFRIC Values'})
               " IDCNTPTY
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("CNTPTY",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
               " IRMV
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  call add (items,{'word':'    0','menu':'No Penetration Removal'})
                  call add (items,{'word':'    1','menu':'Modify Geometry'})
                  call add (items,{'word':'    2','menu':'Modify Contact Thickness'})
                  if synIDattr(slist[1], "name") =~ "pam_CNTAC36_r6"
                     call add (items,{'word':'   -2','menu':'Adjust Contact Thickness for Precise Contact'})
                  endif
                  if synIDattr(slist[1], "name") =~ "pam_CNTAC[35]4_r6" || synIDattr(slist[1], "name") =~ "pam_CNTAC154_r6"
                     call add (items,{'word':'   -2','menu':'Adjust Contact Thickness for Precise Contact'})
                     call add (items,{'word':'   -1','menu':'Adjust Slave Nodes for Precise Contact'})
                  endif
                  if synIDattr(slist[1], "name") =~ "pam_CNTAC44_r6"
                     let items = []
                     call add (items,{'word':'    0','menu':'No Penetration Removal'})
                     call add (items,{'word':'    3','menu':'Offset Global Thickness'})
                  endif
               " IEROD
               elseif synIDattr(slist[2], "name") =~ "pam_6.5.*"
                  call add (items,{'word':'    0','menu':'Deactivated'})
                  call add (items,{'word':'    1','menu':'Activated'})
               " ILEAK
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'    0','menu':'No Obstruction'})
                  call add (items,{'word':'    1','menu':'Obstruction is Considered'})
               " IAC32
               elseif synIDattr(slist[2], "name") =~ "pam_16.*"
                  call add (items,{'word':'    0','menu':'Automatic De-/Reactivation of Slave Entites'})
                  call add (items,{'word':'    1','menu':'No Automatic Treatment'})
               " ITHKSV
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " IOMIT
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  call add (items,{'word':'   -1','menu':'Deactivated'})
                  call add (items,{'word':'    0','menu':'Same as 2'})
                  call add (items,{'word':'    1','menu':'Activated, based on Topology'})
                  call add (items,{'word':'    2','menu':'Activated, based on Element Connectivity'})
                  call add (items,{'word':'    3','menu':'Activated, based on Element Connectivity, Size and Contact Thickness'})
               " IFRED
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  call add (items,{'word':'    0','menu':'Deactivated'})
                  call add (items,{'word':'    1','menu':'Activated'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r7"
               " IUPA
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  call add (items,{'word':'    0','menu':'Deactivated'})
                  call add (items,{'word':'    1','menu':'Activated'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
               " IHTR
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  call add (items,{'word':'    0','menu':'No Heat Transfer'})
                  call add (items,{'word':'    1','menu':'Conduction Heat Transfer'})
                  call add (items,{'word':'    2','menu':'Surface Heat Transfer'})
               " IPRES
               elseif synIDattr(slist[2], "name") =~ "pam_76.*"
                  call add (items,{'word':'    0','menu':'Interface Contribution taken into Account'})
                  call add (items,{'word':'    1','menu':'Interface Contribution NOT taken into Account'})
                  call add (items,{'word':'    2','menu':'Interface Contribution taken into Account + Output Activated'})
               endif
            endif
         " }}}
         " {{{ CNTAC 61
         elseif synIDattr(slist[0], "name") =~ "pam_CNTAC61"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
               " MASTG
               if col('.') <= 10
                  call add (items,{'word':'SPHERE    ','menu':'Node-to-Sphere Contact'})
                  call add (items,{'word':'CYLINDER  ','menu':'Node-to-Cylinder Contact'})
                  call add (items,{'word':'PLANE     ','menu':'Node-to-Plane Contact'})
               " IFRA
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FRAME",10)
               " SOLU
               elseif col('.') >= 41 && col('.') <= 50
                  call add (items,{'word':'LAGRANGE  ','menu':'Lagrange Multiplier Method'})
                  call add (items,{'word':'PENALTY   ','menu':'Penalty Method'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
               " IRMV
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  call add (items,{'word':'   -1','menu':'Adjust Slave Nodes for Precise Contact'})
                  call add (items,{'word':'    0','menu':'No Penetration Removal'})
                  call add (items,{'word':'    1','menu':'Modify Geometry'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
               " IPRES
               if synIDattr(slist[2], "name") =~ "pam_76.*"
                  call add (items,{'word':'    0','menu':'Interface Contribution taken into Account'})
                  call add (items,{'word':'    1','menu':'Interface Contribution NOT taken into Account'})
               endif
            endif
         " }}}
         " {{{ CNTAC 21
         elseif synIDattr(slist[0], "name") =~ "pam_CNTAC21"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC21_r3"
               " ISENS
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("SENSOR",10)
               " IMOD
               elseif col('.') >= 31 && col('.') <= 40
                  call add (items,{'word':'FORCE     ','menu':'Force vs. Penetration Formulation'})
                  call add (items,{'word':'STRESS    ','menu':'Stress vs. Penetration Formulation'})
               " IHYST
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'    0','menu':'Exponential Unloading'})
                  call add (items,{'word':'    1','menu':'Two Curves and Unloading Slope'})
                  call add (items,{'word':'    2','menu':'Quadratic Unloading'})
               " IPEN
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  call add (items,{'word':'    0','menu':'Initial Penetration not Substracted'})
                  call add (items,{'word':'    1','menu':'Initial Penetration Substracted'})
               " INFI
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  call add (items,{'word':'    0','menu':'Finite Element Size'})
                  call add (items,{'word':'    1','menu':'Element Extended to Infinity'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC21_r4"
               " IFUNFsd
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IFUNHd
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " IFUND0d
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC21_r5"
               " IFUNMCd
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_CNTAC21_r6"
               " IFUNMUd
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
         " }}}
         " {{{ CNTAC10
         elseif synIDattr(slist[0], "name") =~ "pam_CNTAC10"
            if synIDattr(slist[1], "name") =~ "pam_CNTAC10_r3"
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("SENSOR",10)
               endif
            endif
         endif
         " }}}
" }}}
" {{{ FRICT
      elseif synIDattr(slist[0], "name") =~ "pam_FRICT.*" 
         if synIDattr(slist[1], "name") =~ "pam_FRICT.*_r1"
            " IFROPT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       1','menu':'Standard Coulomb Friction Model'})
               call add (items,{'word':'       2','menu':'Pressure-Dependent Friction by Curve'})
               call add (items,{'word':'       3','menu':'Velocity-Dependent Friction by Curve'})
               call add (items,{'word':'       4','menu':'Pressure- and Velocity-Dependent Friction by Curve'})
               call add (items,{'word':'       5','menu':'Pressure-Dependent Friction by Standard Function 1'})
               call add (items,{'word':'       6','menu':'Pressure-Dependent Friction by Standard Function 2'})
               call add (items,{'word':'      10','menu':'Orthotropic Friction'})
               call add (items,{'word':'      11','menu':'Orthotropic Friction with Arbitrary Oriantation'})
               call add (items,{'word':'      12','menu':'User-Defined Friction'})
               call add (items,{'word':'      13','menu':'Lookup Table Dependent'})
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               " IPCUR/IVCIR
               if synIDattr(slist[1], "name") =~ "pam_FRICT2_r1"
                  let items = s:getTags("FUNCT",8)
               " IPCUR
               elseif synIDattr(slist[1], "name") =~ "pam_FRICT4_r1"
                  let items = s:getTags("FUNCT",8)
               " IDLKU
               elseif synIDattr(slist[1], "name") =~ "pam_FRICT13_r1"
                  let items = s:getTags("LOOKU",8)
               endif
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               " IDVCUR
               if synIDattr(slist[1], "name") =~ "pam_FRICT4_r1"
                  let items = s:getTags("FUNCT",8)
               endif
            endif
         endif
" }}}
" {{{ RUPMO
      elseif synIDattr(slist[0], "name") =~ "pam_RUPMO.*" 
         if synIDattr(slist[1], "name") =~ "pam_RUPMO.*_r1"
            " IRUPT
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       0','menu':'Uses Load Criterion'})
               call add (items,{'word':'       1','menu':'Uses Stress Criterion'})
               call add (items,{'word':'       2','menu':'User-Defined Rupture Criterion'})
               call add (items,{'word':'       3','menu':'User-Defined Rupture Criterion'})
               call add (items,{'word':'       5','menu':'Uses Loads Criterion'})
               call add (items,{'word':'       6','menu':'EWK Rupture Criterion'})
               call add (items,{'word':'       7','menu':'Uses Loads Criterion'})
               call add (items,{'word':'      11','menu':'User-Defined Rupture Criterion'})
               call add (items,{'word':'      12','menu':'User-Defined Rupture Criterion'})
               call add (items,{'word':'      13','menu':'User-Defined Rupture Criterion'})
            " IFMON
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Monitoring not Activated'})
               call add (items,{'word':'       1','menu':'Monitoring Rupture Criterion Without Rupture'})
            " FILTER
            elseif col('.') >= 33 && col('.') <= 40
               call add (items,{'word':'CYCLE   ','menu':'CYCLE Filter'})
               call add (items,{'word':'TIME    ','menu':'TIME Filter'})
            endif
         endif
" }}}
" {{{ SENSOR
      elseif synIDattr(slist[0], "name") =~ "pam_SENSOR.*" 
         if synIDattr(slist[1], "name") =~ "pam_SENSOR.*_r1"
            " ITYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       1','menu':'Activated by given Time'})
               call add (items,{'word':'       2','menu':'Activated by Imposed Acceleration Field'})
               call add (items,{'word':'       3','menu':'Activated by Computed Acceleration Field'})
               call add (items,{'word':'       4','menu':'Activated by Retractor Belt Feed Rate'})
               call add (items,{'word':'       5','menu':'Activated by Defined Logical Function'})
               call add (items,{'word':'       6','menu':'Activated by Contact Force'})
               call add (items,{'word':'       7','menu':'Activated by Relative Nodal Displacement'})
               call add (items,{'word':'       8','menu':'Activated by Airbag Pressure'})
               call add (items,{'word':'       9','menu':'Activated by Logical Combination of Sensors'})
               call add (items,{'word':'      10','menu':'Time-shifted Activation of base Sensor'})
               call add (items,{'word':'      11','menu':'Line Final Length Sewing Sensor'})
               call add (items,{'word':'      12','menu':'Extended Logical Sensor'})
               call add (items,{'word':'      13','menu':'Kinematic Damping Convergence Monitoring Sensor'})
               call add (items,{'word':'      14','menu':'Kinematic Nodal Motion'})
            " ISREV
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Use Default Settings'})
               call add (items,{'word':'       1','menu':'Disable Reversibility'})
               call add (items,{'word':'       2','menu':'Enable Reversibility'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR2_r3"
            " IACC
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("ACFLD",8)
            " ISIG
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       0','menu':'Magnitude of Signal Vector'})
               call add (items,{'word':'       1','menu':'Projection of Signal Vector on vector V'})
               call add (items,{'word':'       2','menu':'Projection on Plane Normal to Vector V'})
            " IRESP
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               call add (items,{'word':'       0','menu':'Activation when Calculated Signal level >= Target Signal level'})
               call add (items,{'word':'       1','menu':'Activation when Calculated Signal level <= Target Signal level'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR3_r3"
            " ISIG
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       0','menu':'Magnitude of Signal Vector'})
               call add (items,{'word':'       1','menu':'Projection of Signal Vector on vector V'})
               call add (items,{'word':'       2','menu':'Projection on Plane Normal to Vector V'})
            " IRESP
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'Activation when Calculated Signal level >= Target Signal level'})
               call add (items,{'word':'       1','menu':'Activation when Calculated Signal level <= Target Signal level'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR4_r3"
            " IRET
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("RETRA",8) + s:getTags("BELTS",8)
            " IRETPOS
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Used with RETRA'})
               call add (items,{'word':'       1','menu':'Used with BELTS, Retractor at the Beginning'})
               call add (items,{'word':'       2','menu':'Used with BELTS, Retractor at the End'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR5_r3"
            " LCS
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("FUNCT",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR6_r3"
            " IDCTC
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("CNTAC",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR7_r3"
            " IDNT
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Not Active'})
               call add (items,{'word':'       1','menu':'Active'})
            " IDNC
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'Not Active'})
               call add (items,{'word':'       1','menu':'Active'})
            " IMOTION
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'Displacement'})
               call add (items,{'word':'       1','menu':'Translational Velocity'})
               call add (items,{'word':'      10','menu':'Absolute Distance between Nodes'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR8_r3"
            " IDBAG
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("BAGIN",8)
            " IQUALI
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       1','menu':'OFF for <= Target, ON for > Target '})
               call add (items,{'word':'       2','menu':'OFF for >= Target, ON for < Target '})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR9_r3"
            " ISENS1
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("SENSOR",8)
            " ISENS2
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("SENSOR",8)
            " ILOGI
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Logical OR'})
               call add (items,{'word':'       1','menu':'Logical AND'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR10_r3"
            " ISENS1
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("SENSOR",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR11_r3"
            " IDSEW
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("SEWING",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR12_r3"
            " COP
            if col('.') >= 9 && col('.') <= 11
               call add (items,{'word':'OR ','menu':'Logical OR of All Sensors'})
               call add (items,{'word':'AND','menu':'Logical AND of All Sensors'})
               call add (items,{'word':'AGO','menu':'Logical AND within Groups, Logical OR between Groups'})
               call add (items,{'word':'OGA','menu':'Logical OR within Groups, Logical AND between Groups'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR12_r4"
            " ISENS1
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("SENSOR",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR13_r3"
            " KINTYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let start = 16
               call add (items,{'word':'       1','menu':'Fast Monitoring'})
               call add (items,{'word':'       2','menu':'Accurate Monitoring'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_SENSOR14_r3"
            " IMOTION
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'Displacement'})
               call add (items,{'word':'       1','menu':'Translational Velocities'})
               call add (items,{'word':'       2','menu':'Translational Accelerations'})
            endif
         endif
" }}}
" {{{ FRAME
      elseif synIDattr(slist[0], "name") =~ "pam_FRAME.*" 
         if synIDattr(slist[1], "name") =~ "pam_FRAME.*_r1"
            " IFRATY
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       0','menu':'Initial Orientation Rotates with attached Entity'})
               call add (items,{'word':'       1','menu':'Fixed Orientation'})
               call add (items,{'word':'       2','menu':'Self-Rotating Orientation'})
            " IAXIS
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'U,V Axes with two Vectors'})
               call add (items,{'word':'       1','menu':'U,V Axes with three Nodes'})
               call add (items,{'word':'       2','menu':'T,U Axes with two Vectors'})
               call add (items,{'word':'       3','menu':'T,U Axes with three Nodes'})
               call add (items,{'word':'       4','menu':'Cylindrical with two Nodes'})
               call add (items,{'word':'       5','menu':'Spherical with two Nodes'})
            endif
         endif
" }}}
"  {{{ PLY
      elseif synIDattr(slist[0], "name") =~ "pam_PLY.*"
         if synIDattr(slist[1], "name") =~ "pam_PLY.*_r1$"
            " ITYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       0','menu':'Unidirectional Composite Bi-Phase Ply'})
               call add (items,{'word':'       1','menu':'Unidirectional Composite Global Ply'})
               call add (items,{'word':'       2','menu':'Isometric Elastic-Plastic Damaging Ply'})
               call add (items,{'word':'       3','menu':'Anisotropic Elastic-Plastic Ply'})
               call add (items,{'word':'       4','menu':'Anisotropic Elastic-Plastic Hill 90 Ply'})
               call add (items,{'word':'       5','menu':'Hyperelastic Mooney-Rivlin Ply'})
               call add (items,{'word':'       6','menu':'Fabric Composite Bi-Phase Ply'})
               call add (items,{'word':'       7','menu':'Fabric Composite GLobal Ply'})
               call add (items,{'word':'       8','menu':'Fabric Composite Bi-Phase Ply (MAT 131)'})
            " FAILNP
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'No Failure Criterion'})
               call add (items,{'word':'       1','menu':'Failure Criterion Speficied'})
            " ISTRAT
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               call add (items,{'word':'       0','menu':'Strain Rate Switched Off'})
               call add (items,{'word':'       1','menu':'Cowper-Symonds Model'})
               call add (items,{'word':'       2','menu':'Johnson-Cook Model'})
               call add (items,{'word':'       3','menu':'Modified Jones Model'})
               call add (items,{'word':'       4','menu':'Left-Shifted Curve Model'})
               call add (items,{'word':'       5','menu':'Krupowski Model'})
            endif
         " {{{ PLY0
         elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r[56]" || synIDattr(slist[1], "name") =~ "pam_PLY0_r1[12]"
            " IFUNm*s
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               let items = s:getTags("FUNCT",10)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r7" || synIDattr(slist[1], "name") =~ "pam_PLY0_r13"
            " IFUNf*
            if synIDattr(slist[2], "name") =~ "pam_71.*"
               let items = s:getTags("FUNCT",10)
            endif
         " }}}
         " {{{ PLY1
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r4"
            " ISHD
            if synIDattr(slist[2], "name") =~ "pam_61.*"
               call add (items,{'word':'         0','menu':'Linear'})
               call add (items,{'word':'         1','menu':'Exponential'})
               call add (items,{'word':'         2','menu':'Curve'})
            " ITRD
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               call add (items,{'word':'         0','menu':'Linear'})
               call add (items,{'word':'         1','menu':'Exponential'})
               call add (items,{'word':'         2','menu':'Curve'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r7"
            " IFUNd1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let items = s:getTags("FUNCT",10)
            " IFUNd2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let items = s:getTags("FUNCT",10)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r9"
            " IBUCK
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               call add (items,{'word':'         0','menu':'Buckling Considered'})
               call add (items,{'word':'         1','menu':'Buckling Not Considered'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r1[12]"
            " ILAW*
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               call add (items,{'word':'  0.0','menu':'Power Law'})
               call add (items,{'word':'  1.0','menu':'Linear Law'})
               call add (items,{'word':'  2.0','menu':'Neperian Logarithmic Law'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r13"
            " ILAWTYPR0
            if synIDattr(slist[2], "name") =~ "pam_31.*"
               call add (items,{'word':'  0.0','menu':'Power Law'})
               call add (items,{'word':'  1.0','menu':'Linear Law'})
               call add (items,{'word':'  2.0','menu':'Neperian Logarithmic Law'})
            endif
         " }}}
         " {{{ PLY2
         elseif synIDattr(slist[1], "name") =~ "pam_PLY2c_r4"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               let items = s:getTags("FUNCT",10)
            " LC2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               let items = s:getTags("FUNCT",10)
            " LC3
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               let items = s:getTags("FUNCT",10)
            " LC4
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               let items = s:getTags("FUNCT",10)
            " LC5
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("FUNCT",10)
            " LC6
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let items = s:getTags("FUNCT",10)
            " LC7
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               let items = s:getTags("FUNCT",10)
            " LC8
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               let items = s:getTags("FUNCT",10)
            endif
         " }}}
         " {{{ PLY7
         elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r11"
            " ILAW*
            if synIDattr(slist[2], "name") =~ "pam_31.*"
               call add (items,{'word':'       0.0','menu':'Power Law'})
               call add (items,{'word':'       1.0','menu':'Linear Law'})
               call add (items,{'word':'       2.0','menu':'Neperian Logarithmic Law'})
            " ILAWTYP11c
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               call add (items,{'word':'       0.0','menu':'Power Law'})
               call add (items,{'word':'       1.0','menu':'Linear Law'})
               call add (items,{'word':'       2.0','menu':'Neperian Logarithmic Law'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r1[123]"
            " ILAW*
            if synIDattr(slist[2], "name") =~ "pam_31.*"
               call add (items,{'word':'       0.0','menu':'Power Law'})
               call add (items,{'word':'       1.0','menu':'Linear Law'})
               call add (items,{'word':'       2.0','menu':'Neperian Logarithmic Law'})
            endif
         " }}}
         " {{{ PLY8
         elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r[56]" || synIDattr(slist[1], "name") =~ "pam_PLY8_r1[23]"
            " IFUNm*s
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               let items = s:getTags("FUNCT",10)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r9"
            " IDAMCR
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'         0','menu':'Deviatoric/Volumetric Strain'})
               call add (items,{'word':'         1','menu':'Transverse Deformation/Plane Maximal Shear'})
            " IWARP
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               call add (items,{'word':'         0','menu':'Matrix Defined in the First Fiber Direction'})
               call add (items,{'word':'         1','menu':'Matrix Defined in the Mean Direction between Fibers'})
               call add (items,{'word':'         2','menu':'Matrix Half-Stiffness Defined in each Fiber Direction and Superposed'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r[78]" || synIDattr(slist[1], "name") =~ "pam_PLY8_r1[45]"
            " IFUNf*
            if synIDattr(slist[2], "name") =~ "pam_71.*"
               let items = s:getTags("FUNCT",10)
            endif
         " }}}
         " {{{ PLYFAILX
         elseif synIDattr(slist[1], "name") =~ "pam_PLYFAIL"
            " FAILDAM
            if synIDattr(slist[2], "name") =~ "pam_1.10.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_1.10.*")
               call add (items,{'word':'         0','menu':'Failure only for Output, Stress Tensor not Scaled, Damage and Elimination not Active'})
               call add (items,{'word':'         1','menu':'Failure Computed, Stress Tensor Scaled, Damage and Elimination Active'})
               call add (items,{'word':'         2','menu':'Failure Computed, Stress Tensor Scaled, Damage and Elimination When Fiber Criterion Reached'})
            " FAILTYP
            elseif synIDattr(slist[2], "name") =~ "pam_11.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_11.*")
               call add (items,{'word':'         0','menu':'Equivalent Shear Strain Criterion'})
               call add (items,{'word':'         1','menu':'Tsai-Wu Criterion'})
               call add (items,{'word':'         2','menu':'Hoffmann Criterion'})
               call add (items,{'word':'         3','menu':'Tsai-Hill Criterion'})
               call add (items,{'word':'         4','menu':'Modified Puck Criterion'})
               call add (items,{'word':'         5','menu':'Maximum Stress Criterion'})
               call add (items,{'word':'         6','menu':'Maximum Strain Criterion'})
               call add (items,{'word':'         7','menu':'Three Invariant Criterion'})
               call add (items,{'word':'         8','menu':'User-Defined Criterion'})
               call add (items,{'word':'         9','menu':'Equivalent Shear Stress Criterion'})
               call add (items,{'word':'        10','menu':'Puck 2000 Modell'})
            " IFUNmfc
            elseif synIDattr(slist[2], "name") =~ "pam_41.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_41.*")
               let items = s:getTags("FUNCT",10)
            " IDAMm
            elseif synIDattr(slist[2], "name") =~ "pam_51.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_51.*")
               call add (items,{'word':'         0','menu':'Based on Global Ply Criteria'})
               call add (items,{'word':'         1','menu':'Based on Matrix Criteria'})
            " IFUNffc
            elseif synIDattr(slist[2], "name") =~ "pam_61.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_61.*")
               let items = s:getTags("FUNCT",10)
            " IDAMf
            elseif synIDattr(slist[2], "name") =~ "pam_71.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_71.*")
               call add (items,{'word':'         0','menu':'Based on Global Ply Criteria'})
               call add (items,{'word':'         1','menu':'Based on Matrix Criteria'})
            " YSFTYP
            elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL10_r3" && synIDattr(slist[3], "name") =~ "pam_1.10.*"
               call add (items,{'word':'         0','menu':'Strain'})
               call add (items,{'word':'         1','menu':'Stress'})
            endif
         " }}}
         endif
"  }}}
"  {{{ PART
      elseif synIDattr(slist[0], "name") =~ "pam_PART.*"
         if synIDattr(slist[1], "name") =~ "pam_PART.*_r1"
            " ATYPE
            if synIDattr(slist[2], "name") =~ "pam_PART.*_r1_[ae]2"
               call add (items,'   SPHEL')
               call add (items,'   BSHEL')
               call add (items,'   COS3D')
               call add (items,'   SOLID')
               call add (items,'   SHELL')
               call add (items,'   MEMBR')
               call add (items,'     GAP')
               call add (items,'  MTOJNT')
               call add (items,'     BAR')
               call add (items,'   PLINK')
               call add (items,'   LLINK')
               call add (items,'    TIED')
               call add (items,'  SPRING')
               call add (items,'    BEAM')
               call add (items,'   TSHEL')
               call add (items,'   TETRA')
               call add (items,'   ELINK')
               call add (items,'   SLINK')
               call add (items,'  SPRGBM')
               call add (items,'   MBSPR')
               call add (items,'   JOINT')
               call add (items,'   KJOIN')
               call add (items,'   MBKJN')
            " IDMAT
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("MATER",8)
            " IDVAMAT
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("VAMAT",8)
            " IDTHMAT
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("THMAT",8)
            " IDPMAT
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("PFMAT",8)
            endif
         " {{{ MEMBR
         elseif synIDattr(slist[1], "name") =~ "pam_PART_MEMBR_r[67]"
            " IORT12
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               call add (items,{'word':'    0','menu':'Definition via Global Vector'})
               call add (items,{'word':'    1','menu':'Definition via Local Element Frame'})
            endif
         " }}}
         " {{{ SHELL
         elseif synIDattr(slist[1], "name") =~ "pam_PART_SHELL_r6"
            " IORT1
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               call add (items,{'word':'    0','menu':'Definition via Global Vector'})
               call add (items,{'word':'    1','menu':'Definition via Local Element Frame'})
            endif
         " }}}
         " {{{ SOLID
         elseif synIDattr(slist[1], "name") =~ "pam_PART_SOLID_r5"
            " IORT1
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               call add (items,{'word':'    0','menu':'Definition via Global Vector'})
               call add (items,{'word':'    1','menu':'Definition via Local Vector'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PART_SOLID_r6"
            " IORT2
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               call add (items,{'word':'    0','menu':'Definition via Global Vector'})
               call add (items,{'word':'    1','menu':'Definition via Local Vector'})
            endif
         " }}}
         " {{{ COS3D
         elseif synIDattr(slist[1], "name") =~ "pam_PART_COS3D_r5"
            " IMETH
            if synIDattr(slist[2], "name") =~ "pam_51.*"
               call add (items,{'word':'         1','menu':'Based on Element Frame'})
               call add (items,{'word':'         2','menu':'Based on Global Frame'})
               call add (items,{'word':'         3','menu':'Minimum Element Length'})
               call add (items,{'word':'         4','menu':'Maximum Element Length'})
            endif
      " }}}
         " {{{ BEAM
         elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r5"
            " ITPR
            if synIDattr(slist[2], "name") =~ "pam_56.*"
               call add (items,{'word':'    0','menu':'Constant Section Beam'})
               call add (items,{'word':'    1','menu':'Tapered Beam'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r9"
            " IDSEC
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               call add (items,{'word':'    0','menu':'Cross-Section via Integration Points'})
               call add (items,{'word':'    1','menu':'Thin-Walled Circular Section'})
               call add (items,{'word':'    2','menu':'Solid Circular Section'})
               call add (items,{'word':'    3','menu':'Thin-Walled Rectangular Section'})
               call add (items,{'word':'    4','menu':'Solid Rectangular Section'})
            endif
         " }}}
         " {{{ TIED/SLINK/ELINK
         elseif synIDattr(slist[1], "name") =~ "pam_PART_TIED_r5"
            " INEXT
            if synIDattr(slist[2], "name") =~ "pam_71.*"
               call add (items,{'word':'         0','menu':'No Orthotropic Axes Defined'})
               call add (items,{'word':'         1','menu':'Orthotropic Axes Defined via Additional Card'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_PART_TIED_r6"
            " IORT
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               call add (items,{'word':'    0','menu':'via Vector'})
               call add (items,{'word':'    1','menu':'via Local Element Frame'})
            endif
         " }}}
         " {{{ PLINK
         elseif synIDattr(slist[1], "name") =~ "pam_PART_PLINK_r5"
            " IRADBEN
            if synIDattr(slist[2], "name") =~ "pam_61.*"
               call add (items,{'word':'         0','menu':'Axial Displacement due to Bending'})
               call add (items,{'word':'         1','menu':'No Axial Displacement due to Bending'})
            endif
         " }}}
         endif
"  }}}
"  {{{ MATER 1D+LINK
      elseif synIDattr(slist[0], "name") =~ "pam_Mater[23][0-9][0-9]"
         if synIDattr(slist[1], "name") =~ "pam_Mater.*_r1$"
            " ISINT
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'C0 Reissner-Mindlin'})
               call add (items,{'word':'       1','menu':'C0 Reissner-Mindlin'})
               call add (items,{'word':'       2','menu':'C1 Euler-Bernoulli'})
            " ISTRA
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'No Strain Rates'})
               call add (items,{'word':'       1','menu':'Cowper-Symonds Law'})
               call add (items,{'word':'       2','menu':'Johnson-Cook Law(EXP)'})
               call add (items,{'word':'       3','menu':'Modified Jones Law(EXP)'})
               call add (items,{'word':'       4','menu':'Left Shifted Law(EXP)'})
               call add (items,{'word':'       5','menu':'Krupkowsky Law(EXP)'})
               call add (items,{'word':'     101','menu':'Creep Generalized Power Laww(IMP)'})
               call add (items,{'word':'     102','menu':'Creep Combined Power Law(IMP)'})
               call add (items,{'word':'     102','menu':'Creep Time Hardening Law(IMP)'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2a"
            " FILTER
            if synIDattr(slist[2], "name") =~ "pam_MaterX_r2a_[ae]1"
               call add (items,{'word':'    TIME','menu':'Time Filter'})
               call add (items,{'word':'   CYCLE','menu':'Solver Cycle Filter'})
            " INTERP
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Linear Interpolation'})
               call add (items,{'word':'       1','menu':'Logarithmic Interpolation'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2"
            " IMPD
            if synIDattr(slist[2], "name") =~ "pam_73.*"
                let items = s:getTags("MPD",8)
            endif
         " {{{ CURVE Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*c_r8" || synIDattr(slist[1], "name") =~ "pam_MATER.*c_r10"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                let items = s:getTags("FUNCT",10)
            " LC2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                let items = s:getTags("FUNCT",10)
            " LC3
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                let items = s:getTags("FUNCT",10)
            " LC4
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                let items = s:getTags("FUNCT",10)
            " LC5
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                let items = s:getTags("FUNCT",10)
            " LC6
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                let items = s:getTags("FUNCT",10)
            " LC7
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                let items = s:getTags("FUNCT",10)
            " LC8
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                let items = s:getTags("FUNCT",10)
            endif
         " }}}
         " {{{ ECURV Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*e_r8" || synIDattr(slist[1], "name") =~ "pam_Mater.*e_r10" 
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                let items = s:getTags("FUNCT",10)
            endif
         " }}}
         " {{{ MATER 204
         elseif synIDattr(slist[1], "name") =~ "pam_Mater204.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER204.*_r4" 
               " NLOAD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IHYST
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  call add (items,{'word':'    0','menu':'General Model'})
                  call add (items,{'word':'    1','menu':'Unloading via a Slope to a Curve'})
                  call add (items,{'word':'    2','menu':'Exponential Unloading Path'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER204.*_r5" 
               " NUNLD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " NDAMP
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " NMULT
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 205
         elseif synIDattr(slist[1], "name") =~ "pam_Mater205.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER205.*_r4" 
               " NLOAD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IHYST
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'    0','menu':'General Model'})
                  call add (items,{'word':'    1','menu':'Unloading via a Slope to a Curve'})
                  call add (items,{'word':'    2','menu':'Exponential Unloading Path'})
               endif
            endif
            " }}}
         " {{{ MATER 212
         elseif synIDattr(slist[1], "name") =~ "pam_Mater212.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER212.*_r7" 
               " FLIM
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  call add (items,{'word':'    0','menu':'Minimum Plastic Strain'})
                  call add (items,{'word':'    1','menu':'Maximum Plastic Strain'})
               endif
            endif
            " }}}
         " {{{ MATER 214
         elseif synIDattr(slist[1], "name") =~ "pam_Mater214.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER214.*_r4" 
               " LCMs
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LCMt
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               " ITYPM
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  call add (items,{'word':'    0','menu':'Standard Model'})
                  call add (items,{'word':'    1','menu':'Global Plasticit Hinge Model, Force-Elongation Definition'})
                  call add (items,{'word':'    2','menu':'Global Plasticit Hinge Model, Force-Strain Definition'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER214.*_r7" 
               " LYR
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LYS1
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LYS2
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LYT1
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LYT2
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER214.*_r8" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let items = s:getTags("FUNCT",10)
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 220/221/222
         elseif synIDattr(slist[1], "name") =~ "pam_Mater22[012].*"
            if synIDattr(slist[1], "name") =~ "pam_MATER22[01].*_r[468]" || synIDattr(slist[1], "name") =~ "pam_MATER220.*_r1[024]" || synIDattr(slist[1], "name") =~ "pam_MATER222.*_r[47]"
               " NLOAD*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IHt*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  call add (items,{'word':'    0','menu':'General Model'})
                  call add (items,{'word':'    1','menu':'Unloading via Slope'})
                  call add (items,{'word':'    2','menu':'Exponential Unloading Path'})
               " DOFt*
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  call add (items,{'word':'    0','menu':'No Coupling'})
                  call add (items,{'word':'    1','menu':'Coupling Using Saturation Model'})
                  call add (items,{'word':'   -1','menu':'Coupling Using Saturation Model (no Wall Slope)'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER22[01].*_r[579]" || synIDattr(slist[1], "name") =~ "pam_MATER220.*_r1[135]" || synIDattr(slist[1], "name") =~ "pam_MATER222.*_r[58]"
               " NUNL*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 223
         elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER223.*_r4"
               " NLOAD*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IHt*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  call add (items,{'word':'    0','menu':'No Hysteresis'})
                  call add (items,{'word':'    1','menu':'Unloading via Slope'})
                  call add (items,{'word':'    2','menu':'Exponential Unloading Path'})
               " NM**
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  let items = s:getTags("FUNCT",10)
               " INDOF
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  call add (items,{'word':'    4','menu':'Isotropic Behavior'})
                  call add (items,{'word':'    6','menu':'Tying All Six DOF'})
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("RUPMO",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER223.*_r[68]" || synIDattr(slist[1], "name") =~ "pam_MATER223.*_r1[024]"
               " NLOAD*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IHt*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  call add (items,{'word':'    0','menu':'No Hysteresis'})
                  call add (items,{'word':'    1','menu':'Unloading via Slope'})
                  call add (items,{'word':'    2','menu':'Exponential Unloading Path'})
               " NM**
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  let items = s:getTags("FUNCT",10)
               " ILENG
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  call add (items,{'word':'         0','menu':'Not Activated'})
                  call add (items,{'word':'         1','menu':'Activated'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER223.*_r[579]" || synIDattr(slist[1], "name") =~ "pam_MATER223.*_r1[135]"
               " NUNL*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " NDAMP*
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 224
         elseif synIDattr(slist[1], "name") =~ "pam_Mater224.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER224.*_r4" 
               " INDOF
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  call add (items,{'word':'         2','menu':'Isotropic Behavior with Free Rotational DOF'})
                  call add (items,{'word':'         3','menu':'Free Rotational DOF'})
                  call add (items,{'word':'         4','menu':'Isotropic Behavior'})
                  call add (items,{'word':'         6','menu':'Tying All Six DOF'})
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let items = s:getTags("RUPMO",10)
               " IFLGP
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  call add (items,{'word':'         0','menu':'Automatic Stiffness Computation'})
                  call add (items,{'word':'         1','menu':'User-Defined Constant Stiffness'})
                  call add (items,{'word':'         2','menu':'User-Defined Elastic Parameters'})
                  call add (items,{'word':'         3','menu':'User-Defined Timestep for Stiffness Computation'})
               endif
            endif
            " }}}
         " {{{ MATER 225
         elseif synIDattr(slist[1], "name") =~ "pam_Mater225.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER225_r[5-9]" || synIDattr(slist[1], "name") =~ "pam_MATER225_r10"
               " NLOADUP*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " NLOADLW
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " NDAMP*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 226
         elseif synIDattr(slist[1], "name") =~ "pam_Mater226.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER226_r4"
               " IDVU
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IDAU
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " ICHANNEL
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  call add (items,{'word':'         0','menu':'Channel Warming Off'})
                  call add (items,{'word':'         1','menu':'Channel Warming On'})
               endif
            endif
            " }}}
         " {{{ MATER 230
         elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER230.*_r[468]" || synIDattr(slist[1], "name") =~ "pam_MATER230.*_r1[024]"
               " NLOAD*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IHt*
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'    0','menu':'Unloading via Slope'})
                  call add (items,{'word':'    1','menu':'Exponential Unloading Path'})
                  if synIDattr(slist[1], "name") =~ "pam_MATER230.*_r12"
                     call add (items,{'word':'    2','menu':'Flexion-Torsion Joint Material Input'})
                  endif
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER230.*_r[579]" || synIDattr(slist[1], "name") =~ "pam_MATER230.*_r1[135]"
               " NUNL*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " NDAMP*
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 301
         elseif synIDattr(slist[1], "name") =~ "pam_Mater301.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER301.*_r4"
               " IDEABEN
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'         0','menu':'Normal to Element Master, Updated with Master Node Coordinates'})
                  call add (items,{'word':'         1','menu':'Same as 0, Out-of-Plane Loads in Master Deactivated'})
                  call add (items,{'word':'         2','menu':'Normal is Updated with Rotation of Master Node'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER301.*_r5"
               " IDOF
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  call add (items,{'word':'         0','menu':'Tying all 6 DOF'})
                  call add (items,{'word':'         1','menu':'Rotational DOF not Tied'})
               " ITENT
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'         0','menu':'Based on Slave Position with Respect to Master Surface'})
                  call add (items,{'word':'         1','menu':'Based on Master Segment Normal'})
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("RUPMO",10)
               endif
            endif
            " }}}
         " {{{ MATER 302
         elseif synIDattr(slist[1], "name") =~ "pam_Mater302.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER302.*_r4"
               " LSTNOR
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LSTTAN
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               " IFLGC
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  call add (items,{'word':'         0','menu':'Constant Stiffness'})
                  call add (items,{'word':'         1','menu':'Stiffness via Curves'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER302.*_r5"
               " IDOF
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  call add (items,{'word':'         0','menu':'Tying all 6 DOF'})
                  call add (items,{'word':'         1','menu':'Rotational DOF not Tied'})
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("RUPMO",10)
               endif
            endif
            " }}}
         " {{{ MATER 303
         elseif synIDattr(slist[1], "name") =~ "pam_Mater303.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER303.*_r4"
               " IDEABEN
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'         0','menu':'Based on Master Segment Normal'})
                  call add (items,{'word':'         1','menu':'Out of Plane Loads Deactivated'})
                  call add (items,{'word':'         2','menu':'Based on Rotation of Nodes of Master Segment'})
                  call add (items,{'word':'         3','menu':'Based on Rotation of Slave Node'})
                  call add (items,{'word':'         4','menu':'Based on Mean Master/Slave Rotation'})
               " IDELBEND
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  call add (items,{'word':'         0','menu':'Bending Coupling According to IDOF'})
                  call add (items,{'word':'         1','menu':'Bending Coupling Deactivated'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER303.*_r5"
               " IDOF
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  call add (items,{'word':'         0','menu':'Tying all 6 DOF'})
                  call add (items,{'word':'         1','menu':'Rotational DOF not Tied'})
               " IDELA
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'         0','menu':'Pickett Model'})
                  call add (items,{'word':'         1','menu':'Davida BK Model'})
                  call add (items,{'word':'         2','menu':'Davida Power Model'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER303.*_r8"
               " IFUNGcont
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 304
         elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER304.*_r4"
               " IDEABEN
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  call add (items,{'word':'         0','menu':'Out of Plane Loads Activated'})
                  call add (items,{'word':'         1','menu':'Out of Plane Loads Deactivated'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER304.*_r[5-8]"
               " ICUC*
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER304.*_r9" || synIDattr(slist[1], "name") =~ "pam_MATER304.*_r1[0-2]"
               " LKC*
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("LOOKU",10)
               endif
            endif
            " }}}
         " {{{ MATER 305
         elseif synIDattr(slist[1], "name") =~ "pam_Mater305.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER305.*_r4"
               " IELAST
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'         0','menu':'Inelastic Behavior Allowed'})
                  call add (items,{'word':'         1','menu':'Pure Elastic Behavior Enforced'})
               " IDELA
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  call add (items,{'word':'         0','menu':'Power Model'})
                  call add (items,{'word':'         1','menu':'BK Model'})
               " IDRUP
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("RUPMO",10)
               endif
            endif
            " }}}
         endif
"  }}}
"  {{{ MATER 2D
      elseif synIDattr(slist[0], "name") =~ "pam_Mater1[0-9][0-9]"
         if synIDattr(slist[1], "name") =~ "pam_Mater.*_r1$"
            " ISINT
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'Belytschko-Tsay (BT) Uniform Reduced Integration'})
               call add (items,{'word':'       1','menu':'Hughes-Tezduyar (HT) Full Integration'})
               call add (items,{'word':'       2','menu':'Belytschko-Wong-Chaing (BWC) Uniform Reduced Integration with AntiWarping Term'})
               call add (items,{'word':'       3','menu':'Belytschko-Wong-Chiang (BWC) with Assumed Shear and Membrane Fields'})
               call add (items,{'word':'       6','menu':'Batoz-Q4Gamma Full Integratioin (IMP)'})
            " ISHG
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               call add (items,{'word':'       0','menu':'Stiffness Method Using Elastic Modulus'})
               call add (items,{'word':'       1','menu':'Stiffness Method Using Plastic Modulus'})
               call add (items,{'word':'       2','menu':'Viscosity Method'})
               call add (items,{'word':'       3','menu':'Stiffness Method Using Elastic Modulus with Improved Orthogonality to RBODY Motion'})
               call add (items,{'word':'       4','menu':'Stiffness Method Using Plastic Modulus with Improved Orthogonality to RBODY Motion'})
               call add (items,{'word':'       5','menu':'Viscous Method Using Plastic Modulus with Improved Orthogonality to RBODY Motion'})
            " ISTRA
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'No Strain Rates'})
               call add (items,{'word':'       1','menu':'Cowper-Symonds Law'})
               call add (items,{'word':'       2','menu':'Johnson-Cook Law(EXP)'})
               call add (items,{'word':'       3','menu':'Modified Jones Law(EXP)'})
               call add (items,{'word':'       4','menu':'Left Shifted Law(EXP)'})
               call add (items,{'word':'       5','menu':'Krupkowsky Law(EXP)'})
               call add (items,{'word':'     101','menu':'Creep Generalized Power Laww(IMP)'})
               call add (items,{'word':'     102','menu':'Creep Combined Power Law(IMP)'})
               call add (items,{'word':'     102','menu':'Creep Time Hardening Law(IMP)'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2a"
            " FILTER
            if synIDattr(slist[2], "name") =~ "pam_MaterX_r2a_[ae]1"
               call add (items,{'word':'    TIME','menu':'Time Filter'})
               call add (items,{'word':'   CYCLE','menu':'Solver Cycle Filter'})
            " INTERP
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Linear Interpolation'})
               call add (items,{'word':'       1','menu':'Logarithmic Interpolation'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2"
            " IMPD
            if synIDattr(slist[2], "name") =~ "pam_73.*"
                let items = s:getTags("MPD",8)
            endif
         " {{{ CURVE Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*c_r5" || synIDattr(slist[1], "name") =~ "pam_Mater.*c_r11"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                let items = s:getTags("FUNCT",10)
            " LC2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                let items = s:getTags("FUNCT",10)
            " LC3
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                let items = s:getTags("FUNCT",10)
            " LC4
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                let items = s:getTags("FUNCT",10)
            " LC5
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                let items = s:getTags("FUNCT",10)
            " LC6
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                let items = s:getTags("FUNCT",10)
            " LC7
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                let items = s:getTags("FUNCT",10)
            " LC8
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                let items = s:getTags("FUNCT",10)
            endif
         " }}}
         " {{{ MATER 103
         elseif synIDattr(slist[1], "name") =~ "pam_Mater103.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER103e_r5" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER103.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  call add (items,{'word':'EPMX      ','menu':'Maximal Plastic Strain'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
               endif
            endif
            " }}}
         " {{{ MATER 105/106
         elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56].*"
            if synIDattr(slist[1], "name") =~ "pam_MATER10[56]e_r5" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER10[56].*_r7" 
               " FAILURE
               if synIDattr(slist[2], "name") =~ "pam_31.*" || synIDattr(slist[2], "name") =~ "pam_MATER10[56].*_r7_arg"
                  call add (items,{'word':'          ','menu':'Initial Equivalent Threshold for Damage Law'})
                  call add (items,{'word':'JCDTYP    ','menu':'Johnson-Cook Failure Law'})
                  call add (items,{'word':'HSRDTYP   ','menu':'Hill-Stoeren-Rice Failure Law'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER10[56].*_r8" 
               " IFELIM
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'         0','menu':'Use Minimum Strain over Thickness'})
                  call add (items,{'word':'         1','menu':'Use Maximum Strain over Thickness'})
                  call add (items,{'word':'         2','menu':'Use Minimum Damage over Thickness'})
                  call add (items,{'word':'         3','menu':'Use Maximum Damage over Thickness'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER10[56].*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  call add (items,{'word':'EPMX      ','menu':'Maximal Plastic Strain'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
                  call add (items,{'word':'DMG       ','menu':'Maximal Damage'})
               endif
            endif
            " }}}
         " {{{ MATER 108
         elseif synIDattr(slist[1], "name") =~ "pam_Mater108.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER108.*_r7" 
               " IORE
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'         0','menu':'Initial Isotropic Young Modulus'})
                  call add (items,{'word':'         1','menu':'Orthotropic Stiffness Dereived from Plasticity Law'})
                  call add (items,{'word':'         2','menu':'Orthotropic Stiffness Coefficients are Provided'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER108.*_r9" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  call add (items,{'word':'    0','menu':'Hill G,F,N Parameter'})
                  call add (items,{'word':'    1','menu':'Lankford P,Q,R Parameter'})
               " KEYWORD
               elseif synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  call add (items,{'word':'EPMX      ','menu':'Maximal Plastic Strain'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
               endif
            endif
            " }}}
         " {{{ MATER 109
         elseif synIDattr(slist[1], "name") =~ "pam_Mater109.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER109.*_r4" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  call add (items,{'word':'         1','menu':'Hill 90'})
                  call add (items,{'word':'         2','menu':'Barlat'})
                  call add (items,{'word':'         3','menu':'Vegter'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER109.*_r10" 
               " ICUR
               if synIDattr(slist[2], "name") =~ "pam_MATER109.*_r10_Arg"
                  if synIDattr(slist[3], "name") =~ "pam_11.*"
                     let items = s:getTags("FUNCT",10)
                  endif
               endif
            endif
            " }}}
         " {{{ MATER 110
         elseif synIDattr(slist[1], "name") =~ "pam_Mater110.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER110.*_r5" 
               " FNUM
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " RNUM
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 115
         elseif synIDattr(slist[1], "name") =~ "pam_Mater115.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER115.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  call add (items,{'word':'EPMX      ','menu':'Maximal Plastic Strain'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
                  call add (items,{'word':'DMG       ','menu':'Maximal Damage'})
               endif
            endif
            " }}}
         " {{{ MATER 116
         elseif synIDattr(slist[1], "name") =~ "pam_Mater116.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER116.*_r8" 
               " IFELIM
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'         0','menu':'Use Minimum Strain over Thickness'})
                  call add (items,{'word':'         1','menu':'Use Maximum Strain over Thickness'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER116.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  call add (items,{'word':'EPMX      ','menu':'Maximal Plastic Strain'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
                  call add (items,{'word':'DMG       ','menu':'Maximal Damage'})
               endif
            endif
            " }}}
         " {{{ MATER 117
         elseif synIDattr(slist[1], "name") =~ "pam_Mater117.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER117.*l_r5" 
               " ILUTYD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("LOOKU",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER117.*_r7" 
               " ILANK
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  call add (items,{'word':'         0','menu':'Standard Hill'})
                  call add (items,{'word':'         1','menu':'Hill with Lankford Coefficients'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER117.*_r9" 
               " NASSSPL
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  call add (items,{'word':'         0','menu':'Coefficients are Considered as Hill'})
                  call add (items,{'word':'         1','menu':'Coefficients are Considered as Lankford'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER117.*_r10" 
               " ICUR
               if synIDattr(slist[2], "name") =~ "pam_MATER117.*_r10_Arg"
                  if synIDattr(slist[3], "name") =~ "pam_11.*"
                     let items = s:getTags("FUNCT",10)
                  endif
               endif
            endif
            " }}}
         " {{{ MATER 118
         elseif synIDattr(slist[1], "name") =~ "pam_Mater118.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER118.*_r9" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  call add (items,{'word':'    0','menu':'Hill G,F,N Parameter'})
                  call add (items,{'word':'    1','menu':'Lankford P,Q,R Parameter'})
               " KEYWORD
               elseif synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  call add (items,{'word':'EPMX      ','menu':'Maximal Plastic Strain'})
                  call add (items,{'word':'DMG       ','menu':'Maximal Damage'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
               endif
            endif
            " }}}
         " {{{ MATER 126
         elseif synIDattr(slist[1], "name") =~ "pam_Mater126.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER126.*_r8" 
               " IELIM
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  call add (items,{'word':'         0','menu':'Eliminate Elements with Two Cracks'})
                  call add (items,{'word':'         1','menu':'Retain Elements with Two Cracks'})
               " ICC
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'         0','menu':'Ignore Crack Closure'})
                  call add (items,{'word':'         1','menu':'Consider Crack Closure'})
               endif
            endif
            " }}}
         " {{{ MATER 127
         elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater127.*_r8" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  call add (items,{'word':'         0','menu':'von Mises Yield Criterion'})
                  call add (items,{'word':'         1','menu':'Hill 1948 Yield Criterion'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r9" 
               " IFAIL
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  call add (items,{'word':'         0','menu':'Maximum Overall Criteria'})
                  call add (items,{'word':'         1','menu':'Average Overall Criteria'})
                  call add (items,{'word':'         2','menu':'Sum of all Criteria'})
               " IKINH
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  call add (items,{'word':'         0','menu':'Purely Isotropic Hardening'})
                  call add (items,{'word':'         1','menu':'Armonstrong-Frederick-Chaboche Type'})
                  call add (items,{'word':'         2','menu':'Ohno-Wang Type'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r1[02]" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let items = s:getTags("FUNCT",10)
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r14" 
               " IFUNFLD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IFUNMSO
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " IFILTMSO
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  call add (items,{'word':'         0','menu':'Filter with Respect to Plastic Strain Increment'})
                  call add (items,{'word':'         1','menu':'Filter with Respect to Time'})
               endif
            endif
            " }}}
         " {{{ MATER 128
         elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater128.*_r9" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  call add (items,{'word':'         0','menu':'Hill 1948 Yield Criterion'})
                  call add (items,{'word':'         1','menu':'Hill 1990 Yield Criterion'})
                  call add (items,{'word':'         2','menu':'Barlat 1991 Yield Criterion'})
               endif
            endif
            " }}}
         " {{{ MATER 130/131/132
         elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater130.*_r4" 
               " ILAY
               if synIDattr(slist[2], "name") =~ "pam_26.*"
                  call add (items,{'word':'    0','menu':'Define Stackup via Ply Database'})
                  call add (items,{'word':'    1','menu':'Define Stackup via Layer Database'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r5" 
               " IDPLY
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  let items = s:getTags("PLY",10)
                  let items = s:getTags("LAYER",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r6" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_Mater103_r9_[ae]1"
                  call add (items,{'word':'DMG       ','menu':'Maximal Damage'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
               " IFAIL
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'    0','menu':'No Element Elimination'})
                  call add (items,{'word':'    1','menu':'Element Elimination if One Ply Reaches Failure'})
                  call add (items,{'word':'    2','menu':'Element Elimination if All Plies Reach Failure'})
                  call add (items,{'word':'    3','menu':'Element Elimination if Neutral Axis Ply(ies) Reach Failure'})
                  call add (items,{'word':'    4','menu':'Element Elimination if Upper or Lower Surface Ply Reaches Failure'})
                  call add (items,{'word':'    5','menu':'Element Elimination if Specified Fraction of Plies Fail.'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r[7-9]" || synIDattr(slist[1], "name") =~ "pam_Mater130.*_r1[0-2]"
               " IDPLY1
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  let items = s:getTags("PLY",5)
               " IDPLY2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("PLY",5)
               " IDPLY3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("PLY",5)
               " IDPLY4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("PLY",5)
               " IDPLY5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("PLY",5)
               " IDPLY6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("PLY",5)
               " IDPLY7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let items = s:getTags("PLY",5)
               " IDPLY8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("PLY",5)
               endif
            endif
            " }}}
         " {{{ MATER 143
         elseif synIDattr(slist[1], "name") =~ "pam_Mater143.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER143_r7" 
               " LCmax
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               " IFAIL
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  call add (items,{'word':'         0','menu':'Failure Possible in Both Local Directions'})
                  call add (items,{'word':'         1','menu':'Failure Possible only in X Local Direction'})
                  call add (items,{'word':'         2','menu':'Failure Possible only in Y Local Direction'})
               " IFELIM
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  call add (items,{'word':'         0','menu':'Use Average Value over Thickness'})
                  call add (items,{'word':'         1','menu':'Use Minimum Value over Thickness'})
                  call add (items,{'word':'         2','menu':'Use Maximum Value over Thickness'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER143_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  call add (items,{'word':'EPMX      ','menu':'Maximal Plastic Strain'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
                  call add (items,{'word':'DMG       ','menu':'Maximal Damage'})
               endif
            endif
            " }}}
         " {{{ MATER 150
         elseif synIDattr(slist[1], "name") =~ "pam_Mater150.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER150_r4" 
               " IFLA90
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  call add (items,{'word':'         0','menu':'Not Used'})
                  call add (items,{'word':'         1','menu':'Used'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER150_r[56]" 
               " IWR1/2
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'    0','menu':'Tension-Compression'})
                  call add (items,{'word':'    1','menu':'Tension-Only'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER150_r8" 
               " IMATLAW
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  call add (items,{'word':'         0','menu':'2nd Piola-Kirchhoff Stresses and Green-Lagrange Strains'})
                  call add (items,{'word':'         1','menu':'Nominal Stressesw and engineering Strains'})
               " LCLEAK
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 151
         elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER151_r4" 
               " IFUN
               if synIDattr(slist[2], "name") =~ "pam_MATER151_r4_arg"
                  if synIDattr(slist[3], "name") =~ "pam_41.*"
                     let items = s:getTags("FUNCT",10)
                  " IHARD
                  elseif synIDattr(slist[3], "name") =~ "pam_71.*"
                     call add (items,{'word':'    0','menu':'Not Active'})
                     call add (items,{'word':'    1','menu':'Functions of Temperature'})
                     call add (items,{'word':'    2','menu':'Functions of Strain Rate'})
                     call add (items,{'word':'    3','menu':'Functions of Strain'})
                  " IHYST
                  elseif synIDattr(slist[3], "name") =~ "pam_76.*"
                     call add (items,{'word':'    0','menu':'Exponential Unloading Path'})
                     call add (items,{'word':'    1','menu':'Unloading via Slope'})
                     call add (items,{'word':'    2','menu':'Different Exponential Unloading and Reloading'})
                  endif
               " IHARD
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  call add (items,{'word':'    0','menu':'Not Active'})
                  call add (items,{'word':'    1','menu':'Functions of Temperature'})
                  call add (items,{'word':'    2','menu':'Functions of Strain Rate'})
                  call add (items,{'word':'    3','menu':'Functions of Strain'})
               " IHYST
               elseif synIDattr(slist[2], "name") =~ "pam_76.*"
                  call add (items,{'word':'    0','menu':'Exponential Unloading Path'})
                  call add (items,{'word':'    1','menu':'Unloading via Slope'})
                  call add (items,{'word':'    2','menu':'Different Exponential Unloading and Reloading'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER151_r[56]" 
               " LCload
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LCunl
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER151_r8" 
               " LCLEAK
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LCSTRS
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LCRAT1
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LCRAT2
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER151_r1[02]"
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let items = s:getTags("FUNCT",10)
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 152
         elseif synIDattr(slist[1], "name") =~ "pam_Mater152.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER152_r5" 
               " IWR1/2
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'    0','menu':'Tension-Compression'})
                  call add (items,{'word':'    1','menu':'Tension-Only'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER152_r8" 
               " LCLEAK
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 161
         elseif synIDattr(slist[1], "name") =~ "pam_Mater161.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER161_r5" 
               " IFLAW
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  call add (items,{'word':'         0','menu':'Plane Stress'})
                  call add (items,{'word':'         1','menu':'3D Stress-Strain Relation'})
               endif
            endif
            " }}}
         " {{{ MATER 162
         elseif synIDattr(slist[1], "name") =~ "pam_Mater162.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER162.*_r8" 
               " IFELIM
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'         0','menu':'Use Minimum Strain over Thickness'})
                  call add (items,{'word':'         1','menu':'Use Maximum Strain over Thickness'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER162.*_r9" 
               " KEYWORD
               if synIDattr(slist[2], "name") =~ "pam_MATER103_r9_[ae]1"
                  call add (items,{'word':'EPMX      ','menu':'Maximal Plastic Strain'})
                  call add (items,{'word':'THIC      ','menu':'Element Initial Thickness'})
                  call add (items,{'word':'DMG       ','menu':'Maximal Damage'})
               endif
            endif
            " }}}
         " {{{ MATER 171
         elseif synIDattr(slist[1], "name") =~ "pam_Mater171.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER171e_r5" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER171_r9" 
               " IW1
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  call add (items,{'word':'         0','menu':'Not Active'})
                  call add (items,{'word':'         1','menu':'Original Wilkins Implementation'})
               endif
            endif
            " }}}
         endif
"  }}}
"  {{{ MATER 3D
      elseif synIDattr(slist[0], "name") =~ "pam_Mater.*"
         if synIDattr(slist[1], "name") =~ "pam_Mater.*_r1$"
            " ISINT
            if synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'Uniform Reduced Integration'})
               call add (items,{'word':'       1','menu':'Selective Reduced Integration(EXP) || Mean Dilatation Approach (IMP)'})
               call add (items,{'word':'       2','menu':'Full Integration(IMP)'})
               call add (items,{'word':'       3','menu':'Uniform Reduced Integration with Mean Strain(EXP)'})
               call add (items,{'word':'       4','menu':'Incompatible Node Formulation(IMP)'})
            " ISHG
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               call add (items,{'word':'       0','menu':'Viscous Method Using Hourglass Base Vectors'})
               call add (items,{'word':'       1','menu':'Viscous Method Using Hourglass Shape Vectors'})
               call add (items,{'word':'       2','menu':'Stiffness Method Using Hourglass Shape Vectors'})
               call add (items,{'word':'       3','menu':'Incremental Displacement Puso Hourglass'})
               call add (items,{'word':'       4','menu':'Total Displacement Puso Hourglass'})
            " ISTRA
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'No Strain Rates'})
               call add (items,{'word':'       1','menu':'Cowper-Symonds Law'})
               call add (items,{'word':'       2','menu':'Johnson-Cook Law(EXP)'})
               call add (items,{'word':'       3','menu':'Modified Jones Law(EXP)'})
               call add (items,{'word':'       4','menu':'Left Shifted Law(EXP)'})
               call add (items,{'word':'       5','menu':'Krupkowsky Law(EXP)'})
               call add (items,{'word':'     101','menu':'Creep Generalized Power Laww(IMP)'})
               call add (items,{'word':'     102','menu':'Creep Combined Power Law(IMP)'})
               call add (items,{'word':'     102','menu':'Creep Time Hardening Law(IMP)'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2a"
            " FILTER
            if synIDattr(slist[2], "name") =~ "pam_MaterX_r2a_[ae]1"
               call add (items,{'word':'    TIME','menu':'Time Filter'})
               call add (items,{'word':'   CYCLE','menu':'Solver Cycle Filter'})
            " INTERP
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Linear Interpolation'})
               call add (items,{'word':'       1','menu':'Logarithmic Interpolation'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*_r2"
            " IMPD
            if synIDattr(slist[2], "name") =~ "pam_73.*"
                let items = s:getTags("MPD",8)
            endif
         " {{{ CURVE Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*c_r6" || synIDattr(slist[1], "name") =~ "pam_Mater62c_r5"
            " LC1
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                let items = s:getTags("FUNCT",10)
            " LC2
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                let items = s:getTags("FUNCT",10)
            " LC3
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                let items = s:getTags("FUNCT",10)
            " LC4
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                let items = s:getTags("FUNCT",10)
            " LC5
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                let items = s:getTags("FUNCT",10)
            " LC6
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                let items = s:getTags("FUNCT",10)
            " LC7
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                let items = s:getTags("FUNCT",10)
            " LC8
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                let items = s:getTags("FUNCT",10)
            endif
         " }}}
         " {{{ MATER 71
         elseif synIDattr(slist[1], "name") =~ "pam_Mater71.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER71e_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 62
         elseif synIDattr(slist[1], "name") =~ "pam_Mater62.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER62.*_r4" 
               " IFLAW
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  call add (items,{'word':'         0','menu':'Plane Stress'})
                  call add (items,{'word':'         1','menu':'3D Stress-Strain Relation'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER62_r8" 
               " IFELIM
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  call add (items,{'word':'         0','menu':'Use Minimum Strain over Thickness'})
                  call add (items,{'word':'         1','menu':'Use Maximum Strain over Thickness'})
               endif
            endif
            " }}}
         " {{{ MATER 52
         elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER52e_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER52.*_r8" 
               " DUDATYP
               if synIDattr(slist[2], "name") =~ "pam_MATER52.*_r8_[ae]1"
                  call add (items,{'word':'          ','menu':'Specified by Curves'})
                  call add (items,{'word':'LOOKU     ','menu':'Specified by Lookup Table'})
                  call add (items,{'word':'JCFRC     ','menu':'Specified by Johnson-Cook Damage Function'})
               " SHDATYP
               elseif synIDattr(slist[2], "name") =~ "pam_MATER52.*_r8_[ae]2"
                  call add (items,{'word':'          ','menu':'Specified by Curves'})
                  call add (items,{'word':'LOOKU     ','menu':'Specified by Lookup Table'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER52.*_r10" 
               " LCd1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LCd2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LCd3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LCd4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LCd5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               " LCd6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               " LCd7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let items = s:getTags("FUNCT",10)
               " LCd8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER52.*_r12" 
               " LCs1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LCs2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LCs3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LCs4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LCs5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               " LCs6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               " LCs7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let items = s:getTags("FUNCT",10)
               " LCs8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 47
         elseif synIDattr(slist[1], "name") =~ "pam_Mater47.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER47_r4"
               " LCc
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LCcunl
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LCt
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LCtunl
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER47_r7"
               " ISENS
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("SENSOR",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER47_r8"
               " IFUNDYN
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER47_r9"
               " IFUNDAMP
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 45
         elseif synIDattr(slist[1], "name") =~ "pam_Mater45.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater45_r4"
               " IRATEXT
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  call add (items,{'word':'         0','menu':'Interpolation Beyond Last Curve'})
                  call add (items,{'word':'         1','menu':'No Interpolation'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER45_r[57]" || synIDattr(slist[1], "name") =~ "pam_MATER45_r1[01]"
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  let items = s:getTags("FUNCT",10)
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  let items = s:getTags("FUNCT",10)
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER45_r9"
               " LCC_ul
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LCT_ul
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER45_r1[346]"
               " LCt11/LCt_ul11/IDFUNDYN
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " IDFUNDAMP
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 42
         elseif synIDattr(slist[1], "name") =~ "pam_Mater42.*"
            " A_*
            if synIDattr(slist[2], "name") =~ "pam_MATER42_r4_[ae]1" 
               call add (items,{'word':'CURVE     ','menu':'Volumetric Scale Factor'})
               call add (items,{'word':'SRFXY     ','menu':'Surface Scale Factor TL'})
               call add (items,{'word':'SRFYZ     ','menu':'Surface Scale Factor LW'})
               call add (items,{'word':'SRFXZ     ','menu':'Surface Scale Factor TW'})
               call add (items,{'word':'UNIDX     ','menu':'Unidirectional Scale Factor L'})
               call add (items,{'word':'UNIDY     ','menu':'Unidirectional Scale Factor T'})
               call add (items,{'word':'UNIDZ     ','menu':'Unidirectional Scale Factor W'})
               call add (items,{'word':'CRITE     ','menu':'Switch Criterion Scale Factor'})
               call add (items,{'word':'EQSHR     ','menu':'Equivalent Shear'})
            elseif synIDattr(slist[1], "name") =~ "pam_MATER42_r[4-9]" || synIDattr(slist[1], "name") =~ "pam_MATER42_r1[0-2]" 
               " IC*
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " MV*
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER42_r13" 
               " STRATfac
               if synIDattr(slist[2], "name") =~ "pam_71.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER42_r15" 
               " LCy
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LCdam
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               " Iswi
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'         0','menu':'Reversal of Behavior not Possible'})
                  call add (items,{'word':'         1','menu':'Reversal of Behavior Possible'})
               endif
            endif
            " }}}
         " {{{ MATER 38
         elseif synIDattr(slist[1], "name") =~ "pam_Mater38.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER38_r4" 
               " LTCsoft
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 37
         elseif synIDattr(slist[1], "name") =~ "pam_Mater37.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER37_r4" 
               " LTCsoft
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER37_r9" 
               " LTCuniax
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LTCbiax
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " LTCpshear
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               " LTCvol
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 36
         elseif synIDattr(slist[1], "name") =~ "pam_Mater36.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater36_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                   let items = s:getTags("FUNCT",10)
               " LC2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                   let items = s:getTags("FUNCT",10)
               " LC3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                   let items = s:getTags("FUNCT",10)
               " LC4
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                   let items = s:getTags("FUNCT",10)
               " LC5
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                   let items = s:getTags("FUNCT",10)
               " LC6
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                   let items = s:getTags("FUNCT",10)
               " LC7
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                   let items = s:getTags("FUNCT",10)
               " LC8
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                   let items = s:getTags("FUNCT",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater36_r8" 
               " LCmaxelim
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                   let items = s:getTags("FUNCT",10)
               endif
            endif
         " }}}
         " {{{ MATER 31
         elseif synIDattr(slist[1], "name") =~ "pam_Mater31.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER31.*_r4" 
               " IDPLY
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("PLY",10)
               endif
            endif
            " }}}
         " {{{ MATER 30
         elseif synIDattr(slist[1], "name") =~ "pam_Mater30.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER30.*_r4" 
               " IDPLY
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("PLY",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER30.*_r5" 
               " IFAIL
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'    0','menu':'Inactive'})
                  call add (items,{'word':'    1','menu':'Active'})
               endif
            endif
            " }}}
         " {{{ MATER 24
         elseif synIDattr(slist[1], "name") =~ "pam_Mater24.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER24.*_r5" 
               " NCRV1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " NCRV2
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               " NCRV3
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
            " }}}
         " {{{ MATER 17
         elseif synIDattr(slist[1], "name") =~ "pam_Mater17.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER17.*_r5" 
               " LTCload
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  let items = s:getTags("FUNCT",10)
               " LTCunl
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  let items = s:getTags("FUNCT",10)
               endif
            endif
         " }}}
         " {{{ MATER 16
         elseif synIDattr(slist[1], "name") =~ "pam_Mater16.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER16.*_r4" 
               " IYC
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  call add (items,{'word':'         0','menu':'von Mises'})
                  call add (items,{'word':'         1','menu':'Hill 1948'})
                  call add (items,{'word':'         2','menu':'Barlat 1991'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER16e_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                   let items = s:getTags("FUNCT",10)
               endif
            endif
         " }}}
         " {{{ MATER 1
         elseif synIDattr(slist[1], "name") =~ "pam_Mater1.*"
            if synIDattr(slist[1], "name") =~ "pam_MATER1.*_r5" 
               " KEYWIRD
               if synIDattr(slist[2], "name") =~ "pam_MATER1.*_r5_[ae]1"
                  call add (items,{'word':'AFCHA     ','menu':'Armstrong-Frederick-Chaboche Kinematic Hardening'})
                  call add (items,{'word':'OWANG     ','menu':'Ohno-Wang Kinematic Hardening'})
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER1l_r6" 
               " IDLUTYD
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                   let items = s:getTags("LOOKU",10)
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_MATER1e_r6" 
               " LC1
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                   let items = s:getTags("FUNCT",10)
               endif
            endif
         " }}}
         endif
"  }}}
"  {{{ VAMAT
      elseif synIDattr(slist[0], "name") =~ "pam_VAMAT.*"
         if synIDattr(slist[1], "name") =~ "pam_VAMAT.*_r1$"
            " VAMATYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       1','menu':'Acoustic Fluid Material'})
               call add (items,{'word':'       2','menu':'Porous Elastic Material'})
               call add (items,{'word':'       3','menu':'Equivalent Fluid Material'})
               call add (items,{'word':'       4','menu':'Isotropic Elastic Material'})
               call add (items,{'word':'       5','menu':'Septum'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_VAMAT2.*_r6" || synIDattr(slist[1], "name") =~ "pam_VAMAT4.*_r4"
            " IFUNe
            if synIDattr(slist[2], "name") =~ "pam_21.*"
               let items = s:getTags("FUNCT",10)
            " IFUNd
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               let items = s:getTags("FUNCT",10)
            endif
         endif
"  }}}
" {{{ MASS Card
      elseif synIDattr(slist[0], "name") =~ "pam_MASS"
         if synIDattr(slist[1], "name") =~ "pam_MASS_r1"
             " IFRA
             if col('.') >= 17 && col('.') <= 24
                let items = s:getTags("FRAME",8)
             endif
         endif
" }}}
" {{{ FUNCT
      elseif synIDattr(slist[0], "name") =~ "pam_FUNCT"
         if synIDattr(slist[1], "name") =~ "pam_FUNCT_r1"
            " IFLMEAS
            if synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'Dependence on Time'})
               call add (items,{'word':'       1','menu':'Dependence on measured Value'})
            " ICOMP
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               call add (items,{'word':'       0','menu':'Real Function'})
               call add (items,{'word':'       1','menu':'Complex Function'})
            endif
         endif
" }}}
"  {{{ LOOKU
      elseif synIDattr(slist[0], "name") =~ "pam_LOOKU"
         if synIDattr(slist[2], "name") =~ "pam_LOOKU_r3a"
            " IINT
            if synIDattr(slist[3], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'Linear'})
               call add (items,{'word':'       1','menu':'Logaritmic'})
               call add (items,{'word':'       2','menu':'Exponential'})
               call add (items,{'word':'       3','menu':'Closet Value'})
            " ILEXT
            elseif synIDattr(slist[3], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'Linear'})
               call add (items,{'word':'       1','menu':'Logaritmic'})
               call add (items,{'word':'       2','menu':'Exponential'})
               call add (items,{'word':'       3','menu':'Horizontal'})
            " IUEXT
            elseif synIDattr(slist[3], "name") =~ "pam_49.*"
               call add (items,{'word':'       0','menu':'Linear'})
               call add (items,{'word':'       1','menu':'Logaritmic'})
               call add (items,{'word':'       2','menu':'Exponential'})
               call add (items,{'word':'       3','menu':'Horizontal'})
            endif
         endif
"  }}}
"  {{{ SENPT
      elseif synIDattr(slist[0], "name") =~ "pam_SENPT"
         if synIDattr(slist[1], "name") =~ "pam_SENPT_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FRAME",8)
            " ACFLG
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'No Correction'})
               call add (items,{'word':'       1','menu':'Imposed Acceleration is Substracted from Output'})
               call add (items,{'word':'       2','menu':'Initial Acceleration is Substracted from Output'})
            " IDAFLG
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let items = s:getTags("ACFLD",8)
            endif
         endif
"  }}}
"  {{{ UDATA
      elseif synIDattr(slist[0], "name") =~ "pam_UDATA"
         if synIDattr(slist[1], "name") =~ "pam_UDATA_r1"
            " IUDTYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       0','menu':'User Subroutine'})
               call add (items,{'word':'       1','menu':'TCP/IP Communication'})
            " CUDSEL
            elseif col('.') >= 41 && col('.') <= 48
               call add (items,{'word':'CURVE   ','menu':'User Subroutine'})
            " IDCUD
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("FUNCT",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_UDATA_r3"
            " IDENT
            if col('.') >= 25 && col('.') <= 32
               call add (items,{'word':'COO     ','menu':'Coordinate'})
               call add (items,{'word':'DIS     ','menu':'Displacement'})
               call add (items,{'word':'VEL     ','menu':'Velocity'})
               call add (items,{'word':'ACC     ','menu':'Acceleration'})
            endif
         endif
"  }}}
"  {{{ THCRS
      elseif synIDattr(slist[0], "name") =~ "pam_THCRS"
         if synIDattr(slist[1], "name") =~ "pam_THCRS_r1"
            " TYPE1
            if synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 17 && col ('.') <= 21
               call add (items,{'word':'NODE ','menu':'Node :-)'})
            " VAR1
            elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 30 && col ('.') <= 34
               call add (items,{'word':'DISP ','menu':'Translational Displacement'})
               call add (items,{'word':'VELO ','menu':'Translational Velocity'})
               call add (items,{'word':'ACCE ','menu':'Translational Acceleration'})
               call add (items,{'word':'PRES ','menu':'Acoustic Pressure'})
            " COMP1
            elseif synIDattr(slist[2], "name") =~ "pam_35.*"
               call add (items,{'word':'       1','menu':'X-Axis'})
               call add (items,{'word':'       2','menu':'Y-Axis'})
               call add (items,{'word':'       3','menu':'Z-Axis'})
            " TYPE2
            elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 43 && col ('.') <= 47
               call add (items,{'word':'NODE ','menu':'Node :-)'})
            " VAR2
            elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 56 && col ('.') <= 60
               call add (items,{'word':'DISP ','menu':'Translational Displacement'})
               call add (items,{'word':'VELO ','menu':'Translational Velocity'})
               call add (items,{'word':'ACCE ','menu':'Translational Acceleration'})
               call add (items,{'word':'PRES ','menu':'Acoustic Pressure'})
            " COMP2
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               call add (items,{'word':'       1','menu':'X-Axis'})
               call add (items,{'word':'       2','menu':'Y-Axis'})
               call add (items,{'word':'       3','menu':'Z-Axis'})
            endif
         endif
"  }}}
"  {{{ PREFA/PREBM
      elseif synIDattr(slist[0], "name") =~ "pam_PREFA"
         if synIDattr(slist[1], "name") =~ "pam_PREFA_r1"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("FUNCT",8)
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("SENSOR",8)
            endif
         endif
"  }}}
"  {{{ PRESBC
      elseif synIDattr(slist[0], "name") =~ "pam_PRESBC"
         if synIDattr(slist[1], "name") =~ "pam_PRESBC_r1"
            " IFUNPR
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            " IOB
            elseif synIDattr(slist[2], "name") =~ "pam_PRESBC_r1_[ae]1"
               call add (items,{'word':'  0','menu':'Obstruction Considered'})
               call add (items,{'word':'  1','menu':'Obstruction Not Considered'})
            endif
         endif
"  }}}
"  {{{ ACFLD
      elseif synIDattr(slist[0], "name") =~ "pam_ACFLD"
         if synIDattr(slist[1], "name") =~ "pam_ACFLD_r1"
            " IFUN1
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            " IFUN3
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("FUNCT",8)
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let items = s:getTags("FRAME",8)
            endif
         endif
"  }}}
"  {{{ BDFOR
      elseif synIDattr(slist[0], "name") =~ "pam_BDFOR"
         if synIDattr(slist[1], "name") =~ "pam_BDFOR_r1"
            " KEYWORD
            if synIDattr(slist[2], "name") =~ "pam_BDFOR_r1_[ae]1"
               call add (items,{'word':'AFIELD','menu':'Acceleration Field'})
               call add (items,{'word':'VOLUME','menu':'Volumetric Force'})
               call add (items,{'word':'RADIAL','menu':'Centrifugal Force from Angular Velocity'})
               call add (items,{'word':'ROTACC','menu':'Centrifugal Force from Angular Acceleration'})
               call add (items,{'word':'PRSTRS','menu':'Bolt Preload Stress'})
               call add (items,{'word':'PRFORC','menu':'Bolt Preload Force'})
               call add (items,{'word':'PREND ','menu':'Bolt Preload End'})
            " IFUN1
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            " IFUN3
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("FRAME",8)
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               let items = s:getTags("SENSOR",8)
            endif
         endif
"  }}}
"  {{{ SLIPR
      elseif synIDattr(slist[0], "name") =~ "pam_SLIPR"
         if synIDattr(slist[1], "name") =~ "pam_SLIPR_r1"
            " IDFRIC
            if synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("FRICT",8)
            " ILOCK
            elseif synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'Locking Enabled'})
               call add (items,{'word':'       1','menu':'Locking Disabled'})
            endif
         endif
"  }}}
"  {{{ RETRA
      elseif synIDattr(slist[0], "name") =~ "pam_RETRA"
         if synIDattr(slist[1], "name") =~ "pam_RETRA_r1"
            " NBW2
            if synIDattr(slist[2], "name") =~ "pam_57.*"
               call add (items,{'word':'       0','menu':'Inside Element to be Entered'})
               call add (items,{'word':'       1','menu':'No Inside Element to be Entered, Pull-Out Disabled'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_RETRA_r3"
            " ISENSR
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("SENSOR",8)
            " ISPOOL
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            " ISENSP
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("SENSOR",8)
            " IREELR
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            " IREELC
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("FUNCT",8)
            " ICURFRC
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("FUNCT",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_RETRA_r4"
            " LLCURV
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("FUNCT",8)
            " LLSENS
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("SENSOR",8)
            " LLFLAG
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'Global Outlet'})
               call add (items,{'word':'       1','menu':'Local Outlet Starting with Zero'})
            endif
         endif
"  }}}
"  {{{ DAMP
      elseif synIDattr(slist[0], "name") =~ "pam_DAMP"
         if synIDattr(slist[1], "name") =~ "pam_DAMP_r1"
            " ISENS
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("SENSOR",8)
            " IDAMP
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'Absolute Velocities'})
               call add (items,{'word':'       1','menu':'Velocities Relative to Reference Node'})
               call add (items,{'word':'       2','menu':'Velocities Relative to Specified Vector'})
               call add (items,{'word':'       3','menu':'Velocities Relative to Nodal Group Average'})
               call add (items,{'word':'       4','menu':'Velocities Relative to Nodal Bounding Box'})
            " IMODE
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               call add (items,{'word':'       0','menu':'Select by Nodes'})
               call add (items,{'word':'       1','menu':'Select by Element Faces'})
               call add (items,{'word':'       2','menu':'Select by Nodes inside IDELE Solid'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_DAMP_r3"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
"  }}}
"  {{{ KINDA
      elseif synIDattr(slist[0], "name") =~ "pam_KINDA"
         if synIDattr(slist[1], "name") =~ "pam_KINDA_r1"
            " ISENS
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("SENSOR",8)
            " IDAMP
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'Absolute Velocities'})
               call add (items,{'word':'       1','menu':'Velocities Relative to Reference Node'})
               call add (items,{'word':'       2','menu':'Velocities Relative to Specified Vector'})
               call add (items,{'word':'       3','menu':'Velocities Relative to Nodal Group Average'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_KINDA_r3"
            " KINTYP
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               call add (items,{'word':'       1','menu':'without Convergence Test'})
               call add (items,{'word':'       2','menu':'with Convergence Test'})
               call add (items,{'word':'       3','menu':'Springback Simulation'})
               call add (items,{'word':'       4','menu':'Damping Applied to Articulated Rigid Bodies'})
            endif
         endif
"  }}}
"  {{{ INVEL
      elseif synIDattr(slist[0], "name") =~ "pam_INVEL"
         if synIDattr(slist[1], "name") =~ "pam_INVEL_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_65.*"
               let items = s:getTags("FRAME",8)
            " IRIGB
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               call add (items,{'word':'       0','menu':'not Used'})
               call add (items,{'word':'       1','menu':'Rigid Body Motion read from Extra Card'})
            endif
         endif
"  }}}
"  {{{ DISLIM
      elseif synIDattr(slist[0], "name") =~ "pam_DISLIM"
         if synIDattr(slist[1], "name") =~ "pam_DISLIM_r1"
            " IFUN
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("SENSOR",8)
            endif
         endif
"  }}}
"  {{{ BOUNC
      elseif synIDattr(slist[0], "name") =~ "pam_BOUNC"
         if synIDattr(slist[1], "name") =~ "pam_BOUNC_r1"
            " IFRA
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FRAME",8)
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("SENSOR",8)
            endif
         endif
"  }}}
"  {{{ x3D
      elseif synIDattr(slist[0], "name") =~ "pam_x3D"
         if synIDattr(slist[1], "name") =~ "pam_x3D_r1"
            " IFUN1
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            " IFUN3
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_65.*"
               let items = s:getTags("FRAME",8)
            " ISENS
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               let items = s:getTags("SENSOR",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_x3D_r2"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_x3D_r2_[ae]1"
               call add (items,{'word':'INITIAL ','menu':'Initial Mesh of the Whole Simulation'})
               call add (items,{'word':'STAGE   ','menu':'Starting Mesh of the Alternate Stage'})
               call add (items,{'word':'DEFORM  ','menu':'Starting Mesh od Alternate or Continuous Stage'})
            endif
         endif
"  }}}
"  {{{ VAMPSO
      elseif synIDattr(slist[0], "name") =~ "pam_VAMPSO"
         if synIDattr(slist[1], "name") =~ "pam_VAMPSO_r3"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_VAMPSO_r3_[ae]1"
               call add (items,{'word':'PRESSURE','menu':'Pressure Source'})
               call add (items,{'word':'FLOW    ','menu':'Flow Source'})
            " IFUNC
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
"  }}}
"  {{{ VAABSO
      elseif synIDattr(slist[0], "name") =~ "pam_VAABSO"
         if synIDattr(slist[1], "name") =~ "pam_VAABSO_r3"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_VAABSO_r3_[ae]1"
               call add (items,{'word':'IMPED   ','menu':'Impedance'})
               call add (items,{'word':'SIMPED  ','menu':'Specific Impedance'})
               call add (items,{'word':'ADMIT   ','menu':'Admittance'})
               call add (items,{'word':'SADMIT  ','menu':'Specific Admittance'})
            " IFUNC
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
"  }}}
"  {{{ FBC3D
      elseif synIDattr(slist[0], "name") =~ "pam_FBC3D"
         if synIDattr(slist[1], "name") =~ "pam_FBC3D_r1"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_FBC3D_r1_[ae]1"
               call add (items,{'word':'ACCE    ','menu':'Acceleration'})
               call add (items,{'word':'VELO    ','menu':'Velocity'})
               call add (items,{'word':'DISP    ','menu':'Displacement'})
            " IFUN1
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            " IFUN2
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            " IFUN3
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               let items = s:getTags("FUNCT",8)
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_73.*"
               let items = s:getTags("FRAME",8)
            endif
         endif
"  }}}
"  {{{ FBCFA
      elseif synIDattr(slist[0], "name") =~ "pam_FBCFA"
         if synIDattr(slist[1], "name") =~ "pam_FBCFA_r1"
            " QUALIFIER
            if synIDattr(slist[2], "name") =~ "pam_FBCFA_r1_[ae]1"
               call add (items,{'word':'ACCE    ','menu':'Acceleration'})
               call add (items,{'word':'VELO    ','menu':'Velocity'})
               call add (items,{'word':'DISP    ','menu':'Displacement'})
            " IFUNC
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
"  }}}
"  {{{ ACTUA
      elseif synIDattr(slist[0], "name") =~ "pam_ACTUA"
         if synIDattr(slist[1], "name") =~ "pam_ACTUA_r1"
            " QUALIFIER1
            if synIDattr(slist[2], "name") =~ "pam_ACTUA_r1_[ae]1"
               call add (items,{'word':'DISP    ','menu':'Displacement'})
               call add (items,{'word':'VELO    ','menu':'Velocity'})
               call add (items,{'word':'ACCE    ','menu':'Acceleration'})
            " IFUN
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            " QUALIFIER2
            elseif synIDattr(slist[2], "name") =~ "pam_ACTUA_r1_[ae]2"
               call add (items,{'word':'INITIAL ','menu':'Initial Mesh of Whole Simulation is Used'})
               call add (items,{'word':'STAGE   ','menu':'Initial Mesh of Alternate Stage is Used'})
               call add (items,{'word':'DEFORM  ','menu':'Initial Mesh of Alternate or Continuous Stage is Used'})
            endif
         endif
"  }}}
"  {{{ LCPSD
      elseif synIDattr(slist[0], "name") =~ "pam_LCPSD"
         if synIDattr(slist[1], "name") =~ "pam_LCPSD_r1"
            " LCUR
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
"  }}}
"  {{{ DRAPF
      elseif synIDattr(slist[0], "name") =~ "pam_DRAPF"
         if synIDattr(slist[1], "name") =~ "pam_DRAPF_r1"
            " IDLAYER
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("LAYER",8)
            " IMPORT
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       1','menu':'UD/Fabric Ply Fiber Orientation'})
               call add (items,{'word':'       2','menu':'Fabric Warp Angle'})
               call add (items,{'word':'       3','menu':'Fabrib Weft Angle'})
               call add (items,{'word':'       4','menu':'WiseTex Stiffness Matrix'})
            endif
         endif
"  }}}
"  {{{ MSTRM
      elseif synIDattr(slist[0], "name") =~ "pam_MSTRM"
         if synIDattr(slist[1], "name") =~ "pam_MSTRM_r3"
            " IFLG
            if synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'       0','menu':'No Rotational Inertia Considered'})
               call add (items,{'word':'       1','menu':'Rotational Inertia Taken into Account'})
            " IOUT
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'No Output in NSMAS Format'})
               call add (items,{'word':'       1','menu':'Output Results in File nsmasinclu.dat'})
            endif
         endif
"  }}}
"  {{{ SUBDF
      elseif synIDattr(slist[0], "name") =~ "pam_SUBDF"
         if synIDattr(slist[1], "name") =~ "pam_SUBDF_r1"
            " IDEFNOD
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               call add (items,{'word':'       0','menu':'Nodes by All Elements in Substructure, Boundary Nodes Only'})
               call add (items,{'word':'       1','menu':'Nodes by All Elements in Substructure, Boundary and User-Defined Nodes'})
               call add (items,{'word':'       2','menu':'Only User-Defined Nodes'})
            " IFRAM
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FRAME",8)
            " IFRB
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'       0','menu':'No Additional Node Will be Added'})
               call add (items,{'word':'       1','menu':'All Slave Nodes in the same RBODY Included'})
            endif
         endif
"  }}}
"  {{{ IMPORT
      elseif synIDattr(slist[0], "name") =~ "pam_IMPORT"
         if synIDattr(slist[1], "name") =~ "pam_IMPORT_r1"
            " IPLOT
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               call add (items,{'word':'       0','menu':'No Check File'})
               call add (items,{'word':'       1','menu':'Check File with Geometry Alone'})
               call add (items,{'word':'       2','menu':'Check File with Geometry and Element Variables'})
            " IPF
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               call add (items,{'word':'       0','menu':'New Process'})
               call add (items,{'word':'       1','menu':'Continuation of Previous Process'})
            endif
         endif
"  }}}
"  {{{ EXPORT
      elseif synIDattr(slist[0], "name") =~ "pam_EXPORT"
         if synIDattr(slist[1], "name") =~ "pam_EXPORT_r1"
            " IFILE
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               call add (items,{'word':'       0','menu':'Binary'})
               call add (items,{'word':'       1','menu':'ASCII'})
            " IOUTFRAM
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       0','menu':'Standard 2G Format'})
               call add (items,{'word':'       1','menu':'Old 2G Format'})
            endif
         endif
"  }}}
"  {{{ RMSSOL
      elseif synIDattr(slist[0], "name") =~ "pam_RMSSOL"
         if synIDattr(slist[1], "name") =~ "pam_RMSSOL_r1"
            " IDTIED
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("PART",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_RMSSOL_r3"
            " CRIT
            if synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]1"
               call add (items,{'word':'VARS    ','menu':'Variable Criterion'})
            " KW1
            elseif synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]2"
               call add (items,{'word':'EPST    ','menu':'Effective Plastic Strain'})
               call add (items,{'word':'DCDM    ','menu':'DC Damage Parameter (MAT171)'})
               call add (items,{'word':'STRV    ','menu':'Von Mises Stress'})
               call add (items,{'word':'THIN    ','menu':'Shell Thinning'})
               call add (items,{'word':'JCFR    ','menu':'Johnson-Cook Fracture'})
            " KW2
            elseif synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]3"
               call add (items,{'word':'MAXV    ','menu':'Maximum Value'})
               call add (items,{'word':'MINV    ','menu':'Minimum Value'})
            endif
         endif
"  }}}
"  {{{ FUNCSW
      elseif synIDattr(slist[0], "name") =~ "pam_FUNCSW"
         if synIDattr(slist[1], "name") =~ "pam_FUNCSW_r1"
            " ISWTYP
            if synIDattr(slist[2], "name") =~ "pam_17.*"
               call add (items,{'word':'       1','menu':'Switch by Sensor'})
            " INOSNS
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               call add (items,{'word':'      -2','menu':'Print Error Message and Stop'})
               call add (items,{'word':'      -1','menu':'Print Warning and use IFUNNO'})
               call add (items,{'word':'       0','menu':'Return Value ZERO'})
               call add (items,{'word':'       1','menu':'Use IFUNNO'})
            " IFUNNO
            elseif synIDattr(slist[2], "name") =~ "pam_33.*"
               let items = s:getTags("FUNCT",8)
            " IMUSNS
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               call add (items,{'word':'      -2','menu':'Print Error Message and Stop'})
               call add (items,{'word':'      -1','menu':'Print Warning and use IFUNMU'})
               call add (items,{'word':'       0','menu':'Return Value ZERO'})
               call add (items,{'word':'       1','menu':'Use IFUNNO'})
               call add (items,{'word':'       2','menu':'Sum up the Values of all Active Sensors'})
               call add (items,{'word':'       3','menu':'Average all Values of Active Sensors'})
               call add (items,{'word':'       4','menu':'Maximum of all Active Sensor Values'})
               call add (items,{'word':'       5','menu':'Minimum of all Active Sensor Values'})
            " IFUNMU
            elseif synIDattr(slist[2], "name") =~ "pam_49.*"
               let items = s:getTags("FUNCT",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_FUNCSW_r3"
            " ISENS
            if synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("SENSOR",8)
            " IFUN
            elseif synIDattr(slist[2], "name") =~ "pam_17.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
"  }}}
"  {{{ TURBL
      elseif synIDattr(slist[0], "name") =~ "pam_TURBL"
         if synIDattr(slist[1], "name") =~ "pam_TURBL_r1"
            " MODEL
            if synIDattr(slist[2], "name") =~ "pam_TURBL_r1_[ae]1"
               call add (items,{'word':'CORCOS  ','menu':'Corcos Model'})
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r3"
            " IFUNpsd
            if synIDattr(slist[2], "name") =~ "pam_1.8.*"
               let items = s:getTags("FUNCT",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r4"
            " IDIR
            if synIDattr(slist[2], "name") =~ "pam_1.8.*"
               call add (items,{'word':'       1','menu':'X or R Axis'})
               call add (items,{'word':'       2','menu':'Y or S Axis'})
               call add (items,{'word':'       3','menu':'Z or T Axis'})
            " IFRA
            elseif synIDattr(slist[2], "name") =~ "pam_9.*"
               let items = s:getTags("FRAME",8)
            " IFUNuc
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r5"
            " IFUNc1
            if synIDattr(slist[2], "name") =~ "pam_1.8.*"
               let items = s:getTags("FUNCT",8)
            " IFUNc2
            elseif synIDattr(slist[2], "name") =~ "pam_25.*"
               let items = s:getTags("FUNCT",8)
            endif
         endif
"  }}}
      endif
      return sort(items)
   endif
" }}}
endfunc

function! s:getTags(pamName,length)
   let results = []
   for i in range (len (g:dictlist))
      if g:dictlist[i]['pamkind'] == a:pamName
        let replace = g:dictlist[i]['name']
        while strlen (replace) < a:length
          let replace = ' '.replace 
        endwhile
        call add (results,{'word':replace,'menu':g:dictlist[i]['pamname']})
      endif
   endfor   
   return results
endfunction

function! pamcomplete#pamHints()
   let slist = synstack (line("."), col("."))
   if len (slist) == 0
      return ''
   elseif len (slist) == 1
      call add (slist,'')
      call add (slist,'')
      call add (slist,'')
   elseif len (slist) == 2
      call add (slist,'')
      call add (slist,'')
   elseif len (slist) == 3
      call add (slist,'')
   endif
"  {{{ CONTACT
   if synIDattr(slist[0], "name") =~ "pam_CNTAC.*"
      if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "NTYPE - Type of Contact (menu)"
         endif
      endif
      " {{{ CNTAC 37/43/46
      if synIDattr(slist[0], "name") =~ "pam_CNTAC37" || synIDattr(slist[0], "name") =~ "pam_CNTAC4[36]"
         if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'T1SL - Contact Activation Time'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'T2SL - Contact Deactivation Time'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'ISENS - Sensor ID for Activation Control (tag)'
            elseif synIDattr(slist[2], "name") =~ "pam_31..*"
               return 'Hcont - Contact Thickness'
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return 'ITPRT - Contact Interaction Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return 'NINSEC - Node-to-Edge Activation Flag'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r4"
            if synIDattr(slist[2], "name") =~ "pam_6.10.*"
               return 'SLFACM - Scale Factor for Sliding Interface Penalty'
            elseif synIDattr(slist[2], "name") =~ "pam_16.10.*"
               return 'FSVNL - Nonlinear Penalty Stiffness Parameter'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'PENKIN - Allowed Penetration before Kinematic Forces are Applied'
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return 'TLSTIF - Timestep for Stiffness Computation'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r5"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'FRICT - Constant Friction Coefficient'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'XDMP1 - Stiffness Proportional Damping Ratio'
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return 'ICOUFR - Flag to Control Coulomb Friction Type (menu)'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               return 'ILEAK - Leackage Area Obstruction Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'IRMV - Initial Penetration Treatment Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'IOMIT - Small Element Treatment Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_36.*"
               return 'IFRED - Advanced Free Edge Treatment Flag (menu)'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
            if synIDattr(slist[2], "name") =~ "pam_76.*"
               return 'IPRES - Flag to Supress Contact Pressure Assembly (menu)'
            endif
         endif
      " }}}
      " {{{ CNTAC 33/34/36/44/54/154
      elseif synIDattr(slist[0], "name") =~ "pam_CNTAC3[46]" || synIDattr(slist[0], "name") =~ "pam_CNTAC[45]4" || synIDattr(slist[0], "name") =~ "pam_CNTAC154"
         if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'T1SL - Contact Activation Time'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'T2SL - Contact Deactivation Time'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'ISENS - Sensor ID for Activation Control (tag)'
            elseif synIDattr(slist[2], "name") =~ "pam_31..*"
               return 'Hcont - Contact Thickness'
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return 'ITPRT - Contact Interaction Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_46.*"
               return 'IORI - Master Surface Orientation Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return 'IEDGE - Node-to-Edge Activation Flag (menu)'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r4"
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               return 'IPCP - Precise Contact Pressure Calculation Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_6.10.*"
               return 'SLFACM - Scale Factor for Sliding Interface Penalty'
            elseif synIDattr(slist[2], "name") =~ "pam_16.*"
               return 'FSVNL - Nonlinear Penalty Stiffness Parameter'
            elseif synIDattr(slist[2], "name") =~ "pam_26.*"
               return 'IKFOR - Kinematic Contact Forces Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'PENKIN - Allowed Penetration before Kinematic Forces are Applied'
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return 'TLSTIF - Timestep for Stiffness Computation'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r5"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'FRICT - Constant Friction Coefficient'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'IDFRIC - Advanced Friction Model ID (tag)'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'XDMP1 - Stiffness Proportional Damping Ratio'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'XDMPT - Stiffness Proportional Damping Ration in Tangential Direction'
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return 'ICOUFR - Flag to Control Coulomb Friction Type (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return 'IDCNTPTY - Contact Property Definition ID (tag)'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               return 'IRMV - Initial Penetration Treatment Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_6.5.*"
               return 'IEROD - Eroding Contact for Solid Element Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'ILEAK - Leackage Area Obstruction Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_16.*"
               return 'IAC32 - Automatic LINK/TIED Compatibility (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'ITHHKSV - Curve ID for Contact Thickness Offset Function (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'IOMIT - Small Element Treatment Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_36.*"
               return 'IFRED - Advanced Free Edge Treatment Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return 'DTHKPLK - Local Slave Node Contact Thickness Reduction for LINKs'
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return 'ADJTOL - Distance Tolerance for Adjustment of Slave Nodes'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r7"
            if synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'SEPSTR - Separation Stress'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'SEPTHK - Separation search Factor'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'IUPA - Flag to Activate Update of Slave Nodes (menu)'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               return 'IHTR - Heat Transfer Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_6.10.*"
               return 'HTCOND - Heat Conductivity'
            elseif synIDattr(slist[2], "name") =~ "pam_16.*"
               return 'HTSURF - Surface Heat Transfer Coefficient'
            elseif synIDattr(slist[2], "name") =~ "pam_46.*"
               return 'TSCAL - Surface Offset Scale Factor for Solid Materials'
            elseif synIDattr(slist[2], "name") =~ "pam_56.*"
               return 'SDISini - Initial Search Distance'
            elseif synIDattr(slist[2], "name") =~ "pam_66.*"
               return 'Tshadow - Shadow Length'
            elseif synIDattr(slist[2], "name") =~ "pam_76.*"
               return 'IPRES - Flag to Supress Contact Pressure Assembly (menu)'
            endif
         endif
      " }}}
      " {{{ CNTAC 61
      elseif synIDattr(slist[0], "name") =~ "pam_CNTAC61"
         if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
            if col('.') <= 10
               return 'MASTG - Master Surface Geometry Type (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'IDNODC - Cylinder/Sphere Node ID'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'RADCS - Radius of Cylinder/Sphere'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'IFRA - Cylinder Axis Frame ID (tag)'
            elseif col('.') >= 41 && col('.') <= 50
               return 'SOLU - Solution Method (menu)'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r4"
            if synIDattr(slist[2], "name") =~ "pam_6.10.*"
               return 'SLFACM - Scale Factor for Sliding Interface Penalty'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
            if synIDattr(slist[2], "name") =~ "pam_1.5.*"
               return 'IRMV - Initial Penetration Treatment Flag (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return 'ADJTOL - Distance Tolerance for Adjustment of Slave Nodes'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r8"
            if synIDattr(slist[2], "name") =~ "pam_76.*"
               return 'IPRES - Flag to Supress Contact Pressure Assembly (menu)'
            endif
         endif
      " }}}
      " {{{ CNTAC 21
      elseif synIDattr(slist[0], "name") =~ "pam_CNTAC21"
         if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'T1SL - Contact Activation Time'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'T2SL - Contact Deactivation Time'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'ISENS - Sensor ID for Activation Control (tag)'
            elseif col('.') >= 31 && col('.') <= 40
               return 'IMOD - Contact Model Formulation (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return 'IHYST - Hysteresis Model Formulation (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_46.*"
               return 'IPEN - Initial Penetration Substraction (menu)'
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return 'INFI - Infinite Element Size (menu)'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r4"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'IFUNFsd - Force-Penetration Function ID (tag)'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'IFUNHd | NUNLDd - Energy Absorbtion Factor Function ID (tag) | Unload Curve ID'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'IFUN0d | SLOPE - Permanent Penetration Factor Curve ID (tag) | Loading/Unloading Transition Slope'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'DEPREF - Reference Depth'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r5"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'IFUNCd - Damping Function ID (tag)'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'C - Damping Coefficient'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r6"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'IFUNMUd - Friction Function ID (tag)'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'MU - Friction Coefficient'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'V1 - First Ramp Velocity for Friction'
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'V2 - Second Ramp Velocity for Friction'
            endif
         endif
      " }}}
      " {{{ CNTAC 10
      elseif synIDattr(slist[0], "name") =~ "pam_CNTAC10"
         if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'T1SL - Contact Activation Time'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'T2SL - Contact Deactivation Time'
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return 'ISENS - Sensor ID for Activation Control (tag)'
            elseif synIDattr(slist[2], "name") =~ "pam_31..*"
               return 'NACC - Contact Search Accelerator'
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return 'EDGLN - Fraction of SOlid Element Edge Length to Activate Internal Contact'
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return 'Hcmin - Minimum Contact Thickness'
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r4"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return 'SLFACM - Scale Factor for Contact Penalty'
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return 'FSVNL - Nonlinear Penalty Stiffness Parameter'
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return 'TLSTIF - Timestep for Stiffness Computation'
            endif
         endif
      " }}}
      " {{{ CNTAC 1
      elseif synIDattr(slist[0], "name") =~ "pam_CNTAC1"
         if synIDattr(slist[1], "name") =~ "pam_CNTAC.*_r3"
            if synIDattr(slist[2], "name") =~ "pam_31.*"
               return 'Hcont - Thickness of Master and Slave Entities'
            endif
         endif
      endif
      " }}}
"  }}}
"  {{{ PART
   elseif synIDattr(slist[0], "name") =~ "pam_PART.*"
      if synIDattr(slist[1], "name") =~ "pam_PART.*_r1$"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDPRT - Part ID"
         elseif synIDattr(slist[2], "name") =~ "pam_PART.*_r1_[ae]2"
            return "ATYPE - Part Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDMAT - Material ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDVAMAT - Vibroacoustic Material ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDTHMAT - Thermal Material ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDPMAT - Porous Material ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART.*_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "DTELIM - Timestep for Element Elimination"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "TSCALF - Local time Step Scale Factor"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART.*_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "TCONT - Contact Thickness"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSINI - Initial Equivalent Plastic Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "COULFRIC - Coulomb Friction Ciefficient"
         endif
      " {{{ SOLID/TETRA
      elseif synIDattr(slist[1], "name") =~ "pam_PART_SOLID_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.5.*"
            return "IORT1 - Othotropic Axis Definition (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "XDIR1 - X Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "YDIR1 - Y Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "ZDIR1 - Z Component of Orthotropic Orientation Axis"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_SOLID_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.5.*"
            return "IORT2 - Othotropic Axis Definition (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "XDIR2 - X Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "YDIR2 - Y Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "ZDIR2 - Z Component of Orthotropic Orientation Axis"
         endif
      " }}}
      " {{{ COS3D
      elseif synIDattr(slist[1], "name") =~ "pam_PART_COS3D_r5"
         if synIDattr(slist[2], "name") =~ "pam_11.*"
            return "THK - Cohesive Thickness"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "XDIR1 - X Component of Thickness Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "YDIR1 - Y Component of Thickness Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ZDIR1 - Z Component of Thickness Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IMETH - Thickness Direction Method (menu)"
         endif
      " }}}
      " {{{ SPHEL
      elseif synIDattr(slist[1], "name") =~ "pam_PART_SPHEL_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "RATIO - Particle Smoothing Length to Radius Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Hmin - Minimum Smoothing Length"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Hmax - Maximum Smoothing Length"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "ETA - Anticrossing Force parameter"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "INORM - Free Surface Correction Option"
         elseif synIDattr(slist[2], "name") =~ "pam_46.*"
            return "NPAIR - Number of Parts Interacting with This Part"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "ALPHAms - First Parameter of Monaghan-Gingold Artificial Viscosity"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "BETAms - Secong Parameter of Monaghan-Gingold Artificial Viscosity"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "NMON - Monaghan Stability Option"
         endif
      " }}}
      " {{{ SHELL
      elseif synIDattr(slist[1], "name") =~ "pam_PART_SHELL_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "H - Thickness"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "NINT - Number of Integration Points over Thickness"
         elseif synIDattr(slist[2], "name") =~ "pam_16.*"
            return "OFFSET - Offset Value"
         elseif synIDattr(slist[2], "name") =~ "pam_26.*"
            return "NTHDOF - Number of Thermal DOFs over Thickness"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_SHELL_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.5.*"
            return "IORT - Othotropic Axis Definition (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "XDIR - X Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "YDIR - Y Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "ZDIR - Z Component of Orthotropic Orientation Axis"
         endif
      " }}}
      " {{{ BAR
      elseif synIDattr(slist[1], "name") =~ "pam_PART_BAR_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "A - Cross Section"
         endif
      " }}}
      " {{{ TSHEL
      elseif synIDattr(slist[1], "name") =~ "pam_PART_TSHEL_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "H - Thickness"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "NINT - Number of Integration Points"
         endif
      " }}}
      " {{{ MEMBR
      elseif synIDattr(slist[1], "name") =~ "pam_PART_MEMBR_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "H - Thickness"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_MEMBR_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.5.*"
            return "IORT1 - Othotropic Axis Definition (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "VX1 - X Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "VY1 - Y Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "VZ1 - Z Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ALPHof1 - Offset Angle of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "TX1 - X Component of Revolution Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "TY1 - Y Component of Revolution Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "TZ1 - Z Component of Revolution Axis"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_MEMBR_r7"
         if synIDattr(slist[2], "name") =~ "pam_1.5.*"
            return "IORT2 - Othotropic Axis Definition (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "VX2 - X Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "VY2 - Y Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "VZ2 - Z Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ALPHof2 - Offset Angle of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "TX2 - X Component of Revolution Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "TY2 - Y Component of Revolution Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "TZ2 - Z Component of Revolution Axis"
         endif
      " }}}
      " {{{ BEAM
      elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "A - Beam Cross-Sectional Area"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Ashs || FACshs - Shear Effective Area || Factor in s-Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Is - Bending Moment of Inertia about s-Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "It - Bending Moment of Inertia about t-Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Ir - Bending Moment of Inertia about r-Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_56.*"
            return "ITPR - Flag for Tapered Beam (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_56.*"
            return "Asht || FACsht - Shear Effective Area || Factor in t-Direction"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Ist - Mixed Moment of Inertia"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "COGs - s-Coordinate of Beam Section COG"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "COGt - t-Coordinate of Beam Section COG"
         elseif col('.') == 35 || col('.') == 45
            return "R-Axis, Axial Force Release"
         elseif col('.') == 36 || col('.') == 46
            return "S-Axis, Shear Force Release"
         elseif col('.') == 37 || col('.') == 47
            return "T-Axis, Shear Force Release"
         elseif col('.') == 38 || col('.') == 48
            return "R-Axis, Torsion Moment Release"
         elseif col('.') == 39 || col('.') == 49
            return "S-Axis, Bending Moment Release"
         elseif col('.') == 40 || col('.') == 50
            return "T-Axis, Bending Moment Release"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r7"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ALPHA1 - Relative Multiplier of First Section Dimenstion"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "BETA1 - Relative Multiplier of Second Section Dimenstion"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "GAMMA1 - Relative Multiplier of Third Section Dimenstion"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "KSI1 - Relative Multiplier for s-Axis Eccentricity"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ETA1 - Relative Multiplier for t-Axis Eccentricity"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r8"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ALPHA2 - Relative Multiplier of First Section Dimenstion"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "BETA2 - Relative Multiplier of Second Section Dimenstion"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "GAMMA2 - Relative Multiplier of Third Section Dimenstion"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "KSI2 - Relative Multiplier for s-Axis Eccentricity"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ETA2 - Relative Multiplier for t-Axis Eccentricity"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r9"
         if synIDattr(slist[2], "name") =~ "pam_1.5.*"
            return "IDSEC - Cross-Section Description Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_6.5.*"
            return "NIPS - Number of Integration Points in Cross-Section"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "A - Cross-Section Dimension Parameter"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "B - Cross-Section Dimension Parameter"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "C - Cross-Section Dimension Parameter"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_BEAM_r10"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "LCOORDsi - Local s-Coordinate of Integration Point"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "LCOORDti - Local t-Coordinate of Integration Point"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "WTFACi - Weighting Factor for Integration Point"
         endif
      " }}}
      " {{{ TIED/SLINK/ELINK
      elseif synIDattr(slist[1], "name") =~ "pam_PART_TIED_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "RDIST - Link Search Distance"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "INEXT - Orthotropic Axes Definition Flag (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PART_TIED_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.5.*"
            return "IORT - Orthotropic Axis Definition Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "XDIR - X Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "YDIR - Y Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "ZDIR - Z Component of Orthotropic Orientation Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ALPHof - Offset Angle of Orthotropic Orientation Axis"
         endif
      " }}}
      " {{{ LLINK
      elseif synIDattr(slist[1], "name") =~ "pam_PART_LLINK_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "RSEAR - Link Search Distance"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "DISPW - Distance for Connection Point Generation on Defined Line"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "WIDTH - Width of the Generation of Additional Connection Points"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "NGWDTH - Number of Additional Connection Points"
         endif
      " }}}
      " {{{ PLINK
      elseif synIDattr(slist[1], "name") =~ "pam_PART_PLINK_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "RSEAR - Link Search Distance"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "NLAYR - Number of Layers in the Link"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "SPWLG - User-Defined Maximal Length of PLINK Elements"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "NGESP - Number of Additional PLINK Connections Generated"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "SPOTRA - Radius for Placing Multi-PLINK connections"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "THETA - Angle Criterion for Segment Removal in Multi-PLINK Connections"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "IRADBEN - Bending Correction of Radius Flag (menu)"
         endif
      " }}}
      " {{{ GAP
      elseif synIDattr(slist[1], "name") =~ "pam_PART_GAP_r5"
         if synIDattr(slist[2], "name") =~ "pam_11.*"
            return "GAP - Gap Value"
         endif
      " }}}
      endif
"  }}}
"  {{{ MATER
   elseif synIDattr(slist[0], "name") =~ "pam_MATER.*"
      if synIDattr(slist[1], "name") =~ "pam_MATER.*_r1$"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDMAT - Material ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "MATYP - Material Type"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "RHO - Mass Density"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ISINT - Integration Rule Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "ISHG - Hourglass Mode Prevention Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "ISTRAT - Strain Rate Model (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IFROZ - Frozen Metric Option"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MATER.*_r2a"
         if synIDattr(slist[2], "name") =~ "pam_MaterX_r2a_a1"
            return "FILTER - Filter Definition (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "VALUE - Filter Period Value"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "INTERP - Strain Rate Interpolation Type (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MATER.*_r2"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "AUXID1 - First Reference Number of Auxiliary Variable Saved for Plot"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "AUXID2 - Second Reference Number of Auxiliary Variable Saved for Plot"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "AUXID3 - Third Reference Number of Auxiliary Variable Saved for Plot"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "AUXID4 - Fourth Reference Number of Auxiliary Variable Saved for Plot"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "AUXID5 - Fifth Reference Number of Auxiliary Variable Saved for Plot"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "AUXID6 - Sixth Reference Number of Auxiliary Variable Saved for Plot"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "QVM - Quadratic Viscosity Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IDMPD - MPD Entity ID (tag)"
         endif
      "  {{{ MATER LINK
      elseif synIDattr(slist[0], "name") =~ "pam_Mater3[0-9][0-9]"
         " {{{ Mater 301
         if synIDattr(slist[1], "name") =~ "pam_Mater301.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater301.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SDMPt - Stiffness Translation Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLFACm - Penalty Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "FSNVL - Penalty Force Ratio for Nonlinear Penalty Stiffness"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "DELTnl - Reference Elongation for Nonlinear Penalty Force"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IDEABEN - Flag for Treatment of Normal Vector for Bending (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SDMPr - Stiffness Rotation Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "TLSTIF - Time Step for Stiffness Calculation"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater301.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDOF - Flag for Release of Rotational DOF (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ITENS - Rupture Model Tensile Force Orientation Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IDRUP - Rupture Modell ID (tag)"
               elseif col('.') == 38
                  return "Normal Vector Direction Fixed"
               elseif col('.') == 39
                  return "Shear T-Axis Direction Fixed"
               elseif col('.') == 40
                  return "Shear U-Axis Direction Fixed"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "DSTART - Distance to Start DOF Release"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "DRELEA - Distance to End DOF Release"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "RFAC - Residual Stiffness Factor"
               endif
            endif
         " }}}
         " {{{ Mater 302
         elseif synIDattr(slist[1], "name") =~ "pam_Mater302.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater302.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SLFACm - Penalty Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FSNVL - Penalty Force Ratio for Nonlinear Penalty Stiffness"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DELTnl - Reference Elongation for Nonlinear Penalty Force"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STNOR || LSTNOR - Constant || Curve ID for Tension/Compression Stiffness"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STTAN || LSTTAN - Constant || Curve ID for Shear Stiffness"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "IFLGC - User-Defined Stiffness Specification (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "TLSTIF - Time Step for Stiffness Calculation"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater302.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDOF - Flag for Release of Rotational DOF (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "TOLCOR - Correction Factor for in-Element Projection"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IDRUP - Rupture Modell ID (tag)"
               endif
            endif
         " }}}
         " {{{ Mater 303
         elseif synIDattr(slist[1], "name") =~ "pam_Mater303.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater303.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SDMPt - Stiffness Translation Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLFACm - Penalty Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IDEABEN - Flag for Treatment of Normal Vector for Bending (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "IDELBEND - Flag to Deactivate Bending Coupling when Delamination Starts"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "DAMRATE - Maximal Damage Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "TLSTIF - Time Step for Stiffness Calculation"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater303.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDOF - Flag for Release of Rotational DOF (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IDELA - Delamination Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater303.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Hcont - Distance for Kinematic Computation"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "E0 - Normal Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "G0 - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT1 - First Strin Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT2 - Second Strin Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Nfilt - Number of Cycles for Strain Rate Filter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater303.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMApr - Normal Stress for Propagation of Delamination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "GAMMApr - Shear Stress for Propagation of Delamination"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EFRAC1 - Model I Fracture Energy"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EFRAC2 - Model II Fracture Energy"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SIGMAst - Normal Stress for Delamination Initiation"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "GAMMAst - Shear Stress for Delamination Initiation"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ETA - Power Function Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "NFEQD - Number of Cycles for Computing Filtered Equivalent Displacements"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater303.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ncycle - Number of Cycles for Stress Reduction"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFUNGcont - Function ID for Mode I/II Coupling (tag)"
               endif
            endif
         " }}}
         " {{{ Mater 304
         elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater304.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SDMPt - Stiffness Translation Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Hcont - Distance for Kinematic Computation"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Nfilt - Number of Cycles for Strain Rate Filter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IDEABEN - Flag for Treatment of Normal Vector for Bending (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EC_NN - Compression Young's Modulus along N-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUC_NN - Curve ID for Stress/Strain along N-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "CELC_NN - Power Coefficient for Failure in Compression"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIC_NN - Compression Total Strain along N-Axis for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ET_NN - Tensile Young's Modulus along N-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUT_NN - Curve ID for Stress/Strain along N-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "CELT_NN - Power Coefficient for Failure in Tension"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIT_NN - Tensile Total Strain along N-Axis for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G_NT - Shear Modulus in NT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUT_NT - Curve ID for Stress/Strain in NT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "CELT_NT - Power Coefficient for Failure in Shear in NT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIT_NT - Total Shear Strain in NT-Axis for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G_NU - Shear Modulus in NU-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUT_NU - Curve ID for Stress/Strain in NU-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "CELT_NU - Power Coefficient for Failure in Shear in NU-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIT_NU - Total Shear Strain in NU-Axis for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LKC_N - Lookup Table ID for Compression Damage (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "INC_N - Index of Normal Strain Deformation"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INC_NT - Index of Shear Strain in NT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "INC_NU - Index of Shear Strain in NU-Plane"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LKT_N - Lookup Table ID for Tensile Damage (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "INT_N - Index of Normal Strain Deformation"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INT_NT - Index of Shear Strain in NT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "INT_NU - Index of Shear Strain in NU-Plane"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LK_NT - Lookup Table ID for Shear Damage in NT-Plane (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ITN_N - Index of Normal Strain Deformation"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ITN_NT - Index of Shear Strain in NT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ITN_NU - Index of Shear Strain in NU-Plane"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater304.*_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LK_NU - Lookup Table ID for Shear Damage in NU-Plane (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "INU_N - Index of Normal Strain Deformation"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INU_NT - Index of Shear Strain in NT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "INU_NU - Index of Shear Strain in NU-Plane"
               endif
            endif
         " }}}
         " {{{ Mater 305
         elseif synIDattr(slist[1], "name") =~ "pam_Mater305.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater305.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SDMPt - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IELAST - Flag for Pure Elastic Behavior (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IDELA - Interaction Method (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ETA - Mixed Mode Criterion Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Ncycle - Number of Cycles for Stress Reduction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "NFEQD - Number of Cycles for Computing Filtered Equivalent Displacements"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IDRUP - Rupture Model ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater305.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "PSLOPE - Hardening Coefficient for Normal and Shear Modes"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "RSURF - Cohesive Surface Scale Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater305.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "En - Normal Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGSn - Static Maximum Elastic Stress for Normal Mode"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "R_SIGSn - Strain Rate in Normal Mode until SIGSn is Used"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGDn - Dynamic Maximum Elastic Stress for Normal Mode"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "R_SIGDn - Strain Rate in Normal Mode Corresponding to SIGSn"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EFRSn - Static Fracture Energy for Normal Mode"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "R_EFRSn - Strain Rate in Normal Mode until EFRSn is Used"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "EFRDn - Dynamic Fracture Energy for Normal Mode"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater305.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "R_EFRDn - Strain Rate in Normal Mode until EFRDn is Used"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "PCn - Plasticity Coefficient for Normal Mode"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater305.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Es - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGSs - Static Maximum Elastic Stress for Shear Mode"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "R_SIGSs - Strain Rate in Shear Mode until SIGSn is Used"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGDs - Dynamic Maximum Elastic Stress for Shear Mode"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "R_SIGDs - Strain Rate in Shear Mode Corresponding to SIGSn"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EFRSs - Static Fracture Energy for Shear Mode"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "R_EFRSs - Strain Rate in Shear Mode until EFRSn is Used"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "EFRDs - Dynamic Fracture Energy for Shear Mode"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater305.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "R_EFRDs - Strain Rate in Shear Mode until EFRDn is Used"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "PCs - Plasticity Coefficient for Shear Mode"
               endif
            endif
         " }}}
         endif
      "  }}}
      "  {{{ MATER 1D
      elseif synIDattr(slist[0], "name") =~ "pam_Mater2[0-9][0-9]"
         " {{{ CURVE Definition
         if synIDattr(slist[1], "name") =~ "pam_Mater.*c_r8" || synIDattr(slist[1], "name") =~ "pam_Mater.*c_r10"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "LC1 - First Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "LC2 - Second Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "LC3 - Third Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "LC4 - Fourth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "LC5 - Fifth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "LC6 - Sixth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "LC7 - Seventh Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "LC8 - Eighth Flow Curve ID (tag)"
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*c_r9" || synIDattr(slist[1], "name") =~ "pam_Mater.*c_r11"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "ERATE1 - First Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "ERATE2 - Second Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "ERATE3 - Third Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "ERATE4 - Fourth Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "ERATE5 - Fifth Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "ERATE6 - Sixth Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "ERATE7 - Seventh Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "ERATE8 - Eighth Strain Rate Value"
            endif
         " }}}
         " {{{ POINT Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*b_r8" || synIDattr(slist[1], "name") =~ "pam_Mater.*b_r10"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "EPSI1 - First Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "EPSI2 - Second Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "EPSI3 - Third Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "EPSI4 - Fourth Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "EPSI5 - Fifth Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "EPSI6 - Sixth Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "EPSI7 - Seventh Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "EPSI8 - Eighth Effective Plastic Strain Value"
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*b_r9" || synIDattr(slist[1], "name") =~ "pam_Mater.*b_r11"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "SIGMA1 - First Effective True Stress Value"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "SIGMA2 - Second Effective True Stress Value"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "SIGMA3 - Third Effective True Stress Value"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "SIGMA4 - Fourth Effective True Stress Value"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "SIGMA5 - Fifth Effective True Stress Value"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "SIGMA6 - Sixth Effective True Stress Value"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "SIGMA7 - Seventh Effective True Stress Value"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "SIGMA8 - Eighth Effective True Stress Value"
            endif
         " }}}
         " {{{ POWER/KRUPK Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*p_r8" || synIDattr(slist[1], "name") =~ "pam_Mater.*p_r10"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "a || k - Initial Yield Stress || Hardening Coefficient"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "b || EPSIo - Multiplier || Offset Strain"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "n - Hardening Exponent"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "SIGMApmax - Maximum Plastic Stress Cutoff"
            endif
         " }}}
         " {{{ ECURV Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*e_r8" || synIDattr(slist[1], "name") =~ "pam_Mater.*e_r10"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "LC1 - Stress-Strain Curve ID (tag)"
            endif
         " }}}
         " {{{ Mater 200
         elseif synIDattr(slist[1], "name") =~ "pam_Mater200.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater200.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               endif
            endif
         " }}}
         " {{{ Mater 201
         elseif synIDattr(slist[1], "name") =~ "pam_Mater201.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater201.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA - Thermal Dilatation Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater201.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "KSIm - Membrane Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "KSIb - Bending Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "KSIt - Torsion Damping Ratio"
               endif
            endif
         " }}}
         " {{{ Mater 202
         elseif synIDattr(slist[1], "name") =~ "pam_Mater202.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater202.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Et - Hardening Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA - Thermal Dilatation Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater202.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "KSIm - Membrane Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater202.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               endif
            endif
         " }}}
         " {{{ Mater 204
         elseif synIDattr(slist[1], "name") =~ "pam_Mater204.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater204.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOAD - Response Curve ID for Loading (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "CMULTl - Loading Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHYST - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater204.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLD - Response Curve ID for Unloading (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "CMULTul || H - Unloading Curve Multiplier || Energy Absorbtion Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMP - Response Curve ID for Damping (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "CMULTdp - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "NMULT - Response Curve ID for Elongation Dependent Damping (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SLOPE || D - Constant Unloading Slope || Permanent Elongation Factor after Unloading"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater204.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Linear Elastic Stiffness"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "C - Linear Viscous damping Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DLini - Initial Elongation Value for Pre-Stressing"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater204.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MASSsprg - Spring Mass"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Ko - Stiffness to Be Used for Stable Time Step Calculation"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater204.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ft || DELTti - Initial Tensile Force || Elongation Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Fc || DELTci - Initial Compressive Force || Elongation Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DLelimt - Tensile Elongation Limit for Element Elimitation"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "DLelimc - Compressive Elongation Limit for Element Elimitation"
               endif
            endif
         " }}}
         " {{{ Mater 205
         elseif synIDattr(slist[1], "name") =~ "pam_Mater205.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater205.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOAD - Response Curve ID for Loading (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IHYST - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater205.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "H - Energy Dissipation Factor Upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "D - Permanent Strain Factor after Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NUNLD - Response Curve ID for Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SLOPE - Transotion Slope Between Loading and Unloading"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater205.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Kprim - Linear Elastic Stiffness"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI0 - Initial Strain for Pretensioning"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater205.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MU - Mass per Unit Length"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Ko - Stiffness for Timestep Calculation"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater205.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIi - Strain Limit for Initial Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIu - Strain Limir for Material Failure"
               endif
            endif
         " }}}
         " {{{ Mater 212
         elseif synIDattr(slist[1], "name") =~ "pam_Mater212.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater212.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NU - Poission's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Et - Hardening Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA - Thermal Dilatation Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater212.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "KSIm - Membrane Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "KSIb - Bending Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "KSIt - Torsion Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater212.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "FLIM - Strain Limit Element Elimination Flag (menu)"
               endif
            endif
         " }}}
         " {{{ Mater 213
         elseif synIDattr(slist[1], "name") =~ "pam_Mater213.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater213.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NU - Poission's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Et - Hardening Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA - Thermal Dilatation Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater213.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "KSIm - Membrane Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "KSIb - Bending Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "KSIt - Torsion Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater213.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               endif
            endif
         " }}}
         " {{{ Mater 214
         elseif synIDattr(slist[1], "name") =~ "pam_Mater214.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater214.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NU - Poission's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCm - Curve ID for Plastic Bending oment around S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SCFACs - Scale Factor for LCMs Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LCt - Curve ID for Plastic Bending oment around T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SCFACt - Scale Factor for LCMt Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ITYPM - Model Type (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater214.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NEXP - N Exponent for Plasticity Convex"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPMAX - Compression Strain Value to Trigger Force/Moment Stiffening"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPEXP - Exponent for Force/Moment Stiffening Law"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater214.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "KSIm - Membrane Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "KSIb - Bending Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "KSIt - Torsion Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater214.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LYR - Function ID for First Hinge Moment around R-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LYS1 - Function ID for First Hinge Moment around S-Axis at Node 1"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LYS2 - Function ID for First Hinge Moment around S-Axis at Node 2"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LYT1 - Function ID for First Hinge Moment around T-Axis at Node 1"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LYT2 - Function ID for First Hinge Moment around T-Axis at Node 2"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater214.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Axial Collapse Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LC2 - Second Axial Collapse Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LC3 - Third Axial Collapse Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LC4 - Fourth Axial Collapse Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LC5 - Fifth Axial Collapse Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LC6 - Sixth Axial Collapse Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LC7 - Seventh Axial Collapse Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LC8 - Eighth Axial Collapse Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater214.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Mend1 - End Moment for First Axial Collapse Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Mend2 - End Moment for Second Axial Collapse Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Mend3 - End Moment for Third Axial Collapse Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Mend4 - End Moment for Fourth Axial Collapse Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Mend5 - End Moment for Fifth Axial Collapse Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Mend6 - End Moment for Sixth Axial Collapse Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Mend7 - End Moment for Seventh Axial Collapse Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Mend8 - End Moment for Eighth Axial Collapse Curve"
               endif
            endif
         " }}}
         " {{{ Mater 220
         elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater220.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADr - Curve ID for Loading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTLr - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHtr - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLtr - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUtr - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "WALLtr - Minimum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "WALUtr - Maximum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "DOFtr - DOF Coupling Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "WDMPtr - Wall Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDr - Curve ID for Unloading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTUr || Htr - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MASSr - Mass of Spring Element in R-Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NDAMPr - Curve ID for Viscous Damping Forces (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FTDr - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Kr0 || SLOPtr || Dtr - Spring Stiffness for Timestep || Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Felar || DLelar - Force Limit for Elastic Behavior || Displacement Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Ktr - Spring Constant Stiffness"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADs - Curve ID for Loading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTLs - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHts - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLts - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUts - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "WALLts - Minimum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "WALUts - Maximum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "DOFts - DOF Coupling Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "WDMPts - Wall Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDs - Curve ID for Unloading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTUs || Hts - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MASSs - Mass of Spring Element in S-Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NDAMPr - Curve ID for Viscous Damping Forces (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FTDr - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Ks0 || SLOPts || Dts - Spring Stiffness for Timestep || Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Felas || DLelas - Force Limit for Elastic Behavior || Displacement Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Kts - Spring Constant Stiffness"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADt - Curve ID for Loading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTLt - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHtt - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLtt - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUtt - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "WALLtt - Minimum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "WALUtt - Maximum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "DOFtt - DOF Coupling Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "WDMPtt - Wall Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDt - Curve ID for Unloading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTUt || Htt - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MASSt - Mass of Spring Element in T-Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NDAMPr - Curve ID for Viscous Damping Forces (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FTDr - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Kt0 || SLOPtt || Dtt - Spring Stiffness for Timestep || Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Felat || DLelat - Force Limit for Elastic Behavior || Displacement Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Ktt - Spring Constant Stiffness"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADr - Curve ID for Loading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLr - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrr - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLrr - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUrr - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "WALLrr - Minimum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "WALUrr - Maximum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "DOFrr - DOF Coupling Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "WDMPrr - Wall Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDr - Curve ID for Unloading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUr || Hrr - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INERr - Inertia of Spring Element"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MDAMPr - Curve ID for Viscous Damping Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FMDr - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "KMr0 || SLOPrr || Drr - Spring Stiffness for Timestep || Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Melar || RTelar - Moment Limit for Elastic Behavior || Angle Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Krr - Spring Constant Stiffness"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADs - Curve ID for Loading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLs - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrs - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLrs - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUrs - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "WALLrs - Minimum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "WALUrs - Maximum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "DOFrs - DOF Coupling Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "WDMPrs - Wall Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDs - Curve ID for Unloading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUs || Hrs - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INERs - Inertia of Spring Element"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MDAMPs - Curve ID for Viscous Damping Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FMDs - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "KMs0 || SLOPrs || Drs - Spring Stiffness for Timestep || Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Melas || RTelas - Moment Limit for Elastic Behavior || Angle Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Krs - Spring Constant Stiffness"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r14" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADt - Curve ID for Loading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLt - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrt - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLrt - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUrt - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "WALLrt - Minimum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "WALUrt - Maximum Wall Value"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "DOFrt - DOF Coupling Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "WDMPrt - Wall Damping Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater220.*_r15" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDt - Curve ID for Unloading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUt || Hrt - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INERt - Inertia of Spring Element"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MDAMPt - Curve ID for Viscous Damping Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FMDt - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "KMt0 || SLOPrt || Drt - Spring Stiffness for Timestep || Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Melat || RTelat - Moment Limit for Elastic Behavior || Angle Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Krt - Spring Constant Stiffness"
               endif
            endif
         " }}}
         " {{{ Mater 221
         elseif synIDattr(slist[1], "name") =~ "pam_Mater221.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater221.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADr - Curve ID for Loading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLr - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrr - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater221.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDr - Curve ID for Unloading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUr || Hrr - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Cphi - Linear Damping Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Mrelas || PHIelas - Moment || Angle Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SLOPErr || Drr - Transition Loading/Unloading Slope || Permanent Angular Deflection"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater221.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADs - Curve ID for Loading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLs - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrs - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater221.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDs - Curve ID for Unloading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUs || Hrs - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Ctheta - Linear Damping Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Mselas || THETAelas - Moment || Angle Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SLOPErs || Drs - Transition Loading/Unloading Slope || Permanent Angular Deflection"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater221.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADt - Curve ID for Loading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLt - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrt - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater221.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDt - Curve ID for Unloading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUt || Hrt - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Cpsi - Linear Damping Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Mtelas || PSIelas - Moment || Angle Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SLOPErt || Drt - Transition Loading/Unloading Slope || Permanent Angular Deflection"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater221.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUphi - Friction Moment for Rotation about R-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MUtheta - Friction Moment for Rotation about S'-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MUpsi - Friction Moment for Rotation about T''-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "OMEGAini - Initial Angular Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "OMEGAfin - Final Angular Velocity for Friction Ramp"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater221.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ktrans - Spring Stiffness for Penalisation of the Translation DOF"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "TOLtrans - Tolerance fo the Violation of the Translation Constrains"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DAMPtrans - Damping Coefficient for Translation"
               endif
            endif
         " }}}
         " {{{ Mater 222
         elseif synIDattr(slist[1], "name") =~ "pam_Mater222.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater222.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADu - Curve ID for Loading Response for Main Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLu - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHru - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater222.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDu - Curve ID for Unloading Response for Main Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUu || Hru - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Calpha - Linear Damping Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Muelas || ALPHAelas - Moment || Angle Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SLOPEru || Dru - Transition Loading/Unloading Slope || Permanent Angular Deflection"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater222.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MDIR - Curve ID for Directional Dependency of Bending Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FDIR - Curve Multiplier"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater222.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADt - Curve ID for Loading Response for Main Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLt - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrt - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater222.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDt - Curve ID for Unloading Response for Main Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUt || Hrt - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Cbeta - Linear Damping Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Mtelas || BETAelas - Moment || Angle Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SLOPErt || Drt - Transition Loading/Unloading Slope || Permanent Angular Deflection"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater222.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUalpha - Friction Moment for Rotation about U-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MUbeta - Friction Moment for Rotation about T''-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "OMEGAini - Initial Angular Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "OMEGAfin - Final Angular Velocity for Friction Ramp"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater222.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ktrans - Spring Stiffness for Penalisation of the Translation DOF"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "TOLtrans - Tolerance fo the Violation of the Translation Constrains"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DAMPtrans - Damping Coefficient for Translation"
               endif
            endif
         " }}}
         " {{{ Mater 223
         elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater223.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADr - Curve ID for Loading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTLr - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHtr - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLtr - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUtr - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "NMFDTr - Multiplier Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "DLinir - Initial Elongation along R-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "INDOF - Number of DOF (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IDRUP - Rupture Model ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDr - Curve ID for Unloading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTUr || Htr - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MASSr - Mass of Spring Element in R-Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NDAMPr - Curve ID for Viscous Damping Forces (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FTDr - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SLOPtr || Dtr - Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "DLelar - Displacement Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADs - Curve ID for Loading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTLs - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHts - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLts - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUts - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "NMFDTs - Multiplier Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "DLinis - Initial Elongation along S-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ILENG - Input per Unit Length (flag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDs - Curve ID for Unloading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTUs || Hts - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MASSs - Mass of Spring Element in S-Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NDAMPr - Curve ID for Viscous Damping Forces (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FTDr - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SLOPts || Dts - Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "DLelas - Displacement Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADt - Curve ID for Loading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTLt - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHtt - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLtt - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUtt - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "NMFDTt - Multiplier Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "DLinit - Initial Elongation along T-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDt - Curve ID for Unloading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FTUt || Htt - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MASSt - Mass of Spring Element in T-Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NDAMPr - Curve ID for Viscous Damping Forces (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FTDr - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SLOPtt || Dtt - Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "DLelat - Displacement Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADr - Curve ID for Loading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLr - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrr - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLrr - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUrr - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "NMMDTr - Multiplier Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "RTinir - Initial Rotation along R-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDr - Curve ID for Unloading Response along R-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUr || Hrr - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INERr - Inertia of Spring Element"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MDAMPr - Curve ID for Viscous Damping Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FMDr - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SLOPrr || Drr - Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "RTelar - Angle Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADs - Curve ID for Loading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLs - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrs - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLrs - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUrs - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "NMMDTs - Multiplier Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "RTinis - Initial Rotation along S-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDs - Curve ID for Unloading Response along S-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUs || Hrs - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INERs - Inertia of Spring Element"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MDAMPs - Curve ID for Viscous Damping Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FMDs - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SLOPrs || Drs - Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "RTelas - Angle Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r14" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADt - Curve ID for Loading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMLt - Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IHrt - Hysteresis Model Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "RUPLrt - Negative Minimum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "RUPUrt - Positive Maximum Rupture Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "NMMDTt - Multiplier Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "RTinit - Initial Rotation along T-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater223.*_r15" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MUNLDt - Curve ID for Unloading Response along T-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FMUt || Hrt - Curve Multiplier || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "INERt - Inertia of Spring Element"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MDAMPt - Curve ID for Viscous Damping Moment (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FMDt - Damping Curve Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SLOPrt || Drt - Transition Loading/Unloading Slope || Permanent Deflection Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "RTelat - Angle Limit for Elastic Behavior"
               endif
            endif
         " }}}
         " {{{ Mater 224
         elseif synIDattr(slist[1], "name") =~ "pam_Mater224.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater224.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SLFACMt - Penalty Scale Factor for Translation"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLFACMr - Penalty Scale Factor for Rotation"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "XMASS - Transitional Mass"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "INERTIA - Rotational Inertia"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "INDOF - Material Model (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IDRUP - Rupture Model ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IFLGP - User-Defined Constant Stiffness Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater224.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "PRtr || E || TLSTIF - Translation Stiffness in R-Direction || Young's Modulus || Timestep for Stiffness Computation (MPC,PLINK)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "PRts || NU - Translation Stiffness in S-Direction || Poission's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "PRtt || Rmin - Translation Stiffness in T-Direction || Minimum of Effective Length to Section Radius Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "PRrr || Rmax - Rotational Stiffness in R-Direction || Maximum of Effective Length to Section Radius Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "PRrs - Rotational Stiffness in S-Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "PRrt - Rotational Stiffness in T-Direction"
               endif
            endif
         " }}}
         " {{{ Mater 225
         elseif synIDattr(slist[1], "name") =~ "pam_Mater225.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater225.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MASSt - Translational Mass"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MASSr - Rotational Mass"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Ktrans - Transitional Transition Slope between Lower and Upper Force Limit Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Krot - Rotational Transition Slope between Lower and Upper Force Limit Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SLPMULT - Slope Multiplier"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADUPr - Curve ID for Upper Force Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NLOADLWr - Curve ID for Lower Force Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPr - Curve ID for Damping Firce (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225x_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STIFTR - Constant Stiffness along R-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "DAMVTR - Constant Viscous Damping Coefficient along R-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DAMSTR - Constant Stiffness Proportinal Damping Ratio Along R-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADUPs - Curve ID for Upper Force Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NLOADLWs - Curve ID for Lower Force Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPs - Curve ID for Damping Firce (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225x_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STIFTS - Constant Stiffness along S-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "DAMVTS - Constant Viscous Damping Coefficient along S-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DAMSTS - Constant Stiffness Proportinal Damping Ratio Along S-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADUPt - Curve ID for Upper Force Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NLOADLWt - Curve ID for Lower Force Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPt - Curve ID for Damping Firce (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225x_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STIFTT - Constant Stiffness along T-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "DAMVTT - Constant Viscous Damping Coefficient along T-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DAMSTT - Constant Stiffness Proportinal Damping Ratio Along T-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADUPr - Curve ID for Upper Moment Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MLOADLWr - Curve ID for Lower Moment Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MDAMPr - Curve ID for Damping Firce (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225x_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STIFRR - Constant Stiffness about R-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "DAMVRR - Constant Viscous Damping Coefficient about R-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DAMSRR - Constant Stiffness Proportinal Damping Ratio about R-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADUPs - Curve ID for Upper Moment Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MLOADLWs - Curve ID for Lower Moment Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MDAMPs - Curve ID for Damping Firce (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225x_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STIFRS - Constant Stiffness about S-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "DAMVRS - Constant Viscous Damping Coefficient about S-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DAMSRS - Constant Stiffness Proportinal Damping Ratio about S-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADUPt - Curve ID for Upper Moment Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MLOADLWt - Curve ID for Lower Moment Limit (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MDAMPt - Curve ID for Damping Firce (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225x_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STIFRT - Constant Stiffness about T-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "DAMVRT - Constant Viscous Damping Coefficient about T-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DAMSRT - Constant Stiffness Proportinal Damping Ratio about T-Axis"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater225.*_r11" 
               if col('.') == 8 
                  return "Translation Coupling along R-Axis""
               elseif col('.') == 9 
                  return "Translation Coupling along S-Axis""
               elseif col('.') == 10 
                  return "Translation Coupling along T-Axis""
               elseif col('.') == 18 
                  return "Rotation Coupling about R-Axis""
               elseif col('.') == 19 
                  return "Rotation Coupling about S-Axis""
               elseif col('.') == 20 
                  return "Rotation Coupling about T-Axis""
               endif
            endif
         " }}}
         " {{{ Mater 226
         elseif synIDattr(slist[1], "name") =~ "pam_Mater226.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater226.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDVU - Curve ID for Air Spring Volume vs. Displacement (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IDAU - Curve ID for Piston Volume vs. Displacement (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Vz - Addon Volume"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ICHANNEL - Channel Warming Definition Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA - Flow Rate Factor between Air Spring and Addon Volume"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater226.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Cp - Gas Specific Het Capacity at Constant Pressure"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "P0 - Ambient Pressure"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "T0 - Reference Temperature"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "F1 - Load of the Air Spring at Static Position"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "U1 - Displacement of the Air Spring at Static Position"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Kam - Heat Transition Coefficient multiplied by Lateral Surface of Main Volume"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Kamz - Heat Transition Coefficient multiplied by Lateral Surface of Addon Volume"
               endif
            endif
         " }}}
         " {{{ Mater 230
         elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater230.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADr1 - Curve ID of Loading Response along R1-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FFRICr1 - Friction Force for Displacement along R1-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Vinir1 - Initial Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Vfinr1 - Final Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IHtr1 - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDr1 || Hr1 - Curve ID for Unloading Response along R1-Axis (tag) || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLOPr1 || Dr1 - Transition Slope between Loading and Unloading || Permanent Deflection Factor along R1-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPr1 - Curve ID for Viscous Damping Along R1-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "DLelar1 - Displacement Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADs1 - Curve ID of Loading Response along S1-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FFRICs1 - Friction Force for Displacement along S1-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Vinis1 - Initial Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Vfins1 - Final Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IHts1 - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDs1 || Hs1 - Curve ID for Unloading Response along S1-Axis (tag) || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLOPs1 || Ds1 - Transition Slope between Loading and Unloading || Permanent Deflection Factor along S1-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPs1 - Curve ID for Viscous Damping Along S1-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "DLelas1 - Displacement Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NLOADt1 - Curve ID of Loading Response along T1-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FFRICt1 - Friction Force for Displacement along T1-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Vinit1 - Initial Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Vfint1 - Final Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IHtt1 - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDt1 || Ht1 - Curve ID for Unloading Response along T1-Axis (tag) || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLOPt1 || Dt1 - Transition Slope between Loading and Unloading || Permanent Deflection Factor along T1-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPt1 - Curve ID for Viscous Damping Along T1-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "DLelat1 - Displacement Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADtet1 - Curve ID of Loading Response about THETA1-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MFRICtet1 - Friction Moment for Rotation about THETA1-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "OMGinitet1 - Initial Angular Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "OMGfintet1 - Final Angular Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IHtet1 - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDtet1 || Htet1 - Curve ID for Unloading Response about THETA1-Axis (tag) || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLOPtet1 || Dtet1 - Transition Slope between Loading and Unloading || Permanent Deflection Factor about THETA1-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPtet1 - Curve ID for Viscous Damping About THETA1-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "RTelatet1 - Angle Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADtet2 - Curve ID of Loading Response about THETA2-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MFRICtet2 - Friction Moment for Rotation about THETA2-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "OMGinitet2 - Initial Angular Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "OMGfintet2 - Final Angular Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IHtet2 - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDtet2 || Htet2 - Curve ID for Unloading Response about THETA2-Axis (tag) || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLOPtet2 || Dtet2 - Transition Slope between Loading and Unloading || Permanent Deflection Factor about THETA2-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPtet2 - Curve ID for Viscous Damping About THETA2-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "RTelatet2 - Angle Limit for Elastic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r14" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MLOADtet3 - Curve ID of Loading Response about THETA3-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MFRICtet3 - Friction Moment for Rotation about THETA3-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "OMGinitet3 - Initial Angular Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "OMGfintet3 - Final Angular Velocity for Friction Ramp"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IHtet3 - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater230.*_r15" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUNLDtet3 || Htet3 - Curve ID for Unloading Response about THETA3-Axis (tag) || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SLOPtet3 || Dtet3 - Transition Slope between Loading and Unloading || Permanent Deflection Factor about THETA3-Axis"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NDAMPtet3 - Curve ID for Viscous Damping About THETA3-Axis (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "RTelatet3 - Angle Limit for Elastic Behavior"
               endif
            endif
         " }}}
         endif
      "  }}}
      "  {{{ MATER 2D
      elseif synIDattr(slist[0], "name") =~ "pam_Mater1[0-9][0-9]"
         " {{{ CURVE Definition
         if synIDattr(slist[1], "name") =~ "pam_Mater.*c_r5" || synIDattr(slist[1], "name") =~ "pam_Mater.*c_r11"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "LC1 - First Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "LC2 - Second Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "LC3 - Third Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "LC4 - Fourth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "LC5 - Fifth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "LC6 - Sixth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "LC7 - Seventh Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "LC8 - Eighth Flow Curve ID (tag)"
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*c_r6" || synIDattr(slist[1], "name") =~ "pam_Mater.*c_r12"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "ERATE1 - First Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "ERATE2 - Second Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "ERATE3 - Third Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "ERATE4 - Fourth Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "ERATE5 - Fifth Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "ERATE6 - Sixth Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "ERATE7 - Seventh Strain Rate Value"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "ERATE8 - Eighth Strain Rate Value"
            endif
         " }}}
         " {{{ POWER/KRUPK Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*p_r5" || synIDattr(slist[1], "name") =~ "pam_Mater.*p_r11"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "a || k - Initial Yield Stress || Hardening Coefficient"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "b || EPSIo - Multiplier || Offset Strain"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "n - Hardening Exponent"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "SIGMApmax - Maximum Plastic Stress Cutoff"
            endif
         " }}}
         " {{{ Mater 100
         elseif synIDattr(slist[1], "name") =~ "pam_Mater100.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater100.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               endif
            endif
         " }}}
         " {{{ Mater 101
         elseif synIDattr(slist[1], "name") =~ "pam_Mater101.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater101.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - Thermal Dillatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater101.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            endif
         " }}}
         " {{{ Mater 103
         elseif synIDattr(slist[1], "name") =~ "pam_Mater103.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater103.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater103.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - Thermal Dillatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater103_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater103e_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater103_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater103.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "REL_THIN - Thinning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater103.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater103.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "VALUE - GRUC Value"
               endif
            endif
         " }}}
         " {{{ Mater 105/106
         elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56].*"
            if synIDattr(slist[1], "name") =~ "pam_Mater10[56].*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater10[56].*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - Thermal Dillatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56]_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56]e_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56]_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56].*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "REL_THIN - Thinning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIi - Initial Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater10[56].*_r7_arg"
                  return "Failure Definition Keyword"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI1 - Intermediate Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "D1 - Intermediate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIu - Ultimate Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Du - Ultimate Damage Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56].*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFELIM - Element Elimination Strain Limit Choice (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56].*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "VALUE - GRUC Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater10[56].*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "D1 || REL_HSR - Johnson-Cook Parameter D1 || Thinning Parameter for HSR Modell"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "D2 - Johnson-Cook Parameter D2"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "D3 - Johnson-Cook Parameter D3"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "D4 - Johnson-Cook Parameter D4"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSDOTR - Johnson-Cook Failure Length"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Lc - Characteristic Failure Length"
               endif
            endif
         " }}}
         " {{{ Mater 108
         elseif synIDattr(slist[1], "name") =~ "pam_Mater108.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater108.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater108.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater108_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater108_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater108.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "REL_THIN - Thinning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IORE - Orthotropic Elsticity Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "E22 - E22 Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "NU12 - NU12 Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "G12 - G12 Shear Modulus"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater108.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater108.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  return "IYC - Lankford Coefficient Definition Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "G || P - First Hill's || Lankford's Orthotropic Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "F || Q - Second Hill's || Lankford's Orthotropic Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "N || R - Second Hill's || Lankford's Orthotropic Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "VALUE - GRUC Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               endif
            endif
         " }}}
         " {{{ Mater 109
         elseif synIDattr(slist[1], "name") =~ "pam_Mater109.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater109.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater109.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "IYC - Plasticity Formulation Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109k_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMA0 - Initial Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Rsat - Isotropic Hardening Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Cr - Isotropic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Cx - Kinematic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Xsat - Kinematic Hardening - Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X11 - Initial Kinematic Hardening in local Frame, Axis 1"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X22 - Initial Kinematic Hardening in local Frame, Axis 2"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "X12 - Initial Kinematic Hardening in local Frame, in Plane"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109y_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMA0 - Initial Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Cr - Isotropic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Rsat - Isotropic Hardening Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Esat - Young's Modulus Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Xi - Young's Modulus Law Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X11 - Initial Kinematic Hardening in local Frame, Axis 1"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X22 - Initial Kinematic Hardening in local Frame, Axis 2"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "X12 - Initial Kinematic Hardening in local Frame, in Plane"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109y_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Xsati - Initial Back Stress Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Bsat - Bounding Surface Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "KHC1 - First Kinematic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Rsatx - Back Stress Saturation Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "KHC2 - Second Kinematic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Hnih - Non-isotropic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Rnih0 - Non-isotropic Hardening Initial Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "KHC3 - Third Kinematic Hardening Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "RELIM - Thinning Elimination Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "EPREF - Yoshida Law Plastic Strain Reference Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IDRUP - Rupture Model ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ALPHA || A || IDVEG - First Orthotropic Constant || First Barlat's Constant || Vegter Definition Card ID"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "BETA || B - Second Orthotropic Constant || Second Barlat's Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "GAMMA || C - Third Orthotropic Constant || Third Barlat's Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "F - Fourth Barlat's Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "G - Fifth Barlat's Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "H - Sixth Barlat's Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HEXP || M - Hill Law Exponent || Seventh Barlat's Constant"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater109.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ELmn1 - First Minor Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ELmj1 - First Major Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ELmn2 - Second Minor Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ELmj2 - Second Major Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ELmn3 - Third Minor Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ELmj3 - Third Major Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ELmn4 - Fourth Minor Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELmj4 - Fourth Major Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater109.*_r10_Arg"
                  if synIDattr(slist[3], "name") =~ "pam_11.*"
                     return "ICUR - Forming Limit Diagram curve ID (tag)"
                  endif
               endif
            endif
         " }}}
         " {{{ Mater 110
         elseif synIDattr(slist[1], "name") =~ "pam_Mater110.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater110.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Eaust - Young's Modulus for Austenite"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Emart - Young's Modulus for Martensite"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater110.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "BETA - Maximum Transformation Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ALPHA - Asymmetric Tension-Compression Behavior Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater110.*_r5_[ae]1"
                  return "CURVE - CURVE :-)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "FNUM - Equivalent Stress Curve ID for Transformation into Martensite (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "RNUM - Equivalent Stress Curve ID for Transformation into Austenite (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater110.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            endif
         " }}}
         " {{{ Mater 115
         elseif synIDattr(slist[1], "name") =~ "pam_Mater115.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater115.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater115.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater115_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater115_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater115.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "REL_THIN - Thinning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "q1 - Gurson Yield Surface Parameter 1"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "q2 - Gurson Yield Surface Parameter 2"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Fi - Initial Microvoid Volume Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Fc - Critical Fraction for Coalescence"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Ff - Ultimate Fraction for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater115.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater115.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Fn - Nucleated Void Volume Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Sn || SSIGMAn - Standard Gaussian Deviation for Plastic Strain || Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIn || SIGMAn - Mean Effective Plastic Strain || Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NUCTYP - Nucleation Control Type"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "VALUE - GRUC Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               endif
            endif
         " }}}
         " {{{ Mater 116
         elseif synIDattr(slist[1], "name") =~ "pam_Mater116.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater116.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater116.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - Thermal Dillatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater116_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater116_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater116.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "REL_THIN - Thinning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIi - Initial Principal Treshold Strain in Tension for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI1 - Intermediate Principal Treshold Strain in Tension for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "D1 - Intermediate Damage Value in Tension"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIu - Ultimate Principal Threshold Strain in Tension for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Du - Ultimate Damage Value in Tension"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater116.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFELIM - Element Elimination Strain Limit Choice (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater116.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "VALUE - GRUC Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater116.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ec - Young's Modulus in Compression"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAyc - Yield Stress in Compression"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater116.*_r10_[ae]1"
                  return "Description of Stress-Strain Law"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater116_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ec1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAc1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Ec2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMAc2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Ec3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMAc3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Ec4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMAc4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater116_r13" 
               if synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIci - Initial Principal Treshold Strain in Tension for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIc1 - Intermediate Principal Treshold Strain in Tension for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Dc1 - Intermediate Damage Value in Tension"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIcu - Ultimate Principal Threshold Strain in Tension for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Dcu - Ultimate Damage Value in Tension"
               endif
            endif
         " }}}
         " {{{ Mater 117
         elseif synIDattr(slist[1], "name") =~ "pam_Mater117.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater117.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater117.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117l_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDLUTYD - Lookup Table ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "I1YD - Index of Plastic Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "I2YD - Index of Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "I3YD - Index of Temperature"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117k_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMA0 - Initial Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Cr - Isotropic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Rsat - Isotropic Hardening Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Cx - Kinematic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Xsat - Kinematic Hardening - Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X11 - Initial Kinematic Hardening in local Frame, Axis 1"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X22 - Initial Kinematic Hardening in local Frame, Axis 2"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "X12 - Initial Kinematic Hardening in local Frame, in Plane"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117y_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMA0 - Initial Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Cr - Isotropic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Rsat - Isotropic Hardening Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Esat - Young's Modulus Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Xi - Young's Modulus Law Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X11 - Initial Kinematic Hardening in local Frame, Axis 1"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X22 - Initial Kinematic Hardening in local Frame, Axis 2"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "X12 - Initial Kinematic Hardening in local Frame, in Plane"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117y_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Xsati - Initial Back Stress Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Bsat - Bounding Surface Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "KHC1 - First Kinematic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Rsatx - Back Stress Saturation Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "KHC2 - Second Kinematic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Hnih - Non-isotropic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Rnih0 - Non-isotropic Hardening Initial Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "KHC3 - Third Kinematic Hardening Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "RELIM - Thinning Elimination Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "AKC - Ito-Goya Stress Rate Dependency Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "QLANK - Lankford's Coefficient for Normal Anisotropy"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ILANK - Flag for Orthotropic Hill's Criterion Coefficient Definition (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "EPREF - Yoshida Law Plastic Strain Reference Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IDRUP - Rupture Model ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G || P - First Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "F || Q - Second Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "N || R - Third Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "PORTHO1 - First Pseudo-Orthotropic Constang"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "PORTHO2 - Second Pseudo-Orthotropic Constang"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "PORTHO3 - Thord Pseudo-Orthotropic Constang"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IGOYA - Ito-Goya Plasticity Law Activation Flag"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "NASSPL - Non-Associated Plasticity Activation Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater117.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ELmn1 - First Minor Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ELmj1 - First Major Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ELmn2 - Second Minor Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ELmj2 - Second Major Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ELmn3 - Third Minor Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ELmj3 - Third Major Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ELmn4 - Fourth Minor Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELmj4 - Fourth Major Principal Elongation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater117.*_r10_Arg"
                  if synIDattr(slist[3], "name") =~ "pam_11.*"
                     return "ICUR - Forming Limit Diagram curve ID (tag)"
                  endif
               endif
            endif
         " }}}
         " {{{ Mater 118
         elseif synIDattr(slist[1], "name") =~ "pam_Mater118.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater118.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater118.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater118_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater118_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater118.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ff - Ultimate Fraction for Coalescence"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "REL_THIN - Thinning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Fi - Initial Microvoid Volume Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Fc - Critical Fraction for Coalescence"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Ff - Ultimate Fraction for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater118.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater118.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  return "IYC - Lankford Coefficient Definition Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "G || P - First Hill's || Lankford's Orthotropic Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "F || Q - Second Hill's || Lankford's Orthotropic Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "N || R - Second Hill's || Lankford's Orthotropic Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "VALUE - GRUC Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater118.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "q1 - Gurson Yield Surface Parameter 1"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "q2 - Gurson Yield Surface Parameter 2"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Fi - Initial Microvoid Volume Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Fc - Critical Fraction for Coalescence"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Fn - Nucleated Void Volume Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Sn || SSIGMAn - Standard Gaussian Deviation for Plastic Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIn || SIGMAn - Mean Effective Plastic Strain || Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "NUCTYP - Nucleation Control Type"
               endif
            endif
         " }}}
         " {{{ Mater 121
         elseif synIDattr(slist[1], "name") =~ "pam_Mater121.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater121.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - Thermal Dillatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater121.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "k || IFUNk - Material Consistency (Constant || Function)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "m || IFUNm - Strain Rate Hardening (Constant || Function)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "h1 || IFUNh1 - First Strain Rate Hardening Coefficient (Constant || Function)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "h2 || IFUNh2 - Second Strain Rate Hardening Coefficient (Constant || Function)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "w || IFUNw - Viscoelastic Coefficient (Constant || Function)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater121.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  return "TIMEfill - Response Time of Low Pass Filter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERATEref - Reference Strain-Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater121.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "REL_THIN - Thinning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIppmax - Maximum Principal Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               endif
            endif
         " }}}
         " {{{ Mater 126
         elseif synIDattr(slist[1], "name") =~ "pam_Mater126.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater126.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - Thermal Dillatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater126.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  return "SIGMAc - Critical Failure Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "TIMEfil - Time Interval for Stress Filter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater126.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  return "IELIM - Element Elimination Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ICC - Crack Closure Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            endif
         " }}}
         " {{{ Mater 127
         elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater127.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater127.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127e_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMAysat - Saturated Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NVoce - Order of Generalized Voce Function"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127e_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "c1 - First Exponential Amplitude Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "d1 - First Exponential Decay Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "c2 - Second Exponential Amplitude Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "d2 - Second Exponential Decay Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "c3 - Third Exponential Amplitude Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "d3 - Third Exponential Decay Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "c4 - Fourth Exponential Amplitude Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "d4 - Fourth Exponential Decay Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IYC - Yield Criterion Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "G - First Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "F - Second Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "N - Third Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "L - Fourth Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "M - Fifth Orthotropic Constant"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Fo - Damping Target Frequency"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "RELIM - Critical Failure Risk for Damage Initialization"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Lc - Characteristic Failure Length"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Ks - Shear Stress Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "IFAIL - Failure Criterion Reduction Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IKINH - Anisotropic Hardening Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Nx - Number of Back Stress Tensors"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IFUN1nf - First g_d/nu Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFUN2nf - Second g_d/nu Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IFUN3nf - Third g_d/nu Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "IFUN4nf - Fourth g_d/nu Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IFUN5nf - Fifth g_d/nu Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "IFUN6nf - Sixth g_d/nu Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IFUN7nf - Seventh g_d/nu Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IFUN8nf - Eighth g_d/nu Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERATE1nf - First Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERATE2nf - Second Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ERATE3nf - Third Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ERATE4nf - Fourth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ERATE5nf - Fifth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERATE6nf - Sixth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERATE7nf - Seventh Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ERATE8nf - Eighth Strain Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IFUN1sf - First g_s/theta Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFUN2sf - Second g_s/theta Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IFUN3sf - Third g_s/theta Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "IFUN4sf - Fourth g_s/theta Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IFUN5sf - Fifth g_s/theta Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "IFUN6sf - Sixth g_s/theta Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IFUN7sf - Seventh g_s/theta Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IFUN8sf - Eighth g_s/theta Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERATE1sf - First Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERATE2sf - Second Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ERATE3sf - Third Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ERATE4sf - Fourth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ERATE5sf - Fifth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERATE6sf - Sixth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERATE7sf - Seventh Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ERATE8sf - Eighth Strain Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r14" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IFUNFLD - Forming Limit Diagramm Failure Function ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFUNMSO - Mueschenborbn-Sonne Failure Function ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IFILTMSO - Flag for Filtering Mueschenbord-Sonne alpha Parameter (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SFACMSO - Scale Factor for Reference Plastic Strain Filtering"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r15" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Xs1 - Saturation Amplitude for First Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "f1 - Decay Coefficient for First Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "X11_1 Initial Value for 11-Component for First Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "X22_1 Initial Value for 22-Component for First Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "X12_1 Initial Value for 12-Component for First Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X23_1 Initial Value for 23-Component for First Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X31_1 Initial Value for 31-Component for First Back Stress"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r16" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Xs2 - Saturation Amplitude for Second Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "f2 - Decay Coefficient for Second Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "X11_2 Initial Value for 11-Component for Second Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "X22_2 Initial Value for 22-Component for Second Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "X12_2 Initial Value for 12-Component for Second Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X23_2 Initial Value for 23-Component for Second Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X31_2 Initial Value for 31-Component for Second Back Stress"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r17" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Xs3 - Saturation Amplitude for Third Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "f3 - Decay Coefficient for Third Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "X11_3 Initial Value for 11-Component for Third Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "X22_3 Initial Value for 22-Component for Third Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "X12_3 Initial Value for 12-Component for Third Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X23_3 Initial Value for 23-Component for Third Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X31_3 Initial Value for 31-Component for Third Back Stress"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater127.*_r18" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Xs4 - Saturation Amplitude for Fourth Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "f4 - Decay Coefficient for Fourth Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "X11_4 Initial Value for 11-Component for Fourth Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "X22_4 Initial Value for 22-Component for Fourth Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "X12_4 Initial Value for 12-Component for Fourth Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X23_4 Initial Value for 23-Component for Fourth Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X31_4 Initial Value for 31-Component for Fourth Back Stress"
               endif
            endif
         " }}}
         " {{{ Mater 128
         elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater128.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater128.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128k_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMA0 - Initial Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Cr - Isotropic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Rsat - Isotropic Hardening Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Cx - Kinematic Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Xsat - Kinematic Hardening - Saturation Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X11 - Initial Kinematic Hardening in local Frame, Axis 1"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X22 - Initial Kinematic Hardening in local Frame, Axis 2"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "X12 - Initial Kinematic Hardening in local Frame, in Plane"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "RELIM - Thinning Elimination Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Lc - Characteristic Failure Length"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "NFIL - Filtering Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "DEPS - Plastic Instability Check Interval"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IYC - Yield Criterion Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "G || ALPHA || aB - First Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "F || BETA || bB - Second Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "N || GAMMA || hB - Third Orthotropic Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "m - Fourth Orthotropic Constant"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIos - Static Offset Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ns - Static Hardening Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ms - Static Strain Rate Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIod - Dynamic Offset Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "nd - Dynamic Hardening Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "md - Dynamic Strain Rate Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERATEref - Reference Strain Rate"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "R0 - Longitudial Lankford's coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "R45 - Skew Lankford's coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "R90 - Transverse Lankford's coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "KH1 - First Kinematic Hardening Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "KH2 - Second Kinematic Hardening Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "KH3 - Third Kinematic Hardening Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "d - Inhomogenity Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "FLDS1 - Equivalent Failure Strain for Static Plane Strain Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "FLDS2 - Equivalent Failure Strain for Static Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "FLDS3 - Approximation Coefficient for Left Side of Static FLD"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "FLDS4 - Approximation Coefficient for Right Side of Static FLD"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "FLDD1 - Equivalent Failure Strain for Dynamic Plane Strain Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "FLDD2 - Equivalent Failure Strain for Dynamic Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "FLDD3 - Approximation Coefficient for Left Side of Dynamic FLD"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "FLDD4 - Approximation Coefficient for Right Side of Dynamic FLD"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "DFS1 - Equivalent Ductile Failure Strain for Static Tensile Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "DFS2 - Equivalent Ductile Failure Strain for Static Compressive Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DFS3 - Approximation Coefficient for Static Ductile Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "DFD1 - Equivalent Ductile Failure Strain for Dynamic Tensile Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "DFD2 - Equivalent Ductile Failure Strain for Dynamic Compressive Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "DFD3 - Approximation Coefficient for Dynamic Ductile Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "DFA1 - First Anisotropy Parameter for Static/Dynamic Ductile Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "DFA2 - Second Anisotropy Parameter for Static/Dynamic Ductile Failure"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater128.*_r14" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SFS1 - Equivalent Shear Failure Strain for Static Tensile Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SFS2 - Equivalent Shear Failure Strain for Static Compressive Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SFS3 - Approximation Coefficient for Static Shear Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SFD1 - Equivalent Shear Failure Strain for Dynamic Tensile Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SFD2 - Equivalent Shear Failure Strain for Dynamic Compressive Equibiaxial Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SFD3 - Approximation Coefficient for Dynamic Shear Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "SFK - Shear Stress Parameter k"
               endif
            endif
         " }}}
         " {{{ Mater 130/131/132
         elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater130.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Fo - Damping Target Frequency"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NOPER - Number of Operations"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "ILAY - Layer Flag for Composite Ply Database (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10*"
                  return "IDPLY || IDLAYER - Ply || Layer ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "THKPL - Ply Thickness"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ANGPL - Angle Defining Ply Orientation"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NMIN - Minimum Allowed Number of Cycles for Total Damage to Reach the Critical Value"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "VALUE - GRUC Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IFAIL - Ply Failure Element Elimination Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERATIO - Fraction of Failed Plies Triggering Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater130.*_r[7-9]" || synIDattr(slist[1], "name") =~ "pam_Mater130.*_r1[0-2]"
               if synIDattr(slist[2], "name") =~ "pam_1.5.*"
                  return "IDPLY1 - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_6.5.*"
                  return "IDAUX1 - First Auxiliary Variable ID Saved for Plot"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IDPLY2 - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_16.*"
                  return "IDAUX2 - Second Auxiliary Variable ID Saved for Plot"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "IDPLY3 - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "IDAUX3 - Third Auxiliary Variable ID Saved for Plot"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "IDPLY4 - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "IDAUX4 - Fourth Auxiliary Variable ID Saved for Plot"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IDPLY5 - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "IDAUX5 - Fifth Auxiliary Variable ID Saved for Plot"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "IDPLY6 - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "IDAUX6 - Sixth Fourth Auxiliary Variable ID Saved for Plot"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IDPLY7 - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "IDAUX7 - Seventh Auxiliary Variable ID Saved for Plot"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IDPLY8 - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_76.*"
                  return "IDAUX8 - Eigth Auxiliary Variable ID Saved for Plot"
               endif
            endif
         " }}}
         " {{{ Mater 143
         elseif synIDattr(slist[1], "name") =~ "pam_Mater143.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater143.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater143.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "REL_THIN - Thinning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LCmax - Curve ID for Maximum Strain for Element Elimination (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IFAIL - Unidirectional Failure Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IFelim - Element Elimination Strain Limit Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater143.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater143.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "VALUE - GRUC Value"
               endif
            endif
         " }}}
         " {{{ Mater 150
         elseif synIDattr(slist[1], "name") =~ "pam_Mater150.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater150.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E -Young's Modulus of Isotrpic Parent Sheet"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIclim - Compression Strain for Tension to Tension/Compression Return"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ARECUD - Area Reduction Ratio for Element Deactivation"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "MU - Coefficient of Internal Damping"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LAMBDA - Element Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IFLA90 - Element Stability Improvement Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater150.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - Young's Modulus for Layer 1"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "G1 - Shear Modulus for Layer 1"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IWR1 - Type of Wrinkling Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater150.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E2 - Young's Modulus for Layer 2"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "G2 - Shear Modulus for Layer 2"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IWR2 - Type of Wrinkling Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater150.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IMATLAW - Material Law Interpretation Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCLEAK - Function ID for Gas Leakage Rate per Fabric Area vs. Pressure (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater150.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SVWL - Length of Fiber, Size of Weaving Pattern"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SVWR - Radius of a Fabric Fiber"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SVWC1 - Pressure Coefficient C1"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SVWC2 - Pressure Coefficient C2"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SVWC3 - Pressure Coefficient C3"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SVWDIS - Discharge Coefficient"
               endif
            endif
         " }}}
         " {{{ Mater 151
         elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater151.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LAMBDA - Element Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ARECUD - Area Reduction Ratio for Element Deactivation"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Goh - First Resultant Fabric Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater151_r4_arg"
                  if synIDattr(slist[3], "name") =~ "pam_41.*"
                     return "IFUN - Curve ID (tag)"
                  elseif synIDattr(slist[3], "name") =~ "pam_71.*"
                     return "IHARD - Tensile Loading Curve Dependency Flag (menu)"
                  elseif synIDattr(slist[3], "name") =~ "pam_76.*"
                     return "IHYST - Hysteresis Model Flag (menu)"
                  endif
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "PSIlock - Angle of Fabric Shear Locking"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "G1h - Second Resultant Fabric Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IHARD - Tensile Loading Curve Dependency Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_76.*"
                  return "IHYST - Hysteresis Model Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCload1 - Function ID of Layer 1 Tensile Loading (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCunl1 || Hunl1 - Function ID of Layer 1 Tensile Unloading (tag) || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "H1 || K1unl || Hrel1 - Energy Dissipation Factor upon Unloading || Transition Slope between Loadung and Unloading || Energy Dissipation Factor upon Reloading"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "D1 || SLOP1 - Permanent Plastic Strain Factor after Unloading || Transition Slope Between Different Curves"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI10 - Initial Strain Value for Pretensioning"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCload2 - Function ID of Layer 2 Tensile Loading (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCunl2 || Hunl2 - Function ID of Layer 2 Tensile Unloading (tag) || Energy Dissipation Factor upon Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "H2 || K2unl || Hrel2 - Energy Dissipation Factor upon Unloading || Transition Slope between Loadung and Unloading || Energy Dissipation Factor upon Reloading"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "D2 || SLOP2 - Permanent Plastic Strain Factor after Unloading || Transition Slope Between Different Curves"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI10 - Initial Strain Value for Pretensioning"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCLEAK - Function ID for Gas Leakage Rate per Fabric Area vs. Pressure (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCSTRS - Function ID for First Leakage Multiplier (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCRAT1 - Function ID for Second Leakage Multiplier (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCRAT2 - Function ID for Second Leakage Multiplier (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIi - Strain Limit for Elastic Behavior"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EPSIu - Strain Limit for Material Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "K0 - Stiffness For Timestep Calculation"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SVWL - Length of Fiberm Size of Weaving Pattern"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SVWR - Radius of a Fabric Fiber"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SVWC1 - Pressure Coefficient C1"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SVWC2 - Pressure Coefficient C2"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SVWC3 - Pressure Coefficient C3"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SVWDIS - Discharge Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC11 - First Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LC12 - Second Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LC13 - Third Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LC14 - Fourth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LC15 - Fifth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LC16 - Sixth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LC17 - Seventh Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LC18 - Eighth Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "THET11 || ERAT11 || EPSI11 - Temperature || Strain Rate || Strain for the First Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "THET12 || ERAT12 || EPSI12 - Temperature || Strain Rate || Strain for the Second Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "THET13 || ERAT13 || EPSI13 - Temperature || Strain Rate || Strain for the Third Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "THET14 || ERAT14 || EPSI14 - Temperature || Strain Rate || Strain for the Fourth Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "THET15 || ERAT15 || EPSI15 - Temperature || Strain Rate || Strain for the Fifth Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "THET16 || ERAT16 || EPSI16 - Temperature || Strain Rate || Strain for the Sixth Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "THET17 || ERAT17 || EPSI17 - Temperature || Strain Rate || Strain for the Seventh Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "THET18 || ERAT18 || EPSI18 - Temperature || Strain Rate || Strain for the Eighth Curve"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC21 - First Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LC22 - Second Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LC23 - Third Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LC24 - Fourth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LC25 - Fifth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LC26 - Sixth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LC27 - Seventh Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LC28 - Eighth Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater151.*_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "THET21 || ERAT21 || EPSI21 - Temperature || Strain Rate || Strain for the First Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "THET22 || ERAT22 || EPSI22 - Temperature || Strain Rate || Strain for the Second Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "THET23 || ERAT23 || EPSI23 - Temperature || Strain Rate || Strain for the Third Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "THET24 || ERAT24 || EPSI24 - Temperature || Strain Rate || Strain for the Fourth Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "THET25 || ERAT25 || EPSI25 - Temperature || Strain Rate || Strain for the Fifth Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "THET26 || ERAT26 || EPSI26 - Temperature || Strain Rate || Strain for the Sixth Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "THET27 || ERAT27 || EPSI27 - Temperature || Strain Rate || Strain for the Seventh Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "THET28 || ERAT28 || EPSI28 - Temperature || Strain Rate || Strain for the Eighth Curve"
               endif
            endif
         " }}}
         " {{{ Mater 152
         elseif synIDattr(slist[1], "name") =~ "pam_Mater152.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater152.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LAMBDA - Element Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ARECUD - Area Reduction Ratio for Element Deactivation"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater152.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Longtiduinal Stiffness of Constituent Threads"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Fg - Factor for Shear Modulus Evaluation"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IWR1 - Type of Wrinkling Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_46.*"
                  return "Ao - Half Length in First Direction of Knitting Module"
               elseif synIDattr(slist[2], "name") =~ "pam_56.*"
                  return "Bo - Half Length in Seconf Direction of Knitting Module"
               elseif synIDattr(slist[2], "name") =~ "pam_66.*"
                  return "DELTA - Angle between Two Knitting Directions"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater152.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NKLAY - Number of Knitting Layers"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater152.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCLEAK - Function ID for Gas Leakage Rate per Fabric Area vs. Pressure (tag)"
               endif
            endif
         " }}}
         " {{{ Mater 161
         elseif synIDattr(slist[1], "name") =~ "pam_Mater161.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater161.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater161.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IFLAW - Stress-Strein Law Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater161.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            endif
         " }}}
         " {{{ Mater 162
         elseif synIDattr(slist[1], "name") =~ "pam_Mater162.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater162.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "IFLAW - Stress/Strain Law Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse Shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater162_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater162_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater162.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "RELIM - Ratio Thickness for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIi - Initial Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI1 - Intermediate Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "D1 - Intermediate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIu - Ultimate Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Du - Ultimate Damage Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater162.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFELIM - Element Elimination Strain Limit Choice (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater162.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_Mater103.*_r9_[ae]1"
                  return "KEYWORD - Sub-keyword for Selecting GRUC Output (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "VALUE - GRUC Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "REL_THIC - Thickning Factor for Element Elimination"
               endif
            endif
         " }}}
         " {{{ Mater 171
         elseif synIDattr(slist[1], "name") =~ "pam_Mater171.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater171.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater171.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - Thermal Dillatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "HGM - Membrane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "HGW - Out-of-plane Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "HGQ - Rotation Hourglass Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater171_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E1 - First Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E2 - Second Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E3 - Third Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "E4 - Fourth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fourth True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater171e_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater171_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E5 - Fifth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E6 - Sixth Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E7 - Seventh Plastic Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Seventh True Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater171.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "DEWKi - Initial EWK Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "DEWK1 - Intermediate EWK Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "D1 - Intermediate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "DEWKu - Ultimate EWK Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Du - Ultimate Damage Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater171.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SECelim - Failed Section Ratio for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater171.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "H - True Strain at Maximum Load"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Dc - EWK Critical Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Rc - EWK Critical Distance"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Plim - EWK Pressure Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHAEWK || EPSIt - EWK Pressure Exponent Alpha || True Local Tensile Strain at Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "BETAEWK || EPSIs - EWK Pressure Exponent Beta || True Local Shear Strain at Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "IW1 - EWK Flag for Uncapped W1 Growth (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater171.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Dc1 - Critical Damage Value for First Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Dc2 - Critical Damage Value for Second Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Dc3 - Critical Damage Value for Third Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Dc4 - Critical Damage Value for Fourth Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Dc5 - Critical Damage Value for Fifth Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Dc6 - Critical Damage Value for Sixth Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Dc7 - Critical Damage Value for Seventh Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Dc8 - Critical Damage Value for Eighth Strain Rate"
               endif
            endif
         " }}}
         endif
      "  }}}
      "  {{{ MATER 3D
      elseif synIDattr(slist[0], "name") =~ "pam_Mater.*"
         " {{{ CURVE Definition
         if synIDattr(slist[1], "name") =~ "pam_Mater.*c_r6" || synIDattr(slist[1], "name") =~ "pam_Mater62c_r5"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "LC1 - First Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "LC2 - Second Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "LC3 - Third Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "LC4 - Fourth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "LC5 - Fifth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "LC6 - Sixth Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "LC7 - Seventh Flow Curve ID (tag)"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "LC8 - Eighth Flow Curve ID (tag)"
            endif
         " }}}
         " {{{ POINT Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*b_r6" 
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "EPSI1 - First Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "EPSI2 - Second Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "EPSI3 - Third Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "EPSI4 - Fourth Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "EPSI5 - Fifth Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "EPSI6 - Sixth Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "EPSI7 - Seventh Effective Plastic Strain Value"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "EPSI8 - Eighth Effective Plastic Strain Value"
            endif
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*b_r7" 
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "SIGMA1 || ERATE1 - First Effective True Stress Value || Strain Rate"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "SIGMA2 || ERATE2- Second Effective True Stress Value || Strain Rate"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "SIGMA3 || ERATE3 - Third Effective True Stress Value || Strain Rate"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "SIGMA4 || ERATE4 - Fourth Effective True Stress Value || Strain Rate"
            elseif synIDattr(slist[2], "name") =~ "pam_41.*"
               return "SIGMA5 || ERATE5 - Fifth Effective True Stress Value || Strain Rate"
            elseif synIDattr(slist[2], "name") =~ "pam_51.*"
               return "SIGMA6 || ERATE6 - Sixth Effective True Stress Value || Strain Rate"
            elseif synIDattr(slist[2], "name") =~ "pam_61.*"
               return "SIGMA7 || ERATE7 - Seventh Effective True Stress Value || Strain Rate"
            elseif synIDattr(slist[2], "name") =~ "pam_71.*"
               return "SIGMA8 || ERATE8 - Eighth Effective True Stress Value || Strain Rate"
            endif
         " }}}
         " {{{ POWER/KRUPK Definition
         elseif synIDattr(slist[1], "name") =~ "pam_Mater.*p_r6" || synIDattr(slist[1], "name") =~ "pam_Mater62p_r5"
            if synIDattr(slist[2], "name") =~ "pam_1.10.*"
               return "a || k - Initial Yield Stress || Hardening Coefficient"
            elseif synIDattr(slist[2], "name") =~ "pam_11.*"
               return "b || EPSIo - Multiplier || Offset Strain"
            elseif synIDattr(slist[2], "name") =~ "pam_21.*"
               return "n - Hardening Exponent"
            elseif synIDattr(slist[2], "name") =~ "pam_31.*"
               return "SIGMApmax - Maximum Plastic Stress Cutoff"
            endif
         " }}}
         " {{{ Mater 11
         elseif synIDattr(slist[1], "name") =~ "pam_Mater11.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater11.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NU - Poisson's Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater11.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 12
         elseif synIDattr(slist[1], "name") =~ "pam_Mater12.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater12.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Ca - Initial Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Cb - Initial Hardening Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Cn - Initial Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Cc - Strain Rate Dependency coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Cm - Temperature Dependency Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater12.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Tmelt - Melting Temperature"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRATref - Reference Strain Rate"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "C - Specific Heat per Unit of Mass"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Pcut - Pressure Cutoff Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater12.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "C0 - First Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "C1 - Second Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "C2 - Third Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "C3 - Fourth Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "C4 - Fifth Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "C5 - Sixth Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "C6 - Seventh Coefficient for Polynomial Equation of State"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater12.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Troom - Room Temperature"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "FRACelim - Cycle Elimination Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "VFelim - Minimum Element Volume Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Telim - Elimination Trigger Temperature"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater12.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIi - Initial Equivalent Threshold Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI1 - Intermediate Equivalent Threshold Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "D1 - Intermediate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIu - Ultimate Equivalent Threshold Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Du - Ultimate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater12.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 15
         elseif synIDattr(slist[1], "name") =~ "pam_Mater15.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater15.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater15.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Bulk Unloading Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "C0 - First Hydrostatic Pressure Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "C1 - Second Hydrostatic Pressure Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "C2 - Third Hydrostatic Pressure Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "C3 - Fourth Hydrostatic Pressure Curve Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater15.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ftprim - Tensile Strength"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Kpost - Post Cracking Bulk Modulus"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater15.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Fcprim - Compressive Strength"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "A0 - First Plasticity Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "A1 - Second Plasticity Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "A2 - Third Plasticity Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "B0 - First Residual Plasticity Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "B1 - Second Residual Plasticity Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "B2 - Third Residual Plasticity Curve Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "EPSIp - Residual Plastic Strain"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater15.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Elastic Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "RATIOr - Steel Ratio in R Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "RATIOs - Steel Ratio in S Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "RATIOt - Steel Ratio in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Ep - Plastic Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Flag for Steel Ratio coordinate System"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater15.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "FRLIM - Element Elimination Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPLIM - Plastic Elimination Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DSMIN - Initial Elimination Crack Opening"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 16
         elseif synIDattr(slist[1], "name") =~ "pam_Mater16.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater16.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater16.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Et - Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - thermal Dilatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IYC - Yield Criterion Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater16.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Bulk Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IDRUP - Rupture Model ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "YC1 - Yield Criterion Coefficient 1"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "YC2 - Yield Criterion Coefficient 2"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "YC3 - Yield Criterion Coefficient 3"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "YC4 - Yield Criterion Coefficient 4"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "YC5 - Yield Criterion Coefficient 5"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "YC6 - Yield Criterion Coefficient 6"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater16e_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater16.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIi - Initial Equivalent Threshold Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI1 - Intermediate Equivalent Threshold Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "D1 - Intermediate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIu - Ultimate Equivalent Threshold Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Du - Ultimate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater16.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "PFRAC - Spall Pressure"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater16.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Nx - Number of Back Stress Tensors"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater16.*_r1[1-4]" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Xs1-4 - Saturation Amplitude"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "f1-4 - Decay coeffitient for First Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "X11_1-4 Initial Value for 11 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "X22_1-4 Initial Value for 22 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "X33_1-4 Initial Value for 33 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X12_1-4 Initial Value for 12 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X23_1-4 Initial Value for 23 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "X31_1-4 Initial Value for 31 Back Stress Component"
               endif
            endif
         " }}}
         " {{{ Mater 17
         elseif synIDattr(slist[1], "name") =~ "pam_Mater17.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater17.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Aload - First Mooney-Rivlin Law Coefficient for Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Bload - Second Mooney-Rivlin Law Coefficient for Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NUload - Poisson's Ratio for Loading"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Aunl - First Mooney-Rivlin Law Coefficient for Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Bunl - Second Mooney-Rivlin Law Coefficient for Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "NUunl - Poisson's Ratio for Unloading"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater17.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LTCload - Tension/Compression Test Curve ID for Loading (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LTCunl - Tension/Compression Test Curve ID for Unloading (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NSEARCH - Number of Cycles Between Search for Loading or Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NDECAY - Number of Cycles for Transition between Loading or Unloading"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater17.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 18
         elseif synIDattr(slist[1], "name") =~ "pam_Mater18.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater18.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "A - First Hart-Smith Law coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "B - Second Hart-Smith Law coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "C - Third Hart-Smith Law coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "D - Fourth Hart-Smith Law coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "NU - Poisson's Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater18.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 19
         elseif synIDattr(slist[1], "name") =~ "pam_Mater19.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater19.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ainf - First Mooney-Rivlin Law Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Binf - Second Mooney-Rivlin Law Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poissons's Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater19.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "A1 - First Mooney-Rivlin Law Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "B1 - Second Mooney-Rivlin Law Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "TAU1 - Relaxation Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "A2 - First Mooney-Rivlin Law Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "B2 - Second Mooney-Rivlin Law Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "TAU2 - Relaxation Constant"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater19.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 2O
         elseif synIDattr(slist[1], "name") =~ "pam_Mater20.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater20.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "A - First Yield Function Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "B - Second Yield Function Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "C - Third Yield Function Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "P0 - Initial Air Pressure"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "PHI - Volume Fraction of Solid Material"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater20.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater20.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 22
         elseif synIDattr(slist[1], "name") =~ "pam_Mater22.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater22.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E10 - Initial Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "n1 - Exponent in Power Law for Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ETA20 - Initial Viscous Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "E20 - Elastic Modulus for Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "n2 - Exponent in power Law for Viscosity"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater22.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NU - Poisson's Ratio"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater22.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 24
         elseif synIDattr(slist[1], "name") =~ "pam_Mater24.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater24.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Ec - Young's Modulus for Compression"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Et - Young's Modulus for Tension"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Po - Initial Air Pressure"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "PHI - Volume Fraction of Solid Material"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIelim - Maximum Principial Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "PLIM - Air Pressure Limitation Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater24.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NCRV1 - Curve ID for Hydrostatic Yield Stress vs. Volumetric Strain (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NCRV2 - Curve ID for Triaxial Yield Stress vs. Volumetric Strain (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NCRV3 - Curve ID for Tension Yield Stress vs. Volumetric Strain (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater24.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater24.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 25
         elseif synIDattr(slist[1], "name") =~ "pam_Mater25.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater25.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "A - First Yield Function Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "B - Second Yield Function Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "C - Third Yield Function Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "P0 - Initial Air Pressure"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "PHI - Volume Fraction of Solid Material"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater25.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIv1 - First Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIv2 - Second Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIv3 - Third Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIv4 - Fourth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIv5 - Fifth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EPSIv6 - Sixth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIv7 - Seventh Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "EPSIv8 - Eighth Volumetric Strain Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater25.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SSF1 - First Stress Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SSF2 - Second Stress Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SSF3 - Third Stress Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SSF4 - Fourth Stress Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SSF5 - Fifth Stress Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SSF6 - Sixth Stress Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "SSF7 - Seventh Stress Scale Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SSF8 - Eighth Stress Scale Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater25.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater25.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater25.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 26
         elseif synIDattr(slist[1], "name") =~ "pam_Mater26.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater26.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater26.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Et - Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Fo - Damping Target Frequency"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater26.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Bulk Modulus"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater26.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "q1 - Gurson Yield Surface Parameter 1"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "q2 - Gurson Yield Surface Parameter 2"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "fi - Initial Microvoid Volume Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "fn - Nucleated Void Volume Fraction"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Sn - Gaussian Standard Deviation"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EPSIn - Mean Effective Plastic Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "fc - Critical Fraction for Coalescence"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "fF - Ultimate Fraction for Coalescence"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater26.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               endif
            endif
         " }}}
         " {{{ Mater 28
         elseif synIDattr(slist[1], "name") =~ "pam_Mater28.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater28.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "B - Bulk Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "GAMMA - Exponent"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater28.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "P0 - Reference Pressure"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Pcutoff - Cutoff Pressure"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater28.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 30
         elseif synIDattr(slist[1], "name") =~ "pam_Mater30.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater30.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDPLY - Ply ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater30.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIslim - Equivalent Shear Strain Limit for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NMIN - Minimum Allowed Number of Cycles for Total Damage"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "IFAIL - Flag for Activating Element Elimination due to Failure (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater30.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater30.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 31
         elseif synIDattr(slist[1], "name") =~ "pam_Mater31.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater31.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDPLY - Ply ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater31.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIslim - Equivalent Shear Strain Limit for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIflim - Nonlinaer Fibre Tensile Strain Limit for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NMIN - Minimum Allowed Number of Cycles for Total Damage"
               elseif synIDattr(slist[2], "name") =~ "pam_26.*"
                  return "NMAIN - Number of Points for Nonlinear Fibre main Stress-Strain Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "NUNLD - Number of Points for Nonlinear Fibre Unloading Stress-Strain Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_36.*"
                  return "NRELD - Number of Points for Nonlinear Fibre Reloading Stress-Strain Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater31.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSI1 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI2 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI3 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSI4 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fibre Main Curve Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater31.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSI5 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI6 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI7 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSI8 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA8 - Fibre Main Curve Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater31.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIu1 - Fibre Unloading Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAu1 - Fibre Unloading Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIu2 - Fibre Unloading Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMAu2 - Fibre Unloading Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIu3 - Fibre Unloading Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMAu3 - Fibre Unloading Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIu4 - Fibre Unloading Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMAu4 - Fibre Unloading Curve Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater31.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIr1 - Fibre Reloading Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAr1 - Fibre Reloading Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIr2 - Fibre Reloading Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMAr2 - Fibre Reloading Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIr3 - Fibre Reloading Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMAr3 - Fibre Reloading Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIr4 - Fibre Reloading Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMAr4 - Fibre Reloading Curve Stress Value"
               endif
            endif
         " }}}
         " {{{ Mater 35
         elseif synIDattr(slist[1], "name") =~ "pam_Mater35.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater35.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater35.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Et - Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater35.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Bulk Modulus"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater35.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NUPLAS - Plastic Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ALPHAy - Alpha Shape of Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "TAUmax - Maximum Shear Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIplim - Plastic Strain elimination Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Gf - Mode I - Fracture Energy"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Dmax - Maximum Damage for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater35.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               endif
            endif
         " }}}
         " {{{ Mater 36
         elseif synIDattr(slist[1], "name") =~ "pam_Mater36.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater36.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater36_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LC2 - Second Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LC3 - Third Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LC4 - Fourth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LC5 - Fifth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LC6 - Sixth Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LC7 - Seventh Flow Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LC8 - Eighth Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater36_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERATE1 - First Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERATE2- Second Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ERATE3 - Third Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ERATE4 - Fourth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ERATE5 - Fifth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERATE6 - Sixth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERATE7 - Seventh Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ERATE8 - Eighth Strain Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater36_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSItmax - Maximum Total True Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCmaxelim - Curve ID for Maximum Total True Strain for Element Elimination (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater36_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 37
         elseif synIDattr(slist[1], "name") =~ "pam_Mater37.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater37_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "N - Number of Terms in Ogden Series"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "M - Number of Terms in Prony Series"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - Thermal Dilatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LTCsoft - Hysteresis Softening Function ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Gd - Frequency Independent Damping Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMAy - Frequency Independent Damping Yield Stress"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater37_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MU1 - First Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MU2 - Second Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MU3 - Third Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MU4 - Fourth Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "MU5 - Fifth Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "MU6 - Sixth Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "MU7 - Seventh Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "MU8 - Eighth Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater37_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ALPHA1 - First Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ALPHA2 - Second Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ALPHA3 - Third Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA4 - Fourth Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA5 - Fifth Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ALPHA6 - Sixth Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALPHA7 - Seventh Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ALPHA8 - Eighth Exponent"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater37_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G1 - First Shear Relaxation Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "G2 - Second Shear Relaxation Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "G3 - Third Shear Relaxation Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "G4 - Fourth Shear Relaxation Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "G5 - Fifth Shear Relaxation Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "G6 - Sixth Shear Relaxation Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "G7 - Seventh Shear Relaxation Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "G8 - Eighth Shear Relaxation Modulus"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater37_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "TAU1 - First Shear Relaxation Time"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "TAU2 - Second Shear Relaxation Time"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "TAU3 - Third Shear Relaxation Time"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "TAU4 - Fourth Shear Relaxation Time"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "TAU5 - Fifth Shear Relaxation Time"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "TAU6 - Sixth Shear Relaxation Time"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "TAU7 - Seventh Shear Relaxation Time"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "TAU8 - Eighth Shear Relaxation Time"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater37.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LTCuniax - Tension/Compression Test Curve ID"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LTCbiax - Biaxial Tension/Compression Test Curve ID"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LTCpshear - Pure Shear Tension/Compression Test Curve ID"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LTCvol - Volumetric Tension/Compression Test Curve ID"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 38
         elseif synIDattr(slist[1], "name") =~ "pam_mater38.*"
            if synIDattr(slist[1], "name") =~ "pam_mater38_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "N - Number of Terms in Ogden Series"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "M - Number of Terms in Prony Series"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Nv - Number of Terms in Ogden Series for Volumetric Response"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Mv - Number of Terms in Prony Series for Volumetric Response"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LTCsoft - Hysteresis Softening Function ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Gd - Frequency Independent Damping Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMAy - Frequency Independent Damping Yield Stress"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_mater38_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "MU1 - First Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "MU2 - Second Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "MU3 - Third Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MU4 - Fourth Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "MU5 - Fifth Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "MU6 - Sixth Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "MU7 - Seventh Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "MU8 - Eighth Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_mater38_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ALPHA1 - First Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ALPHA2 - Second Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ALPHA3 - Third Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA4 - Fourth Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA5 - Fifth Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ALPHA6 - Sixth Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALPHA7 - Seventh Exponent"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ALPHA8 - Eighth Exponent"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_mater38_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "GAMMA1 - First Shear Relaxation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "GAMMA2 - Second Shear Relaxation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "GAMMA3 - Third Shear Relaxation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "GAMMA4 - Fourth Shear Relaxation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "GAMMA5 - Fifth Shear Relaxation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "GAMMA6 - Sixth Shear Relaxation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "GAMMA7 - Seventh Shear Relaxation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "GAMMA8 - Eighth Shear Relaxation Coefficient"
               endif
            endif
         " }}}
         " {{{ Mater 41
         elseif synIDattr(slist[1], "name") =~ "pam_Mater41.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater41_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EoT - Young's Modulus in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIyT - Yield Strain in Compression in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E1T - First Tengential Modulus in Compression in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "E2T - Second Tengential Modulus in Compression in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "GoTL - Shear Modulus in TL-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EPSIyTL - Yield Strain foe Shear in TL-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "G1TL - Tangent Modulus for Shear in TL-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMAyT - Yield Stress for tensile Loading in T Direction"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater41s_r4" 
               if synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "CST - Crush Strength in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIc - Compaction Strain in all Directions"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Du - Ultimate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EPSI1 - Equivalent Strain for Damage"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater41_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EoL - Young's Modulus in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIyL - Yield Strain in Compression in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E1L - First Tengential Modulus in Compression in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "E2L - Second Tengential Modulus in Compression in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "GoLW - Shear Modulus in LW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EPSIyLW - Yield Strain foe Shear in LW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "G1LW - Tangent Modulus for Shear in LW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMAyL - Yield Stress for tensile Loading in L Direction"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater41_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EoW - Young's Modulus in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIyW - Yield Strain in Compression in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E1W - First Tengential Modulus in Compression in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "E2W - Second Tengential Modulus in Compression in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "GoWT - Shear Modulus in WT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EPSIyWT - Yield Strain foe Shear in WT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "G1WT - Tangent Modulus for Shear in WT-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMAyW - Yield Stress for tensile Loading in W Direction"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater41_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIc - Compaction Strain in all Directions"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater41s_r7" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater41_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "D1 - Intermediate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Du - Ultimate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIi - Initial Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSI1 - Intermediate Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSIu - Ultimate Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater41s_r8" 
               if synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
           elseif synIDattr(slist[1], "name") =~ "pam_Mater41_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ALPHA - Scale Factor for Volumetric Influence to Damage Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSIdoff - Volumetric Strain doe Damage Deactivation"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIdten - Initial Tensile Strain for Tensile Damage"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIelim"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
           elseif synIDattr(slist[1], "name") =~ "pam_Mater41s_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 42
         elseif synIDattr(slist[1], "name") =~ "pam_Mater42.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater42_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EC_TT - Compressive Young's Modulus in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "AC_TT - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUC_TT - Curve ID of Compressive Yield Stress vs. Total Strain in T Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVC_TT - Curve ID of Compressive Yield Stress Factor vs. Equivalent Strain in T Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASIC_TT - Power Factor for Element Switching in Compression in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESIC_TT - Compressive Total Strain in T Direction for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALIC_TT - Power Factor for Element Elimination in Compression in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIC_TT - Compressive Total Strain in T Direction for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ET_TT - Tensile Young's Modulus in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "AT_TT - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUT_TT - Curve ID of Tensile Yield Stress vs. Total Strain in T Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVT_TT - Curve ID of Tensile Yield Stress Factor vs. Equivalent Strain in T Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASIT_TT - Power Factor for Element Switching in Compression in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESIT_TT - Tensile Total Strain in T Direction for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALIT_TT - Power Factor for Element Elimination in Compression in T Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIT_TT - Tensile Total Strain in T Direction for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EC_LL - Compressive Young's Modulus in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "AC_LL - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUC_LL - Curve ID of Compressive Yield Stress vs. Total Strain in L Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVC_LL - Curve ID of Compressive Yield Stress Factor vs. Equivalent Strain in L Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASIC_LL - Power Factor for Element Switching in Compression in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESIC_LL - Compressive Total Strain in L Direction for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALIC_LL - Power Factor for Element Elimination in Compression in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIC_LL - Compressive Total Strain in L Direction for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ET_LL - Tensile Young's Modulus in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "AT_LL - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUT_LL - Curve ID of Tensile Yield Stress vs. Total Strain in L Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVT_LL - Curve ID of Tensile Yield Stress Factor vs. Equivalent Strain in L Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASIT_LL - Power Factor for Element Switching in Compression in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESIT_LL - Tensile Total Strain in L Direction for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALIT_LL - Power Factor for Element Elimination in Compression in L Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIT_LL - Tensile Total Strain in L Direction for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EC_WW - Compressive Young's Modulus in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "AC_WW - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUC_WW - Curve ID of Compressive Yield Stress vs. Total Strain in W Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVC_WW - Curve ID of Compressive Yield Stress Factor vs. Equivalent Strain in W Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASIC_WW - Power Factor for Element Switching in Compression in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESIC_WW - Compressive Total Strain in W Direction for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALIC_WW - Power Factor for Element Elimination in Compression in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIC_WW - Compressive Total Strain in W Direction for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ET_WW - Tensile Young's Modulus in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "AT_WW - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICUT_WW - Curve ID of Tensile Yield Stress vs. Total Strain in W Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVT_WW - Curve ID of Tensile Yield Stress Factor vs. Equivalent Strain in W Direction (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASIT_WW - Power Factor for Element Switching in Compression in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESIT_WW - Tensile Total Strain in W Direction for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALIT_WW - Power Factor for Element Elimination in Compression in W Direction"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELIT_WW - Tensile Total Strain in W Direction for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G_TL - Shear Modulus in TL-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "A_TL - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICU_TL - Curve ID of Shear Yield Stress vs. Total Strain in TL-Plane (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVL_TL - Curve ID of Shear Yield Stress Factor vs. Equivalent Strain in TL-Plane (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASI_TL - Power Factor for Element Switching in Compression in TL-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESI_TL - Total Shear Strain in TL-Plane for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALI_TL - Power Factor for Element Elimination in Compression in TL-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELI_TL - Shear Total Strain in TL-Plane for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G_LW - Shear Modulus in LW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "A_LW - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICU_LW - Curve ID of Shear Yield Stress vs. Total Strain in LW-Plane (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVL_LW - Curve ID of Shear Yield Stress Factor vs. Equivalent Strain in LW-Plane (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASI_LW - Power Factor for Element Switching in Compression in LW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESI_LW - Total Shear Strain in LW-Plane for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALI_LW - Power Factor for Element Elimination in Compression in LW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELI_LW - Shear Total Strain in LW-Plane for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G_TW - Shear Modulus in TW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater42_r4_[ae]1"
                  return "A_TW - Stress Strain Type (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ICU_TW - Curve ID of Shear Yield Stress vs. Total Strain in TW-Plane (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "MVL_TW - Curve ID of Shear Yield Stress Factor vs. Equivalent Strain in TW-Plane (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ASI_TW - Power Factor for Element Switching in Compression in TW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ESI_TW - Total Shear Strain in TW-Plane for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ALI_TW - Power Factor for Element Elimination in Compression in TW-Plane"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ELI_TW - Shear Total Strain in TW-Plane for Element Elimination"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Fo - Damping Target Frequency"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRATfac - Curve ID for Strain Rate Factor (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r14" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EVOLC - Compressive Volumetric Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EVOLT - Tensile Volumetric Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EVOMC - Compressive Volumetric Power Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EVOMT - Tensile Volumetric Power Factor for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EVSLC - Compressive Volumetric Strain for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "EVSLT - Tensile Volumetric Strain for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EVSMC - Compressive Volumetric Power Factor for Element Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "EVSMT - Tensile Volumetric Power Factor for Element Switching"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater42_r15" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Eswi - Young's Modulus after Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NUswi - Poisson's Ratio after Switching"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCy - Curve ID for Defining Yield Stress (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCdam - Curve ID for Defining Damage vs. Plastic Deformation (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Iswi - Allow Reverse Switchign Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Aswi - Exponent of the Switch Criterion for Elastic Stiffening before Switching"
               endif
            endif
         " }}}
         " {{{ Mater 45
         elseif synIDattr(slist[1], "name") =~ "pam_Mater45.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater45_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Initial Young'g Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "UNLFAC - Unloading Energy Dissipation Factor"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "HYDRO - Hydrostatic/Volumetric Load Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SLMULT - Transition Slope Multiplier"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Fo - Damping Target Frequency"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "XRATUL - Strain Rate Multiplier for Unloading"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IRATEXT - Strain Rate Extrapolation Flag (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCc1 - First Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCc2 - Second Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCc3 - Third Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCc4 - Fourth Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LCc5 - Fifth Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LCc6 - Sixth Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LCc7 - Seventh Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LCc8 - Eighth Compression Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERATc1 - First Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERATc2 - Second Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ERATc3 - Third Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ERATc4 - Fourth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ERATc5 - Fifth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERATc6 - Sixth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERATc7 - Seventh Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ERATc8 - Eighth Strain Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCt1 - First Tension Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCt2 - Second Tension Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCt3 - Third Tension Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCt4 - Fourth Tension Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LCt5 - Fifth Tension Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LCt6 - Sixth Tension Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LCt7 - Seventh Tension Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LCt8 - Eighth Tension Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERATt1 - First Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERATt2 - Second Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ERATt3 - Third Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ERATt4 - Fourth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ERATt5 - Fifth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERATt6 - Sixth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERATt7 - Seventh Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ERATt8 - Eighth Strain Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCc_u1 - Unloading Compression Stress-Strain Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCt_u1 - Unloading Tension Stress-Strain Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ALPHA - thermal Dilatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "IFLAG - Continuation Flag for PAM-COMFORT"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCc11 - First Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCc12 - Second Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCc13 - Third Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCc14 - Fourth Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LCc15 - Fifth Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LCc16 - Sixth Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LCc17 - Seventh Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LCc18 - Eighth Compression Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCc_u111 - First Unloading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCc_u112 - Second Unloading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCc_u113 - Third Unloading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCc_u114 - Fourth Unloading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LCc_u115 - Fifth Unloading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LCc_u116 - Sixth Unloading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LCc_u117 - Seventh Unloading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LCc_u118 - Eighth Unloading Compression Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERATc1 - First Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERATc2 - Second Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ERATc3 - Third Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ERATc4 - Fourth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ERATc5 - Fifth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERATc6 - Sixth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERATc7 - Seventh Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ERATc8 - Eighth Strain Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCt11 - Tension Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r14" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCt_u111 - Tension Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r15" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERATt11 - Tension Strain Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater45_r16" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IFUNDYN - Dynamic Modulus Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFUNDAMP - Damping Coefficient Curve ID (tag)"
               endif
            endif
         " }}}
         " {{{ Mater 47
         elseif synIDattr(slist[1], "name") =~ "pam_Mater47.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater47.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_Mater47_r4_[ae]1"
                  return "STATIC - Static Definition Keyword"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCc - Loading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCunl - Unloading Compression Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCt - Loading Tensile Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LCtunl - Unloading Tensile Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater47.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_Mater47_r7_[ae]1"
                  return "DYNAMIC - Dynamic Definition Keyword"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ISENS - Sensor ID to Start Dynamic Behavior"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater47.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IFUNDYN - Dynamic Modulus Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater47.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IFUNDAMP - Damping Coefficient Curve ID (tag)"
               endif
            endif
         " }}}
         " {{{ Mater 51
         elseif synIDattr(slist[1], "name") =~ "pam_Mater51.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater51_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ALPHA - Thermal Dilatation Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater51_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater51_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 52
         elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater52.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater52.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Et - Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - thermal Dilatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Bulk Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Ks - Shear Stress Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Nf - Filtering Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Lc - Characteristic Failure Length"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52e_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52l_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDLUTYD - Lookup Table ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "I1YD - Index Number of Plastic Strain in Lokoup Table"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "I2YD - Index Number of Plastic Strain Rate in Lokoup Table"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "I3YD - Index Number of Porosity Value in Lokoup Table"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_Mater52.*_r8_[ae]1"
                  return "DUDAATYP - Ductile Damage Function Formulation (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater52.*_r8_[ae]2"
                  return "SHDATYP - Shear Damage Function Formulation"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCd1 - First Ductile Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCd2 - Second Ductile Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCd3 - Third Ductile Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCd4 - Fourth Ductile Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LCd5 - Fifth Ductile Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LCd6 - Sixth Ductile Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LCd7 - Seventh Ductile Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LCd8 - Eighth Ductile Damage Stress Triaxiality Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*_r11" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERAd1 - First Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERAd2 - Second Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ERAd3 - Third Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ERAd4 - Fourth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ERAd5 - Fifth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERAd6 - Sixth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERAd7 - Seventh Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ERAd8 - Eighth Strain Rate Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*_r12" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LCd1 - First Shear Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "LCd2 - Second Shear Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "LCd3 - Third Shear Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "LCd4 - Fourth Shear Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "LCd5 - Fifth Shear Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "LCd6 - Sixth Shear Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "LCd7 - Seventh Shear Damage Stress Triaxiality Curve ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "LCd8 - Eighth Shear Damage Stress Triaxiality Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater52.*_r13" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "ERAs1 - First Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "ERAs2 - Second Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "ERAs3 - Third Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ERAs4 - Fourth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ERAs5 - Fifth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "ERAs6 - Sixth Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "ERAs7 - Seventh Strain Rate Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "ERAs8 - Eighth Strain Rate Value"
               endif
            endif
         " }}}
         " {{{ Mater 61
         elseif synIDattr(slist[1], "name") =~ "pam_Mater61.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater61_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse Shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater61_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            endif
         " }}}
         " {{{ Mater 62
         elseif synIDattr(slist[1], "name") =~ "pam_Mater62.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater62_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "NU - Poisson's Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "IFLAW - Stress/Strain Law Flag (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "As - Transverse Shear Correction Factor"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater62.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSI1 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA1 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI2 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA2 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI3 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA3 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSI4 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA4 - Fibre Main Curve Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater62.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSI5 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA5 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI6 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA6 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI7 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "SIGMA7 - Fibre Main Curve Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSI8 - Fibre Main Curve Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "SIGMA8 - Fibre Main Curve Stress Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater62.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "RELIM - Ratio Thickness for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSIi - Initial Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI1 - Intermediate Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "D1 - Intermediate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "EPSIu - Ultimate Equivalent Shear Strain for Damage Law"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Du - Ultimate Damage Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater62_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Equivalent Strain Limit for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "IFELIM - Flag for Element Elimination Strain Limit (menu)"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            endif
         " }}}
         " {{{ Mater 71
         elseif synIDattr(slist[1], "name") =~ "pam_Mater71.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater71.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater71.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Et - Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - thermal Dilatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater71.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Bulk Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Dc - EWK Critical Damage"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Rc - EWK Critical Distance"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Plim - EWK Pressure Limit"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA || EPSIt - EWK Pressure Exponent || True Local Tensile Strain at Failure"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "BETA || EPSIs - EWK Asymmetric Exponent || True Local Shear Strain at Failure"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater71l_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDLUTYD - Lookup Table ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "I1YD - Index Number of Plastic Strain in Lokoup Table"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "I2YD - Index Number of Plastic Strain Rate in Lokoup Table"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater71v_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMAysat - Saturated Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NVoce - Order of Generalized Voce Function"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater71e_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater71.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIpmax - Maximum Plastic Strain for Element Elimination"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "DEWKi - Initial EWK Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "DEWK1 - Intermediate EWK Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "D1 - Intermediate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "DEWKu - Ultimate EWK Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Du - Ultimate Damage Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater71.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               endif
            endif
         " }}}
         " {{{ Mater 99
         elseif synIDattr(slist[1], "name") =~ "pam_Mater99.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater99.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "E - Young's Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NU - Poisson's Ratio"
               endif
            endif
         " }}}
         " {{{ Mater 1
         elseif synIDattr(slist[1], "name") =~ "pam_Mater1.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater1.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater1.*_r4_[ae]1"
                  return "Description of Stress-Strain Law"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Et - Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "ALPHA - thermal Dilatation Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater1.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Bulk Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_Mater1.*_r5_[ae]1"
                  return "KEYWORD - Hardening Type (menu)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater1l_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "IDLUTYD - Lookup Table ID (tag)"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "I1YD - Index Number of Plastic Strain in Lokoup Table"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "I2YD - Index Number of Plastic Strain Rate in Lokoup Table"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater1v_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMAysat - Saturated Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "NVoce - Order of Generalized Voce Function"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater1e_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "LC1 - First Flow Curve ID (tag)"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater1.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater1.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater1.*_r10" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Nx - Number of Back Stress Tensors"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater1.*_r1[1-4]" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "Xs1-4 - Saturation Amplitude"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "f1-4 - Decay coeffitient for First Back Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "X11_1-4 Initial Value for 11 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "X22_1-4 Initial Value for 22 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "X33_1-4 Initial Value for 33 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "X12_1-4 Initial Value for 12 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "X23_1-4 Initial Value for 23 Back Stress Component"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "X31_1-4 Initial Value for 31 Back Stress Component"
               endif
            endif
         " }}}
         " {{{ Mater 2
         elseif synIDattr(slist[1], "name") =~ "pam_Mater2.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater2.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "K0 - Bulk Unloading Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "a0 - Yield Function Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "a1 - Yield Function Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "a2 - Yield Function Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Pfr - Pressure Cutoff for Tensile Fracture"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT1 - First Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT2 - Second Strain Rate Parameter"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater2.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIv1 - First Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "P1 - First Pressure Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIv2 - Second Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "P2 - Second Pressure Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater2.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIv3 - Third Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "P3 - Third Pressure Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIv4 - Fourth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "P4 - Fourth Pressure Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater2.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIv5 - Fifth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "P5 - Fifth Pressure Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIv6 - Sixth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "P6 - Sixth Pressure Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater2.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIv7 - Seventh Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "P7 - Seventh Pressure Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIv8 - Eighth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "P8 - Eighth Pressure Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater2.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSIv9 - Ninth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "P9 - Ninth Pressure Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSIv10 - Tenth Volumetric Strain Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "P10 - Tenth Pressure Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "STRAT3 - Third Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "STRAT4 - Fourth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "STRAT5 - Fifth Strain Rate Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "STRAT6 - Sixth Strain Rate Parameter"
               endif
            endif
         " }}}
         " {{{ Mater 5
         elseif synIDattr(slist[1], "name") =~ "pam_Mater5.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater5.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "K - Bulk Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Go - Short-time Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "GINF - Long-time Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "BETA - Decay Constant"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "ALPHA - Thermal Dillatation Coefficient"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater5.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater5.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 6
         elseif synIDattr(slist[1], "name") =~ "pam_Mater6.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater6.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "A - First Constant in Pressure Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "B - Second Constant in Pressure Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "R1 - Third Constant in Pressure Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "R2 - Fourth Constant in Pressure Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "OMEGA - Fifth Constant in Pressure Equation of State"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater6.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "D - Detonation Velocity"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "PCJ - Chapman-Jouget Pressure"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "E0 - Initial Internal Energy per Unit Volume"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater6.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater6.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 7
         elseif synIDattr(slist[1], "name") =~ "pam_Mater7.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater7.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMAy - Yield Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "Et - Tangent Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "Pfr - Pressure Cutoff"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "E0 - Initial Internal Energy per Unit Volume"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater7.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "C0 - First Coefficient for the Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "C1 - Second Coefficient for the Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "C2 - Third Coefficient for the Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "C3 - Fourth Coefficient for the Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "C4 - Fifth Coefficient for the Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "C5 - Sixth Coefficient for the Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "C6 - Seventh Coefficient for the Polynomial Equation of State"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater7.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSI1 - First Effective Plastic Strin Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSI2 - Second Effective Plastic Strin Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI3 - Third Effective Plastic Strin Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSI4 - Fourth Effective Plastic Strin Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "EPSI5 - Fifth Effective Plastic Strin Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater7.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "EPSI6 - Sixth Effective Plastic Strin Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "EPSI7 - Seventh Effective Plastic Strin Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "EPSI8 - Eighth Effective Plastic Strin Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "EPSI9 - Ninth Effective Plastic Strin Value"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater7.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMA1 - First True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA2 - Second True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SIGMA3 - Third True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA4 - Fourth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "SIGMA5 - Fifth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater7.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMA6 - Sixth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA7 - Seventh True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "SIGMA8 - Eighth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "SIGMA9 - Ninth True Stress Value"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         " {{{ Mater 8
         elseif synIDattr(slist[1], "name") =~ "pam_Mater8.*"
            if synIDattr(slist[1], "name") =~ "pam_Mater8.*_r4" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "G - Shear Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "SIGMA0 - Yield Stress at Room Temperature"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "BETA - Hardening Modulus"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "n - Hardening Coefficient"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "GAMMAi - Initial Plastic Strain"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "E0 - Initial Internal Energy per Unit Volume"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater8.*_r5" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "SIGMApmax - Maximum Plastic Stress"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "b - First Coefficient of Shear Modulus Equation"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "bprime - First Coefficient of Yield Stress Equation"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "B - Shear Temperature Parameter"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "f - Energy Multiplier"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater8.*_r6" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "A - Atomic Weight"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "Tm0 - Melting Temperature at Initial Density"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "GAMMA - First Coefficient of Melting Temperature Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "a - Second Coefficient of Melting Temperature Curve"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Pcut - Pressure Cutoff Value"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "R - Universal Gas Contant"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater8.*_r7" 
               if synIDattr(slist[2], "name") =~ "pam_1.10.*"
                  return "C0 - First Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_11.*"
                  return "C1 - Second Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_21.*"
                  return "C2 - Third Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_31.*"
                  return "C3 - Fourth Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "C4 - Fifth Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "C5 - Sixth Coefficient for Polynomial Equation of State"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "C6 - Seventh Coefficient for Polynomial Equation of State"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater8.*_r8" 
               if synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "KSI - Stiffness Proportional Damping Ratio"
               elseif synIDattr(slist[2], "name") =~ "pam_71.*"
                  return "Fo - Damping Target Frequency"
               endif
            elseif synIDattr(slist[1], "name") =~ "pam_Mater8.*_r9" 
               if synIDattr(slist[2], "name") =~ "pam_41.*"
                  return "Q1 - Quadratic Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_51.*"
                  return "Q2 - Linear Bulk Viscosity"
               elseif synIDattr(slist[2], "name") =~ "pam_61.*"
                  return "Q3 - Hourglass Bulk Viscosity"
               endif
            endif
         " }}}
         endif
      "  }}}
      endif
"  }}}
"  {{{ VAMAT
   elseif synIDattr(slist[0], "name") =~ "pam_VAMAT.*"
      if synIDattr(slist[1], "name") =~ "pam_VAMAT.*_r1$"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDMAT - VA Material ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "VAMATYP - Material Type (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_VAMAT[13]_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "RHOFL - Fluid Mass Density"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "CELEFL - Sound Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "ETAFL - Fluid Damping Coefficient"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_VAMAT2_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "RHOFL - Fluid Mass Density"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "CELEFL - Sound Velocity"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_VAMAT[23]_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Lvisc - Viscous Characteristic Length"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Ltherm - Thermal Characteristic Length"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "PORO - Porosity"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "RESI - Resistivity"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "TORT - Tortuosity"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_VAMAT[23]_r6" || synIDattr(slist[1], "name") =~ "pam_VAMAT[45]_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "RHOST - Structural Mass Density"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "NU - Poisson's Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "IFUNe - Function ID of Young's Modulus vs. Frequency (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EMULT - Multiplier of Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Econst - Constant Value of Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNd - Function ID of Structural Damping vs. Frequency (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "DMULT - Damping Function Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "ETAst - Structural Damping Coefficient"
         endif
      endif
"  }}}
"  {{{ THMAT
   elseif synIDattr(slist[0], "name") =~ "pam_THMAT"
      if synIDattr(slist[1], "name") =~ "pam_THMAT_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return "IDMAT - Material Entity ID"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_THMAT_MASS_DENSITY_r2"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "RHO || IFUNRHOt - Constant Mass Density || Function ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_THMAT_CONDUCTIVITY_r2"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Kp || IFUNKpT - Constant Thermal Conductivity || Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Kpyy || IFUNKpyy - Thermal Conductivity yy || Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Kpxy || IFUNKpxy - Thermal Conductivity xy || Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Kpzz || IFUNKpzz - Thermal Conductivity zz || Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Kpxz || IFUNKpxz - Thermal Conductivity xz || Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Kpyz || IFUNKpyz - Thermal Conductivity yz || Function ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_THMAT_SPECIFIC_HEAT_r2"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Cp || IFUNCpT - Constant Specific Heat || Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Href - Reference Enthalpy"
         endif
      endif
"  }}}
"  {{{ PLY
   elseif synIDattr(slist[0], "name") =~ "pam_PLY.*"
      if synIDattr(slist[1], "name") =~ "pam_PLY.*_r1$"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDPLY - Ply ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ITYP - Ply Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "RHO - Mass Density"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "FAILNP - Ply Failure Input Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "ISTRAT - Strain Rate Model Selection (menu)"
         endif
      endif
      " {{{ PLY0
      if synIDattr(slist[1], "name") =~ "pam_PLY0_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Et11 - Tensile Matrix Young's Modulus in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Et22 - Tensile Matrix Young's Modulus in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Et33 - Tensile Matrix Young's Modulus in Direction 3"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Gt12 - Tensile Matrix Shear Modulus in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Gt23 - Tensile Matrix Shear Modulus in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Gt13 - Tensile Matrix Shear Modulus in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Nut12 - Tensile Matrix Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Nut23 - Tensile Matrix Poisson's Ratio in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Nut13 - Tensile Matrix Poisson's Ratio in 13-Plane"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSImtsi - Tensile Matrix Initial Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSImts1 - Tensile Matrix Intermediate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSImtsu - Tensile Matrix Ultimate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dmts1 - Tensile Matrix Intermediate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dmtsu - Tensile Matrix Ultimate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNmts - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSImtvi - Tensile Matrix Initial Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSImtv1 - Tensile Matrix Intermediate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSImtvu - Tensile Matrix Ultimate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dmtv1 - Tensile Matrix Intermediate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dmtvu - Tensile Matrix Ultimate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNmtv - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r7"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Eft - Tensile Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ALPHAft - Tensile Fiber Volume Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfti - Tensile Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIft1 - Tensile Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIftu - Tensile Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dmtf1 - Tensile Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dmtfu - Tensile Fiber Ultimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "IFUNft - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r8"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "KAPPA23 - Shear Correction Factor in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "KAPPA13 - Shear Correction Factor in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "ALPHA1 - Longitudinal Thermal Expansion Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "ALPHA2 - Transverse Thermal Expansion Coefficient"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r9"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Ec11 - Compressive Matrix Young's Modulus in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Ec22 - Compressive Matrix Young's Modulus in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Ec33 - Compressive Matrix Young's Modulus in Direction 3"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r10"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Gc12 - Compressive Matrix Shear Modulus in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Gc23 - Compressive Matrix Shear Modulus in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Gc13 - Compressive Matrix Shear Modulus in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Nuc12 - Compressive Matrix Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Nuc23 - Compressive Matrix Poisson's Ratio in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Nuc13 - Compressive Matrix Poisson's Ratio in 13-Plane"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r11"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSImcsi - Compressive Matrix Initial Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSImcs1 - Compressive Matrix Intermediate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSImcsu - Compressive Matrix Ultimate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dmcs1 - Compressive Matrix Intermediate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dmcsu - Compressive Matrix Ultimate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNmcs - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r12"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSImcvi - Compressive Matrix Initial Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSImcv1 - Compressive Matrix Intermediate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSImcvu - Compressive Matrix Ultimate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dmcv1 - Compressive Matrix Intermediate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dmcvu - Compressive Matrix Ultimate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNmcv - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY0_r13"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Efc - Compressive Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ALPHAct - Compressive Fiber Volume Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfci - Compressive Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIfc1 - Compressive Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIfcu - Compressive Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dmcf1 - Compressive Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dmcfu - Compressive Fiber Ultimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "IFUNfc - Damage/Strain Curve ID (tag)"
         endif
      " }}}
      " {{{ PLY1
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "E0t1 - Young's Modulus in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "E0t2 - Young's Modulus in Direction 2"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "G012 - Shear Modulus in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "G023 - Shear Modulus in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "G013 - Shear Modulus in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "NU12 - Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "KAPPA23 - Shear Correction Factor in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "KAPPA13 - Shear Correction Factor in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "ISHD - Shear Damage method Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "ITRD - Transverse Shear Method Flag (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Yc - Critical Shear Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Y0 - Initial Shear Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Ycp - Critical Transverse Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Y0p - Initial Transverse Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "b - Shear and Transverse Damage Coupling Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Ysp - Brittle Transverse Damage Limit of Fiber/Matrix Interface"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Yr - Elementary Shear Damage Fracture Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "Dmax - Maximum Allowed Value for Shear and Transverse Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSIfti - Tensile Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSIftu - Tensile Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Dftu - Tensile Fiber Ultimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dsat1 - Saturation Shear Damage Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dsat2 - Saturation Transverse Damage Factor"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r7"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "IFUNd1 - Curve ID for Shear Damage Factor Function of Y (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "IFUNd2 - Curve ID for Transverse Damage Factor Function of Y (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r8"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ALPHA1 - Longitudial Thermal Expansion Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ALPHA2 - Transverse Thermal Expansion Coefficient"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r9"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "E0c1 - Compressive Fiber Young's Modulus in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "GAMMA - Compressive Factor of Modulus Correction"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPFIfci - Compressive Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPFIfcu - Compressive Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dfcu - Compressive Fiber Utimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IBUCK - Buckling Damage Matrix Flag (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r10"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "R0 - Initial Yield Stress"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "BETA - Hardening Law Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "m - Hardening Law Exponent"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "A - Shear and Transverse Plastic Strain Coupling"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r11"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ERATEr11 - Initial Strain Rate Threshold in Longitudinal Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "D11 - First Parameter of Longitudinal Young Modulus Law"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "n11 - Second Parameter of Longitudinal Young Modulus Law"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "D11u - First Parameter of Fiber Ultimate Law"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "n11u - Second Parameter of Fiber Ultimate Law"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "LAWTYP11 - Type of Law in Longitudinal Direction (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r12"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ERATEr12 - Initial Strain Rate Threshold in Shear Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "D12 - First Parameter of Transverse Young Modulus Law"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "n12 - Second Parameter of Transverse Young Modulus Law"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "D12u - First Parameter of Shear Modulus Law"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "n12u - Second Parameter of Shear Modulus Law"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "LAWTYP12 - Type of Law in Transverse Direction (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY1_r13"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ERATErR0 - Initial Strain Rate Threshold for Yield Stress"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "DR0 - First Parameter of Yield Stress Law"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "nR0 - Second Parameter of Yield Stress Law"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "LAWTYPR0 - Yield Stress Law Type (menu)"
         endif
      " }}}
      " {{{ PLY2
      elseif synIDattr(slist[1], "name") =~ "pam_PLY2_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "E - Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "SIGMAy - Yield Stress"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "NU - Poisson's Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "As - Transverse shear Correction Factor"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY2_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "E1 - First Plastic Tangent Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "SIGMA1 - First True Stress Value"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "E2 - Second Plastic Tangent Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "SIGMA2 - Second True Stress Value"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "E3 - Third Plastic Tangent Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "SIGMA3 - Third True Stress Value"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "E4 - Fourth Plastic Tangent Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "SIGMA4 - Fourth True Stress Value"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY2c_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "LC1 - First Flow Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "LC2 - Second Flow Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "LC3 - Third Flow Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "LC4 - Fourth Flow Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "LC5 - Fifth Flow Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "LC6 - Sixth Flow Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "LC7 - Seventh Flow Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "LC8 - Eighth Flow Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY2p_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "a || k - Initial Yield Stress || Hardening Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "b || EPSIo - Multiplier || Offset Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "n - Hardening Exponent"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "SIGMApmax - Maximum Plastic Stress Cutoff"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY2c_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ERATE1 - First Strain Rate Value"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ERATE2- Second Strain Rate Value"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "ERATE3 - Third Strain Rate Value"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "ERATE4 - Fourth Strain Rate Value"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ERATE5 - Fifth Strain Rate Value"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "ERATE6 - Sixth Strain Rate Value"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "ERATE7 - Seventh Strain Rate Value"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "ERATE8 - Eighth Strain Rate Value"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY2_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "E5 - Fifth Plastic Tangent Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "SIGMA5 - Fifth True Stress Value"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "E6 - Sixth Plastic Tangent Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "SIGMA6 - Sixth True Stress Value"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "E7 - Seventh Plastic Tangent Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "SIGMA7 - Seventh True Stress Value"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY2_r6"
         if synIDattr(slist[2], "name") =~ "pam_11.*"
            return "STRAT1 - First Strain Rate Parameter"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "STRAT2 - Second Strain Rate Parameter"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIi - Initial Equivalent Shear Strain for Damage Law"
         elseif synIDattr(slist[2], "name") =~ "pam_Mater10[56].*_r7_arg"
            return "Failure Definition Keyword"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSI1 - Intermediate Equivalent Shear Strain for Damage Law"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "D1 - Intermediate Damage Value"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "EPSIu - Ultimate Equivalent Shear Strain for Damage Law"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "DAMu - Ultimate Damage Value"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY2_r7"
         if synIDattr(slist[2], "name") =~ "pam_21.*"
            return "STRAT3 - Third Strain Rate Parameter"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "STRAT4 - Fourth Strain Rate Parameter"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "STRAT5 - Fourth Strain Rate Parameter"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "STRAT6 - Fourth Strain Rate Parameter"
         endif
      " }}}
      " {{{ PLY6
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Et11 - Tensile Matrix Young's Modulus in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Et22 - Tensile Matrix Young's Modulus in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Et33 - Tensile Matrix Young's Modulus in Direction 3"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Gt12 - Tensile Matrix Shear Modulus in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Gt23 - Tensile Matrix Shear Modulus in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Gt13 - Tensile Matrix Shear Modulus in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Nut12 - Tensile Matrix Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Nut23 - Tensile Matrix Poisson's Ratio in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Nut13 - Tensile Matrix Poisson's Ratio in 13-Plane"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSItsi - Tensile Matrix Initial Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSIts1 - Tensile Matrix Intermediate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSItsu - Tensile Matrix Ultimate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dts1 - Tensile Matrix Intermediate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dtsu - Tensile Matrix Ultimate Shear Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSItvi - Tensile Matrix Initial Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSItv1 - Tensile Matrix Intermediate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSItvu - Tensile Matrix Ultimate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dtv1 - Tensile Matrix Intermediate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dtvu - Tensile Matrix Ultimate Volume Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r7"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Eft1 - Tensile Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ALPHAft1 - Tensile Fiber Volume Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfti1 - Tensile Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIft11 - Tensile Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIftu1 - Tensile Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dft11 - Tensile Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dftu1 - Tensile Fiber Ultimate Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r8"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Eft2 - Tensile Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ALPHAft2 - Tensile Fiber Volume Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfti2 - Tensile Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIft12 - Tensile Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIftu2 - Tensile Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dtf12 - Tensile Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dtfu2 - Tensile Fiber Ultimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "ALPHA2 - Second Fiber Direction Angle"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r10"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Ec11 - Compressive Matrix Young's Modulus in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Ec22 - Compressive Matrix Young's Modulus in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Ec33 - Compressive Matrix Young's Modulus in Direction 3"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r11"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Gc12 - Compressive Matrix Shear Modulus in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Gc23 - Compressive Matrix Shear Modulus in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Gc13 - Compressive Matrix Shear Modulus in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Nuc12 - Compressive Matrix Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Nuc23 - Compressive Matrix Poisson's Ratio in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Nuc13 - Compressive Matrix Poisson's Ratio in 13-Plane"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r12"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSIcsi - Compressive Matrix Initial Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSIcs1 - Compressive Matrix Intermediate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIcsu - Compressive Matrix Ultimate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dcs1 - Compressive Matrix Intermediate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dcsu - Compressive Matrix Ultimate Shear Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r13"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSIcvi - Compressive Matrix Initial Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSIcv1 - Compressive Matrix Intermediate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIcvu - Compressive Matrix Ultimate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dcv1 - Compressive Matrix Intermediate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dcvu - Compressive Matrix Ultimate Volume Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r14"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Efc1 - Compressive Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ALPHAct1 - Compressive Fiber Volume Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfci1 - Compressive Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIfc11 - Compressive Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIfcu1 - Compressive Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dcf11 - Compressive Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dcfu1 - Compressive Fiber Ultimate Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY6_r15"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Efc2 - Compressive Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ALPHAct2 - Compressive Fiber Volume Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfci2 - Compressive Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIfc12 - Compressive Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIfcu2 - Compressive Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dfc12 - Compressive Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dfcu2 - Compressive Fiber Ultimate Damage"
         endif
      " }}}
      " {{{ PLY7
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "E01 - Young's Modulus in First Fiber Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "E02 - Young's Modulus in Second Fiber Direction"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "G012 - Shear Modulus in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "G023 - Shear Modulus in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "G013 - Shear Modulus in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "NU012 - Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "KAPPA23 - Shear Correction Factor in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "KAPPA13 - Shear Correction Factor in 13-Plane"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Y12C - Critical Shear Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Y120 - Initial Shear Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Y12R - Shear Damage Fracture Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "D12max - Maximum Allowed Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Y11C - Critical Tensile Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Y110 - Initial Tensile Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Y11R - Tensile Damage Fracture Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "D11max - Maximum Allowed Tensile Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r8"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ALPHA1 - Longitudial Thermal Expansion Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ALPHA2 - Transverse Thermal Expansion Coefficient"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r9"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "E0c1 - Compressive Fiber Young's Modulus in First Fiber Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "E1c1 - Compressive Fiber Young's Modulus in Second Fiber Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "NU0c12 - Compressive Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Y11cC - Critical Compressive Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Y11c0 - Initial Compressive Damage Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Y11cR - Compressive Damage Fracture Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "D11cmax - Maximum Allowed Compressive Damage"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r10"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "R0 - Initial Yield Stress"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "BETA - Hardening Law Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "m - Hardening Law Exponent"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r11"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ERATEr11 - Initial Strain Rate Threshold in Tension"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "D11 - First Parameter of Tensile Law"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "n11 - Second Parameter of Tensile Law"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "LAWTYP11 - Type of Law in Tensile Direction (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ERATEc11 - Initial Strain Rate Threshold in Compression"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "D11c - First Parameter of Compressive Law"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "n11c - Second Parameter of Compressive Law"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "LAWTYP11c - Type of Law in Compressive Direction (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r12"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ERATEr12 - Initial Strain Rate Threshold in Shear Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "D12 - First Parameter of Transverse Young Modulus Law"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "n12 - Second Parameter of Transverse Young Modulus Law"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "LAWTYP12 - Type of Law in Transverse Direction (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY7_r13"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "ERATErR0 - Initial Strain Rate Threshold for Yield Stress"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "DR0 - First Parameter of Yield Stress Law"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "nR0 - Second Parameter of Yield Stress Law"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "LAWTYPR0 - Yield Stress Law Type (menu)"
         endif
      " }}}
      " {{{ PLY8
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Et11 - Tensile Matrix Young's Modulus in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Et22 - Tensile Matrix Young's Modulus in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Et33 - Tensile Matrix Young's Modulus in Direction 3"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Gt12 - Tensile Matrix Shear Modulus in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Gt23 - Tensile Matrix Shear Modulus in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Gt13 - Tensile Matrix Shear Modulus in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "NUt12 - Tensile Matrix Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "NUt23 - Tensile Matrix Poisson's Ratio in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "NUt13 - Tensile Matrix Poisson's Ratio in 13-Plane"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSImtsi - Tensile Matrix Initial Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSImts1 - Tensile Matrix Intermediate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSImtsu - Tensile Matrix Ultimate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dmts1 - Tensile Matrix Intermediate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dmtsu - Tensile Matrix Ultimate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNmts - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r6"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSImtvi - Tensile Matrix Initial Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSImtv1 - Tensile Matrix Intermediate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSImtvu - Tensile Matrix Ultimate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dmtv1 - Tensile Matrix Intermediate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dmtvu - Tensile Matrix Ultimate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNmtv - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r7"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Eft1 - Tensile Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "GAMMAt1 - Gamma Non-Linearity Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfti1 - Tensile Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIft11 - Tensile Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIftu1 - Tensile Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dmtf11 - Tensile Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dmtfu1 - Tensile Fiber Ultimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "IFUNft1 - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r8"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Eft2 - Tensile Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "GAMMAt2 - Gamma Non-Linearity Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfti2 - Tensile Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIft12 - Tensile Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIftu2 - Tensile Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dmtf12 - Tensile Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dmtfu2 - Tensile Fiber Ultimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "IFUNft2 - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r9"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "As - Outer Shear Correction Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "ANG2 - Angle between Fibers"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "VOLFRf1 - Fiber 1 Volume Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "VOLFRf2 - Fiber 2 Volume Ratio"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDAMCR - Matrix Damage Criteria (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IWARP - Frame of Matrix Definition (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "ALPHA1 - Longitudial Thermal Expansion Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "ALPHA2 - Transverse Thermal Expansion Coefficient"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r10"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Ec11 - Compressive Matrix Young's Modulus in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Ec22 - Compressive Matrix Young's Modulus in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Ec33 - Compressive Matrix Young's Modulus in Direction 3"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r11"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Gc12 - Compressive Matrix Shear Modulus in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "Gc23 - Compressive Matrix Shear Modulus in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "Gc13 - Compressive Matrix Shear Modulus in 13-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Nuc12 - Compressive Matrix Poisson's Ratio in 12-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Nuc23 - Compressive Matrix Poisson's Ratio in 23-Plane"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Nuc13 - Compressive Matrix Poisson's Ratio in 13-Plane"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r12"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSImcsi - Compressive Matrix Initial Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSImcs1 - Compressive Matrix Intermediate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSImcsu - Compressive Matrix Ultimate Equivalent Shear Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dmcs1 - Compressive Matrix Intermediate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dmcsu - Compressive Matrix Ultimate Shear Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNmcs - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r13"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "EPSImcvi - Compressive Matrix Initial Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "EPSImcv1 - Compressive Matrix Intermediate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSImcvu - Compressive Matrix Ultimate Equivalent Volume Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "Dmcv1 - Compressive Matrix Intermediate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Dmcvu - Compressive Matrix Ultimate Volume Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "IFUNmcv - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r14"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Efc1 - Compressive Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "GAMMAc1 - Gamma Non-Linearity Factgor"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfci1 - Compressive Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIfc11 - Compressive Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIfcu1 - Compressive Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dmcf11 - Compressive Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dmcfu1 - Compressive Fiber Ultimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "IFUNfc1 - Damage/Strain Curve ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_PLY8_r15"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "Efc2 - Compressive Fiber Young's Modulus"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "GAMMAc2 - Gamma Non-Linearity Factgor"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "EPSIfci2 - Compressive Fiber Initial Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*"
            return "EPSIfc12 - Compressive Fiber Intermediate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "EPSIfcu2 - Compressive Fiber Ultimate Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*"
            return "Dmcf12 - Compressive Fiber Intermediate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "Dmcfu2 - Compressive Fiber Ultimate Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*"
            return "IFUNfc2 - Damage/Strain Curve ID (tag)"
         endif
      " }}}
      " {{{ PLYFAIL
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL0_r2"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "EPSIlim - Shar Strain Limit"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL1_r2"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "SIGtu11 - Tensile Strength in Direction 1"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "SIGtu22 - Tensile Strength in Direction 2"
         elseif synIDattr(slist[3], "name") =~ "pam_21.*"
            return "SIGtu33 - Tensile Strength in Direction 3"
         elseif synIDattr(slist[3], "name") =~ "pam_31.*"
            return "TAUpu12 - Positive Shear Strength in 12-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "TAUpu23 - Positive Shear Strength in 23-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_51.*"
            return "TAUpu13 - Positive Shear Strength in 13-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_61.*"
            return "TWk - k Parameter in Tsai-Wu Criterion"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL1_r3"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "SIGcu11 - Compressive Strength in Direction 1"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "SIGcu22 - Compressive Strength in Direction 2"
         elseif synIDattr(slist[3], "name") =~ "pam_21.*"
            return "SIGcu33 - Compressive Strength in Direction 3"
         elseif synIDattr(slist[3], "name") =~ "pam_31.*"
            return "TAUnu12 - Negative Shear Strength in 12-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "TAUnu23 - Negative Shear Strength in 23-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_51.*"
            return "TAUnu13 - Negative Shear Strength in 13-Plane"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL6_r2"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "EPSItu11 - Tensile Ultimate Strain in Direction 1"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "EPSItu22 - Tensile Ultimate Strain in Direction 2"
         elseif synIDattr(slist[3], "name") =~ "pam_21.*"
            return "EPSItu33 - Tensile Ultimate Strain in Direction 3"
         elseif synIDattr(slist[3], "name") =~ "pam_31.*"
            return "EPSIpu12 - Positive Ultimate Shear Strain in 12-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "EPSIpu23 - Positive Ultimate Shear Strain in 23-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_51.*"
            return "EPSIpu13 - Positive Ultimate Shear Strain in 13-Plane"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL6_r3"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "EPSIcu11 - Compressive Ultimate Strain in Direction 1"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "EPSIcu22 - Compressive Ultimate Strain in Direction 2"
         elseif synIDattr(slist[3], "name") =~ "pam_21.*"
            return "EPSIcu33 - Compressive Ultimate Strain in Direction 3"
         elseif synIDattr(slist[3], "name") =~ "pam_31.*"
            return "EPSInu12 - Negative Ultimate Shear Strain in 12-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "EPSInu23 - Negative Ultimate Shear Strain in 23-Plane"
         elseif synIDattr(slist[3], "name") =~ "pam_51.*"
            return "EPSInu13 - Negative Ultimate Shear Strain in 13-Plane"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL7_r2"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "THETA - Biaxial Sensitivity Factor"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "EPSIslim - Equivalent Strain Limit"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL8_r2"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "USER1 - User-Defined Parameter 1"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "USER2 - User-Defined Parameter 2"
         elseif synIDattr(slist[3], "name") =~ "pam_21.*"
            return "USER3 - User-Defined Parameter 3"
         elseif synIDattr(slist[3], "name") =~ "pam_31.*"
            return "USER4 - User-Defined Parameter 4"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "USER5 - User-Defined Parameter 5"
         elseif synIDattr(slist[3], "name") =~ "pam_51.*"
            return "USER6 - User-Defined Parameter 6"
         elseif synIDattr(slist[3], "name") =~ "pam_61.*"
            return "USER7 - User-Defined Parameter 7"
         elseif synIDattr(slist[3], "name") =~ "pam_71.*"
            return "USER8 - User-Defined Parameter 8"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL8_r3"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "USER9 - User-Defined Parameter 9"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "USER10 - User-Defined Parameter 10"
         elseif synIDattr(slist[3], "name") =~ "pam_21.*"
            return "USER11 - User-Defined Parameter 11"
         elseif synIDattr(slist[3], "name") =~ "pam_31.*"
            return "USER12 - User-Defined Parameter 12"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "USER13 - User-Defined Parameter 13"
         elseif synIDattr(slist[3], "name") =~ "pam_51.*"
            return "USER14 - User-Defined Parameter 14"
         elseif synIDattr(slist[3], "name") =~ "pam_61.*"
            return "USER15 - User-Defined Parameter 15"
         elseif synIDattr(slist[3], "name") =~ "pam_71.*"
            return "USER16 - User-Defined Parameter 16"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL9_r2"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "SIGslim - Equivalent Stress Limit"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL10_r2"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "R22+ - Transverse Matrix Tensile Strength"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "R22- - Transverse Matrix Compressive Strength"
         elseif synIDattr(slist[3], "name") =~ "pam_21.*"
            return "R12 - In-plane Matrix Shear Strength"
         elseif synIDattr(slist[3], "name") =~ "pam_31.*"
            return "p12c - Slope 1 of the Failure Envelope"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "p12t - Slope 2 of the Failure Envelope"
         elseif synIDattr(slist[3], "name") =~ "pam_51.*"
            return "DAMpost - Post-Damage of Matrix"
         elseif synIDattr(slist[3], "name") =~ "pam_61.*"
            return "p23t - Slope 3 of the Failure Envelope"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_PLYFAIL10_r3"
         if synIDattr(slist[3], "name") =~ "pam_1.10.*"
            return "YSFTYP - Yamada Sun Fiber Failure Type (menu)"
         elseif synIDattr(slist[3], "name") =~ "pam_11.*"
            return "Xt11 - Longitudinal Tensile Stress/Strain in Fiber Direction"
         elseif synIDattr(slist[3], "name") =~ "pam_21.*"
            return "Xt12 - In-Plane Shear Stress/Strain"
         elseif synIDattr(slist[3], "name") =~ "pam_31.*"
            return "Xt13 - Out-of-Plane Shear Stress/Strain"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "Xc11 - Longitudinal Compressive Stress/Strain in Fiber Direction"
         elseif synIDattr(slist[3], "name") =~ "pam_51.*"
            return "Xc12 - In-Plane Shear Stress/Strain"
         elseif synIDattr(slist[3], "name") =~ "pam_61.*"
            return "Xc13 - Out-of-Plane Shear Stress/Strain"
         endif
      " }}}
      " {{{ PLYFAILX
      elseif synIDattr(slist[1], "name") =~ "pam_PLYFAIL"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_1.10.*")
            return "FAILDAM - Type of Failure Treatment (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_11.*")
            return "FAILTYP - Type of Ply Failure Model (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_21.*")
            return "NUSRALO - Number of History Variables for User-Defined Criterion"
         elseif synIDattr(slist[2], "name") =~ "pam_31.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_31.*")
            return "NCYCLE - Number of Cycles for Iterative Filtering of Failure Criteria"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_41.*")
            return "IFUNmfc - Curve ID for Matrix Damage based on Failure Criteria (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_51.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_51.*")
            return "IDAMm - Flag for Matrix Damage (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_61.*")
            return "IFUNffc - Curve ID for Fiber Damage based on Failure Criteria (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_71.*" || (synIDattr(slist[2], "name") =~ "pam_PLYFAIL.*_r1" && synIDattr(slist[3], "name") =~ "pam_71.*")
            return "IDAMf - Flag for Fiber Damage (menu)"
         endif
      " }}}
      endif
"   }}} 
"  {{{ FRICT
   elseif synIDattr(slist[0], "name") =~ "pam_FRICT.*"
      if synIDattr(slist[1], "name") =~ "pam_FRICT.*_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDFRIC"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFROPT - Friction Model Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            if synIDattr(slist[1], "name") =~ "pam_FRICT1_r1"
               return "FRICT - Friction Coefficient"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT2_r1"
               return "IPCUR/IVCIR - Reference Curve ID (tag)"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT4_r1"
               return "IPCUR - Reference Curve ID for Contact Pressure (tag)"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT5_r1"
               return "C0 - Coefficient 0"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT1[01]_r1"
               return "FRICT1 - Friction Coefficient in Direction 1"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT12_r1"
               return "VAL1 - User Parameter 1"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT13_r1"
               return "IDLKU - Lookup Table ID (tag)"
            endif
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            if synIDattr(slist[1], "name") =~ "pam_FRICT4_r1"
               return "IVCUR - Curve ID for Sliding Velocity (tag)"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT5_r1"
               return "C1 - Coefficient 1"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT1[01]_r1"
               return "FRICT2 - Friction Coefficient in Direction 2"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT12_r1"
               return "VAL2 - User Parameter 2"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT13_r1"
               return "I1F - Index for Contact Pressure Axis"
            endif
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            if synIDattr(slist[1], "name") =~ "pam_FRICT5_r1"
               return "C2 - Coefficient 2"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT11_r1"
               return "ALPHA1 - Rotation Angle Between Directions"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT12_r1"
               return "VAL3 - User Parameter 3"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT13_r1"
               return "I2F - Index for Sliding Velocity Axis"
            endif
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            if synIDattr(slist[1], "name") =~ "pam_FRICT12_r1"
               return "VAL4 - User Parameter 4"
            elseif synIDattr(slist[1], "name") =~ "pam_FRICT13_r1"
               return "I3F - Index for Temperatur Axis"
            endif
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            if synIDattr(slist[1], "name") =~ "pam_FRICT12_r1"
               return "VAL5 - User Parameter 5"
            endif
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            if synIDattr(slist[1], "name") =~ "pam_FRICT12_r1"
               return "VAL6 - User Parameter 6"
            endif
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            if synIDattr(slist[1], "name") =~ "pam_FRICT12_r1"
               return "VAL7 - User Parameter 7"
            endif
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_FRICT12_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "VAL8 - User Parameter 8"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "VAL9 - User Parameter 9"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "VAL10 - User Parameter 10"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "VAL11 - User Parameter 11"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "VAL12 - User Parameter 12"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "VAL13 - User Parameter 13"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "VAL14 - User Parameter 14"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "VAL15 - User Parameter 15"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "VAL16 - User Parameter 16"
         endif
      endif
"  }}}
"  {{{ RUPMO
   elseif synIDattr(slist[0], "name") =~ "pam_RUPMO.*"
      if synIDattr(slist[1], "name") =~ "pam_RUPMO.*_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDRUP"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IRUPT - Rupture Model Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFMON - Monitoring Option (menu)"
         elseif col('.') >= 33 && col('.') <= 40
            return "FILTER - Failure Criterion Time Windows Type (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO[01]_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "FAILT - Failure Time"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "FAILD - Failure Duration"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "AFAILN - Ultimate Tensile Strength"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "AFAILS - Ultimate Shear Strength"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "A1 - First Exponent in Failure Model"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "A2 - Second Exponent in Failure Model"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "INTF - Failure Criterion Time Window"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "D1 - Energy Absorbtion Distance after Failure Initiation"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "D2 - Ultimate Distance at Complete Failure"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO2_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "USR1 - User Parameter 1"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "FAILD - Failure Duration"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "USR2 - User Parameter 2"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "USR3 - User Parameter 3"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "USR4 - User Parameter 4"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "USR5 - User Parameter 5"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "INTF - Failure Criterion Time Window"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "D1 - Energy Absorbtion Distance after Failure Initiation"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "D2 - Ultimate Distance at Complete Failure"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO2_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "USR6 - User Parameter 6"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "USR7 - User Parameter 7"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "USR8 - User Parameter 8"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "USR9 - User Parameter 9"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "USR10 - User Parameter 10"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "USR11 - User Parameter 11"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "USR12 - User Parameter 12"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "USR13 - User Parameter 13"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "USR14 - User Parameter 14"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO2_r5"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "USR15 - User Parameter 15"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "USR16 - User Parameter 16"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "USR17 - User Parameter 17"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "USR18 - User Parameter 18"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "USR19 - User Parameter 19"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "USR20 - User Parameter 20"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "USR21 - User Parameter 21"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "USR22 - User Parameter 22"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "USR23 - User Parameter 23"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO2_r6"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "USR24 - User Parameter 24"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "USR25 - User Parameter 25"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "USR26 - User Parameter 26"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "USR27 - User Parameter 27"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "USR28 - User Parameter 28"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "USR29 - User Parameter 29"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "USR30 - User Parameter 30"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "USR31 - User Parameter 31"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "USR32 - User Parameter 32"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO3_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "USR1 - User Parameter 1"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "USR2 - User Parameter 2"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "USR3 - User Parameter 3"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "USR4 - User Parameter 4"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "USR5 - User Parameter 5"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "USR6 - User Parameter 6"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "USR7 - User Parameter 7"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "USR8 - User Parameter 8"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "USR9 - User Parameter 9"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO3_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "USR10 - User Parameter 10"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "USR11 - User Parameter 11"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "USR12 - User Parameter 12"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "USR13 - User Parameter 13"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "USR14 - User Parameter 14"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "USR15 - User Parameter 15"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "USR16 - User Parameter 16"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "USR17 - User Parameter 17"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "USR18 - User Parameter 18"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO5_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "FAILT - Failure Time"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "FAILD - Failure Duration"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "AFAILN - Ultimate Tensile Strength"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "AFAILS - Ultimate Shear Strength"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "A1 - First Exponent in Failure Model"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "A2 - Second Exponent in Failure Model"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "INTF - Failure Criterion Time Window"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "D1 - Energy Absorbtion Distance after Failure Initiation"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "D2 - Ultimate Distance at Complete Failure"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO5_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "AFAILT - Ultimate Torsion Strength"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "AFAILB - Ultimate Bending Strength"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "A3 - Third Exponent in Failure Model"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "A4 - Fourth Exponent in Failure Model"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RUPMO6_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "Dc - EWK Critical Damage"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "Rc - EWK Critical Distance"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Plim - EWK Pressure Limit"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "ALPHA - EWK Pressure Exponent"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "BETA - EWK Assymetric Exponent"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "EPSIn - EWK Necking Plastic Strain"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "DMGelim - EWK Maximum Damage for Element Elimination"
         endif
      endif
"  }}}
"  {{{ SENSOR
   elseif synIDattr(slist[0], "name") =~ "pam_SENSOR.*"
      if synIDattr(slist[1], "name") =~ "pam_SENSOR.*_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ISENS"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ITYP - Sensor Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "ISREV - Reversibility Switch (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR1_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "TSENS - Activation Time"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR2_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IACC - Imposed Acceleration Field Number (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ISIG - Type of Signal (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Vx - X Component of Vector V"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "Vy - Y Component of Vector V"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Vz - Z Component of Vector V"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IRESP - Signal Response Flag"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "TARGET - Target Signal Level"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "NCYC - Number of Cycles for Signal Average"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR3_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD1 - Node ID at Which Acceleration is Computed"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ISIG - Type of Signal (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD2 - Node ID for Signal Projection Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IRESP - Signal Response Flag"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "TARGET - Target Signal Level"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "NCYC - Number of Cycles for Signal Average"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR4_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDRET - Retractor or Fast Belt ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "RBELT - Fast Belt Feed Rate to be Exceeded for Triggering"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IRETPOS - Retractor Positioning Flag (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR5_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "LCS - Curve ID determining Sensor Status (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR6_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDCTC - Contact ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TARGET - Contact Force Magnitude"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "TIMEfil - Time Interval for Contact Force Filter"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR7_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD1 - First Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD2 - Second Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNT - Signal Response Flag in Tension (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNC - Signal response Flag for Compression (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "SIGLN - Target Signal Level in Tension"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "SIGSH - Target Signal Level in Compression"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IMOTION - Nature of Motion Flag (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR8_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDBAG - Airbag ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDCHA - Chamber ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IQUALI - Signal Interpretation Qualifier (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "TPRESS - Target Signal Level"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR9_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ISENS1 - First Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ISENS2 - Second Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "ILOGI - Logical Operation (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR10_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ISENS1 - Reference Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TSHIFT - Time Shift"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR11_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDSEW - Sewing Line ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "SEWSPEC - Ratio of Sewing Lines hat should reach Final Length"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR12_r3"
         if col('.') >= 9 && col ('.') <= 11
            return "COP - Logical Operand (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR12_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ISENS1 - Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDGRP - Group ID"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR13_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDKINDA - Kinematic Damping ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "KINTYP - Damping Convergence Monitoring (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SENSOR14_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD - Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TARGET - Displacement/Velocity/Acceleration Target"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "TWIND - Observation Time Window"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IMOTION - Motion's Nature Flag (menu)"
         endif
      endif
"  }}}
"  {{{ SECFO
   elseif synIDattr(slist[0], "name") =~ "pam_SECFO.*"
      if synIDattr(slist[1], "name") =~ "pam_SECFO.*_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDSF"
         elseif synIDattr(slist[2], "name") =~ "pam_SECFO_.*_r1_[ae]2"
            return "NTYP - Output Type (menu)" 
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFRA - Local Coordinate Frame ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SECFO_PLANE_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return "Xtail - X Coordinate of Tail Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return "Ytail - Y Coordinate of Tail Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_25.8.*"
            return "Ztail - Z Coordinate of Tail Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return "Xhead - X Coordinate of Head Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return "Yhead - Y Coordinate of Head Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_49.8.*"
            return "Zhead - Z Coordinate of Head Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_57.8.*"
            return "RADIUS - Cross-Section Selection Limitation"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SECFO_DETECT_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return "IDESPH - Deactivation id Associated SPH Elements (menu)"
         endif
      endif
"  }}}
"  {{{ FRAME
   elseif synIDattr(slist[0], "name") =~ "pam_FRAME.*"
      if synIDattr(slist[1], "name") =~ "pam_FRAME.*_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IFRA - Frame ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFRATY - Frame Orientation Update Type Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IAXIS - Type of Axes flag (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_FRAME.*_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return "NF1 - ID of the first Orientation Node"
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return "NF2 - ID of the second Orientation Node"
         elseif synIDattr(slist[2], "name") =~ "pam_25.8.*"
            return "NF3 - ID of the third Orientation Node"
         elseif synIDattr(slist[2], "name") =~ "pam_9.16.*"
            return "Ux | Tx - X Component of U/T Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_25.16.*"
            return "Uy | Ty - Y Component of U/T Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_41.16.*"
            return "Uz | Tz - Z Component of U/T Vector"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_FRAME.*_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.16.*"
            return "Vx | Ux - X Component of V/U Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_25.16.*"
            return "Vy | Uy - Y Component of V/U Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_41.16.*"
            return "Vz | Uz - Z Component of V/U Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IDNOD - Node ID to which the Frame is attached"
         endif
      endif
"  }}}
"  {{{ NODE/CNODE
   elseif synIDattr(slist[0], "name") =~ 'pam_[C]\=Node'
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDNOD"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "X Coordinate"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "Y Coordinate"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "Z Coordinate"
      endif
"  }}}
"  {{{ HEXA20
   elseif synIDattr(slist[0], "name") =~ "pam_Hexa20"
      if synIDattr(slist[1], "name") =~ "pam_Hexa20_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Hexa20_r2"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD1"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD2"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD3"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD4"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD5"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IDNOD6"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IDNOD7"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IDNOD8"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Hexa20_r3"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD9"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD10"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD11"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD12"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD13"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IDNOD14"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IDNOD15"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IDNOD16"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Hexa20_r4"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD17"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD18"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD19"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD20"
         endif
      endif
"  }}}
"  {{{ GAP
   elseif synIDattr(slist[0], "name") =~ "pam_Gap"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IFRA - Local Frame ID (tag)"
      endif
"  }}}
"  {{{ SPHEL/SPHELO
   elseif synIDattr(slist[0], "name") =~ "pam_Sphel"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "VOL - Element Volume"
      endif
"  }}}
"  {{{ SHELL/TSHEL
   elseif synIDattr(slist[0], "name") =~ "pam_Shell"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IDNOD3"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "IDNOD4"
      elseif synIDattr(slist[1], "name") =~ "pam_65.*"
         return "H - Element Thickness"
      endif
"  }}}
"  {{{ RBODY[0-2]
   elseif synIDattr(slist[0], "name") =~ "pam_RBODY[0-2]"
      if synIDattr(slist[1], "name") =~ "pam_RBODY[0-2]_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDRB"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "ITRB - Rigid Body Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNODcog - Center of Gravity Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ICOG - Imposed Position of COG Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "ISENS - Sensor ID for Ac-/Deactivation (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "HRB - Height of Deformation"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RBODY[12]_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "TFAIL - Time at which Failure Occurs"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "FAILD - Failure Duration"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "AFAILN - Ultimate Tensile Strength"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "AFAILS - Ultimate Shear Strength"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "A1 - First Exponent in Spotweld Model"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "A2 - Second Exponent in Spotweld Model"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "INTF - Failure Criterion Time Window"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "D1 - Energy Absorbtion Distance after Failure Initiation"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "D2 - Ultimate Distance at Complete Failure"
         endif
      endif
"  }}}
"  {{{ RBODY[34]
   elseif synIDattr(slist[0], "name") =~ "pam_RBODY[3-4]"
      if synIDattr(slist[1], "name") =~ "pam_RBODY[3-4]_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDRB"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "ITRB - Rigid Body Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNODcog - Center of Gravity Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD1 - Node ID of first principial Moment of Inertia Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD2 - Node ID of second principial Moment of Inertia Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "ISENS - Sensor ID for Ac-/Deactivation (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IFRA - Local Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "HRB - Height of Deformation"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RBODY[3-4]_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.8.*"
            return "IT3FL - Flag for Inertia Specification (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_9.*"
            return "Mrb - Mass of Rigid Body"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "I1 | Ixx - First princ. Moment of Inertia | xx-Component of Inertia Tensor"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "I2 | Iyy - Second princ. Moment of Inertia | yy-Component of Inertia Tensor"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "I3 | Izz - Third princ. Moment of Inertia | zz-Component of Inertia Tensor"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Ixy - xy-Component of Inertia Tensor"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "Ixz - xz-Component of Inertia Tensor"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "Iyz - yz-Component of Inertia Tensor"
         endif
      endif
"  }}}
"  {{{ TIED
   elseif synIDattr(slist[0], "name") =~ "pam_TIED"
      if synIDattr(slist[1], "name") =~ "pam_TIED_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IPCHK - Check on TIED Connections (menu)"
         endif
      endif
"  }}}
"  {{{ INTEM
   elseif synIDattr(slist[0], "name") =~ "pam_INTEM"
      if synIDattr(slist[1], "name") =~ "pam_INTEM_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TEMINI - Initial Temperature Value"
         endif
      endif
"  }}}
"  {{{ TEMBC
   elseif synIDattr(slist[0], "name") =~ "pam_TEMBC"
      if synIDattr(slist[1], "name") =~ "pam_TEMBC_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TEMINI - Initial Temperature Value"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "TFIMP - Imposed Temperature Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SLFAC - Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "ISENS - Activation Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "TDOF - Shell Temperature DOF for Temperature Gradient (menu)"
         endif
      endif
"  }}}
"  {{{ SEWING
   elseif synIDattr(slist[0], "name") =~ "pam_SEWING"
      if synIDattr(slist[1], "name") =~ "pam_SEWING_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDSEW"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "LSEW0 - Final Sew Element Length"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "SEWVEL - Attraction Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFINT - Internal Forces Prediction Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ISENS - Sewing Activation Sensor ID (tag)"
         endif
      endif
"  }}}
"  {{{ PLINK
   elseif synIDattr(slist[0], "name") =~ "pam_PLink"
      if synIDattr(slist[1], "name") =~ "pam_PLink_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "MORE - Pre-selection Card Reading Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "NLAYR - Number of Layers"
         endif
      endif
"  }}}
"  {{{ SLINK
   elseif synIDattr(slist[0], "name") =~ "pam_SLink"
      if synIDattr(slist[1], "name") =~ "pam_SLink_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD1"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD2"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD3"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD4"
         endif
      endif
"  }}}
"  {{{ ELINK/LLINK
   elseif synIDattr(slist[0], "name") =~ "pam_[EL]Link"
      if synIDattr(slist[1], "name") =~ "pam_[EL]Link_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD1"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD2"
         endif
      endif
"  }}}
"  {{{ BAR
   elseif synIDattr(slist[0], "name") =~ "pam_Bar"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      endif
"  }}}
"  {{{ THNOD
   elseif synIDattr(slist[0], "name") =~ "pam_THNOD"
      if synIDattr(slist[1], "name") =~ "pam_THNOD_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD - Node ID to be Listed"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ISTMOD - Activation Structural Modal Contribution Output"
         endif
      endif
"  }}}
"  {{{ THLOC
   elseif synIDattr(slist[0], "name") =~ "pam_THLOC"
      if synIDattr(slist[1], "name") =~ "pam_THLOC_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD - Node ID to be Listed"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFRA - Local Coordinate Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD1 - Node ID of First Local Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD2 - Node ID of Second Local Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ACFLG - Acceleration Output Correction Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDAFLG - Acceleration Field ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "ISTMOD - Activation of Structural Modal Contribution"
         endif
      endif
"  }}}
"  {{{ THNAC
   elseif synIDattr(slist[0], "name") =~ "pam_THNAC"
      if synIDattr(slist[1], "name") =~ "pam_THNAC_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD - Node ID to be Listed"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IPANEL - Panel Contribution Output (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFLMOD - Fluid Modal Contribution"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "ISTMOD - Structural Modal Contribution"
         endif
      endif
"  }}}
"  {{{ MEMBR
   elseif synIDattr(slist[0], "name") =~ "pam_Membr"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IDNOD3"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "IDNOD4"
      elseif synIDattr(slist[1], "name") =~ "pam_65.*"
         return "BETA1 - Fiber Angle of Layer 1"
      elseif synIDattr(slist[1], "name") =~ "pam_73.*"
         return "BETA2 - Fiber Angle of Layer 2"
      endif
"  }}}
"  {{{ TETR4
   elseif synIDattr(slist[0], "name") =~ "pam_Tetr4"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IDNOD3"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "IDNOD4"
      endif
"  }}}
"  {{{ KJOIN
   elseif synIDattr(slist[0], "name") =~ "pam_KJoin.*"
      if synIDattr(slist[1], "name") =~ "pam_KJoin_general_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDEL'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'IDPRT (tag)'
         elseif col('.') >= 25 && col('.') <= 32
            return 'JTYP - Joint Type Specification (menu)'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'IDNOD1'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'IDNOD2'
         elseif synIDattr(slist[2], "name") =~ "pam_49.8.*"
            return 'IFRA1 - Frame to Define Coord. System at IDNOD1 (tag)'
         elseif synIDattr(slist[2], "name") =~ "pam_57.8.*"
            return 'IFRA2 - Frame to Define Coord. System at IDNOD2 (tag)'
         elseif synIDattr(slist[2], "name") =~ "pam_65.8.*"
            return 'RELPEN - Relative Penalty Coefficient'
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_KJoin_general_r2"
         if col('.') == 11
            return 'DOFTR1 - r1-Translation Degree of Freedom'
         elseif col('.') == 12
            return 'DOFTS1 - s1-Translation Degree of Freedom'
         elseif col('.') == 13
            return 'DOFTT1 - t1-Translation Degree of Freedom'
         elseif col('.') == 14
            return 'DOFRR1 - r1-Rotation Degree of Freedom'
         elseif col('.') == 15
            return 'DOFRSpr - sp-Rotation Degree of Freedom'
         elseif col('.') == 16
            return 'DOFRT2 - t2-Rotation Degree of Freedom'
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_9.8.*"
         return 'IDEL'
      elseif synIDattr(slist[1], "name") =~ "pam_17.8.*"
         return 'IDPRT (tag)'
      elseif col('.') >= 25 && col('.') <= 32
         return 'JTYP - Joint Type Specification (menu)'
      elseif synIDattr(slist[1], "name") =~ "pam_33.8.*"
         return 'IDNOD1'
      elseif synIDattr(slist[1], "name") =~ "pam_41.8.*"
         return 'IDNOD2'
      elseif synIDattr(slist[1], "name") =~ "pam_49.8.*"
         return 'IFRA1 - Frame to Define Coord. System at IDNOD1 (tag)'
      elseif synIDattr(slist[1], "name") =~ "pam_57.8.*"
         return 'IFRA2 - Frame to Define Coord. System at IDNOD2 (tag)'
      elseif synIDattr(slist[1], "name") =~ "pam_65.8.*"
         return 'RELPEN - Relative Penalty Coefficient'
      endif 
"  }}}
"  {{{ MTOJNT
   elseif synIDattr(slist[0], "name") =~ "pam_Mtojnt"
      if synIDattr(slist[1], "name") =~ "pam_Mtojnt_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDMTOJ'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'IDPRT (tag)'
         elseif col('.') >= 25 && col('.') <= 32
            return 'JTYP - Joint Type Specification (menu)'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'IDNODi - Independent Node ID'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'IDNODd - Dependent Node ID'
         elseif synIDattr(slist[2], "name") =~ "pam_49.8.*"
            return 'IFRA1 - Frame to Define Coord. System at IDNODi (tag)'
         elseif synIDattr(slist[2], "name") =~ "pam_57.8.*"
            return 'IFRA2 - Frame to Define Coord. System at IDNODd (tag)'
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Mtojnt_r2"
         if col('.') == 11
            return 'DOFTR1 - r1-Translation Degree of Freedom'
         elseif col('.') == 12
            return 'DOFTS1 - s1-Translation Degree of Freedom'
         elseif col('.') == 13
            return 'DOFTT1 - t1-Translation Degree of Freedom'
         elseif col('.') == 14
            return 'DOFRR1 - r1-Rotation Degree of Freedom'
         elseif col('.') == 15
            return 'DOFRSpr - sp-Rotation Degree of Freedom'
         elseif col('.') == 16
            return 'DOFRT2 - t2-Rotation Degree of Freedom'
         endif
      endif 
"  }}}
"  {{{ DELEM
   elseif synIDattr(slist[0], "name") =~ "pam_DELEM"
      if synIDattr(slist[1], "name") =~ "pam_DELEM_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDDELEM'
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return 'ISENS - Sensor ID Triggering Element Elimination (tag)'
         endif
      endif 
"  }}}
"  {{{ IMPMA
   elseif synIDattr(slist[0], "name") =~ "pam_IMPMA"
      if synIDattr(slist[1], "name") =~ "pam_IMPMA_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDIMPMA'
         elseif col('.') >= 17 && col('.') <= 24
            return 'Matrix Type (menu)'
         elseif col('.') >= 25 && col('.') <= 32
            return 'Matrix Origin (menu)'
         elseif col('.') >= 33 && col('.') <= 40
            return 'Matrix Form (menu)'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'IMATYP - Input Matrix Value Type (menu)'
         endif
      endif 
"  }}}
"  {{{ LINCO
   elseif synIDattr(slist[0], "name") =~ "pam_LINCO"
      if synIDattr(slist[1], "name") =~ "pam_LINCO_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDLC'
         elseif col('.') >= 17 && col('.') <= 24
            return 'DOFTYP - Type of Degree od Freedom (menu)'
         elseif synIDattr(slist[2], "name") =~ "pam_25.8.*"
            return 'NNODI - Number of Independent Nodes'
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_LINCO_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDNOD - ID of (In)Dependent Node'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'IDOF - DOF of (In)Dependent Node (menu)'
         elseif synIDattr(slist[2], "name") =~ "pam_25.8.*"
            return 'SFAC - Coefficient of (In)Dependent Nodal DOF'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'IFRA - Local Frame ID (tag)'
         endif
      endif 
"  }}}
"  {{{ MTOCO1
   elseif synIDattr(slist[0], "name") =~ "pam_MTOCO1"
      if synIDattr(slist[1], "name") =~ "pam_MTOCO1_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDMTO'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'IDNODi - Number of Independent Node'
         elseif col('.') == 27
            return 'X-axis Translation'
         elseif col('.') == 28
            return 'Y-axis Translation'
         elseif col('.') == 29
            return 'Z-axis Translation'
         elseif col('.') == 30
            return 'X-axis Rotation'
         elseif col('.') == 31
            return 'Y-axis Rotation'
         elseif col('.') == 32
            return 'Z-axis Rotation'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'IFRA1 - Local Frame for Independent Node (tag)'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'ITMTO - MTOCO Type Flag (menu)'
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MTOCO1_r3"
         if col('.') <= 8
            return 'IT1FL - Moment of Inertia Input Flag (menu)'
         elseif synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'MMTO - User Imposed Mass of MTOCO'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'I1 | Ixx - First Principial Moment of Inertia | Ixx of Inertia Tensor'
         elseif synIDattr(slist[2], "name") =~ "pam_25.8.*"
            return 'I2 | Iyy - Second Principial Moment of Inertia | Iyy of Inertia Tensor'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'I3 | Izz - Third Principial Moment of Inertia | Izz of Inertia Tensor'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'Ixy - Ixy of Inertia Tensor'
         elseif synIDattr(slist[2], "name") =~ "pam_49.8.*"
            return 'Ixz - Ixz of Inertia Tensor'
         elseif synIDattr(slist[2], "name") =~ "pam_57.8.*"
            return 'Iyz - Iyz of Inertia Tensor'
         elseif synIDattr(slist[2], "name") =~ "pam_65.8.*"
            return 'IFRA2 - Local Frame ID for Inertia (tag)'
         elseif synIDattr(slist[2], "name") =~ "pam_73.8.*"
            return 'IDNODcog - Center of Gravity Node ID'
         endif
      endif 
"  }}}
"  {{{ MTOCO0
   elseif synIDattr(slist[0], "name") =~ "pam_MTOCO"
      if synIDattr(slist[1], "name") =~ "pam_MTOCO_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDMTO'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'IDNODi - Number of Independent Node'
         elseif col('.') == 27
            return 'X-axis Translation'
         elseif col('.') == 28
            return 'Y-axis Translation'
         elseif col('.') == 29
            return 'Z-axis Translation'
         elseif col('.') == 30
            return 'X-axis Rotation'
         elseif col('.') == 31
            return 'Y-axis Rotation'
         elseif col('.') == 32
            return 'Z-axis Rotation'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'IFRA1 - Local Frame for Independent Node (tag)'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'ITMTO - MTOCO Type Flag (menu)'
         elseif synIDattr(slist[2], "name") =~ "pam_49.8.*"
            return 'ISENS - Sensor ID to Activate/Deactivate MTOCO (tag)'
         elseif synIDattr(slist[2], "name") =~ "pam_57.8.*"
            return 'ALPHA - Constant Thermal Expansion Coefficient'
         endif
      endif 
"  }}}
"  {{{ OTMCO
   elseif synIDattr(slist[0], "name") =~ "pam_OTMCO"
      if synIDattr(slist[1], "name") =~ "pam_OTMCO_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDOTM'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'IDNODd - Number of Dependent Node'
         elseif col('.') == 27
            return 'X-axis Translation'
         elseif col('.') == 28
            return 'Y-axis Translation'
         elseif col('.') == 29
            return 'Z-axis Translation'
         elseif col('.') == 30
            return 'X-axis Rotation'
         elseif col('.') == 31
            return 'Y-axis Rotation'
         elseif col('.') == 32
            return 'Z-axis Rotation'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'IMETH - Choice of Contribution of Motion (menu)'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'RADIUS - Independent Node Selection Filter'
         elseif synIDattr(slist[2], "name") =~ "pam_49.8.*"
            return 'IELIM - OTMCO Elimination Criteria'
         elseif synIDattr(slist[2], "name") =~ "pam_57.8.*"
            return 'ITYP - Type of OTMCO'
         elseif synIDattr(slist[2], "name") =~ "pam_65.8.*"
            return 'ALPHA - Constant Thermal Expansion Coefficient'
         endif
      endif 
"  }}}
"  {{{ BEAM
   elseif synIDattr(slist[0], "name") =~ "pam_Beam"
      if synIDattr(slist[1], "name") =~ "pam_Beam_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'IDEL'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'IDPRT (tag)'
         elseif synIDattr(slist[2], "name") =~ "pam_25.8.*"
            return 'IDNOD1'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'IDNOD2'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'IDNOD3'
         elseif col('.') == 59 || col('.') == 67
            return 'R-axis Axial Force'
         elseif col('.') == 60 || col('.') == 68
            return 'S-axis Shear Force'
         elseif col('.') == 61 || col('.') == 69
            return 'T-axis Shear Force'
         elseif col('.') == 62 || col('.') == 70
            return 'R-axis Torsion Moment'
         elseif col('.') == 63 || col('.') == 71
            return 'S-axis Bending Moment'
         elseif col('.') == 64 || col('.') == 72
            return 'T-axis Bending Moment'
         elseif synIDattr(slist[2], "name") =~ "pam_73.8.*"
            return 'ITPR - Tapered Bream Flag (menu)'
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Beam_r2"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'ALPHA1 - Relative Multiplier of 1st Section Dimension'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'BETA1 - Relative Multiplier of 2nd Section Dimension'
         elseif synIDattr(slist[2], "name") =~ "pam_25.8.*"
            return 'GAMMA1 - Relative Multiplier of 3rd Section Dimension'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'KSI1 - Relative Multiplier of Local s-Axis Eccentricity'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'ETA1 - Relative Multiplier of Local t-Axis Eccentricity'
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Beam_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.8.*"
            return 'ALPHA2 - Relative Multiplier of 1st Section Dimension'
         elseif synIDattr(slist[2], "name") =~ "pam_17.8.*"
            return 'BETA2 - Relative Multiplier of 2nd Section Dimension'
         elseif synIDattr(slist[2], "name") =~ "pam_25.8.*"
            return 'GAMMA2 - Relative Multiplier of 3rd Section Dimension'
         elseif synIDattr(slist[2], "name") =~ "pam_33.8.*"
            return 'KSI2 - Relative Multiplier of Local s-Axis Eccentricity'
         elseif synIDattr(slist[2], "name") =~ "pam_41.8.*"
            return 'ETA2 - Relative Multiplier of Local t-Axis Eccentricity'
         endif
      endif 
"  }}}
"  {{{ JOINT
   elseif synIDattr(slist[0], "name") =~ "pam_Joint"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IDNOD3 || IFRA - Local Coordinate Frame Number (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "IDNOD4"
      elseif synIDattr(slist[1], "name") =~ "pam_57.*"
         return "PHI0 - First Initial Rotation Angle"
      elseif synIDattr(slist[1], "name") =~ "pam_65.*"
         return "THET0 - Second Initial Rotation Angle"
      elseif synIDattr(slist[1], "name") =~ "pam_73.*"
         return "PSI0 - Third Initial Rotation Angle"
      endif
"  }}}
"  {{{ SPRGBM
   elseif synIDattr(slist[0], "name") =~ "pam_Sprgbm"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IDNOD3"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "IFRA - Local Coordinate Frame Number (tag)"
      endif
"  }}}
"  {{{ SPRING
   elseif synIDattr(slist[0], "name") =~ "pam_Spring"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IDNOD3 || IFRA - Locale Coordinate Frame (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "IDNOD4"
      endif
"  }}}
"  {{{ SHEL6
   elseif synIDattr(slist[0], "name") =~ "pam_Shel6"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IDNOD3"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "IDNOD4"
      elseif synIDattr(slist[1], "name") =~ "pam_57.*"
         return "IDNOD5"
      elseif synIDattr(slist[1], "name") =~ "pam_65.*"
         return "IDNOD6"
      endif
"  }}}
"  {{{ PENT6
   elseif synIDattr(slist[0], "name") =~ "pam_Penta6"
      if synIDattr(slist[1], "name") =~ "pam_9.*"
         return "IDEL"
      elseif synIDattr(slist[1], "name") =~ "pam_17.*"
         return "IDPTR (tag)"
      elseif synIDattr(slist[1], "name") =~ "pam_25.*"
         return "IDNOD1"
      elseif synIDattr(slist[1], "name") =~ "pam_33.*"
         return "IDNOD2"
      elseif synIDattr(slist[1], "name") =~ "pam_41.*"
         return "IDNOD3"
      elseif synIDattr(slist[1], "name") =~ "pam_49.*"
         return "IDNOD4"
      elseif synIDattr(slist[1], "name") =~ "pam_57.*"
         return "IDNOD5"
      elseif synIDattr(slist[1], "name") =~ "pam_65.*"
         return "IDNOD6"
      endif
"  }}}
"  {{{ PENT15
   elseif synIDattr(slist[0], "name") =~ "pam_Penta15"
      if synIDattr(slist[1], "name") =~ "pam_Penta15_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Penta15_r2"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD1"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD2"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD3"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD4"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD5"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IDNOD6"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IDNOD7"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IDNOD8"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Penta15_r3"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD9"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD10"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD11"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD12"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD13"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IDNOD14"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IDNOD15"
         endif
      endif
"  }}}
"  {{{ SHEL8
   elseif synIDattr(slist[0], "name") =~ "pam_Shel8"
      if synIDattr(slist[1], "name") =~ "pam_Shel8_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD1"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD2"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD3"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD4"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Shel8_r2"
         if synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD5"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD6"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD7"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD8"
         endif
      endif
"  }}}
"  {{{ TETRA/TETR10
   elseif synIDattr(slist[0], "name") =~ "pam_Tetra10"
      if synIDattr(slist[1], "name") =~ "pam_Tetra10_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Tetra10_r2"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD1"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD2"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD3"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD4"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD5"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IDNOD6"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IDNOD7"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IDNOD8"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_Tetra10_r3"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD9"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD10"
         endif
      endif
"  }}}
"  {{{ SOLID
   elseif synIDattr(slist[0], "name") =~ "pam_SOLID"
      if synIDattr(slist[1], "name") =~ "pam_SOLID_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDPTR (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_SOLID_r2"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD1"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD2"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNOD3"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD4"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD5"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IDNOD6"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IDNOD7"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IDNOD8"
         endif
      endif
"  }}}
"  {{{ CONLO
   elseif synIDattr(slist[0], "name") =~ "pam_CONLO"
      if synIDattr(slist[1], "name") =~ "pam_CONLO_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD - Node ID of the Node with Load"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDIR - Type and Direction of Load (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "LCUR - Load Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SFAC - Load Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IFRA - Local Coordinate Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "ISENS - Activation Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "ILDTYPE - Load Activation Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "CLOAD - Constant Load Definition"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_CONLO_r2"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "CLOADi - Constant Imaginary Load Defintion"
         endif
      endif
"  }}}
"  {{{ HTSURF
   elseif synIDattr(slist[0], "name") =~ "pam_HTSURF"
      if synIDattr(slist[1], "name") =~ "pam_HTSURF_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "AMBTconst - Constant Ambient Temperature"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "AMBTLCUR - Time-Dependent Curve ID for Ambient Temperature (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "AMBPYCUR - Python Function Curve ID"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_HTSURF_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.8.*"
            return "CONVCOEF - Constant Convection Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_9.*"
            return "TEMCUR - Temperature-Dependent Multiplier Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TIMCUR - Time-Dependent Multiplier Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "PYMCUR - Python Multiplier Function Curve ID"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_HTSURF_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.8.*"
            return "SURFEMMI - Spatial Radiation Surface Emissivity"
         endif
      endif
"  }}}
"  {{{ BFLUX
   elseif synIDattr(slist[0], "name") =~ "pam_BFLUX"
      if synIDattr(slist[1], "name") =~ "pam_BFLUX_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "BHCOEF || DHFconst - Body || Distributed Heat Flux Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TLCUR - Time Dependent Load Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "PYCUR - Python Function Curve ID"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SLFAC - Scale Factor"
         endif
      endif
"  }}}
"  {{{ HFLUX
   elseif synIDattr(slist[0], "name") =~ "pam_HFLUX"
      if synIDattr(slist[1], "name") =~ "pam_HFLUX_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD - Nodal Point ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "HEATIN - Added Internal Heat Value"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUN - Time Dependent Load Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUNPY - Python Function ID"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "SFAC - Scale Factor"
         endif
      endif
"  }}}
"  {{{ NLAVE
   elseif synIDattr(slist[0], "name") =~ "pam_NLAVE"
      if synIDattr(slist[1], "name") =~ "pam_NLAVE_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNLAVE"
         elseif col('.') >= 17 && col('.') <= 24 && synIDattr(slist[2], "name") =~ "pam_NLAVE_r1_a1*"
            return "QUALIFIER - Non-Average Type (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_NLAVE_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.16*"
            return "RADIUSave - Averaging Radius"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ENERCRID - Critical Strain Energy Density"
         endif
      endif
"  }}}
"  {{{ NSMAS
   elseif synIDattr(slist[0], "name") =~ "pam_NSMAS"
      if synIDattr(slist[1], "name") =~ "pam_NSMAS_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNMS"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "MASS"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "MLEN"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "MARE"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "MVOL"
         endif
      endif
"  }}}
"  {{{ SENPT/SENPTG
   elseif synIDattr(slist[0], "name") =~ "pam_SENPT"
      if synIDattr(slist[1], "name") =~ "_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDSPT"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNODref - Reference (Free) Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "RDIST - Distance of Sensor Point from Projected Point"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFRA - Local Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNOD1 - Node ID of First Local Axis Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNOD2 - Node ID of Second Local Axis Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "ACFLG - Acceleration Output Correction (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IDAFLG - Acceleration Field ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "MASS - Added Mass"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "Ix - Added Moment of Intertia about Global X"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Iy - Added Moment of Intertia about Global Y"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "Iz - Added Moment of Intertia about Global Z"
         endif
      endif
"  }}}
"  {{{ MASS
   elseif synIDattr(slist[0], "name") =~ "pam_MASS"
      if synIDattr(slist[1], "name") =~ "pam_MASS_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFRA"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "DISr"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "DISs"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "DISt"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MASS_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "Mx"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "My"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Mz"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MASS_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "Ix"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Iy"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Iz"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MASS_r5"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "Ixy"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Iyz"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Ixz"
         endif
      endif
"  }}}
"  {{{ FUNCT
   elseif synIDattr(slist[0], "name") =~ "pam_FUNCT"
      if synIDattr(slist[1], "name") =~ "pam_FUNCT_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDFUN"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "FUNTYP - Number of Points to use"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "SCALX - Local Scale Factor for X-Values"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SCALY - Local Scale Factor for Y-Values"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "SHIFTX - Shift Value for X-Values"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "SHIFTY - Shift Value for Y-Values"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "IFLMEAS - Measured Value Dependence Switch (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "ICOMP - Real/Complex Function Switch (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_FUNCT_r3d"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNODr - Reference Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNOD1 - Measured Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNODax - Node ID of the Node Defining Distance Axis"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_FUNCT_r3a"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNODr1 - Node ID of the first Node on the first Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IDNODv1 - Node ID of the second Node on the first Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDNODax - Node ID of the Node Defining Angle Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNODr2 - Node ID of the first Node on the second Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNODv2 - Node ID of the second Node on the second Vector"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "ANGini - Initial Angle Estimate"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_FUNCT_r3"
         if synIDattr(slist[2], "name") =~ "pam_17.*"
            return "X - Independent Variable"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "Y | YR - Dependent Variable or real Part"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "YI - Imaginary Part of Dependent Variable"
         endif
      endif
"  }}}
"  {{{ FUNCSW
   elseif synIDattr(slist[0], "name") =~ "pam_FUNCSW"
      if synIDattr(slist[1], "name") =~ "pam_FUNCSW_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDSW"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ISWTYP - Switch Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "INOSNS - Behavior Flag when no Sensor Active (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUNNO - Default Function ID when no Sensor Active (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IMUSNS - Behavior Flag when more than one Sensor Active (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IFUNMU - Default Function ID when more than one Sensor Active (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_FUNCSW_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ISENS - Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFUN - Function ID (tag)"
         endif
      endif
"  }}}
"  {{{ THCRS
   elseif synIDattr(slist[0], "name") =~ "pam_THCRS"
      if synIDattr(slist[1], "name") =~ "pam_THCRS_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDTHCRS"
         elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 17 && col ('.') <= 21
            return "TYPE1 - Entity Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_22.*"
            return "IDEN1 - Entity ID"
         elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 30 && col ('.') <= 34
            return "VAR1 - Variable Name (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_35.*"
            return "COMP1 - Variable Component (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 43 && col ('.') <= 47
            return "TYPE2 - Entity Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_48.*"
            return "IDEN2 - Entity ID"
         elseif synIDattr(slist[2], "name") =~ "pam_THCRS_r1_[ae]1" && col('.') >= 56 && col ('.') <= 60
            return "VAR2 - Variable Name (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_61.*"
            return "COMP2 - Variable Component (menu)"
         endif
      endif
"  }}}
"  {{{ UDATA
   elseif synIDattr(slist[0], "name") =~ "pam_UDATA"
      if synIDattr(slist[1], "name") =~ "pam_UDATA_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IUDATA"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IUDTYP - User Data Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_UDATA_r1_[ae]1"
            return "CUDSEL - Controlled Entity Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDCUD - Controlled Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "NUDTH - Number of User History Variables"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_UDATA_r3"
         if col('.') >= 9 && col('.') <= 16 && synIDattr(slist[2], "name") =~ "pam_UDATA_r3_[ae]1"
            return "CUDENT - Entity Type for This Input Channel"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IUDENT - ID of Used Entity"
         elseif col('.') >= 25 && col('.') <= 32 && synIDattr(slist[2], "name") =~ "pam_UDATA_r3_[ae]1"
            return "IDENT - Type Of Variable (menu)"
         endif
      endif
"  }}}
"  {{{ INPRES
   elseif synIDattr(slist[0], "name") =~ "pam_INPRES"
      if synIDattr(slist[1], "name") =~ "pam_INPRES_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDIPRES"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD - Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "PRESini - Initial Pressure"
         endif
      endif
"  }}}
"  {{{ PREFA/PREBM
   elseif synIDattr(slist[0], "name") =~ "pam_PREFA"
      if synIDattr(slist[1], "name") =~ "pam_PREFA_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IFUN - Load Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDEL - Element ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "FACT - Multiplier of Load Function"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "ISENS - Activation Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CONST - Constant Pressure Definition"
         endif
      endif
"  }}}
"  {{{ PRESBC
   elseif synIDattr(slist[0], "name") =~ "pam_PRESBC"
      if synIDattr(slist[1], "name") =~ "pam_PRESBC_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDPRBC"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD - Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "PRCONST - Imposed Pressure Constant"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUNPR - Imposed Pressure Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "SFAC - Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_PRESBC_r1_[ae]1"
            return "IOB - Air Obstruction Flag (menu)"
         endif
      endif
"  }}}
"  {{{ ACFLD
   elseif synIDattr(slist[0], "name") =~ "pam_ACFLD"
      if synIDattr(slist[1], "name") =~ "pam_ACFLD_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDAFLD"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFUN1 - X Direction Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "SFAC1 - X Direction Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUN2 - Y Direction Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "SFAC2 - Y Direction Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IFUN3 - Z Direction Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "SFAC3 - Z Direction Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IFRA - Local Frame ID (tag)"
         endif
      endif
"  }}}
"  {{{ BDFOR
   elseif synIDattr(slist[0], "name") =~ "pam_BDFOR"
      if synIDattr(slist[1], "name") =~ "pam_BDFOR_r1"
         if synIDattr(slist[2], "name") =~ "pam_BDFOR_r1_[ae]1"
            return "KEYWORD - Body Force Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFUN1 - First Direction Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUN2 - Second Direction Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUN3 - Thord Direction Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IFRA - Local Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNODrad - Node ID for Center of Angular Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "ISENS - Activation Sensor ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_BDFOR_r2"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "CONST1 - Constant Value for Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "CONST2 - Constant Value for Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CONST3 - Constant Value for Direction 3"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_BDFOR_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "Xtail - X Coordinate for Vector's Tail"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "Ytail - Y Coordinate for Vector's Tail"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Ztail - Z Coordinate for Vector's Tail"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "Xhead - X Coordinate for Vector's Head"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Yhead - Y Coordinate for Vector's Head"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "Zhead - Z Coordinate for Vector's Head"
         endif
      endif
"  }}}
"  {{{ DAMP
   elseif synIDattr(slist[0], "name") =~ "pam_DAMP"
      if synIDattr(slist[1], "name") =~ "pam_DAMP_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD - Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*" || synIDattr(slist[2], "name") =~ "pam_DAMP_r1_[ae]2"
            return "ADAMP - Mass-proportional Nodal Damping Factor || CURVE"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*" || synIDattr(slist[2], "name") =~ "pam_DAMP_r1_[ae]1"
            return "TIDAMP - Starting Time of Damping || SENSOR"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "TFDAMP || ISENS - End Time of Damping || Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDAMP - Damping Relative Velocity Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDNODref || Vx - Reference Node ID || X Component of Reference Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "Vy - Y Component of Reference Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "Vz - Z Component of Reference Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IMODE - Extended Input Fomat Mode (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_DAMP_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.16.*"
            return "DRAGCO - Drag Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ODENS - Density of Surrounding Air"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUN - Mass-proportional Damping Factor Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDELE - Solid Element ID for Geometrical Selection"
         endif
      endif
"  }}}
"  {{{ KINDA
   elseif synIDattr(slist[0], "name") =~ "pam_KINDA"
      if synIDattr(slist[1], "name") =~ "pam_KINDA_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDKINDA"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*" || synIDattr(slist[2], "name") =~ "pam_KINDA_r1_[ae]1"
            return "TIKINDA - Starting Time of Damping || SENSOR"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "TFKINDA || ISENS - End Time of Damping || Sensor ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IDAMP - Damping Relative Velocity Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDNODref || Vx - Reference Node ID || X Component of Reference Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "Vy - Y Component of Reference Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "Vz - Z Component of Reference Velocity"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_KINDA_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "KINTYP - Kinematic Damping Simulation Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TOLKIN - Convergence Test Tolerance"
         endif
      endif
"  }}}
"  {{{ INVEL
   elseif synIDattr(slist[0], "name") =~ "pam_INVEL"
      if synIDattr(slist[1], "name") =~ "pam_INVEL_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD - Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "VELX0 - Initial Velocity in X Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "VELY0 - Initial Velocity in Y Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "VELZ0 - Initial Velocity in Z Direction"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "VANX0 - Initial Angular Velocity around X Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "VANY0 - Initial Angular Velocity around Y Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "VANZ0 - Initial Angular Velocity around Z Axis"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IFRA - Local Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IRIGB - Initial Rigid Body Flag (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_INVEL_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "NRIGB - Center of Rotation Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "XRIGB - X Coordinate of Center of Rotation"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "YRIGB - Y Coordinate of Center of Rotation"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "ZRIGB - Z Coordinate of Center of Rotation"
         endif
      endif
"  }}}
"  {{{ DISLIM
   elseif synIDattr(slist[0], "name") =~ "pam_DISLIM"
      if synIDattr(slist[1], "name") =~ "pam_DISLIM_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "CONST - Maximum Displacement or CURVE"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUN - Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SFAC - Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ISENS - Activation Sensor ID (tag)"
         endif
      endif
"  }}}
"  {{{ BOUNC
   elseif synIDattr(slist[0], "name") =~ "pam_BOUNC"
      if synIDattr(slist[1], "name") =~ "pam_BOUNC_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD"
         elseif col('.') == 19
            return "X Displacement Constraint"
         elseif col('.') == 20
            return "Y Displacement Constraint"
         elseif col('.') == 21
            return "Z Displacement Constraint"
         elseif col('.') == 22
            return "X Rotation Constraint"
         elseif col('.') == 23
            return "Y Rotation Constraint"
         elseif col('.') == 24
            return "Z Rotation Constraint"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFRA - Local Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "ISENS - Activation Sensor ID (tag)"
         endif
      endif
"  }}}
"  {{{ MDBODY
   elseif synIDattr(slist[0], "name") =~ "pam_MDBODY"
      if synIDattr(slist[1], "name") =~ "pam_MDBODY_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDMBO"
         elseif synIDattr(slist[2], "name") =~ "pam_MDBODY_r1_[ae]1"
            return "CTYPE - FE Mesh Type of Deformable Body (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "BULK - Average Bulk Modulus to be Used by MADYMO Contact"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "THICK - Average Thickness to be Used by MADYMO Contact"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDCVS - External Identifier to be Referenced in MADYMO"
         endif
      endif
"  }}}
"  {{{ DETOP
   elseif synIDattr(slist[0], "name") =~ "pam_DETOP"
      if synIDattr(slist[1], "name") =~ "pam_DETOP_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDETOP"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "TDET - Lighting Time  of Detonation Point"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "XDETP - X Coordinate of Detonation Point"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "YDETP - Y Coordinate of Detonation Point"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "ZDETP - Z Coordinate of Detonation Point"
         endif
      endif
"  }}}
"  {{{ DPNQM
   elseif synIDattr(slist[0], "name") =~ "pam_DPNQM"
      if synIDattr(slist[1], "name") =~ "pam_DPNQM_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDIR - Momentum Direction Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUN - Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SFAC - Scale Factor"
         endif
      endif
"  }}}
"  {{{ DPEEN
   elseif synIDattr(slist[0], "name") =~ "pam_DPEEN"
      if synIDattr(slist[1], "name") =~ "pam_DPEEN_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ITYP - Type of Deposition Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUN - Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SFAC - Scale Factor"
         endif
      endif
"  }}}
"  {{{ DPEMA
   elseif synIDattr(slist[0], "name") =~ "pam_DPEMA"
      if synIDattr(slist[1], "name") =~ "pam_DPEMA_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFUN - Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "SFAC - Scale Factor"
         endif
      endif
"  }}}
"  {{{ SLIPR
   elseif synIDattr(slist[0], "name") =~ "pam_SLIPR"
      if synIDattr(slist[1], "name") =~ "pam_SLIPR_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDSR"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD - Structure Attachement Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "FRICPR - Pulley Rim Friction Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "TOLSLP - Force Tolerance to Trigger Material Slipping"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "FRACT - Fraction of Length for an Element to be Slipped"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "IDFRIC - Advanced Friction Model ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "ILOCK - Slipping Locking Activation Flag (menu)"
         endif
      endif
"  }}}
"  {{{ MUSC1
   elseif synIDattr(slist[0], "name") =~ "pam_MUSC1"
      if synIDattr(slist[1], "name") =~ "pam_MUSC1_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDMUS"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "Fmax - Maximum Isometric Muscle Force"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*" || synIDattr(slist[3], "name") =~ "pam_25.*"
            return "ALF - Muscle Pennation Angle"
         elseif synIDattr(slist[3], "name") =~ "pam_33.*"
            return "PCSA - Physiological Cross Sectional Area"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "Smax - Maximum Isometric Muscle Stress"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MUSC1_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "NLEN - Response Curve ID for the Active Muscle Force-Length Relation (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "NLEN_FAC - Active Muscle Curve Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "ALopt - Ratio of Muscle Fiber Rest Length"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "CSH - Shape Parameter of the Active Muscle Force-Length Relation"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MUSC1_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "NVEL - Response Curve ID for the Active Muscle Force-Velocity Relation (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "NVEL_FAC - Active Muscle Curve Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "AVmax - Muscle Maximum Shortening Velocity"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "CSHORT - Shape Parameter of the Active Muscle Force-Velocity Relation (Tightening)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CLENG - Shape Parameter of the Active Muscle Force-Velocity Relation (Lenghtening)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "CMVL - Force Parameter of the Active Muscle Force-Velocity relation (Lenghtening)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MUSC1_r5"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "NACT - Response Curve ID for the Active Muscle State-Time Relation (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "NACT_FAC - Active Muscle Curve Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Tact - Muscle Activation Time"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "Tdeact - Muscle Deactivation Time"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Texci - Excitation Time"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "Tref - Reflex Time"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "Ainit - Initial Value of the Muscle Active State"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "Eini - Initial Value of the Excitation"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MUSC1_r6"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "NPAS - Response Curve ID for the Passive Muscle State-Time Relation (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "NPAS_FAC - Active Muscle Curve Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "L0fib - Muscle Fiber Rest Length"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "PEmax - Muscle Elongation at Passive Force"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CPE - Shape Parameter of the Passive Muscle Force-Elongation Relation"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "CDAMP - Linear Viscous Damping Coefficient of the Passive Muscle Force"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MUSC1_r7"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ITRIG - Flag for Muscle Force Triggering by Stretch Reflex (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ELTRIG - Threshold Elongation for the Stretch Reflex"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "WMAS - Total Muscle Mass"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "NMCY - Interval in Cycles for the Muscle Smoothing Filter"
         endif
      endif
"  }}}
"  {{{ RETRA
   elseif synIDattr(slist[0], "name") =~ "pam_RETRA"
      if synIDattr(slist[1], "name") =~ "pam_RETRA_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDRET"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD - Structure Attachement Node ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "FRETRA - Retractor Pretension Force Value"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "FRCOUT - Length Fraction for Retractor Element Pull-Out"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "FRCIN - Length Fraction for Retractor Element Pull-In"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "NBW2 - Inside Element Definition Flag (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RETRA_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ISENSR - Sensor ID for Triggering the Retractor Locking (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ISPOOL - Curve ID for Spool Effect after Locking (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "ISENSP - Sensor ID of Triggering the Pyrotechnical Pretensioner (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IREELR - Reel-in Rate Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IREELC - Reel-in Langth Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "ICURFRC - Pretensioner Force Limit Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "NLOADL - Number of Load Limiter Stages"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RETRA_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "LLCURV - Curve ID of Load Limiter Stage (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "LLSENS - Sensor ID for Triggering the Load Limiter Stage (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "LLFLAG - Reference Length Selection Flag (menu)"
         endif
      endif
"  }}}
"  {{{ x3D
   elseif synIDattr(slist[0], "name") =~ "pam_x3D"
      if synIDattr(slist[1], "name") =~ "pam_x3D_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFUN1 - Function ID for Direction 1 (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUN2 - Function ID for Direction 2 (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUN3 - Function ID for Direction 3 (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "SFAC1 - Scale Factor for Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "SFAC2 - Scale Factor for Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "SFAC3 - Scale Factor for Direction 3"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "IFRA - Local Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "ISENS - Activation Sensor ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_x3D_r2"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "CONST1 - Constant Displacement in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "CONST2 - Constant Displacement in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CONST3 - Constant Displacement in Direction 3"
         elseif synIDattr(slist[2], "name") =~ "pam_x3D_r2_[ae]1"
            return "QUALIFIER - Reference for Rotation in Multi-Stage (menu)"
         endif
      endif
"  }}}
"  {{{ VAMPSO
   elseif synIDattr(slist[0], "name") =~ "pam_VAMPSO"
      if synIDattr(slist[1], "name") =~ "pam_VAMPSO_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDMPSO"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDNOD - Node ID of Source Location"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_VAMPSO_r3"
         if synIDattr(slist[2], "name") =~ "pam_VAMPSO_r3_[ae]1"
            return "QUALIFIER - Monopole Source Input Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFUNC - Complex Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "MULT - Intensity Multiplicator"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "CONSTr - Real Part of Constant Source"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CONSTi - Imaginary Part of Constant Source"
         endif
      endif
"  }}}
"  {{{ VAABSO
   elseif synIDattr(slist[0], "name") =~ "pam_VAABSO"
      if synIDattr(slist[1], "name") =~ "pam_VAABSO_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDABSO"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_VAABSO_r3"
         if synIDattr(slist[2], "name") =~ "pam_VAABSO_r3_[ae]1"
            return "QUALIFIER - Absorber Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFUNC - Complex Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "MULT - Function Multiplicator"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "CONSTr - Real Part of Constant Absorber"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CONSTi - Imaginary Part of Constant Absorber"
         endif
      endif
"  }}}
"  {{{ FBC3D
   elseif synIDattr(slist[0], "name") =~ "pam_FBC3D"
      if synIDattr(slist[1], "name") =~ "pam_FBC3D_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD"
         elseif synIDattr(slist[2], "name") =~ "pam_FBC3D_r1_[ae]1"
            return "QUALIFIER - Boundary Condition Input Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUN1 - Function ID for Direction 1 (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUN2 - Function ID for Direction 2 (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IFUN3 - Function ID for Direction 3 (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "SFAC1 - Scale Factor for Function in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "SFAC2 - Scale Factor for Function in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_65.*"
            return "SFAC3 - Scale Factor for Function in Direction 3"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "IFRA - Local Corrdinate Frame ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_FBC3D_r2"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "CONST1 / CONSTI1 - Real/Imaginary Part of Constant BC in Direction 1"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "CONST1 / CONSTI1 - Real/Imaginary Part of Constant BC in Direction 2"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CONST1 / CONSTI1 - Real/Imaginary Part of Constant BC in Direction 3"
         endif
      endif
"  }}}
"  {{{ FBCFA
   elseif synIDattr(slist[0], "name") =~ "pam_FBCFA"
      if synIDattr(slist[1], "name") =~ "pam_FBCFA_r1"
         if synIDattr(slist[2], "name") =~ "pam_FBCFA_r1_[ae]1"
            return "QUALIFIER - Boundary Condition Input Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IFUNC - Function ID for the Boundary condition (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "MULT - Boundary Condition Multiplier"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "CONST - Real Part of Constant Value BC"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CONSTI - Imaginary Part of Constant Value BC"
         endif
      endif
"  }}}
"  {{{ ACTUA
   elseif synIDattr(slist[0], "name") =~ "pam_ACTUA"
      if synIDattr(slist[1], "name") =~ "pam_ACTUA_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDELE"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDOF - Actuating Joint Degree of Freedom"
         elseif synIDattr(slist[2], "name") =~ "pam_ACTUA_r1_[ae]1"
            return "QUALIFIER1 - Actuation Type (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFUN - Function Curve ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "CSFAC - Curve Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "CLOAD - Constant Value"
         elseif synIDattr(slist[2], "name") =~ "pam_ACTUA_r1_[ae]2"
            return "QUALIFIER2 - Reference for Displacmenent for Multi-Stage (menu)"
         endif
      endif
"  }}}
"  {{{ RMLOAD
   elseif synIDattr(slist[0], "name") =~ "pam_RMLOAD"
      if synIDattr(slist[1], "name") =~ "pam_RMLOAD_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDNOD"
         elseif col('.') == 19
            return "CTX - X Direction Force Code"
         elseif col('.') == 20
            return "CTY - Y Direction Force Code"
         elseif col('.') == 21
            return "CTZ - Z Direction Force Code"
         elseif col('.') == 22
            return "CRX - X Rotation Moment Code"
         elseif col('.') == 23
            return "CRY - Y Rotation Moment Code"
         elseif col('.') == 24
            return "CRZ - Z Rotation Moment Code"
         endif
      endif
"  }}}
"  {{{ LCPSD
   elseif synIDattr(slist[0], "name") =~ "pam_LCPSD"
      if synIDattr(slist[1], "name") =~ "pam_LCPSD_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "ILOAD1 - First Load ID"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ILOAD2 - Second Load ID"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "LCUR - Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SFACr - Scale Factor for Real Part"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "SFACi - Scale Factor for Imaginary Part"
         endif
      endif
"  }}}
"  {{{ DMPEW
   elseif synIDattr(slist[0], "name") =~ "pam_DMPEW"
      if synIDattr(slist[1], "name") =~ "pam_DMPEW_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDDMPEW"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "CPUSFAC - Scale Factor for CPU Weight"
         endif
      endif
"  }}}
"  {{{ DRAPF
   elseif synIDattr(slist[0], "name") =~ "pam_DRAPF"
      if synIDattr(slist[1], "name") =~ "pam_DRAPF_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDLAYER - Layer Entity ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IMPORT - Importing Element Flag (menu)"
         endif
      endif
"  }}}
"  {{{ LAYER
   elseif synIDattr(slist[0], "name") =~ "pam_LAYER"
      if synIDattr(slist[1], "name") =~ "pam_LAYER_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDLAYER - Layer Entity ID (tag)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_LAYER_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.10.*"
            return "IDPLY - PLY Entity ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_11.*"
            return "THKPL - Ply Thickness"
         elseif synIDattr(slist[2], "name") =~ "pam_21.*"
            return "ANGPL - Angle Defining Layer Orientation with Respect to Reference Direction in PART"
         endif
      endif
"  }}}
"  {{{ MSTRM
   elseif synIDattr(slist[0], "name") =~ "pam_MSTRM"
      if synIDattr(slist[1], "name") =~ "pam_MSTRM_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "Mc - Objective Total Mass"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Ixc - Objective Rotational Inertia XX"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Iyc - Objective Rotational Inertia YY"
         elseif synIDattr(slist[2], "name") =~ "pam_57.*"
            return "Izc - Objective Rotational Inertia ZZ"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MSTRM_r2"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "Xc - X Coordinate Objective COG Position"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "Yc - Y Coordinate Objective COG Position"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "Zc - Z Coordinate Objective COG Position"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_MSTRM_r3"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "EPS - Accuracy Parameter for Optimization Process Terminatio"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "ALFA - Scaling Factor for Upper Bound of Mass Change"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFLG - Rotation Inertia treatment Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IOUT - Output Optimization Results Format (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IDOFST - Offset foe NSMAS ID in Output File"
         endif
      endif
"  }}}
"  {{{ SUBDF
   elseif synIDattr(slist[0], "name") =~ "pam_SUBDF"
      if synIDattr(slist[1], "name") =~ "pam_SUBDF_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDEFNOD - Node to Put into Output File (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "NODOTI - Output Time Interval for Node Displacement"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFRAM - Local Frame ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IFLAG - Imposing Substructuring Filename and path"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "IFRB - Flag to Handle Rigid Body Slave Nodes"
         endif
      endif
"  }}}
"  {{{ IMPORT
   elseif synIDattr(slist[0], "name") =~ "pam_IMPORT"
      if synIDattr(slist[1], "name") =~ "pam_IMPORT_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IPLOT - Check File Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "HTF - Heat Treatment coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "IPF - Process Flag (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "RDIST - Search Extension"
         endif
      endif
"  }}}
"  {{{ EXPORT
   elseif synIDattr(slist[0], "name") =~ "pam_EXPORT"
      if synIDattr(slist[1], "name") =~ "pam_EXPORT_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IFILE - Mapping File Format (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IOUTFRAM - 2K Local Frame Activation (menu)"
         endif
      endif
"  }}}
"  {{{ RMSSOL
   elseif synIDattr(slist[0], "name") =~ "pam_RMSSOL"
      if synIDattr(slist[1], "name") =~ "pam_RMSSOL_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDRMSSOL"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "IDTIED - TIED Part ID to Connect Generated Solids (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "NCYCL - Accelerator to Check Remeshing Criteria"
         elseif synIDattr(slist[2], "name") =~ "pam_73.*"
            return "DSYSCA - Reduction Scale Factor for DSY Output"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RMSSOL_r3"
         if synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]1"
            return "CRIT - SSM Criteria (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]2"
            return "KEYWORD1 - SSM Criteria Definition (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_RMSSOL_r3_[ae]3"
            return "KEYWORD2 - Value Over all Integration Points Compared with VCRIT (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "VCRIT - Threshold to Trigger Remeshing"
         elseif synIDattr(slist[2], "name") =~ "pam_49.*"
            return "RMESH - Radius to Remesh Neighbour Shells"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_RMSSOL_r4"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "NGEDG - Number of Solids over Shell Edge"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "NGTHK - Number of Solids over Thickness"
         endif
      endif
"  }}}
"  {{{ LOOKU
   elseif synIDattr(slist[0], "name") =~ "pam_LOOKU"
      if synIDattr(slist[1], "name") =~ "pam_LOOKU_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDLUT"
         endif
      elseif synIDattr(slist[2], "name") =~ "pam_LOOKU_r3a"
         if synIDattr(slist[3], "name") =~ "pam_17.*"
            return "IARG - Component ID"
         elseif synIDattr(slist[3], "name") =~ "pam_LOOKU_r3a_[ae]1"
            return "NAMA - Component Name"
         elseif synIDattr(slist[3], "name") =~ "pam_33.*"
            return "IINT - Interpolation Mode Flag (menu)"
         elseif synIDattr(slist[3], "name") =~ "pam_41.*"
            return "ILEXT - Lower Extrapolation Flag (menu)"
         elseif synIDattr(slist[3], "name") =~ "pam_49.*"
            return "IUEXT - Upper Extrapolation Flag (menu)"
         elseif synIDattr(slist[3], "name") =~ "pam_57.*"
            return "ARGD - Default Argument Value"
         endif
      endif
"  }}}
"  {{{ TURBL
   elseif synIDattr(slist[0], "name") =~ "pam_TURBL"
      if synIDattr(slist[1], "name") =~ "pam_TURBL_r1"
         if synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IDTURBL"
         elseif synIDattr(slist[2], "name") =~ "pam_TURBL_r1_[ae]1"
            return "MODEL - Turbulent Boundary Layer Model (menu)"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r3"
         if synIDattr(slist[2], "name") =~ "pam_1.8.*"
            return "IFUNpsd - Wall Pressure PSD Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_9.*"
            return "SFACpsd - Wall Pressure PSD Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "PSD - Constant Wall PSD"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r4"
         if synIDattr(slist[2], "name") =~ "pam_1.8.*"
            return "IDIR - Direction of the Flow (menu)"
         elseif synIDattr(slist[2], "name") =~ "pam_9.*"
            return "IFRA - Local Coordinate Frame (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "THK - Turbulent Boundary Layer Thickness"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUNCuc - Convective Velocity Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SCAFuc - Convective Velocity Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "UC - Constant Convective Velocity"
         endif
      elseif synIDattr(slist[1], "name") =~ "pam_TURBL_r5"
         if synIDattr(slist[2], "name") =~ "pam_1.8.*"
            return "IFUNc1 - Spatial Decay Coefficient Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_9.*"
            return "SFACc1 - Spatial Decay Coefficient Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_17.*"
            return "C1 - Constact Spatial Decay Coefficient"
         elseif synIDattr(slist[2], "name") =~ "pam_25.*"
            return "IFUNc2 - Spatial Decay Coefficient Function ID (tag)"
         elseif synIDattr(slist[2], "name") =~ "pam_33.*"
            return "SFACc2 - Spatial Decay Coefficient Scale Factor"
         elseif synIDattr(slist[2], "name") =~ "pam_41.*"
            return "C2 - Constact Spatial Decay Coefficient"
         endif
      endif
"  }}}
"  {{{ ID for Rest
   elseif synIDattr(slist[2], "name") =~ "8id"
      return "ID - Entity Identification Number"
"  }}}
   endif
   return ''
endfunc
