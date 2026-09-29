Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		// Check if an image is selected
		If (imgRange#Null:C1517)
			
			WP SELECT:C1348(vDoc; imgRange)
			
			WP SET ATTRIBUTES:C1342(imgRange; wk anchor vertical offset:K81:238; valVertOff)
			
			GOTO OBJECT:C206(vDoc)
			
		Else 
			ALERT:C41(Localized string("AlertSelectImage"))
			
		End if 
		
End case 
