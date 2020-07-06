Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		If (Form:C1466.currItem#Null:C1517)
			CALL SUBFORM CONTAINER:C1086(-1)  // update contactInput when row is clicked
		End if 
		
	: (Form event code:C388=On Double Clicked:K2:5)
		If (Form:C1466.currItem#Null:C1517)
			C_OBJECT:C1216($form_o)
			$form_o:=New object:C1471("ent";Form:C1466.currItem;"categoryName";Form:C1466.currItem.category.Name)
			
			C_LONGINT:C283($win_l)
			$win_l:=Open form window:C675([Contact:3];"contactInput2")
			DIALOG:C40([Contact:3];"contactInput2";$form_o)
			CLOSE WINDOW:C154($win_l)
			
			CALL SUBFORM CONTAINER:C1086(-2)
		End if 
		
End case 