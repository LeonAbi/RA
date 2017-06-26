// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe4.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	push {lr}

//R0 zeigt auf Count
	ldr r0, =Count
//R1 zeigt auf Total
	ldr r1, =Total
//R2 zeigt auf Table
	ldr r2, =Table
//lade Wert von Count in R0 (4)
	ldr r0, [r0]
//lade Wert von Total in R1 (0)
	ldr r1, [r1]
	
	b Add_instr
		
Add_instr:
//speichert ersten Wert der Tabelle in R3 und holt im nächsten Durchgang den zweiten Wert
	ldr r3, [r2], #4
//addiert Totel und den ersten Wert der Tabelle
	add r1, r1, r3
//zählt einen runter vom Schleifen Counter
	subs r0, r0, #1
//wenn counter noch >= 0 macht er Add_instr wieder
	bpl Add_instr
//r5 zeigt auf Total
	ldr r5, =Total
//speichert den Wert von Total in den neuen totalzeiger (Endergebnis)
	str r1, [r5]
	pop {pc}

Halt:
	b	Halt

.Lfe1:
	.size	main,.Lfe1-main

	.data
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

	

// End of File

