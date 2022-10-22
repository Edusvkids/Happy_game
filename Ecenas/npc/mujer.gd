extends Area2D






# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_mujer_body_entered(body):
	if body.is_in_group("players"):
		$AnimatedSprite.play("dance")
		Global.vidas += Global.contador
		Global.contador = 0
		$CollisionShape2D.disabled = true
		yield(get_tree().create_timer(1),"timeout")
		$CollisionShape2D.disabled = false
