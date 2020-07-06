//%attributes = {"invisible":true}
C_TEXT:C284($0)
C_OBJECT:C1216($1;$contact_e)

If (Count parameters:C259>0)
	$contact_e:=$1
Else 
	$contact_e:=This:C1470
End if 

Case of 
	: (Length:C16($contact_e.MobilePhone)=10)
		$0:="M: "+String:C10(Num:C11($contact_e.MobilePhone);"000-000-0000")
		
	: (Length:C16($contact_e.WorkPhone)=10)
		$0:="W: "+String:C10(Num:C11($contact_e.WorkPhone);"000-000-0000")
		
	: (Length:C16($contact_e.HomePhone)=10)
		$0:="H: "+String:C10(Num:C11($contact_e.HomePhone);"000-000-0000")
		
	: (Length:C16($contact_e.MobilePhone)=11)
		$0:="M: "+String:C10(Num:C11($contact_e.MobilePhone);"0-000-000-0000")
		
	: (Length:C16($contact_e.WorkPhone)=11)
		$0:="W: "+String:C10(Num:C11($contact_e.WorkPhone);"0-000-000-0000")
		
	: (Length:C16($contact_e.HomePhone)=11)
		$0:="H: "+String:C10(Num:C11($contact_e.HomePhone);"0-000-000-0000")
		
End case 
