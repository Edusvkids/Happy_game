extends KinematicBody2D

var dir = 1
var speed = 80
var vidas = 4
var motion = Vector2()
var is_alive:bool = true

onready var RaySuelo = $RayCast2D
onready var anim = $AnimatedSprite

func _ready():
	$AnimatedSprite.play("run")

func _physics_process(delta):
	move_and_slide(Vector2(speed * dir,300), Vector2.UP)
	patrol()
	pass

func patrol():
	if is_on_wall() or !RaySuelo.is_colliding():
		dir *= -1
		scale.x *= -1
	pass

func morir():
	if vidas <= 0:
		$AnimatedSprite.play("muerte")
		dir = 0
		$Area2D/CollisionShape2D.disabled = true
		$CollisionShape2D.disabled = true
		yield($AnimatedSprite, "animation_finished")
		queue_free()

func _on_Area2D_body_entered(body):
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if anim.animation == "daño":
		$AnimatedSprite.play("run")
		 
