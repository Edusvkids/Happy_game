extends Node2D
onready var http : HTTPRequest = $HTTPRequest
onready var username:LineEdit=$NameTXT
onready var passwordplayer:LineEdit=$PasswordTXT
onready var notificacion:Label=$Label

func _on_HTTPRequest_request_completed(result:int, response_code:int, headers:PoolStringArray, body:PoolByteArray)->void:
	var respose_body:=JSON.parse(body.get_string_from_ascii())
	if response_code !=200 or response_code !=401:
		print(response_code)
	if response_code == 401:
		notificacion.text = "Cuenta no existente"
	if response_code == 200:
		notificacion.text= "todo bien"
		get_tree().change_scene("res://Ecenas/Niveles/menu.tscn")


func _on_Button_pressed()->void:
	if username.text.empty() or passwordplayer.text.empty():
		notificacion.text = "Ingrese los datos"
		return
	Global.login(username.text,passwordplayer.text,http)

func _on_SalirBTN_pressed():
	get_tree().quit()


func _on_crear_cuentaBTN_pressed():
	get_tree().change_scene("res://Ecenas/inicio de secion y crear usuario/Crear_usuario.tscn")

func _on_invitado_pressed():
	Global.nameuser = "Invitado"
	Global.modoinvitado = true
	get_tree().change_scene("res://Ecenas/Niveles/menu.tscn")
