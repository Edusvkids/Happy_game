extends KinematicBody2D

var vidas = 1
var dir = 1
var speed = 25
var motion = Vector2()
var is_alive:bool = true
onready var ray3 = $Ray3
onready var ray1 = $Ray1

func _ready():
	$AnimatedSprite.play("run")

func _physics_process(delta):
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

func _on_Area2D_body_entered(body):
	if body.is_in_group("players"):
		$AnimatedSprite.play("runX2")
		speed = 180


func _on_muerte_body_entered(body):
	if body.is_in_group("players") or vidas == 0:
		morir()



func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "boom2":
		queue_free()

func morir():
	$muerte/CollisionShape2D.disabled = true
	$CollisionShape2D.disabled = true
	$AnimatedSprite.play("boom2")
	Global.vidas -= 20
	dir = 0
