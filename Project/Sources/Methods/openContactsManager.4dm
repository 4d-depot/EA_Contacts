//%attributes = {}
#DECLARE($p : Integer)
var $proc_l : Integer

If (Count parameters:C259=0)
	$proc_l:=New process:C317(Current method name:C684; 0; "Contacts"; 1; *)
	
Else 
	
	var $form_o : Object
	$form_o:=New object:C1471("categories"; New object:C1471; "contacts"; New object:C1471; "contact"; New object:C1471)
	
	var $win_l : Integer
	$win_l:=Open form window:C675("contactManager")
	DIALOG:C40("contactManager"; $form_o)
	CLOSE WINDOW:C154($win_l)
	
End if 