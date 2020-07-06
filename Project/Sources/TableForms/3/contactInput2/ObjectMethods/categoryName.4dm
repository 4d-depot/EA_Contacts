Case of 
	: (Form event code:C388=On After Edit:K2:43)
		C_OBJECT:C1216($category_o)
		C_LONGINT:C283($bw;$bh;$bw1;$bh1)
		C_LONGINT:C283($l;$t;$r;$b)
		C_LONGINT:C283($numRecords_l)
		C_TEXT:C284($enteredText_t)
		$enteredText_t:=Get edited text:C655
		
		If ($enteredText_t#"")
			Form:C1466.autofill_preview:=ds:C1482.Category.query("Name = :1";$enteredText_t+"@")
			$numRecords_l:=Form:C1466.autofill_preview.length
			
			  // Limit autofill listbox to 10 categories
			If ($numRecords_l>0)
				If ($numRecords_l>10)
					Form:C1466.autofill_preview:=Form:C1466.autofill_preview.slice(0;10)
				End if 
				
				For each ($category_o;Form:C1466.autofill_preview)
					Form:C1466.textPreview:=$category_o.Name
					OBJECT GET BEST SIZE:C717(*;"textPreview";$bw1;$bh1)
					
					  // Get largest text width out of all the category names
					If ($bw1>$bw)
						$bw:=$bw1+10
					End if 
				End for each 
				
				$bh:=LISTBOX Get rows height:C836(*;"autofill_preview_lb";lk pixels:K53:22)*$numRecords_l+4
				
				OBJECT GET COORDINATES:C663(*;"categoryName";$l;$t;$r;$b)
				OBJECT SET COORDINATES:C1248(*;"autofill_preview_lb";$l;$t+20;$l+$bw;$b+$bh)
				
				OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";True:C214)
				LISTBOX SET ROWS HEIGHT:C835(*;"autofill_preview_lb";25;lk pixels:K53:22)
			Else 
				OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)
			End if 
		Else 
			OBJECT SET VISIBLE:C603(*;"autofill_preview_lb";False:C215)
		End if 
		
End case 