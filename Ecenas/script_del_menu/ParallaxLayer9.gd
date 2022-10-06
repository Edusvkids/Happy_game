extends ParallaxLayer


var dir = Vector2(1,0)
var velocidad = 70

func _process(delta):
	motion_offset -= dir * velocidad * delta
