//%attributes = {"invisible":true}
C_LONGINT:C283($l;$t;$r;$b;$l1;$t1;$r1;$b1;$i;widthOffset_l;colCount_l)
OBJECT GET COORDINATES:C663(*;"contacts_SF";$l;$t;$r;$b)
OBJECT GET COORDINATES:C663(*;"contactInput_SF";$l1;$t1;$r1;$b1)

OBJECT SET COORDINATES:C1248(*;"contacts_SF";$l;$t;$r1-15;$b)
OBJECT GET COORDINATES:C663(*;"contacts_SF";$l;$t;$r;$b)

C_LONGINT:C283(cellwidth_l;colCount_l;$cellwidth_l)

For ($i;1;10)
	$cellwidth_l:=($r-$l)/$i-15
	If ($cellwidth_l<326)
		cellwidth_l:=$cellwidth_l
		colCount_l:=$i
		$i:=11
	End if 
End for 

OBJECT SET SUBFORM:C1138(*;"contacts_SF";"contactCell")
OBJECT SET SCROLLBAR:C843(*;"contacts_SF";False:C215;True:C214)

Form:C1466.listMode:=False:C215
