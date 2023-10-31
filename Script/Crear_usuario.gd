extends Node

onready var http :HTTPRequest = $HTTPRequest
onready var username:LineEdit=$NameTXT
onready var gmailplayer:LineEdit=$GmailTXT
onready var passwordplayer:LineEdit=$PasswordTXT
onready var notificacion:Label=$Label








func _on_HTTPRequest_request_completed(result:int, response_code:int, headers:PoolStringArray, body:PoolByteArray)->void:
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		print(response_code)
	else:
		notificacion.text = "todo bien"
		yield(get_tree().create_timer(2.0),"timeout")
		get_tree().change_scene("res://Ecenas/inicio de secion y crear usuario/Login.tscn")


func _on_CrearBTN_pressed():
	if passwordplayer.text.empty() or username.text.empty() or gmailplayer.text.empty():
		notificacion.text = "Rellene los campos de textos"
		return
	Global.register(username.text,gmailplayer.text,passwordplayer.text,http)


func _on_SalirBTN_pressed():
	get_tree().quit()
