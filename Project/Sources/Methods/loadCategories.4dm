//%attributes = {"invisible":true}
var $categories_es; $category_e; $category_o; $status_o : Object

$categories_es:=ds:C1482.Category.all().orderBy("Name")
Form:C1466.categories.data:=New collection:C1472

// Get arrow picture
var $arrow_p : Picture
var $picturePath_t : Text
If (FORM Get color scheme:C1761="light")
	$picturePath_t:=File:C1566("/RESOURCES/Navs/arrow.png").platformPath
Else 
	$picturePath_t:=File:C1566("/RESOURCES/Navs/arrow_dark.png").platformPath
End if 

// Only display categories that contain contacts, else delete empty group
For each ($category_e; $categories_es)
	If ($category_e.contacts.length>0)
		$category_o:=$category_e.toObject("ID,Name")
		READ PICTURE FILE:C678($picturePath_t; $arrow_p)
		$category_o.Arrow:=$arrow_p
		Form:C1466.categories.data.push($category_o)
	Else 
		$status_o:=$category_e.drop()
		If ($status_o.success=False:C215)
			ALERT:C41("Failed to delete category: "+$status_o.statusText)
		End if 
	End if 
End for each 

Form:C1466.categories.data.unshift(New object:C1471("ID"; 0; "Name"; "All Groups"; "Arrow"; $arrow_p))

