extends ParallaxLayer


# Declare member variables here. Examples:
var dir = Vector2(1,0)
var velocidad = 100

func _process(delta):
	motion_offset -= dir * velocidad * delta
