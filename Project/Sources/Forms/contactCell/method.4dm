Case of 
	: (Form event code:C388=On Unload:K2:2)
		lastCell_l:=0
		EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"highlightRow";*;"contacts_LB";1)
	Else 
		loadContactCells 
End case 