
$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "listDocument")

$path:=Get 4D folder:C485(Current resources folder:K5:16)
$path:=$path+$ptr->{$ptr->}



WP EXPORT DOCUMENT:C1337(vDoc; $path; wk 4wp:K81:4)