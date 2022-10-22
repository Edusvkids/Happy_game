extends Area2D

var direccion = 0
var verlocidad_actual = Vector2()

var solo_uno = false
var solo_20 = false

func _physics_process(delta):
	verlocidad_actual.y -= 200 *direccion * delta

func _ready():
	$AnimatedSprite.play("off")
	$area_activacion.disabled = false
	$Area2D/area_de_explocion.disabled = true



func _on_bomb_body_entered(body):
	if body.is_in_group("players") && solo_uno == false:
		$AnimatedSprite.play("on")
		$area_activacion.disabled = true
		$Area2D/area_de_explocion.disabled = true
		solo_uno = true


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "on":
		$AnimatedSprite.play("boom")
		$Area2D/area_de_explocion.disabled = false

func _on_AnimatedSprite_animation_finished2():
	if $AnimatedSprite.animation == "boom":
		yield(get_tree().create_timer(0.8),"timeout")
		queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("players") && solo_20 == false:
		Global.vidas -= 20
		solo_20 = true
