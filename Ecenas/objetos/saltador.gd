extends Area2D


func _ready():
	pass


func _on_saltador_body_entered(body):
	if body.is_in_group("players"):
		$AnimatedSprite.play("saltador")
		body.velocity.y = -600


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "saltador":
		$AnimatedSprite.play("saltador(off)")
