extends Area2D

var motion:Vector2= Vector2()
var direccion = 0

func _ready():
	
	pass

func _physics_process(delta):
	
	position.x -= 200 *direccion * delta


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bala_body_entered(body):
	if body.is_in_group("players"):
		Global.vidas -= 5
		queue_free()
