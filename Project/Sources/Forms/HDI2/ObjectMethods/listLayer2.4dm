Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		// Check if an image is selected
		If (imgRange#Null:C1517)
			
			var $txt : Text
			$txt:=Self:C308->{Self:C308->}
			Case of 
				: ($txt="wk behind of text")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor layout:K81:227; wk behind text:K81:240)
					
				: ($txt="wk in front of text")
					WP SET ATTRIBUTES:C1342(imgRange; wk anchor layout:K81:227; wk in front of text:K81:241)
					
					
			End case 
			
		Else 
			ALERT:C41(Localized string("AlertSelectImage"))
			
		End if 
		
End case 
