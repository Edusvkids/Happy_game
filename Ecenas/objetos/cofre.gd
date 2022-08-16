extends Area2D

var booleana


func _ready():
	$AnimatedSprite.play("idle")


func _on_cofre_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("players"):
		$AnimatedSprite.play("open")


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "open":
		$AnimatedSprite.play("open2")
		$CollisionShape2D.disabled = true
