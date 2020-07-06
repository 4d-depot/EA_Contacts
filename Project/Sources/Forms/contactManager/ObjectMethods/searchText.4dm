  // Query contacts after each keystroke
Case of 
	: (Form event code:C388=On After Edit:K2:43)
		Form:C1466.searchText:=Get edited text:C655
		loadContacts ("On Update")
		loadContactInput ("On Search")
		
		
End case 