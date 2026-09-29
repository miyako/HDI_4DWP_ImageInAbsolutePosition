var $ptr : Pointer
var $path : Text

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		initHDI
		OBJECT Get pointer:C1124(Object named:K67:5; "varTxt")->:=TextTabControl{FORM Get current page:C276}
		OBJECT SET VISIBLE:C603(*; "TextDoc"; False:C215)
		OBJECT SET VISIBLE:C603(*; "listDocument"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ButtonDocument"; False:C215)
		OBJECT SET VISIBLE:C603(*; "TextZoom"; False:C215)
		OBJECT SET VISIBLE:C603(*; "zoomList"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ButtonAddPicture"; False:C215)
		OBJECT SET VISIBLE:C603(*; "WriteProArea"; False:C215)
		OBJECT SET VISIBLE:C603(*; "Line1"; False:C215)
		
		
		isSelection:=False:C215
		
		valVertOff:=0
		valHorOff:=0
		
		OBJECT Get pointer:C1124(Object named:K67:5; "listDocument")->:=1
		
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "listDocument")
		$path:=Get 4D folder:C485(Current resources folder:K5:16)
		$path:=$path+$ptr->{$ptr->}
		vDoc:=WP Import document:C1318($path)
		WP SET ATTRIBUTES:C1342(vDoc; wk layout unit:K81:78; wk unit px:K81:137)
		CLEAR VARIABLE:C89(imgRange)
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		OBJECT Get pointer:C1124(Object named:K67:5; "varTxt")->:=TextTabControl{FORM Get current page:C276}
		
		Case of 
			: (FORM Get current page:C276=1)  //Info
				
				OBJECT SET VISIBLE:C603(*; "TextDoc"; False:C215)
				OBJECT SET VISIBLE:C603(*; "listDocument"; False:C215)
				OBJECT SET VISIBLE:C603(*; "ButtonDocument"; False:C215)
				OBJECT SET VISIBLE:C603(*; "TextZoom"; False:C215)
				OBJECT SET VISIBLE:C603(*; "zoomList"; False:C215)
				OBJECT SET VISIBLE:C603(*; "ButtonAddPicture"; False:C215)
				OBJECT SET VISIBLE:C603(*; "WriteProArea"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Line1"; False:C215)
				
			: (FORM Get current page:C276>1)
				OBJECT SET VISIBLE:C603(*; "TextDoc"; True:C214)
				OBJECT SET VISIBLE:C603(*; "listDocument"; True:C214)
				OBJECT SET VISIBLE:C603(*; "ButtonDocument"; True:C214)
				OBJECT SET VISIBLE:C603(*; "TextZoom"; True:C214)
				OBJECT SET VISIBLE:C603(*; "zoomList"; True:C214)
				OBJECT SET VISIBLE:C603(*; "ButtonAddPicture"; True:C214)
				OBJECT SET VISIBLE:C603(*; "WriteProArea"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Line1"; True:C214)
				
				var $x1; $y1; $x2; $y2 : Integer
				OBJECT GET COORDINATES:C663(*; "WriteProArea"; $x1; $y1; $x2; $y2)
				If (FORM Get current page:C276=2)
					OBJECT SET COORDINATES:C1248(*; "WriteProArea"; $x1; 257; $x2; $y2)
				Else 
					OBJECT SET COORDINATES:C1248(*; "WriteProArea"; $x1; 365; $x2; $y2)
				End if 
		End case 
		
		
End case 
