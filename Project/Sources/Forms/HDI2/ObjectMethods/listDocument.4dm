var $path : Text

Case of 
	: (Form event code:C388=On Data Change:K2:15)
		$path:=Get 4D folder:C485(Current resources folder:K5:16)
		$path:=$path+Self:C308->{Self:C308->}
		
		
		vDoc:=WP Import document:C1318($path)
		WP SET ATTRIBUTES:C1342(vDoc; wk layout unit:K81:78; wk unit px:K81:137)
		CLEAR VARIABLE:C89(imgRange)
End case 
