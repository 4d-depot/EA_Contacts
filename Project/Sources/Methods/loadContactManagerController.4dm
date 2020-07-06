//%attributes = {"invisible":true}
C_TEXT:C284($1;$contactAction_t)
C_TEXT:C284($2;$groupAction_t)
$contactAction_t:=$1
$groupAction_t:=$2

C_LONGINT:C283(contactRow_l)
C_LONGINT:C283($categoryRow_l)

Case of 
	: ($contactAction_t="On Saving Contact")
		loadCategories 
		If (lastUpdatedContact_e.category#Null:C1517)
			lastSelectedCategoryPos_l:=Form:C1466.categories.data.findIndex("findCategory";lastUpdatedContact_e.category.Name)+1
			lastSelectedCategory_o:=Form:C1466.categories.data[lastSelectedCategoryPos_l-1]
		Else 
			lastSelectedCategoryPos_l:=1
			lastSelectedCategory_o:=Form:C1466.categories.data[0]
		End if 
		
		loadContacts ($groupAction_t)
		C_LONGINT:C283($entityPos_l)
		$entityPos_l:=lastUpdatedContact_e.indexOf(Form:C1466.contacts.data)
		lastUpdatedContact_e:=Form:C1466.contacts.data[$entityPos_l]
		loadContactInput ("On Update Contact")
		
		contactRow_l:=lastUpdatedContact_e.indexOf(Form:C1466.contacts.data)
		EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";lastSelectedCategoryPos_l)
		EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"scrollToRow";*;"contacts_LB";contactRow_l+1)
		EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"highlightRow";*;"contacts_LB";contactRow_l+1)
End case 

Case of 
	: ($contactAction_t="On Deleting Contact")
		loadCategories 
		contactRow_l:=lastUpdatedContact_e.indexOf(Form:C1466.contacts.data)
		
		  // If deleted contact had no group
		If (lastUpdatedContact_e.CategoryID=0)
			lastSelectedCategory_o:=Form:C1466.categories.data[0]
			
			loadContacts ("On Deleting Contact")
			loadContactInput ("On Deleting Contact")
			
			EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";1)
			
			  // If deleted contact is in a group
		Else 
			$categoryRow_l:=Form:C1466.categories.data.findIndex("findCategory";lastUpdatedContact_e.category.Name)
			
			  // If deleted contact was the last member of a group
			If ($categoryRow_l=-1)
				lastSelectedCategory_o:=Form:C1466.categories.data[0]
				
				loadContacts ("On Deleting Contact")
				If (Form:C1466.contacts.data.length=0)
					loadContacts ("On All Groups")
					loadContactInput ("On Init")
				Else 
					loadContactInput ("On Deleting Contact")
				End if 
				
				EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";1)
			Else 
				  // If deleted contact still has contacts in the group
				loadContacts ("On Deleting Contact")
				loadContactInput ("On Deleting Contact")
				
				EXECUTE METHOD IN SUBFORM:C1085("categories_SF";"highlightRow";*;"categories_LB";lastSelectedCategoryPos_l)
			End if 
		End if 
		
		EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"scrollToRow";*;"contacts_LB";contactRow_l+1)
		EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"highlightRow";*;"contacts_LB";contactRow_l+1)
		
End case 

If (Form:C1466.listMode=False:C215)
	EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"loadContactCells";*)
End if 