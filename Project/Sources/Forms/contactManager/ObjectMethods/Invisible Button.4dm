Form:C1466.searchType:=Pop up menu:C542("All;First name;Last name")

Case of 
	: (Form:C1466.searchType=1)
		OBJECT SET PLACEHOLDER:C1295(*;"searchText";"All names")
		Form:C1466.queryNames:="FirstName = :1 or LastName = :1"
		
	: (Form:C1466.searchType=2)
		OBJECT SET PLACEHOLDER:C1295(*;"searchText";"First name")
		Form:C1466.queryNames:="FirstName = :1"
		
	: (Form:C1466.searchType=3)
		OBJECT SET PLACEHOLDER:C1295(*;"searchText";"Last name")
		Form:C1466.queryNames:="LastName = :1"
		
End case 

  // Query contacts upon changing searchType
loadContacts ("On Update")

  // Load empty contact in contactInput
loadContactInput ("On Search")