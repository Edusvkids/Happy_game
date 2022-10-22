extends StaticBody2D

export (PackedScene) var Bala
export (int) var B_speed = 100
export (int) var direccion

onready var animacion = $AnimatedSprite

onready var RayDesac =$RayDesactivador
onready var RayAtack =$RayCast2D

var damage_in:bool = false
var is_alive:bool = true
var can_shot:bool = true
var shoting = false

func _process(delta):
	
	if is_alive:
		state_machine()
	
	if RayAtack.is_colliding() and is_alive:
		if RayAtack.get_collider().is_in_group("players") and can_shot:
			shot_instance() 
			can_shot = false
			$Timer.start()
			shoting = true

func state_machine():
	
	if shoting:
		animacion.play("ataque")
	else:
		animacion.play("idle")

func shot_instance():
	var b = Bala.instance()
	direccion = 1
	b.direccion= $".".scale.x
	b.position = $Position2D.global_position
	get_tree().get_root().call_deferred("add_child", b)

func _on_Timer_timeout():
	if !can_shot:
		can_shot = true
		shoting = false
