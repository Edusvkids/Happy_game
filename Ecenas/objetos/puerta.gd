extends Area2D

onready var anim = $AnimatedSprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	$AnimatedSprite.play("closed")


func _physics_process(delta):
	if Global.puerta == 1:
		$AnimatedSprite.play("opening")

func _on_puerta_body_entered(body):
	if body.is_in_group("players"):
		if anim.animation == "open":
			get_tree().change_scene("res://Ecenas/Niveles/JefeMundo2.tscn")

func _on_AnimatedSprite_animation_finished():
	if anim.animation == "opening":
		Global.puerta += 1
		$AnimatedSprite.play("open")
