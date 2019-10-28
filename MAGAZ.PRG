clear all
set color to w
set default to c:
set bell off
set decimal to 0
use magaz
replace cod with recno() all
coglionazzo = 1
pirlo = 1
pirlino = 1
nelculo = 1
set confirm on


do while pirlo = 1

sucaminchia = space(5)
cazzazzo = space(2)
use magaz
clear
@ 2,19 SAY "Radel - Gestione  Magazzino - Radel"
@ 5,20 say " 1) Inserimento Articoli"
@ 6,20 say " 2) Visualizzazione - Modifica Articoli"
@ 7,20 say " 3) Stampa prospetto"
@ 8,20 say " 4) Cancellazione articoli"
@ 9,20 say " 5) Ricerca articoli"
@ 11,20 say " 9) Fine Lavori"
@ 14,20 say "Scegli : " get sucaminchia
read
sucaminchia = upper (sucaminchia)
if sucaminchia = "***"
  nelculo = nelculo * -1
endif


if sucaminchia = "1"
 append blank
 go bottom
 replace cod with recno ()
 crasto = 1
 fottitene = 0
 clear

 do while crasto = 1
 @  2, 25  SAY "HSC - Gestione Magazzino - HSC"
 @  5, 17  SAY "Codice Articolo"
 @  5, 33  say  MAGAZ->COD
 @  7, 21  SAY "Descrizione"
 @  7, 33  GET  MAGAZ->DES
 read
 if substr(des,1,1)=" "
    fottitene = 1
    crasto = 0
    exit
 endif
 @  9, 16  SAY "Unita' di misura"
 @  9, 33  GET  MAGAZ->UNM  PICTURE "XX"
 read
 @ 11, 23  SAY "Quantita'"
 @ 11, 33  GET  MAGAZ->QUA
 read
 @ 13, 17  SAY "Prezzo Unitario"
 @ 13, 33  GET  MAGAZ->PRU
 read
 @ 15, 29  SAY "IVA"
 @ 15, 33  GET  MAGAZ->IVA
 read
 @ 17, 18  SAY "Sconto"
 @ 17, 25  GET  MAGAZ->SC
 read
 pre = pru-pru*sc/100
 tot = pre*qua
 @ 17, 33  SAY "Prezzo"
 @ 17, 40  say  pre
 @ 17, 53  SAY "Totale"
 @ 17, 61  say  TOT
 set color to *w
 @  20,10 say "             Premi un tasto per continuare "
 set color to w
 wait ""
 append blank
 go bottom
 replace cod with recno ()
 clear
enddo

 if fottitene = 1
    delete record recno ()
    pack
 endif

endif


