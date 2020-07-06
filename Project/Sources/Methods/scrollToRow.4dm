//%attributes = {"invisible":true}
C_TEXT:C284($1;$listboxName_t)
C_LONGINT:C283($2;$row_l)
$listboxName_t:=$1
$row_l:=$2

OBJECT SET SCROLL POSITION:C906(*;$listboxName_t;$row_l)