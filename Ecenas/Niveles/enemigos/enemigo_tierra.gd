extends KinematicBody2D

var solo_uno = false
var solo_20 = false

var dir = 1
var speed = 25
var motion = Vector2()
var is_alive:bool = true
onready var ray3 = $Ray3
onready var ray1 = $Ray1

func _ready():
	pass

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

func _on_muerte_body_entered(body):
	if body.is_in_group("players") && solo_uno == false:
		$Area2D/CollisionShape2D.disabled = true
		$AnimatedSprite.play("boom")
		dir = 0
		$muerte/CollisionShape2D.disabled = true
		$hit/CollisionShape2D.disabled = true
		solo_uno = true

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "boom":
		$hit/CollisionShape2D.disabled = false
		$AnimatedSprite.play("boom2")
	if $AnimatedSprite.animation == "boom":
		yield(get_tree().create_timer(0,8),"timeout")
		queue_free()

func _on_dao_body_entered(body):
	if body.is_in_group("players") && solo_20 == false:
		Global.vidas -= 20
		solo_20 = true


#func _on_AnimatedSprite_animation_finished_2():
	#if $AnimatedSprite.animation == "muerte2":
		#yield(get_tree().create_timer(0.8),"timeout")
		#queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("players"):
		$AnimatedSprite.play("runX2")
		speed = 180
	if !body.is_in_group("players"):
		$AnimatedSprite.play("run")
		speed = 25
