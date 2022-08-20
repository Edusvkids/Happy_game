extends KinematicBody2D

var VELOCIDAD = 70
var movimiento = Vector2(0,0)
var forgod = true
var GRAVITY = 20


onready var ray = $RayCast2D

func _physics_process(delta) -> void:
	if !ray.is_colliding() or is_on_wall():
		forgod = not forgod
	if forgod == true:
		movimiento.x = -50
		$AnimatedSprite.play("run")
		$CollisionShape2D.position.x = -3
		ray.position.x = -3
		$AnimatedSprite.flip_h = true
	else:
		movimiento.x = 50
		$AnimatedSprite.play("run")
		$CollisionShape2D.position.x = 3
		ray.position.x = 3
		$AnimatedSprite.flip_h = false
	movimiento.y += GRAVITY
	movimiento = move_and_slide(movimiento, Vector2.UP)
	movimiento.x = lerp(movimiento.x, 0, 0.2)
