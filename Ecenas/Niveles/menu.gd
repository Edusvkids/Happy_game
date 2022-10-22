extends Node2D

func _ready():
	pass 


func _on_jugar_pressed():
	get_tree().change_scene("res://Ecenas/Niveles/Nivel_1.tscn")


func _on_salir_pressed():
	get_tree().quit()
