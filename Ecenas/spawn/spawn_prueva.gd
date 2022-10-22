extends StaticBody2D

export (PackedScene) var npc



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var newEnemigo = npc.instance()
	get_tree().get_root().call_deferred("add_child", newEnemigo)
	newEnemigo.position = $Position2D.global_position
