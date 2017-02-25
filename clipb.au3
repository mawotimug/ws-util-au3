#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

main()

Func main()
	CreateWindow()
EndFunc

Func CreateWindow()
	Local $iWidthW = 105 ; ширина окна
	Local $iHightW = 105 ; высота окна
	Local $iWidthB = 85 ; ширина Button
	Local $iHightB = 25 ; высота Button
	Local $iWidthL = 70 ; ширина Label
	Local $iHightL = $iHightW - 30 - $iHightB ; высота Label
    ; Create a GUI with various controls.
    Local $hGUI = GUICreate( "ClipBoard", $iWidthW, $iHightW, 840, 500, -1, $WS_EX_TOPMOST)
    Local $idOK = GUICtrlCreateButton("Exit", 10, 10, $iWidthB, $iHightB)
	Local $sClip1 = ClipGet()
	Local $sClip2 = ""
	Local $hLabel = GUICtrlCreateLabel ( $sClip1, 10, 45, $iWidthL, $iHightL )

    ; Display the GUI.
    GUISetState(@SW_SHOW, $hGUI)

    ; Loop until the user exits.
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $idOK
                ExitLoop
        EndSwitch
		$sClip2 = ClipGet()
		If @error = 0 And $sClip1 <> $sClip2 Then
			$sClip1 = $sClip2
			GUICtrlSetData ( $hLabel, $sClip2 )
		EndIf
	Sleep(100)
	WEnd

    ; Delete the previous GUI and all controls.
    GUIDelete($hGUI)
EndFunc