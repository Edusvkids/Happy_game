extends KinematicBody2D

var MoveSpeed = 5000
var acc = 3
var Gravedad = 20
var dir = 1
var t = 1

var atacando = false
var PuedeMoverse : bool = true

var Velocity : Vector2 = Vector2()

onready var RaySuelo = $RayCast2D

func _ready():
	pass

func _physics_process(delta):
	if PuedeMoverse:
		Patrullar()
		move_and_slide(Vector2(MoveSpeed * dir * delta, 200), Vector2.UP)

func Patrullar():
	
	#Velocity = Vector2()
	if is_on_wall() or !RaySuelo.is_colliding():
		dir *= -1
		scale.x *= -1
		if !atacando:
			$AnimatedSprite.play("run")

func ControlAtaque():
	if $AtackDetect.is_colliding():
		var col = $AtackDetect.get_collider()
		if col.is_in_group("players"):
			$AtackDetect.enabled = false
			atacar()
			yield(get_tree().create_timer(0.2), "timeout")
			$Atack.enabled = true
			
	if $Atack.is_colliding():
		var col = $Atack.get_collider()
		if col.is_in_group("players"):
			$Atack.enabled = false
			print(name ," aplicando daño")

func atacar():
	PuedeMoverse = false
	atacando = true
	$AnimatedSprite.play("attack")
	
	if $AnimatedSprite.frame == 2:
		$Atack.enabled = true

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		$Atack.enabled = false
		$AnimatedSprite.play("run")
		$AtackDetect.enabled = true
		PuedeMoverse = true
		atacando = false
