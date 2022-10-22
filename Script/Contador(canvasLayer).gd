extends CanvasLayer

func _process(_delta):
	$Label.text = str(Global.contador)
	$Label2.text = str(Global.vidas)
	$Label3.text = str(Global.jefe_1)
	if Global.vidas <= 0:
		$Label2.text = str("DEAD")

