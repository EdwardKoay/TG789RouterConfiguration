#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Eddywardward

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <Constants.au3>
#include <GUIConstants.au3>
#include <WindowsConstants.au3>
#include <CompareColors.au3>

Local $Paused
HotKeySet("{INSERT}", "ExitProgram")
HotKeySet("{PAUSE}", "TogglePause")
AutoItSetOption ("TrayIconDebug", 1)

Func ExitProgram()
   Exit
EndFunc

Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is "Paused = SCRIPT IS NOT RUNNING = you wont get another message if you dont unpause it"', 400, 105)
    WEnd
    ToolTip("")
EndFunc

_Main()

Func _Main()
	Local $idOptionsMenu, $idSeparator, $idAlwaysOnTop
	Local $idExitItem, $idHelpMenu, $idAboutItem, $idOkButton, $idCancelButton
	Local $iMsg, $ClipBoard, $PixelColor, $InternodeGUI
	Local $idTG789VDSLButtonButton, $idTG789ADSLButton, $idTG789FibreButton, $idTG789HFCButton
	Local $idFRITZ7490VDSLButton, $idFRITZ7490ADSLButton, $idFRITZ7490FIBREButton, $idFRITZ7490VLAN2Button
	Local $BoxChecked = "1"
	
	$InternodeGUI = GUICreate("Internode Config V1.224", 300, 200, 275, 525, -1, -1)
	;$Formtitle = GUICtrlCreateLabel(" OdnoMMS", 0, 4, @DesktopWidth, 20, -1, $GUI_WS_EX_PARENTDRAG)
	;GUICtrlSetColor(-1, 0xFFFFFF)
	;GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	;$Formtitlebackground = GUICtrlCreateGraphic(0, 0, @DesktopWidth, 22)

	GUISetBkColor ( 0xADADAD ) 
	
	$idOptionsMenu = GUICtrlCreateMenu("Options")
	$idAlwaysOnTop = GUICtrlCreateMenuItem("Always On Top", $idOptionsMenu, 1)
	$idSeparator = GUICtrlCreateMenuItem("", $idOptionsMenu)
	$idExitItem = GUICtrlCreateMenuItem("Exit", $idOptionsMenu)
	$idHelpMenu = GUICtrlCreateMenu("Help")
	$idAboutItem = GUICtrlCreateMenuItem("About...", $idHelpMenu)

	$idTG789VDSLButton = GUICtrlCreateButton("TG789 VDSL", 30, 20, 90, 20)
	$idTG789ADSLButton = GUICtrlCreateButton("TG789 ADSL", 30, 60, 90, 20)
	$idTG789FibreButton = GUICtrlCreateButton("TG789 FIBRE", 30, 100, 90, 20)
	$idTG789HFCButton = GUICtrlCreateButton("TG789 HFC", 30, 140, 90, 20)

	$idFRITZ7490VDSLButton = GUICtrlCreateButton("Fritz7490 VDSL", 180, 20, 90, 20)
	$idFRITZ7490ADSLButton = GUICtrlCreateButton("Fritz7490 ADSL", 180, 60, 90, 20)
	$idFRITZ7490FIBREButton = GUICtrlCreateButton("Fritz7490 FIBRE", 180, 100, 90, 20)
	$idFRITZ7490VLAN2Button = GUICtrlCreateButton("Fritz7490 VLAN2", 180, 140, 90, 20)
	
	WinSetOnTop($InternodeGUI, "", 1)
	GUICtrlSetState($idAlwaysOnTop, $GUI_CHECKED)
	
	;GUICtrlSetBkColor ( 1, $COLOR_AQUA)
	;GUICtrlSetColor ( 1, $COLOR_AQUA)

	GUISetState()

	While 1
		$iMsg = GUIGetMsg()

		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				ExitLoop

			Case $iMsg = $idExitItem
				ExitLoop
				
			Case $iMsg = $idAlwaysOnTop
				If $BoxChecked == 1  Then
					$BoxChecked = 0
					WinSetOnTop($InternodeGUI, "", 0)
					GUICtrlSetState($idAlwaysOnTop, $GUI_UNCHECKED)
				Else
					$BoxChecked = 1
					WinSetOnTop($InternodeGUI, "", 1)
					GUICtrlSetState($idAlwaysOnTop, $GUI_CHECKED)
				EndIf

			
			Case $iMsg = $idAboutItem
				MsgBox($MB_SYSTEMMODAL, "About", "AutoIt v3 Internode Configuration GUI Information." &@crlf& "" &@crlf& "E-Mail: Edward.Koay@tpgtelecom.com.au" &@crlf& "©2021 Eddywardward")

			Case $iMsg = $idTG789VDSLButton			

				MouseClick("left",895,344,1)
				Sleep(420)
				MouseClick("left",895,405,1)
				Sleep(420)
				MouseClick("left",174,564,3)
				Send("^c")
				MouseClick("left",889,421,3)
				Send("^v")
				MouseClick("left",175,609,3)
				Send("^c")
				MouseClick("left",893,461,3)
				Send("^v")
				MouseClick("left",920,529,1)
				Sleep(450)
				MouseClick("left",172,654,3)
				Send("^c")
				$ClipBoard = ClipGet()
				Sleep(100)
				
				if $ClipBoard <> @error Then
					MouseClick("left",885,477,3)
					Send("^v")
					MouseClick("left",173,697,3)
					Send("^c")
					MouseClick("left",879,515,3)
					Send("^v")
				EndIf
				
				CompareWhiteColorAndClick(957, 587)
				
				Sleep(600)
				$PixelColor = Hex(PixelGetColor(886, 457))
				
				if $PixelColor <> "00FFFFFF" Then
					MouseClick("left",886,457,1)
					Sleep(420)
				EndIf
				
				CompareWhiteColorAndClick(957, 627)

				CompareWhiteColorAndClick(955, 589)

				Sleep(600)
				$PixelColor = Hex(PixelGetColor(886, 457))
				
				if $PixelColor <> "00FFFFFF" Then
					MouseClick("left",886,457,1)
					Sleep(420)
				EndIf
				
				CompareWhiteColorAndClick(955, 627)

				CompareWhiteColorAndClick(955, 589)

				CompareWhiteColorAndClick(954, 665)

				TogglePause()
				
				MouseClick("left",942,736,1)
				Sleep(420)
				MouseClick("left",609,947,1)
				Send("^w")
				MsgBox($MB_OK, "Configuration Completed", "Press 'Enter' Or 'ESC' To Exit", 5)
				
			Case $iMsg = $idTG789ADSLButton			

				MouseClick("left",895,344,1)
				Sleep(420)
				MouseClick("left",895,375,1)
				Sleep(420)
				MouseClick("left",174,564,3)
				Send("^c")
				MouseClick("left",889,421,3)
				Send("^v")
				MouseClick("left",175,609,3)
				Send("^c")
				MouseClick("left",893,461,3)
				Send("^v")
				MouseClick("left",921,603,1)
				Sleep(420)

				MouseClick("left",172,654,3)
				Send("^c")
				$ClipBoard = ClipGet()
				Sleep(100)
				
				if $ClipBoard <> @error Then
					MouseClick("left",885,477,3)
					Send("^v")
					MouseClick("left",173,697,3)
					Send("^c")
					MouseClick("left",879,515,3)
					Send("^v")
				EndIf

				CompareWhiteColorAndClick(957, 587)
				
				Sleep(600)
				$PixelColor = Hex(PixelGetColor(886, 457))
				
				if $PixelColor <> "00FFFFFF" Then
					MouseClick("left",886,457,1)
					Sleep(420)
				EndIf
				
				CompareWhiteColorAndClick(957, 627)

				CompareWhiteColorAndClick(955, 589)

				Sleep(600)
				$PixelColor = Hex(PixelGetColor(886, 457))
				
				if $PixelColor <> "00FFFFFF" Then
					MouseClick("left",886,457,1)
					Sleep(420)
				EndIf
				
				CompareWhiteColorAndClick(955, 627)

				CompareWhiteColorAndClick(955, 589)

				CompareWhiteColorAndClick(954, 665)

				TogglePause()
				MouseClick("left",942,736,1)
				Sleep(420)
				MouseClick("left",609,947,1)
				Send("^w")
				MsgBox($MB_OK, "Configuration Completed", "Press 'Enter' Or 'ESC' To Exit", 5)
				
			Case $iMsg = $idTG789FibreButton

				MouseClick("left",895,344,1)
				Sleep(420)
				MouseClick("left",895,421,1)
				Sleep(420)
				MouseClick("left",174,564,3)
				Send("^c")
				MouseClick("left",889,421,3)
				Send("^v")
				MouseClick("left",175,609,3)
				Send("^c")
				MouseClick("left",893,461,3)
				Send("^v")
				MouseClick("left",920,529,1)
				Sleep(420)

				MouseClick("left",172,654,3)
				Send("^c")
				$ClipBoard = ClipGet()
				Sleep(100)
				
				if $ClipBoard <> @error Then
					MouseClick("left",885,477,3)
					Send("^v")
					MouseClick("left",173,697,3)
					Send("^c")
					MouseClick("left",879,515,3)
					Send("^v")
				EndIf

				CompareWhiteColorAndClick(957, 587)
				
				Sleep(600)
				$PixelColor = Hex(PixelGetColor(886, 457))
				
				if $PixelColor <> "00FFFFFF" Then
					MouseClick("left",886,457,1)
					Sleep(420)
				EndIf
				
				CompareWhiteColorAndClick(957, 627)

				CompareWhiteColorAndClick(955, 589)

				Sleep(600)
				$PixelColor = Hex(PixelGetColor(886, 457))
				
				if $PixelColor <> "00FFFFFF" Then
					MouseClick("left",886,457,1)
					Sleep(420)
				EndIf
				
				CompareWhiteColorAndClick(955, 627)

				CompareWhiteColorAndClick(955, 589)

				CompareWhiteColorAndClick(954, 665)
				
				TogglePause()
				
				MouseClick("left",942,736,1)
				
				MouseMove(1222, 421, 10)
				
				Sleep(2000)
				
				CompareWhiteColorAndClick(1222, 421)
				
				Sleep(1500)
				MouseClick("left",1006,247,1)
				Sleep(420)
				MouseClick("left",864,325,1)
				Sleep(420)
				MouseClick("left",994,705,1)
				Sleep(600)
				MouseClick("left",950,709,1)
				Sleep(420)
				MouseClick("left",609,947,1)
				Send("^w")
				MsgBox($MB_OK, "Configuration Completed", "Press 'Enter' Or 'ESC' To Exit", 5)
				
			Case $iMsg = $idTG789HFCButton

				MouseClick("left",895,344,1)
				Sleep(420)
				MouseClick("left",895,421,1)
				Sleep(420)
				MouseClick("left",174,564,3)
				Send("^c")
				MouseClick("left",889,421,3)
				Send("^v")
				MouseClick("left",175,609,3)
				Send("^c")
				MouseClick("left",893,461,3)
				Send("^v")
				MouseClick("left",920,529,1)
				Sleep(420)

				MouseClick("left",172,654,3)
				Send("^c")
				$ClipBoard = ClipGet()
				Sleep(100)
				if $ClipBoard <> @error Then
					MouseClick("left",885,477,3)
					Send("^v")
					MouseClick("left",173,697,3)
					Send("^c")
					MouseClick("left",879,515,3)
					Send("^v")
				EndIf

				CompareWhiteColorAndClick(957, 587)
				
				Sleep(600)
				$PixelColor = Hex(PixelGetColor(886, 457))
				
				if $PixelColor <> "00FFFFFF" Then
					MouseClick("left",886,457,1)
					Sleep(420)
				EndIf
				
				CompareWhiteColorAndClick(957, 627)

				CompareWhiteColorAndClick(955, 589)

				Sleep(600)
				$PixelColor = Hex(PixelGetColor(886, 457))
				
				if $PixelColor <> "00FFFFFF" Then
					MouseClick("left",886,457,1)
					Sleep(420)
				EndIf
				
				CompareWhiteColorAndClick(955, 627)

				CompareWhiteColorAndClick(955, 589)

				CompareWhiteColorAndClick(954, 665)
				
				TogglePause()
				MouseClick("left",942,736,1)

				MouseMove(1222, 421, 10)
				
				Sleep(2000)
				
				CompareWhiteColorAndClick(1222, 421)
				
				Sleep(1500)
				MouseClick("left",1004,248,1)
				Sleep(420)
				MouseClick("left",935,521,1)
				Sleep(420)
				MouseClick("left",883,554,1)
				Sleep(600)
				MouseClick("left",947,754,1)
				Sleep(420)
				MouseClick("left",609,947,1)
				Send("^w")
				MsgBox($MB_OK, "Configuration Completed", "Press 'Enter' Or 'ESC' To Exit", 5)


			Case $iMsg = $idFRITZ7490VDSLButton

				MouseClick("left",1205,956,1)
				MouseClick("left",980,572,1)
				
				CompareWhiteColorAndClick(668,134)
				
				CompareGreyColorAndClick(724,947)
				
				CompareWhiteColorAndClick(668,134)
				
				MouseClick("left",674,226,1)
				MouseClick("left",746,314,1)
				Sleep(2000)
				Send("^r")
				Sleep(3200)
				MouseClick("left",902,371,1)
				MouseClick("left",902,516,1)
				MouseClick("left",662,532,1)
				Sleep(300)
				MouseWheel($MOUSE_WHEEL_DOWN, 4)
				MouseClick("left",174,564,3)
				Send("^c")
				MouseClick("left",882,628,3)
				Send("^v")
				MouseClick("left",175,609,3)
				Send("^c")
				MouseClick("left",882,671,3)
				Send("^v")
				MouseClick("left",750,844,1)
				Sleep(300)
				MouseWheel($MOUSE_WHEEL_DOWN, 3)
				MouseClick("left",686,639,1)
				Sleep(300)
				MouseWheel($MOUSE_WHEEL_DOWN, 6)
				MouseClick("left",663,909,1)
				
				TogglePause()
				
				MouseClick("left",1093,957,1)
				Sleep(2500)
				CompareWhiteColorAndClick(1213,958)
				TogglePause()
				MouseClick("left",172,654,3)
				Send("^c")
				$ClipBoard = ClipGet()
				
				if $ClipBoard <> @error Then
					
					
					
					CompareWhiteColorAndClick(668,134)
					
					MouseClick("left",668,532,1)
					Sleep(600)
					MouseClick("left",757,619,1)
					
					TogglePause()
					
					CompareWhiteColorAndClick(1140,960)
					
					CompareLightBlueColorAndClick(1117,961)
					
					Sleep(511)
					
					MouseClick("left",1085,294,3)
					Send("^v")
					MouseClick("left",1085,332,3)
					Send("^v")
					MouseClick("left",894,819,3)
					Send("^v")
					MouseClick("left",173,697,3)
					Send("^c")
					MouseClick("left",894,859,3)
					Send("^v")
					
					TogglePause()
					
					MouseClick("left",1091,957,1)
					Sleep(1600)
					MouseClick("left",1091,957,1)
					Sleep(6500)
					MouseClick("left",1091,957,1)
					
					CompareWhiteColorAndClick(668,134)
					MouseClick("left",767,576, 1)
					CompareBlueColorAndClick(1126,576)
					
					CompareLightGreyColorAndClick(773,379)
					
					MouseClick("left",708,428,1)
					MouseClick("left",1093,958,1)
					
				EndIf
				
				MouseClick("left",609,947,1)
				Send("^w")
				MsgBox($MB_OK, "Configuration Completed", "Press 'Enter' Or 'ESC' To Exit", 5)
				
			Case $iMsg = $idFRITZ7490ADSLButton

				MouseClick("left",1205,956,1)
				MouseClick("left",980,572,1)
				
				CompareWhiteColorAndClick(668,134)
				
				CompareGreyColorAndClick(724,947)
				
				CompareWhiteColorAndClick(668,134)
				
				MouseClick("left",674,226,1)
				MouseClick("left",746,314,1)
				Sleep(2000)
				Send("^r")
				Sleep(3200)
				MouseClick("left",902,371,1)
				MouseClick("left",902,448,1)
				MouseClick("left",174,564,3)
				Send("^c")
				MouseClick("left",902,498,3)
				Send("^v")
				MouseClick("left",175,609,3)
				Send("^c")
				MouseClick("left",902,529,3)
				Send("^v")
				MouseClick("left",662,744,1)
				
				TogglePause()
				
				MouseClick("left",1093,957,1)
				Sleep(600)
				MouseClick("left",172,654,3)
				Send("^c")
				$ClipBoard = ClipGet()
				
				if $ClipBoard <> @error Then
					
					Sleep(800)
					CompareWhiteColorAndClick(1213,958)
					
					CompareWhiteColorAndClick(668,134)
					
					MouseClick("left",668,532,1)
					Sleep(600)
					MouseClick("left",757,619,1)
					
					TogglePause()
					
					CompareWhiteColorAndClick(1140,960)
					
					CompareLightBlueColorAndClick(1117,961)
					
					Sleep(511)
					
					MouseClick("left",1085,294,3)
					Send("^v")
					MouseClick("left",1085,332,3)
					Send("^v")
					MouseClick("left",894,819,3)
					Send("^v")
					MouseClick("left",173,697,3)
					Send("^c")
					MouseClick("left",894,859,3)
					Send("^v")
					
					TogglePause()
					
					MouseClick("left",1091,957,1)
					Sleep(1600)
					MouseClick("left",1091,957,1)
					Sleep(6500)
					MouseClick("left",1091,957,1)
					
					CompareWhiteColorAndClick(668,134)
					MouseClick("left",767,576, 1)
					CompareBlueColorAndClick(1126,576)
					
					CompareLightGreyColorAndClick(773,379)
					
					MouseClick("left",708,428,1)
					MouseClick("left",1093,958,1)
					
				EndIf
				
				MouseClick("left",609,947,1)
				Send("^w")
				MsgBox($MB_OK, "Configuration Completed", "Press 'Enter' Or 'ESC' To Exit", 5)
				
			Case $iMsg = $idFRITZ7490FIBREButton

				MouseClick("left",1205,956,1)
				MouseClick("left",980,572,1)
				
				CompareWhiteColorAndClick(668,134)
				
				CompareGreyColorAndClick(724,947)
				
				CompareWhiteColorAndClick(668,134)
				
				MouseClick("left",674,226,1)
				MouseClick("left",746,314,1)
				Sleep(2000)
				Send("^r")
				Sleep(3200)
				MouseClick("left",902,371,1)
				MouseClick("left",902,516,1)
				MouseClick("left",662,710,1)
				Sleep(300)
				MouseWheel($MOUSE_WHEEL_DOWN, 7)
				MouseClick("left",889,777,2)
				Send("99999")
				MouseClick("left",889,819,2)
				Send("60000")
				MouseClick("left",174,564,3)
				Send("^c")
				MouseClick("left",882,483,3)
				Send("^v")
				MouseClick("left",175,609,3)
				Send("^c")
				MouseClick("left",882,515,3)
				Send("^v")
				MouseClick("left",750,844,1)
				Sleep(300)
				MouseWheel($MOUSE_WHEEL_DOWN, 7)
				MouseClick("left",686,411,1)
				MouseClick("left",661,909,1)
				
				TogglePause()
				
				MouseClick("left",1093,957,1)
				Sleep(600)
				MouseClick("left",1023,493,1)
				Sleep(600)
				MouseClick("left",172,654,3)
				Send("^c")
				$ClipBoard = ClipGet()
				
				if $ClipBoard <> @error Then
					
					Sleep(800)
					CompareWhiteColorAndClick(1213,958)
					
					CompareWhiteColorAndClick(668,134)

					MouseClick("left",668,489,1)
					Sleep(600)
					MouseClick("left",757,619,1)
					
					TogglePause()
					
					CompareWhiteColorAndClick(1140,960)
					
					CompareLightBlueColorAndClick(1117,961)
					
					Sleep(511)
					
					MouseClick("left",1085,294,3)
					Send("^v")
					MouseClick("left",1085,332,3)
					Send("^v")
					MouseClick("left",894,819,3)
					Send("^v")
					MouseClick("left",173,697,3)
					Send("^c")
					MouseClick("left",894,859,3)
					Send("^v")
					
					TogglePause()
					
					MouseClick("left",1091,957,1)
					Sleep(1600)
					MouseClick("left",1091,957,1)
					Sleep(6500)
					MouseClick("left",1091,957,1)
					
					CompareWhiteColorAndClick(668,134)
					MouseClick("left",767,576, 1)
					CompareBlueColorAndClick(1126,576)
					
					CompareLightGreyColorAndClick(773,379)
					
					MouseClick("left",708,428,1)
					MouseClick("left",1093,958,1)
					
				EndIf
				
				MouseClick("left",609,947,1)
				Send("^w")
				MsgBox($MB_OK, "Configuration Completed", "Press 'Enter' Or 'ESC' To Exit", 5)
			
			Case $iMsg = $idFRITZ7490VLAN2Button

				MouseClick("left",1205,956,1)
				MouseClick("left",980,572,1)
				
				CompareWhiteColorAndClick(668,134)
				
				CompareGreyColorAndClick(724,947)
				
				CompareWhiteColorAndClick(668,134)
				
				MouseClick("left",674,226,1)
				MouseClick("left",746,314,1)
				Sleep(2000)
				Send("^r")
				Sleep(3200)
				MouseClick("left",902,371,1)
				MouseClick("left",902,516,1)
				MouseClick("left",662,710,1)
				Sleep(300)
				MouseWheel($MOUSE_WHEEL_DOWN, 7)
				MouseClick("left",889,777,2)
				Send("99999")
				MouseClick("left",889,819,2)
				Send("60000")
				MouseClick("left",174,564,3)
				Send("^c")
				MouseClick("left",882,483,3)
				Send("^v")
				MouseClick("left",175,609,3)
				Send("^c")
				MouseClick("left",882,515,3)
				Send("^v")
				MouseClick("left",750,844,1)
				sleep(300)
				MouseWheel($MOUSE_WHEEL_DOWN, 7)
				MouseClick("left",686,411,1)
				MouseClick("left",675,594,1)
				MouseClick("left",917,626,1)
				Send("2")
				MouseClick("left",661,909,1)
				
				TogglePause()
				
				MouseClick("left",1093,957,1)
				Sleep(600)
				MouseClick("left",1023,493,1)
				Sleep(600)
				MouseClick("left",172,654,3)
				Send("^c")
				$ClipBoard = ClipGet()
				
				if $ClipBoard <> @error Then
					
					Sleep(800)
					CompareWhiteColorAndClick(1213,958)
					
					CompareWhiteColorAndClick(668,134)
					
					MouseClick("left",668,489,1)
					Sleep(600)
					MouseClick("left",757,619,1)
					
					TogglePause()
					
					CompareWhiteColorAndClick(1140,960)
					
					CompareLightBlueColorAndClick(1117,961)
					
					Sleep(511)
					
					MouseClick("left",1085,294,3)
					Send("^v")
					MouseClick("left",1085,332,3)
					Send("^v")
					MouseClick("left",894,819,3)
					Send("^v")
					MouseClick("left",173,697,3)
					Send("^c")
					MouseClick("left",894,859,3)
					Send("^v")
					
					TogglePause()
					
					MouseClick("left",1091,957,1)
					Sleep(1600)
					MouseClick("left",1091,957,1)
					Sleep(6500)
					MouseClick("left",1091,957,1)
					
					CompareWhiteColorAndClick(668,134)
					MouseClick("left",767,576, 1)
					CompareBlueColorAndClick(1126,576)
					
					CompareLightGreyColorAndClick(773,379)
					MouseClick("left",708,428,1)
					MouseClick("left",1093,958,1)
					
				EndIf
				
				MouseClick("left",609,947,1)
				Send("^w")
				MsgBox($MB_OK, "Configuration Completed", "Press 'Enter' Or 'ESC' To Exit", 5)
				
		EndSelect
	WEnd


	Exit
EndFunc   ;==>_Main
