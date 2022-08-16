extends Area2D


func _ready():
	$AnimatedSprite.play("moneda")



func _on_coin_body_entered(body):
	if body.is_in_group("players"):
		$AnimatedSprite.play("moneda_deah")
		yield($AnimatedSprite, "animation_finished")
		queue_free()
