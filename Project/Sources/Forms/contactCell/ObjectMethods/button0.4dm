var $sel_l : Integer
var $photoName_t; $contactName_t; $companyName_t; $phemailName_t : Text
var $photo_p; $name_p; $comp_p; $phone_p : Pointer

$sel_l:=Num:C11(OBJECT Get name:C1087(Object current:K67:2))

var $form_o : Object
$form_o:=New object:C1471("ent"; Form:C1466.data[$sel_l])

var $win_l : Integer
$win_l:=Open form window:C675([Contact:3]; "contactInput2")
DIALOG:C40([Contact:3]; "contactInput2"; $form_o)
CLOSE WINDOW:C154($win_l)

CALL SUBFORM CONTAINER:C1086(-2)