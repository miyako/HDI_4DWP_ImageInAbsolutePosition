Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		// Check if an image is selected
		If (imgRange#Null:C1517)
			
			var $txt : Text
			$txt:=Self:C308->{Self:C308->}
			Case of 
				: ($txt="wk top")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor vertical align:K81:239; wk top:K81:97)
					
				: ($txt="wk center")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor vertical align:K81:239; wk center:K81:99)
					
				: ($txt="wk bottom")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor vertical align:K81:239; wk bottom:K81:98)
					
			End case 
			
			WP SET ATTRIBUTES:C1342(imgRange; wk anchor vertical offset:K81:238; 0)
			valVertOff:=0
			
		Else 
			ALERT:C41(Localized string("AlertSelectImage"))
			
		End if 
		
End case 
