#include-once

; ****************** Within a ???? app (should be Firefox???) ***************************************

Local $PixelColor

Func CompareLightGreyColorAndClick($x, $y)
	Sleep(500)
	$PixelColor = Hex(PixelGetColor($x, $y))
	While $PixelColor <> "00ADADAD"
		Sleep(100)
		$PixelColor = Hex(PixelGetColor($x, $y))
	WEnd
	
	MouseClick("left",$x, $y,1)
	
EndFunc

Func CompareWhiteColorAndClick($x, $y)
	Sleep(500)
	$PixelColor = Hex(PixelGetColor($x, $y))
	While $PixelColor <> "00FFFFFF"
		Sleep(100)
		$PixelColor = Hex(PixelGetColor($x, $y))
	WEnd
	
	MouseClick("left",$x, $y,1)
	
EndFunc

Func CompareGreyColorAndClick($x, $y)
	Sleep(500)
	$PixelColor = Hex(PixelGetColor($x, $y))
	While $PixelColor <> "00969693"
		Sleep(100)
		$PixelColor = Hex(PixelGetColor($x, $y))
	WEnd
	
	MouseClick("left",$x, $y,1)
	
EndFunc

Func CompareBlackColorAndClick($x, $y)
	Sleep(500)
	$PixelColor = Hex(PixelGetColor($x, $y))
	While $PixelColor <> "00757A7F"
		Sleep(100)
		$PixelColor = Hex(PixelGetColor($x, $y))
	WEnd
	
	MouseClick("left",$x, $y,1)
	
EndFunc

Func CompareBlueColorAndClick($x, $y)
	Sleep(500)
	$PixelColor = Hex(PixelGetColor($x, $y))
	While $PixelColor <> "004269A4"
		Sleep(100)
		$PixelColor = Hex(PixelGetColor($x, $y))
	WEnd
	
	MouseClick("left",$x, $y,1)
	
EndFunc

Func CompareLightBlueColorAndClick($x, $y)
	Sleep(500)
	$PixelColor = Hex(PixelGetColor($x, $y))
	While $PixelColor <> "00268EDF"
		Sleep(100)
		$PixelColor = Hex(PixelGetColor($x, $y))
	WEnd
	
	MouseClick("left",$x, $y,1)
	
EndFunc

; This func is used with the version of pp script that selects the suburb automatically for me
Func StarTrackErrorColorsComparison($x1, $y1, $iConsignmentConfirmColor, $x2, $y2, $iErrorColor)
   Local $firefoxHandler = winGetHandle("Firefox")
   Local $changedToColor1 = PixelGetColor($x1, $y1, $firefoxHandler)
   Local $changedToColor2 = PixelGetColor($x2, $y2, $firefoxHandler)

   While (Hex($changedToColor1,6) <> Hex($iConsignmentConfirmColor,6)) And (Hex($changedToColor2,6) <> Hex($iErrorColor,6))
	  Sleep(100)
	  $changedToColor1 = PixelGetColor($x1, $y1, $firefoxHandler)
	  $changedToColor2 = PixelGetColor($x2, $y2, $firefoxHandler)
   WEnd

   If Hex($changedToColor1,6) = Hex($iConsignmentConfirmColor,6) Then
	  Return 1
   Else
	  Return 2
   EndIf

EndFunc


; ******************** Within an Excel app *************************************

Func CompareColorsWithinExcelCode3($x, $y, $iNumber_OriginalColor)
   Local $firefoxHandler = winGetHandle("Firefox")
   Local $changedToColor = PixelGetColor($x, $y, $firefoxHandler)
   While Hex($changedToColor,6) <> Hex($iNumber_OriginalColor,6)
	  Sleep(100)
	  $changedToColor = PixelGetColor($x, $y, $firefoxHandler)
   WEnd

   Sleep($iWExcelMenuAndDialogBoxDisplay_ExcessData)

EndFunc