Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		// Check if an image is selected
		If (imgRange#Null:C1517)
			
			C_TEXT:C284($txt)
			$txt:=Self:C308->{Self:C308->}
			Case of 
				: ($txt="wk left")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor horizontal align:K81:237; wk left:K81:95)
					
				: ($txt="wk center")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor horizontal align:K81:237; wk center:K81:99)
					
				: ($txt="wk right")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor horizontal align:K81:237; wk right:K81:96)
					
			End case 
			
			WP SET ATTRIBUTES:C1342(imgRange; wk anchor horizontal offset:K81:236; 0)
			valHorOff:=0
			
		Else 
			ALERT:C41("Please, select an image in your document.")
			
		End if 
		
End case 