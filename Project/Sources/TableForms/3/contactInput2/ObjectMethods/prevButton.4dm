var $ent : cs:C1710.ContactEntity
$ent:=Form:C1466.ent.previous()

If ($ent#Null:C1517)
	Form:C1466.ent:=$ent
	Form:C1466.categoryName:=Form:C1466.ent.category.Name
End if 