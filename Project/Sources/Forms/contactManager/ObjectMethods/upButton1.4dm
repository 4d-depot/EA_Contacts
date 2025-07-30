var $win_l : Integer
$win_l:=Open form window:C675([Contact:3]; "contactInput2")
DIALOG:C40([Contact:3]; "contactInput2")
CLOSE WINDOW:C154($win_l)

loadContactManagerController(contactAction_t; groupAction_t)