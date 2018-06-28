#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         Sorin Ionut Bajenaru

 Script Function:
	Template AutoIt script.
    15 - May - 2016

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


HotKeySet("{TAB}", "start")
HotKeySet("{END}", "quit")
HotKeySet("{PGUP}", "pozitie")
HotKeySet("{PGDN}", "pozculoare")

Global $secunde = 15 * 60 * 10
Global $sec = -1
Global $sw10 = 0
Global $sw05 = 0
Global $swFinal = 0

While 1
   showTimer()
WEnd

Func start()

    ; buton pay
	Local $pPayx = 1180
	Local $pPayy = 965

	; plateste cu ce am
	Local $pPaySaveCoords = MouseGetPos();
	MouseClick("left", $pPaySaveCoords[0], $pPaySaveCoords[1], 1, 0)
	Sleep(160)
	MouseClick("left", $pPayx, $pPayy, 1, 0)
	MouseMove($pPaySaveCoords[0], $pPaySaveCoords[1], 0)
	Sleep(100)

   $secunde -= 3
EndFunc

Func showTimer()

   Local $messX = 650
   Local $messy = 822

   Local $colorX = 659
   Local $colorY = 794
   Local $culoare10 = 16753920
   Local $culoare05 = 16711680
   Local $curentColor = 0

   If ($swFinal = 0) Then
	  ToolTip('Timp ramas, secunde: ' & Int($secunde / 10) , $messX, $messY)
   ElseIf ($swFinal = 1) Then
	  ToolTip('Timp ramas, secunde: ' & Int($sec / 10) , $messX, $messY)
   EndIf

   $curentColor = PixelGetColor($colorX, $colorY)
   ;ToolTip($culoare10 & ' ' & $curentColor , 700, 850)

   If (($curentColor = $culoare10) And ($sw10 = 0)) Then
	  $sw10 = 1
	  $sw05 = 0
	  $secunde = 10 * 60 * 10
   EndIf

   If (($curentColor = $culoare05) And ($sw05 = 0)) Then
	  $sw05 = 1
	  $secunde = 5 * 60 * 10
   EndIf

   If (($sw05 = 1) And ($curentColor = $culoare05)) Then
	  $swFinal = 1
	  $sw10 = 0
	  $sec = $secunde
   EndIf

   $secunde -= 1

   Sleep(70)

EndFunc

Func pozitie()
	Local $aPos = MouseGetPos()
	ToolTip('X: ' & $aPos[0] & ', Y: ' & $aPos[1])
 EndFunc

Func pozculoare()
	Local $aPos = MouseGetPos()
	Local $iColor = PixelGetColor($aPos[0], $aPos[1])
	ToolTip('X: ' & $aPos[0] & ', Y: ' & $aPos[1] & ', color: ' & $iColor)
 EndFunc

Func quit()
	Exit 0
EndFunc