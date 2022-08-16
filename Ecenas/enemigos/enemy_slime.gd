extends KinematicBody2D

var dir = 1
var speed = 80
var motion = Vector2()
var is_alive:bool = true
onready var ray = $RayCast2D

func _ready():
	$AnimatedSprite.play("run")

func _physics_process(delta):
	motion = move_and_slide(Vector2(speed * dir,0))
	patrol()
	pass

func patrol():
	if !ray.is_colliding() or is_on_wall():
		dir *= 1
		ray.position.x *= 1
		$AnimatedSprite.scale.x *= 1
	pass
