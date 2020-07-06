Case of 
	: (Form event code:C388=-1)  // On Selection Change of categories_LB
		  // save last selected category if user clicks on empty row in category listbox
		lastSelectedCategory_o:=Form:C1466.categories.currItem
		lastSelectedCategoryPos_l:=Form:C1466.categories.currPos
		
		  // query updated contacts and highlight 1st row
		loadContacts ("On Update")
		EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"highlightRow";*;"contacts_LB";1)
		
		  // update contactInput
		loadContactInput ("On Init")
		
End case 