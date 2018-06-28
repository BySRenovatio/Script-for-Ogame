#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         Sorin Ionut Bajenaru

 Script Function:
	Template AutoIt script.
    10 - May - 2016

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

HotKeySet("{TAB}", "start")
HotKeySet("{PGUP}", "pozitie")
HotKeySet("{PGDN}", "pozculoare")
HotKeySet("{END}", "quit")

While 1
   Sleep(1000)
 WEnd

Func start()

   Local $messX = 730
   Local $messY = 300

   Local $aLoginX = 1220
   Local $aLoginY = 340
   Local $iColorLogin = 11220534

   Local $aAtackX = 1255
   Local $aAtackY = 200
   Local $iColorAtack = 3028293

   Local $sSkypeMeX = 2060
   Local $sSkypeMeY = 440
   Local $sSkypeXcall = 3680
   Local $sSkypeYcall = 85
   Local $sSkypeXend = 3110
   Local $sSkypeYend = 995

   Local $aStartx = 1380
   Local $aStarty = 205
   Local $aConstY = 53
   Local $aCurX = $aStartx
   Local $aCurY = $aStarty

   Local $pPlanet = 0
   Local $aNrPlanets = 9
   Local $aConst = 1000
   Local $howUrgent = 20

   While 1

		ToolTip('Start Loop', $messX, $messY)
		Sleep(Random(10, 20, 1) * $aConst)


		ToolTip('Check Login', $messX, $messY)
		If $iColorLogin = PixelGetColor($aLoginX, $aLoginY) Then
			MouseClick("left", $aLoginX, $aLoginY, 1, 0)
		EndIf
		Sleep(Random(10, 20, 1) * $aConst)


		ToolTip('Check Atack', $messX, $messY)
		If $iColorAtack <> PixelGetColor($aAtackX, $aAtackY) Then
		    MouseClick("left", $sSkypeMeX, $sSkypeMeY, 1, 0)
			Sleep(500)
			MouseClick("left", $sSkypeXcall, $sSkypeYcall, 1, 0)

			For $j = 1 to 75 Step +1
				Beep($j * 200, 200)
			Next

			MouseClick("left", $sSkypeXend, $sSkypeYend, 1, 0)
		EndIf
		Sleep(Random(10, 20, 1) * $aConst)


		For $i = 1 To 10 Step +1

			If Mod($i, $howUrgent) = 0 Then

				ToolTip('Check Login', $messX, $messY)
				If $iColorLogin = PixelGetColor($aLoginX, $aLoginY) Then
					MouseClick("left", $aLoginX, $aLoginY, 1, 0)
				EndIf
				Sleep(Random(10, 20, 1) * $aConst)


				ToolTip('Check Atack', $messX, $messY)
					If $iColorAtack <> PixelGetColor($aAtackX, $aAtackY) Then
					    MouseClick("left", $sSkypeMeX, $sSkypeMeY, 1, 0)
						Sleep(500)
						MouseClick("left", $sSkypeXcall, $sSkypeYcall, 1, 0)

						For $j = 1 to 75 Step +1
							Beep($j * 200, 200)
						Next

						MouseClick("left", $sSkypeXend, $sSkypeYend, 1, 0)
					EndIf
				Sleep(Random(10, 20, 1) * $aConst)

			EndIf

			; choose a planet
			$pPlanet = Random(1, $aNrPlanets, 1)

			; click planet
			ToolTip('Planet (' & $i & ') '& $pPlanet & ' click', $messX, $messY)
			$aCurY = $aStarty + $aConstY * $pPlanet
			MouseClick("left", $aCurX, $aCurY, 1, 0)
			Sleep(Random(20, 40, 1) * $aConst)

			; resources
			ToolTip('Resources', $messX, $messY)
			If Random(0, 1, 1) == 1 Then
				MouseClick("left", 560, 270, 1, 0)
			EndIf
			Sleep(Random(10, 20, 1) * $aConst)

			; fleet
			ToolTip('Fleet', $messX, $messY)
			If Random(0, 1, 1) == 1 Then
				MouseClick("left", 560, 445, 1, 0)
			EndIf
			Sleep(Random(10, 20, 1) * $aConst)

			; defense
			ToolTip('Defense', $messX, $messY)
			If Random(0, 1, 1) == 1 Then
				MouseClick("left", 560, 415, 1, 0)
			EndIf
			Sleep(Random(10, 20, 1) * $aConst)

			; Moon
			ToolTip('Moon', $messX, $messY)
			MouseClick("left", $aCurX + 50, $aCurY, 1, 0)
			Sleep(Random(20, 40, 1) * $aConst)

			; overview
			ToolTip('Overview', $messX, $messY)
			MouseClick("left", 560, 240, 1, 0)
			Sleep(Random(20, 40, 1) * $aConst)

		Next

   WEnd

EndFunc

Func quit()
	Exit 0
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