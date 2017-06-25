// Name:		Matrikelnummer:
// Name:		Matrikelnummer:
// Datum:

	.file	"aufgabe2.S"
	.text			@ legt eine Textsection fuer PrgrammCode + Konstanten an
	.align	2		@ sorgt dafuer, dass nachfolgende Anweisungen auf einer durch 4 teilbaren Adresse liegen
				@ unteren 2 Bit sind 0
	.global	main		@ nimmt das Symbol main in die globale Sysmboltabelle auf
	.type	main,function
main:
	push	{lr}

	mov r0, #0
	mov r1, #1

	bl	up1
	bl	up2
	bl	up3
	
	pop	{pc}

// UP1 benutzt nur Scratchregister und stellt keine Blattroutine dar (ruft somit weitere
// Unterprogramme auf)	
up1:

bl up2

// Linked Register Pointer um 12 Byte verringern um 3 Befehle weiter nach oben zu springen
sub LR, #12
MOV PC,LR



// UP2 benutzt nur Scratchregister und stellt eine Blattroutine dar (ruft somit keine weiteren
// Unterprogramme auf)
up2:

add  r0, r1
MOV PC, LR


//UP3 benutzt Nicht-Scratchregister und stellt keine Blattroutine dar
up3:

	//Store Increase after -> speichert Inhalt von SP in R4 und erhöht SP danach um 4 Byte
	add SP, LR
	MOV PC, LR

.Lfe1:
	.size	main,.Lfe1-main

// End of File
