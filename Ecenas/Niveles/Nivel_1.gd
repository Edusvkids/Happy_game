extends Node2D

#onready var camara = $Player_woman/Camera2D2

#export (int) var limite_c_up
#export (int) var limite_c_down
#export (int) var limite_c_left
#export (int) var limite_c_rigth

# Called when the node enters the scene tree for the first time.
#func _ready():
	#camara.limit_left = limite_c_left
	#camara.limit_right = limite_c_rigth
	#camara.limit_top = limite_c_up
	#camara.limit_bottom = limite_c_down

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_el_matador_body_entered(body):
	if body.is_in_group("players"):
		Global.vidas -= 9999
