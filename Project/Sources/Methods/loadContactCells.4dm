//%attributes = {"invisible":true}
C_LONGINT:C283(lastCell_l;$ris_l;$i)
C_LONGINT:C283($l;$t;$r;$b;$colNum_l;$newLeft_l;$newTop_l;$newRight_l;$newBottom_l)
C_TEXT:C284($recName_t;$photoName_t;$contactName_t;$companyName_t;$phemailName_t;$buttonName_t)
C_POINTER:C301($photo_p;$name_p;$comp_p;$phone_p)

$ris_l:=Form:C1466.data.length
$colNum_l:=1
OBJECT SET COORDINATES:C1248(*;"@";0;0)
OBJECT SET VISIBLE:C603(*;"@";False:C215)

For ($i;0;$ris_l-1)
	
	$recName_t:="Rectangle"+String:C10($i)
	$photoName_t:="photo"+String:C10($i)
	$contactName_t:="name"+String:C10($i)
	$companyName_t:="company"+String:C10($i)
	$phemailName_t:="phone_email"+String:C10($i)
	$buttonName_t:="button"+String:C10($i)
	
	  //If ($i>lastCell_l) 
	OBJECT DUPLICATE:C1111(*;"Rectangle0";$recName_t)
	OBJECT DUPLICATE:C1111(*;"photo0";$photoName_t)
	OBJECT DUPLICATE:C1111(*;"name0";$contactName_t)
	OBJECT DUPLICATE:C1111(*;"company0";$companyName_t)
	OBJECT DUPLICATE:C1111(*;"phone_email0";$phemailName_t)
	OBJECT DUPLICATE:C1111(*;"button0";$buttonName_t)
	  //End if 
	
	OBJECT SET VISIBLE:C603(*;$recName_t;True:C214)
	OBJECT SET VISIBLE:C603(*;$photoName_t;True:C214)
	OBJECT SET VISIBLE:C603(*;$contactName_t;True:C214)
	OBJECT SET VISIBLE:C603(*;$companyName_t;True:C214)
	OBJECT SET VISIBLE:C603(*;$phemailName_t;True:C214)
	OBJECT SET VISIBLE:C603(*;$buttonName_t;True:C214)
	OBJECT GET COORDINATES:C663(*;$recName_t;$l;$t;$r;$b)
	
	$newLeft_l:=(cellwidth_l*($colNum_l-1))+($colNum_l*10)
	If (Mod:C98($i+1;colCount_l)=0)
		$newTop_l:=($b-$t+10)*(Int:C8($i+1/colCount_l)-1)+(10)
	Else 
		$newTop_l:=($b-$t+10)*(Int:C8($i+1/colCount_l))+(10)
	End if 
	If ($colNum_l<colCount_l)
		$colNum_l:=$colNum_l+1
	Else 
		$colNum_l:=1
	End if 
	
	$newRight_l:=$newLeft_l+cellwidth_l
	$newBottom_l:=$newTop_l+$b-$t
	OBJECT SET COORDINATES:C1248(*;$recName_t;$newLeft_l;$newTop_l;$newRight_l;$newTop_l+100)
	OBJECT SET COORDINATES:C1248(*;$buttonName_t;$newLeft_l;$newTop_l;$newRight_l)
	OBJECT SET COORDINATES:C1248(*;$photoName_t;$newLeft_l+10;$newTop_l+10;$newLeft_l+80;$newTop_l+90)
	OBJECT SET COORDINATES:C1248(*;$contactName_t;$newLeft_l+98;$newTop_l+9)
	OBJECT SET COORDINATES:C1248(*;$companyName_t;$newLeft_l+98;$newTop_l+33)
	OBJECT SET COORDINATES:C1248(*;$phemailName_t;$newLeft_l+98;$newTop_l+55)
	
	$photo_p:=OBJECT Get pointer:C1124(Object named:K67:5;$photoName_t)
	$name_p:=OBJECT Get pointer:C1124(Object named:K67:5;$contactName_t)
	$comp_p:=OBJECT Get pointer:C1124(Object named:K67:5;$companyName_t)
	$phone_p:=OBJECT Get pointer:C1124(Object named:K67:5;$phemailName_t)
	
	If (Form:C1466.data[$i].Photo#Null:C1517)
		$photo_p->:=Form:C1466.data[$i].Photo
	Else 
		$photo_p->:=Null:C1517
	End if 
	
	$name_p->:=Form:C1466.data[$i].FirstName+" "+Form:C1466.data[$i].LastName
	$comp_p->:=Form:C1466.data[$i].Organization
	$phone_p->:=formatContactColumn (Form:C1466.data[$i])
	
	If ($phone_p->#"")
		$phone_p->:=$phone_p->+"\n"+Form:C1466.data[$i].Email
	Else 
		$phone_p->:=Form:C1466.data[$i].Email
	End if 
End for 

If ($ris_l>lastCell_l)
	lastCell_l:=$ris_l
End if 

REDRAW WINDOW:C456