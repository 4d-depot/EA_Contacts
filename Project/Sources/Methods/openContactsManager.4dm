//%attributes = {}
C_LONGINT:C283($1;$proc_l)

If (Count parameters:C259=0)
	$proc_l:=New process:C317(Current method name:C684;0;"Contacts";1;*)
	
Else 
	
	C_OBJECT:C1216($form_o)
	$form_o:=New object:C1471("categories";New object:C1471;"contacts";New object:C1471;"contact";New object:C1471)
	
	C_LONGINT:C283($win_l)
	$win_l:=Open form window:C675("contactManager")
	DIALOG:C40("contactManager";$form_o)
	CLOSE WINDOW:C154($win_l)
	
End if 