Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		// Check if an image is selected
		If (imgRange#Null:C1517)
			
			var $txt : Text
			$txt:=Self:C308->{Self:C308->}
			Case of 
				: ($txt="wk paper box")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor origin:K81:235; wk paper box:K81:215)
					
				: ($txt="wk header box")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor origin:K81:235; wk header box:K81:243)
					
				: ($txt="wk footer box")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor origin:K81:235; wk footer box:K81:244)
					
				Else 
					ALERT:C41(Localized string("AlertImpossible"))
					
			End case 
			
		Else 
			ALERT:C41(Localized string("AlertSelectImage"))
			
		End if 
		
End case 
