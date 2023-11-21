extends Area2D

var booleana


func _ready():
	$AnimatedSprite.play("moneda")


func _on_coin_body_entered(body):
	if body.is_in_group("players"):
		$AudioStreamPlayer.playing = true
		Global.contador += 1
		get_node("CollisionShape2D").queue_free()
		$AnimatedSprite.play("moneda_deah")
		yield($AnimatedSprite, "animation_finished")
		queue_free()
