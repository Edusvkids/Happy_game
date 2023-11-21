extends KinematicBody2D

onready var anim = $AnimatedSprite

const acceleration = 40
const max_speed = 175

var speed = 10
var jump_speed = 400
var gravity = 22
var ataque = false

var velocity = Vector2.ZERO

func _ready():
	#$AnimatedSprite.playing = true
	pass

func _physics_process(_delta):
	if Global.vidas <= 0:
		$AnimatedSprite.play("muerte")
		yield(get_tree().create_timer(1),"timeout")
		Global.vidas = 100
		Global.contador = 0
		Global.puerta = 0
		Global.jefe_1 = 100
		get_tree().reload_current_scene()
	elif Global.vidas >= 0:
		move()
		jump()
		velocity = move_and_slide(velocity, Vector2(0,-1))

func move():
	velocity.y += gravity
	
	if Input.is_action_pressed("ataque"):
		$AnimatedSprite.play("ataque")
		ataque = true
	
	if Input.is_action_pressed("mover_derecha") && ataque == false:
		velocity.x = min(velocity.x + acceleration, max_speed)
		$AnimatedSprite.flip_h = false
		$Area2D/CollisionShape2D.position.x = 14
	elif Input.is_action_pressed("mover_izquierda") && ataque == false:
		velocity.x = max(velocity.x - acceleration, -max_speed)
		$AnimatedSprite.flip_h = true
		$Area2D/CollisionShape2D.position.x = -20
	else:
		velocity.x = 0
	
	if velocity.x == 0 && ataque == false:
		$AnimatedSprite.animation = "Idle"
	elif velocity.x > 0 or velocity.x < 0:
		$AnimatedSprite.animation = "Run"

func jump():
	if is_on_floor() && ataque == false:
		if Input.is_action_just_pressed("saltar"):
			velocity.y -= jump_speed
	
	if !is_on_floor() && ataque == false:
		if velocity.y < -1:
			$AnimatedSprite.animation = "Jump"
		if velocity.y > 1:
			$AnimatedSprite.animation = "Fall"


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "ataque":
		$AnimatedSprite.play("Idle")
		ataque = false
	if $AnimatedSprite.animation == "hit":
		$AnimatedSprite.play("Idle")

func _on_AnimatedSprite_frame_changed():
	if $AnimatedSprite.animation == "ataque":
		$Area2D/CollisionShape2D.disabled = false
	else:
		$Area2D/CollisionShape2D.disabled = true


func _on_dao_body_entered(body):
	if body.is_in_group("slime"):
		$hit/CollisionShape2D.disabled = true
		ataque = true
		hit()
		yield(get_tree().create_timer(0.4),"timeout")
		ataque = false
		$hit/CollisionShape2D.disabled = false

func hit():
	$AnimatedSprite.play("hit")
	Global.vidas -= 10

func rebote():
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("slime"):
		body.vidas -= 1
		body.morir()
	if body.is_in_group("fire"):
		body.anim.play("hit")
		body.vidas -= 1
		body.morir()
	if body.is_in_group("dark"):
		body.anim.play("hi")
		body.vidas -=1
		body.morir()
	if body.is_in_group("greep"):
		body.anim.play("daño")
		body.vidas -= 1
		body.morir()
	if body.is_in_group("jefe_1"):
		body.anim.play("hit")
		Global.jefe_1 -= 2
		body.morir()
