C_BOOLEAN:C305($tryAgain_b)
C_TEXT:C284($datafile_t)

Repeat 
	$tryAgain_b:=False:C215
	$datafile_t:=Select document:C905(Get 4D folder:C485(Database folder:K5:14);".4dd";"New data file";File name entry:K24:17)
	If (OK=1)
		If (document#Data file:C490)
			TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Database folder:K5:14)+"new4DD";"new data file")
			CREATE DATA FILE:C313(document)
			CANCEL:C270
		Else 
			ALERT:C41("Sorry! You cannot replace a file that currently open.\nPlease try again with a different file name.")
			$tryAgain_b:=True:C214
			ACCEPT:C269
		End if 
	Else 
		ACCEPT:C269
	End if 
Until (Not:C34($tryAgain_b))