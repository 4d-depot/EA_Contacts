//%attributes = {"invisible":true}
C_TEXT:C284($1;$listboxName_t)
C_LONGINT:C283($2;$rowNum_l)
$listboxName_t:=$1
$rowNum_l:=$2

LISTBOX SELECT ROW:C912(*;$listboxName_t;$rowNum_l)