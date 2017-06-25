// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe3.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:

Loop: 
//lädt total in R0
    LDR r0, Total
Add_instr:
//r1 zeigt auf Tabelle
    LDR r1, Table
//erster wert + total, speichert in r0
    ADD r0, r1
//speichert r0 in total
    STR r0, Total
    LDR r2, Add_instr
    ADD r2, #4
    STR r2, Add_instr
    LDR r3, Count
    SUBS r3, #1
    STR r3, Count
//solange bis Loop (5) auf 0 ist
    BNE Loop


//; Data definitions

//Total 	DEFW 0 ; Total - initially zero
Total:	.word	0

//One 	DEFW 1 ; The number one

//Count 	DEFW 4 ; Loop counter (loop 5x)
Count:	.word	4

//Table 	DEFW 39 ; The numbers to total ...
//	DEFW 25 ;
//	DEFW 4 ;
//	DEFW 98 ;
//	DEFW 17 ;
Table:	.word	39, 25, 4, 98, 17


.Lfe1:
	.size	main,.Lfe1-main

// End of File
