extends Area2D



func _ready():
	$AnimatedSprite.play("corazon")







func _on_corazon_body_entered(body):
	if body.is_in_group("players"):
		$AnimatedSprite.play("corazon_obtenido")
		Global.vidas += 10
		$CollisionShape2D.disabled = true


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "corazon_obtenido":
		queue_free()
