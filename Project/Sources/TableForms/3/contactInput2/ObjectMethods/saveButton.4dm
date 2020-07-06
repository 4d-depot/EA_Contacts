If (Form:C1466.ent.FirstName="") | (Form:C1466.ent.LastName="")
	ALERT:C41("Contact must have first name and last name")
Else 
	  // Set field CategoryID properly before saving
	C_OBJECT:C1216($categories_es;$status_o)
	$categories_es:=ds:C1482.Category.query("Name = :1";Form:C1466.categoryName)
	
	Case of 
			  // If empty group name, assign CategoryID 0
		: (Form:C1466.categoryName="")
			Form:C1466.ent.CategoryID:=0
			groupAction_t:="On Empty Group"
			
			  // If existing group name, assign correct CategoryID
		: ($categories_es.length=1)
			Form:C1466.ent.CategoryID:=$categories_es.first().ID
			groupAction_t:="On Existing Group"
			
			  // If new group, create new group
		: ($categories_es.length=0)
			C_OBJECT:C1216($newCategory_e)
			$newCategory_e:=ds:C1482.Category.new()
			$newCategory_e.Name:=Form:C1466.categoryName
			$status_o:=$newCategory_e.save()
			
			Form:C1466.ent.CategoryID:=$newCategory_e.ID
			
			If ($status_o.success=False:C215)
				ALERT:C41($status_o.statusText)
			Else 
				groupAction_t:="On Existing Group"
			End if 
			
	End case 
	
	$status_o:=Form:C1466.ent.save()
	
	If ($status_o.success=False:C215)
		ALERT:C41("Failed to save contact: "+$status_o.statusText)
	Else 
		contactAction_t:="On Saving Contact"
		lastUpdatedContact_e:=Form:C1466.ent
		ACCEPT:C269
	End if 
End if 

