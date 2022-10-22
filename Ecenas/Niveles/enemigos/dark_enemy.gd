extends KinematicBody2D

var MoveSpeed = 3000
var vidas = 10
var acc = 3
var Gravedad = 20
var dir = 2.5
var t = 0

var atacando = false
var PuedeMoverse : bool = true

var Velocity : Vector2 = Vector2()

onready var anim = $AnimatedSprite
onready var RaySuelo = $RayCast2D

func _ready():
	pass

func _physics_process(delta):
	ControlAtaque()
	
	if PuedeMoverse:
		patrullar()
		move_and_slide(Vector2(MoveSpeed * dir * delta ,200), Vector2.UP)

func patrullar():
	if is_on_wall() or !RaySuelo.is_colliding():
		dir *= -1
		scale.x *= -1
		if!atacando:
			anim.play("run")

func ControlAtaque():
	if $detc_b.is_colliding():
		var col = $detc_b.get_collider()
		if col.is_in_group("players"):
			$detc_b.enabled = false
			atacar()
			yield(get_tree().create_timer(1),"timeout")
			$detc_a.enabled = true
	if $detc_a.is_colliding():
		var col = $detc_a.get_collider()
		if col.is_in_group("players"):
			$detc_a.enabled = false
			Global.vidas -= 40

func morir():
	if vidas == 0:
		anim.play("deah");
		PuedeMoverse = false
		$detc_b.enabled = false
		yield(anim,"animation_finished")
		queue_free()

func atacar():
	PuedeMoverse = false
	atacando = true 
	anim.play("attack")
	if anim.frame == 4:
		$detc_a.enabled = true



func _on_AnimatedSprite_animation_finished():
	if anim.animation == "attack":
		$detc_a.enabled = false 
		anim.play("run")
		$detc_b.enabled = true
		PuedeMoverse = true
		atacando = false 
	if anim.animation == "hit":
		$AnimatedSprite.play("run")
		$detc_b.enabled = true
		PuedeMoverse = true
		atacando = false 
