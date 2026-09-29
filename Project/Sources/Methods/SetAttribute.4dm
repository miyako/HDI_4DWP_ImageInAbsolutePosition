//%attributes = {"invisible":true}
var $val : Variant

WP Get attributes:C1345(imgRange; wk anchor layout:K81:227; $val)
Case of 
	: ($val=wk behind text:K81:240)
		OBJECT Get pointer:C1124(Object named:K67:5; "listLayer2")->:=1
		
	: ($val=wk in front of text:K81:241)
		OBJECT Get pointer:C1124(Object named:K67:5; "listLayer2")->:=2
		
	Else 
		ALERT:C41(Localized string("AlertNotSupported"))
End case 


WP Get attributes:C1345(imgRange; wk anchor origin:K81:235; $val)
Case of 
	: ($val=wk paper box:K81:215)
		OBJECT Get pointer:C1124(Object named:K67:5; "listOrigin2")->:=1
		
	: ($val=wk header box:K81:243)
		OBJECT Get pointer:C1124(Object named:K67:5; "listOrigin2")->:=2
		
	: ($val=wk footer box:K81:244)
		OBJECT Get pointer:C1124(Object named:K67:5; "listOrigin2")->:=3
		
	Else 
		ALERT:C41(Localized string("AlertNotSupported"))
		
End case 


WP Get attributes:C1345(imgRange; wk anchor horizontal align:K81:237; $val)
Case of 
	: ($val=wk left:K81:95)
		OBJECT Get pointer:C1124(Object named:K67:5; "listHor2")->:=1
		
	: ($val=wk center:K81:99)
		OBJECT Get pointer:C1124(Object named:K67:5; "listHor2")->:=2
		
	: ($val=wk right:K81:96)
		OBJECT Get pointer:C1124(Object named:K67:5; "listHor2")->:=3
		
	Else 
		ALERT:C41(Localized string("AlertNotSupported"))
		
End case 


WP Get attributes:C1345(imgRange; wk anchor vertical align:K81:239; $val)
Case of 
	: ($val=wk top:K81:97)
		OBJECT Get pointer:C1124(Object named:K67:5; "listVert2")->:=1
		
	: ($val=wk center:K81:99)
		OBJECT Get pointer:C1124(Object named:K67:5; "listVert2")->:=2
		
	: ($val=wk bottom:K81:98)
		OBJECT Get pointer:C1124(Object named:K67:5; "listVert2")->:=3
		
	Else 
		ALERT:C41(Localized string("AlertNotSupported"))
		
End case 


WP Get attributes:C1345(imgRange; wk anchor horizontal offset:K81:236; valHorOff)
WP Get attributes:C1345(imgRange; wk anchor vertical offset:K81:238; valVertOff)
