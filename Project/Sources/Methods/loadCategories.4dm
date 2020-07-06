//%attributes = {"invisible":true}
C_OBJECT:C1216($categories_es;$category_e;$category_o;$status_o)

$categories_es:=ds:C1482.Category.all().orderBy("Name")
Form:C1466.categories.data:=New collection:C1472

  // Get arrow picture
C_PICTURE:C286($arrow_p)
C_TEXT:C284($picturePath_t)
$picturePath_t:=Get 4D folder:C485(Current resources folder:K5:16)+"Navs"+Folder separator:K24:12+"arrow_white.png"

  // Only display categories that contain contacts, else delete empty group
For each ($category_e;$categories_es)
	If ($category_e.contacts.length>0)
		$category_o:=$category_e.toObject("ID,Name")
		READ PICTURE FILE:C678($picturePath_t;$arrow_p)
		$category_o.Arrow:=$arrow_p
		Form:C1466.categories.data.push($category_o)
	Else 
		$status_o:=$category_e.drop()
		If ($status_o.success=False:C215)
			ALERT:C41("Failed to delete category: "+$status_o.statusText)
		End if 
	End if 
End for each 

Form:C1466.categories.data.unshift(New object:C1471("ID";0;"Name";"All Groups";"Arrow";$arrow_p))

