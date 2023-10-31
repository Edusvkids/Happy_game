extends Node2D
onready var http : HTTPRequest = $HTTPRequest
onready var username:LineEdit=$NameTXT
onready var passwordplayer:LineEdit=$PasswordTXT
onready var notificacion:Label=$Label

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var respose_body:=JSON.parse(body.get_string_from_ascii())
	if response_code !=200:
		print(response_code)
	else:
		notificacion.text= "todo bien"
		get_tree().change_scene("res://Ecenas/Niveles/menu.tscn")


func _on_Button_pressed():
	if username.text.empty() or passwordplayer.text.empty():
		notificacion.text = "Ingrese los datos"
		return
	Global.login(username.text,passwordplayer.text,http)

func _on_SalirBTN_pressed():
	get_tree().quit()


func _on_crear_cuentaBTN_pressed():
	get_tree().change_scene("res://Ecenas/inicio de secion y crear usuario/Crear_usuario.tscn")
