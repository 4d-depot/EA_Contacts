//%attributes = {"invisible":true}
#DECLARE($o : Object)->$format : Text

var $contact_e : Object

If (Count parameters:C259>0)
	$contact_e:=$o
Else 
	$contact_e:=This:C1470
End if 

Case of 
	: (Length:C16($contact_e.MobilePhone)=10)
		$format:="M: "+String:C10(Num:C11($contact_e.MobilePhone); "000-000-0000")
		
	: (Length:C16($contact_e.WorkPhone)=10)
		$format:="W: "+String:C10(Num:C11($contact_e.WorkPhone); "000-000-0000")
		
	: (Length:C16($contact_e.HomePhone)=10)
		$format:="H: "+String:C10(Num:C11($contact_e.HomePhone); "000-000-0000")
		
	: (Length:C16($contact_e.MobilePhone)=11)
		$format:="M: "+String:C10(Num:C11($contact_e.MobilePhone); "0-000-000-0000")
		
	: (Length:C16($contact_e.WorkPhone)=11)
		$format:="W: "+String:C10(Num:C11($contact_e.WorkPhone); "0-000-000-0000")
		
	: (Length:C16($contact_e.HomePhone)=11)
		$format:="H: "+String:C10(Num:C11($contact_e.HomePhone); "0-000-000-0000")
		
End case 
