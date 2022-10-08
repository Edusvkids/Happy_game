extends KinematicBody2D

var MoveSpeed = 3000
var acc = 3
var Gravedad = 20
var dir = 1
var t = 0

var atacando = false
var PuedeMoverse : bool = true
var despierto = false

var Velocity : Vector2 = Vector2()

onready var anim = $AnimatedSprite
onready var RaySuelo = $RayCast2D

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if despierto == true:
		ControlAtaque()
	
	if PuedeMoverse:
		patrullar()
		move_and_slide(Vector2(MoveSpeed * dir * delta ,200), Vector2.UP)

func patrullar():
	if is_on_wall() or !RaySuelo.is_colliding():
		dir *= -1
		scale.x *= -1
		if!atacando && despierto == true:
			anim.play("hostile_run")
		if despierto == false:
			anim.play("pasibe_run") 

func ControlAtaque():
	if $detc_b.is_colliding():
		var col = $detc_b.get_collider()
		if col.is_in_group("players"):
			$detc_b.enabled = false
			atacar()
			yield(get_tree().create_timer(0.2),"timeout")
			$detc_a.enabled = true
	if $detc_a.is_colliding():
		var col = $detc_a.get_collider()
		if col.is_in_group("players"):
			$detc_a.enabled = false
			Global.vidas -= 20

func morir():
	anim.play("muerte");
	PuedeMoverse = false
	$detc_b.enable = false
	yield(anim,"animation_finished")
	queue_free()

func atacar():
	PuedeMoverse = false
	atacando = true 
	anim.play("ataque")
	if anim.frame == 2:
		$detc_a.enabled = true

func _on_AnimatedSprite_animation_finished():
	if anim.animation == "ataque":
		$detc_a.enabled = false 
		anim.play("hostile_run")
		$detc_b.enabled = true
		PuedeMoverse = true
		atacando = false 




func _on_Area2D_body_entered(body):
	if body.is_in_group("players"):
		$AnimatedSprite.play("despertar")
		dir = 0
		despierto = true

func _on_AnimatedSprite_animation_finished_2():
	if anim.animation == "despertar":
		$Area2D/CollisionShape2D.disabled = true
		anim.play("hostile_run")
		dir = 1
