Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		range:=WP Selection range:C1340(vDoc)
		
		C_LONGINT:C283($type)
		WP Get attributes:C1345(range; wk type:K81:189; $type)
		
		If ($type=wk type image:K81:192)
			
			imgRange:=OB Copy:C1225(range)
			
			isSelection:=True:C214
			
			If (FORM Get current page:C276=4)
				SetAttribute
			End if 
			
		Else 
			isSelection:=False:C215
		End if 
		
		
	: (Form event code:C388=On Mouse Move:K2:35)
		MOUSE POSITION:C468($x; $y; $z)
		
		If ($z=1)
			If (isSelection)
				WP Get attributes:C1345(imgRange; wk anchor horizontal offset:K81:236; valHorOff)
				WP Get attributes:C1345(imgRange; wk anchor vertical offset:K81:238; valVertOff)
			End if 
		End if 
		
End case 