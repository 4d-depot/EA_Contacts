If (Form event code:C388=On Load:K2:1)
	
	Form:C1466.colTheme:=New object:C1471
	Form:C1466.colTheme.values:=New collection:C1472("default"; "blue"; "green"; "orange"; "pink"; "purple"; "red"; "yellow")
	Form:C1466.colTheme.index:=-1
	Form:C1466.colTheme.currentValue:="Select a theme"
	
End if 