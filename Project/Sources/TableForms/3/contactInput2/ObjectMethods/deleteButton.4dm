C_OBJECT:C1216($status_o)
C_TEXT:C284($name_t)
$name_t:=Form:C1466.ent.FirstName+" "+Form:C1466.ent.LastName

C_OBJECT:C1216(next_e;prev_e)

CONFIRM:C162("Are you sure you want to delete "+$name_t+"?";"Delete";"Cancel")
If (OK=1)
	lastUpdatedContact_e:=Form:C1466.ent
	
	next_e:=Form:C1466.ent.next()
	prev_e:=Form:C1466.ent.previous()
	$status_o:=Form:C1466.ent.drop()
	
	If ($status_o.success=False:C215)
		ALERT:C41("Failed to drop contact: "+$status_o.statusText)
	Else 
		groupAction_t:="On Deleting Group"
		contactAction_t:="On Deleting Contact"
		ACCEPT:C269
	End if 
End if 

