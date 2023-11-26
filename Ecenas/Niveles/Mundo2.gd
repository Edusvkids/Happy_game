extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


func _physics_process(delta):
	if Input.is_action_pressed("Inicio"):
		get_tree().change_scene("res://Ecenas/Niveles/menu.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://Ecenas/Niveles/menu.tscn")


func _on_el_matador_body_entered(body):
	if body.is_in_group("players"):
		Global.vidas -= 9999
