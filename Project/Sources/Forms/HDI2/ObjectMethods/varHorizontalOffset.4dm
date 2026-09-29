
Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		// Check if an image is selected
		If (imgRange#Null:C1517)
			
			WP SELECT:C1348(vDoc; imgRange)
			
			WP SET ATTRIBUTES:C1342(imgRange; wk anchor horizontal offset:K81:236; valHorOff)
			
			GOTO OBJECT:C206(vDoc)
			
		Else 
			ALERT:C41("Please, select an image in your document.")
			
		End if 
		
End case 