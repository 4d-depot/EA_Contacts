Case of 
	: (Form event code:C388=On Load:K2:1)
		  // save last selected category if user clicks off category listbox
		C_OBJECT:C1216(lastSelectedCategory_o)
		C_LONGINT:C283(lastSelectedCategoryPos_l)
		lastSelectedCategoryPos_l:=1
		
		  // save last updated contact
		C_OBJECT:C1216(lastUpdatedContact_e)
		  // used to remember which contact row to highlight after deletion
		C_LONGINT:C283(lastDeletedContactPos_l)
		
		  // conditions how to manipulate subforms whether user creates or edits a contact
		C_TEXT:C284(contactAction_t;groupAction_t)
		
		  // start in list mode
		Form:C1466.listMode:=True:C214
		
		  // initialize searchText to empty string and searchType as "All names"
		Form:C1466.searchText:=""
		Form:C1466.searchType:=0
		Form:C1466.queryNames:="FirstName = :1 or LastName = :1"
		OBJECT SET PLACEHOLDER:C1295(*;"searchText";"All names")
		
		  // initialize categories and highlight 1st row
		loadCategories 
		EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";1)
		
		  // initilize contacts and highlight 1st row
		loadContacts ("On All Groups")
		EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"highlightRow";*;"contacts_LB";1)
		
		  // initialize contactInput to current contact
		loadContactInput ("On Init")
		
	: (Form event code:C388=On Resize:K2:27)
		  // If window is resized, also resize contact grid
		If (Form:C1466.listMode=False:C215)
			SET TIMER:C645(1)
		End if 
		
	: (Form event code:C388=On Timer:K2:25)
		initializeContactGrid 
		EXECUTE METHOD IN SUBFORM:C1085("contacts_LB";"loadContactCells")
		SET TIMER:C645(0)
		
End case 