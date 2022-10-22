extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("off")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_boton_body_entered(body):
	if body.is_in_group("players"):
		$AnimatedSprite.play("on")
		Global.puerta += 1
		$CollisionShape2D.disabled = true
