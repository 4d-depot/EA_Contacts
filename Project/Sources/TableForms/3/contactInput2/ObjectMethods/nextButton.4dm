C_OBJECT:C1216($ent)
$ent:=Form:C1466.ent.next()

If ($ent#Null:C1517)
	Form:C1466.ent:=$ent
	Form:C1466.categoryName:=Form:C1466.ent.category.Name
End if 