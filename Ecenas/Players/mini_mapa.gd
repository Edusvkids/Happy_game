extends ViewportContainer


var player : KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("players")[0]


func _process(delta):
	$Viewport/Camera2D.global_transform.origin.x = player.global_transform.origin.x
