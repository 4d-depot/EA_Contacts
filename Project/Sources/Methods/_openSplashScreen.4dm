//%attributes = {"invisible":true}
#DECLARE() : Integer
var $win_l : Integer
var $path_t : Text

$path_t:=Get 4D folder:C485(Database folder:K5:14)+"new4DD"
If (Test path name:C476($path_t)=Is a document:K24:1)
	DELETE DOCUMENT:C159($path_t)
	return 1
Else 
	$win_l:=Open form window:C675("splashScreen"; Plain form window:K39:10)
	DIALOG:C40("splashScreen")
	CLOSE WINDOW:C154($win_l)
	return OK
End if 
