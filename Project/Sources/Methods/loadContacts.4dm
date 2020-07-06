//%attributes = {"invisible":true}
C_TEXT:C284($1;$action_t)
$action_t:=$1

Case of 
	: ($action_t="On All Groups") | ($action_t="On Empty Group")
		Form:C1466.contacts.data:=ds:C1482.Contact.all().orderBy("ID desc")
		
	: ($action_t="On Update")
		C_TEXT:C284($queryCategory_t;$searchText_t)
		C_LONGINT:C283($categoryID_l)
		$categoryID_l:=lastSelectedCategory_o.ID
		$searchText_t:=Form:C1466.searchText+"@"
		
		  // If category other than "All Groups" is clicked, add category query
		If ($categoryID_l#0)
			$queryCategory_t:=" and CategoryID = :2"
		Else 
			$queryCategory_t:=""
		End if 
		
		Form:C1466.contacts.data:=ds:C1482.Contact.query(Form:C1466.queryNames+$queryCategory_t;$searchText_t;$categoryID_l)\
			.orderBy("ID desc")
		
	: ($action_t="On Existing Group")
		Form:C1466.contacts.data:=ds:C1482.Contact.query("CategoryID = :1";lastUpdatedContact_e.category.ID).orderBy("ID desc")
		
	: ($action_t="On Deleting Contact")
		Form:C1466.contacts.data:=Form:C1466.contacts.data.minus(lastUpdatedContact_e).orderBy("ID desc")
		
End case 

Form:C1466.contacts.recordsFound:=String:C10(Form:C1466.contacts.data.length)+" records found"

If (Form:C1466.listMode=False:C215)
	EXECUTE METHOD IN SUBFORM:C1085("contacts_SF";"loadContactCells";*)
End if 