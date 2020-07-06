//%attributes = {"invisible":true}
C_TEXT:C284($1;$action_t)
$action_t:=$1

C_BOOLEAN:C305($loadCategory_b)

Case of 
	: ($action_t="On Init")
		Form:C1466.contact.ent:=Form:C1466.contacts.data.first()
		$loadCategory_b:=True:C214
		
	: ($action_t="On Search")
		Form:C1466.contact.ent:=Null:C1517
		$loadCategory_b:=False:C215
		
	: ($action_t="On Contact Selection Change")
		Form:C1466.contact.ent:=Form:C1466.contacts.currItem
		$loadCategory_b:=True:C214
		
	: ($action_t="On New Contact") | ($action_t="On Update Contact")
		Form:C1466.contact.ent:=lastUpdatedContact_e
		$loadCategory_b:=True:C214
		
	: ($action_t="On Deleting Contact")
		If (next_e#Null:C1517)
			Form:C1466.contact.ent:=next_e
		Else 
			Form:C1466.contact.ent:=prev_e
			contactRow_l:=contactRow_l-1
		End if 
		
		$loadCategory_b:=True:C214
		
End case 

If ($loadCategory_b)
	If (Form:C1466.contact.ent#Null:C1517)
		If (Form:C1466.contact.ent.category#Null:C1517)
			Form:C1466.contact.categoryName:=Form:C1466.contact.ent.category.Name
		Else 
			Form:C1466.contact.categoryName:=""
		End if 
	Else 
		Form:C1466.contact.categoryName:=""
	End if 
Else 
	Form:C1466.contact.categoryName:=""
End if 