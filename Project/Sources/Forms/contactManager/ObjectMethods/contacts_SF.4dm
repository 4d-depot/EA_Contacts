Case of 
	: (Form event code:C388=-1)  // On Selection Change of contacts_LB
		loadContactInput ("On Contact Selection Change")
		
	: (Form event code:C388=-2)  // On Double Clicked on contacts_LB
		loadContactManagerController (contactAction_t;groupAction_t)
		
End case 