OBJECT SET VISIBLE:C603(*;"layoutButton1Rect";True:C214)
OBJECT SET VISIBLE:C603(*;"layoutButton2Rect";False:C215)
OBJECT SET VISIBLE:C603(*;"contactInput_SF";True:C214)
OBJECT SET SUBFORM:C1138(*;"contacts_SF";"contactList")

C_LONGINT:C283($l;$t;$r;$b;$l1;$t1;$r1;$b1)
OBJECT GET COORDINATES:C663(*;"contacts_SF";$l;$t;$r;$b)
OBJECT GET COORDINATES:C663(*;"searchRect";$l1;$t1;$r1;$b1)
OBJECT SET COORDINATES:C1248(*;"contacts_SF";$l;$b1+6;$r1;$b)

Form:C1466.listMode:=True:C214

Form:C1466.contact.ent:=Form:C1466.contacts.data.first()