extends KinematicBody2D

var dir = 1
var speed = 80
var motion = Vector2()
var is_alive:bool = true

func _ready():
	$AnimatedSprite.play("run")

func _physics_process(delta):
	move_and_slide(Vector2(speed * dir,300), Vector2.UP)
	patrol()
	pass

func patrol():
	if is_on_wall():
		dir *= -1
		scale.x *= -1
	pass
