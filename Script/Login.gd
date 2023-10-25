extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_crear_cuentaBTN_pressed():
	get_tree().change_scene("res://Ecenas/inicio de secion y crear usuario/Crear_usuario.tscn")


func _on_SalirBTN_pressed():
	get_tree().quit()