if sucaminchia = "2"
 coglioncello = 1

 do while coglioncello = 1
    go top
    if substr(des,1,1) = " "
      go bottom
         if recno () = 1
           clear
           ?
           ?" L'archivio e' vuoto !"
           ?
           wait " Premere un tasto per continuare ..."
           coglioncello = 0
           exit
        endif
    endif

 puttana = 1

 do while puttana = 1
 clear
 ?
 ?
 input " Quale articolo (0 per uscire) :" to coglionazzo
  go bottom
  ult = recno ()

  sucapalle = 1
  spaccapirli = 1

  if sucapalle = 1
   if coglionazzo > ult
    puttana = 1
    lercio = 0
    tricazzo = 1
    coglioncello = 0
    sucapalle = 0
    spaccapirli = 0
   endif

   if spaccapirli = 1
     if coglionazzo = 0
      lercio = 0
      puttana = 0
      tricazzo = 1
      spaccapirli = 0
      sucapalle = 0
      coglioncello = 0
     else
      tricazzo = 0
      lercio = 1
      spaccapirli = 0
      puttana = 0
     endif
   endif
  endif

  if lercio = 1
  go coglionazzo
  do case
     case substr(des,1,1) = "X"
      if nelculo = 1
       puttana = 1
       ?
       ?" Articolo inesistente "
       ?
       wait " Premi un tasto per continuare "
      else
       puttana = 0
       tricazzo = 0
      endif

     case iva = 0
      if nelculo = 1
       puttana = 1
       ?
       ?" Articolo inesistente "
       ?
       wait " Premi un tasto per continuare "
      else
       puttana = 0
       tricazzo = 0
      endif
     otherwise
      puttana = 0
      tricazzo = 0
  endcase
  endif

 enddo

 if tricazzo = 0

 stocazzo = 1
 go coglionazzo
 do while stocazzo = 1
 pene = 1
 clear
 @  2, 25  SAY "HSC - Gestione Magazzino - HSC"
 @  5, 17  SAY "Codice Articolo"
 @  5, 33  say  MAGAZ->COD
 @  7, 21  SAY "Descrizione"
 @  7, 33  GET  MAGAZ->DES
 @  9, 16  SAY "Unita' di misura"
 @  9, 33  GET  MAGAZ->UNM  PICTURE "XX"
 @ 11, 23  SAY "Quantita'"
 @ 11, 33  GET  MAGAZ->QUA
 @ 13, 17  SAY "Prezzo Unitario"
 @ 13, 33  GET  MAGAZ->PRU
 @ 15, 29  SAY "IVA"
 @ 15, 33  GET  MAGAZ->IVA
 @ 17, 18  SAY "Sconto"
 @ 17, 25  GET  MAGAZ->SC
 read
 pre = pru-pru*sc/100
 tot = pre*qua
 @ 17, 33  SAY "Prezzo"
 @ 17, 40  say  PRE
 @ 17, 51  SAY "Totale"
 @ 17, 58  say  TOT

  do while pene = 1
  @ 20,1
   cazzo = inkey ()
   go bottom
   ult = recno ()

   if cazzo =18
      coglionazzo=coglionazzo-1
      pene = 0
       if coglionazzo < 1
	  coglionazzo = ult
       endif
      go coglionazzo
       if nelculo = 1
        do while iva =0
	 coglionazzo = coglionazzo - 1
	   if coglionazzo < 1
	      coglionazzo = ult
           endif
	 go coglionazzo
        enddo
       endif
   endif

   if cazzo = 3
      coglionazzo=coglionazzo+1
      pene = 0
      if coglionazzo > ult
	 coglionazzo = 1
      endif
      go coglionazzo
      if nelculo = 1
       do while iva = 0
	  coglionazzo = coglionazzo + 1
	   if coglionazzo > ult
	      coglionazzo = 1
           endif
	  go coglionazzo
       enddo
      endif
   endif

   if cazzo = 6
      stocazzo = 0
      pene = 0
      coglioncello = 0
   endif

  enddo
 enddo
 endif

 enddo
endif

if sucaminchia = "3"
 if nelculo = 1
   set filter to iva > 0
 endif
 staminchia = 1
 do while staminchia = 1
 clear
 @ 9,10 say " Stampa su Video o Stampante (V/S) ?" get cazzazzo
 read
 clear
 cazzazzo = upper (cazzazzo)
 do case
    case cazzazzo = "V"
      staminchia = 0
      clear
      report form magaz
      ?
      wait " Premi un tasto per continuare "
    case cazzazzo = "S"
      staminchia = 0
      clear
      report form magaz to print
      ?
      wait " Premi un tasto per continuare "
    otherwise
      staminchia = 1
 endcase
 enddo
endif

if sucaminchia = "4"
   ciucciacazzi = 1
   do while ciucciacazzi = 1
   go top
   if substr(des,1,1) = " "
      go bottom
      if recno () = 1
         clear
         ?
         ?
         ?" L'archivio e' vuoto !"
         ?
         wait" Premi un tasto per continuare "
         exit
      endif
   endif
   use magaz
   bottana = 1
   do while bottana = 1
   clear
   ?
   ?
   input" Numero Articolo da cancellare : " to canc
   ?
   ?
   go bottom
   ult = recno ()
   do case
      case canc = 0
       bottana = 1
      case canc > ult
       bottana = 1
      otherwise
       bottana = 0
   endcase
   enddo
   cazzazzo = space(2)
   @ 7,2 say "Sei proprio sicuro (S/N) ? " get cazzazzo
   read
   cazzazzo = upper (cazzazzo)
   if cazzazzo="S"
     go canc
     replace des with "XXX Cancellato XXX"
     replace unm with "X"
     replace qua with 0
     replace pru with 0
     replace iva with 0
     replace sc with 0
     ciucciacazzi = 0
   endif
   enddo
endif

