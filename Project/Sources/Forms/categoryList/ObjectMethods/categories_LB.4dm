Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		  // Go to subform container to update Form.contacts.data when clicking on group
		If (Form:C1466.currItem#Null:C1517)
			CALL SUBFORM CONTAINER:C1086(-1)
		Else 
			  // keep row highlight if user clicks on empty category row
			LISTBOX SELECT ROW:C912(*;"categories_LB";lastSelectedCategoryPos_l)
		End if 
		
		
End case 