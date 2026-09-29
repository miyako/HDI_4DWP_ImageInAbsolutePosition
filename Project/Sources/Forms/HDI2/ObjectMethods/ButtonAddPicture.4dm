ARRAY TEXT:C222(arrPath; 0)
C_OBJECT:C1216($obImage)

$path:=Select document:C905(Get 4D folder:C485(Current resources folder:K5:16); ""; \
"Select an image"; Use sheet window:K24:11+Package open:K24:8; arrPath)

If (OK=1)
	$obImage:=WP Add picture:C1536(vDoc; arrPath{1})
End if 