if sucaminchia = "5"
 penazzo = 1
 pelodiminchia = space (30)
 pelodiculo = 0
 do while penazzo = 1
 clear
 ric = space(1)
 @ 6,5 say " Ricerca per Descrizione o Prezzo unitario (D/P) ?" get ric
 read
 r = upper (ric)

 if r = "D"
    penazzo = 0
    clear
    @ 6,5 say " Inserire descrizione : " get pelodiminchia
    read
    go bottom
    crigno=recno()
    trovato=0
    castro=1
    inculato=1
    go inculato
    do while castro=1
    clear
    @ 1,1 say " Attendere ... ricerca in corso"
       if pelodiminchia=des
          trovato=1
          clear
    @  2, 25  SAY "HSC - Gestione Magazzino - HSC"
    @  5, 17  SAY "Codice Articolo"
    @  5, 33  say  MAGAZ->COD
    @  7, 21  SAY "Descrizione"
    @  7, 33  GET  MAGAZ->DES
    @  9, 16  SAY "Unita' di misura"
    @  9, 33  GET  MAGAZ->UNM  PICTURE "XX"
    @ 11, 23  SAY "Quantita'"
    @ 11, 33  GET  MAGAZ->QUA
    @ 13, 17  SAY "Prezzo Unitario"
    @ 13, 33  GET  MAGAZ->PRU
    @ 15, 29  SAY "IVA"
    @ 15, 33  GET  MAGAZ->IVA
    @ 17, 18  SAY "Sconto"
    @ 17, 25  GET  MAGAZ->SC
    pre = pru-pru*sc/100
    tot = pre*qua
    @ 17, 33  SAY "Prezzo"
    @ 17, 40  say  PRE
    @ 17, 51 SAY "Totale"
    @ 17, 58  say  TOT
    ?
    wait " Premere un tasto per continuare "
    inculato=inculato+1
       else
    inculato=inculato+1
       endif
         if inculato=crigno
               if trovato=0
                  ? " Nessun record trovato"
               endif
            castro=0
            inculato=1
         endif
    go inculato
    enddo
 endif

 if r = "P"
    penazzo = 0
    clear
    @ 6,5 say " Inserire prezzo unitario : " get pelodiculo
    read
    clear
    go bottom
    crigno=recno()
    trovato=0
    castro=1
    inculato=1
    go inculato
    do while castro=1
    clear
    @ 1,1 say " Attendere ... ricerca in corso."
 if pelodiculo=pru
    trovato=1
    clear
    @  2, 25  SAY "HSC - Gestione Magazzino - HSC"
    @  5, 17  SAY "Codice Articolo"
    @  5, 33  say  MAGAZ->COD
    @  7, 21  SAY "Descrizione"
    @  7, 33  GET  MAGAZ->DES
    @  9, 16  SAY "Unita' di misura"
    @  9, 33  GET  MAGAZ->UNM  PICTURE "XX"
    @ 11, 23  SAY "Quantita'"
    @ 11, 33  GET  MAGAZ->QUA
    @ 13, 17  SAY "Prezzo Unitario"
    @ 13, 33  GET  MAGAZ->PRU
    @ 15, 29  SAY "IVA"
    @ 15, 33  GET  MAGAZ->IVA
    @ 17, 18  SAY "Sconto"
    @ 17, 25  GET  MAGAZ->SC
    pre = pru-pru*sc/100
    tot = pre*qua
    @ 17, 33  SAY "Prezzo"
    @ 17, 40  say  PRE
    @ 17, 51 SAY "Totale"
    @ 17, 58  say  TOT
    ?
    wait " Premere un tasto per continuare "
    inculato=inculato+1
      else
    inculato=inculato+1
      endif
       if inculato=crigno
           if trovato=0
              ? " Nessun record trovato"
           endif
         castro=0
         inculato=1
       endif
    go inculato
    enddo
    endif
    enddo
 endif

if sucaminchia = "ZAP"
   clear
   ?
   set color to *w
   @ 5,10 say " Siete sicuri (S/N) ? " get cazzazzo
   read
   cazzazzo = upper (cazzazzo)
   if cazzazzo = "S"
      zap
   endif
   set color to w
endif

if sucaminchia = "9"
   clear
   pirlo=0
endif

if sucaminchia = "RADEL"

    clear
    ?" Programma Magaz"
    ?
    ?" Ideato da     :    Giorgio Zaverio"
    ?
    ?" Sviluppato da :    Gabriele Zaverio"
    ?"                    Giorgio Zaverio"
    ?
    ?" (C) 1987 by Radel Software, 11/9/1987"
    ?
    ?" (C) 1987 Horror Software Corporation, 11/9/1987"
    ?
    ?" Siete fortunati ..."
    ?
    wait " Premi un tasto per continuare ..."

endif

set filter to
pack
close databases

enddo
clear
