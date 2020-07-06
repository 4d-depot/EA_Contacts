C_LONGINT:C283($sel_l)
C_TEXT:C284($photoName_t;$contactName_t;$companyName_t;$phemailName_t)
C_POINTER:C301($photo_p;$name_p;$comp_p;$phone_p)

$sel_l:=Num:C11(OBJECT Get name:C1087(Object current:K67:2))

C_OBJECT:C1216($form_o)
$form_o:=New object:C1471("ent";Form:C1466.data[$sel_l])

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675([Contact:3];"contactInput2")
DIALOG:C40([Contact:3];"contactInput2";$form_o)
CLOSE WINDOW:C154($win_l)

CALL SUBFORM CONTAINER:C1086(-2)