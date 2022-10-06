extends KinematicBody2D

const acceleration = 70
const max_speed = 200

var speed = 10
var jump_speed = 400
var gravity = 22
var ataque = false

var velocity = Vector2.ZERO

func _ready():
	$AnimatedSprite.playing = true

func _physics_process(_delta):
	if Global.vidas <= 0:
		$AnimatedSprite.play("muerte")
	elif Global.vidas >= 0:
		move()
		jump()
		velocity = move_and_slide(velocity, Vector2(0,-1))

func move():
	velocity.y += gravity
	
	if Input.is_action_pressed("mover_derecha") && ataque == false:
		$CollisionShape2D.position.x = -4.6
		velocity.x = min(velocity.x + acceleration, max_speed)
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("mover_izquierda") && ataque == false:
		$CollisionShape2D.position.x = 4.6
		velocity.x = max(velocity.x - acceleration, -max_speed)
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0
	
	if velocity.x == 0:
		$AnimatedSprite.animation = "Idle"
	elif velocity.x > 0 or velocity.x < 0:
		$AnimatedSprite.animation = "Run"
	if Input.is_action_pressed("ataque") && ataque == false:
		ataque()

func ataque():
		ataque = true
		$AnimatedSprite.play("ataque")
		ataque = false

func jump():
	if is_on_floor():
		if Input.is_action_just_pressed("saltar") && ataque == false:
			velocity.y -= jump_speed
	
	if !is_on_floor():
		if velocity.y < -1:
			$AnimatedSprite.animation = "Jump"
		if velocity.y > 1:
			$AnimatedSprite.animation = "Fall"


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == " ataque":
		$AnimatedSprite.play("Idle")
		ataque = false


func _on_AnimatedSprite_frame_changed():
	if $AnimatedSprite.animation == "ataque":
		$Area2D/CollisionShape2D.disabled = false
	else:
		$Area2D/CollisionShape2D.disabled = true
