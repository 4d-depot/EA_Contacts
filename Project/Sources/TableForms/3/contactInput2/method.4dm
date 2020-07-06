Case of 
	: (Form event code:C388=On Load:K2:1)
		OBJECT SET PLACEHOLDER:C1295(*;"Title";"Title")
		OBJECT SET PLACEHOLDER:C1295(*;"FirstName";"First Name")
		OBJECT SET PLACEHOLDER:C1295(*;"LastName";"Last Name")
		OBJECT SET PLACEHOLDER:C1295(*;"WorkPhone";"Work Phone")
		OBJECT SET PLACEHOLDER:C1295(*;"HomePhone";"Home Phone")
		OBJECT SET PLACEHOLDER:C1295(*;"MobilePhone";"Mobile Phone")
		
		If (Form:C1466.ent=Null:C1517)
			OBJECT SET ENABLED:C1123(*;"deleteButton";False:C215)
			OBJECT SET ENABLED:C1123(*;"prevButton";False:C215)
			OBJECT SET ENABLED:C1123(*;"nextButton";False:C215)
			Form:C1466.ent:=ds:C1482.Contact.new()
			contactAction_t:="On New Contact"
			Form:C1466.categoryName:=""
		Else 
			contactAction_t:="On Edit Contact"
			
			If (Form:C1466.ent.category#Null:C1517)
				Form:C1466.categoryName:=Form:C1466.ent.category.Name
			Else 
				Form:C1466.categoryName:=""
			End if 
		End if 
		
End case 