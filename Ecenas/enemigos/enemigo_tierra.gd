extends KinematicBody2D

var dir = 1
var speed = 25
var motion = Vector2()
var is_alive:bool = true
onready var ray3 = $Ray3
onready var ray1 = $Ray1

func _ready():
	$AnimatedSprite.play("run")

func _physics_process(delta) -> void:
	#if ray1.is_colliding():
		#$AnimatedSprite.play("runX2")
		#speed = 80
	#if !ray1.is_colliding():
		#$AnimatedSprite.play("run")
		#speed = 25
	move_and_slide(Vector2(speed * dir,300), Vector2.UP)
	patrol()
	pass

func patrol():
	if !ray3.is_colliding() or is_on_wall():
		dir *= -1
		scale.x *= -1
	pass


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("players"):
		$AnimatedSprite.play("runX2")
		speed = 180
	if !body.is_in_group("players"):
		$AnimatedSprite.play("run")
		speed = 25
