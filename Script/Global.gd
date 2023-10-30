extends Node

const api_key = "Key.JWTAPIMinimal2023.API"
const loginUrl := "https://localhost:7294/userplayer/login"
const registerUrl = "https://localhost:7294/userplayer"

var current_token = ""
var contador = 0
var vidas = 100
var puerta = 0
var jefe_1 = 100

func _get_token_id_from_result(result:Array)->String:
	if result.size() >= 4:
		var result_body = JSON.parse(result[3].get_string_from_ascii())
		if result_body is Dictionary:
			return result_body["idToken"]
		else:
			print("El cuerpo de la respuesta no es un diccionario.")
	else:
		print("La respuesta no contiene un cuerpo válido.")
	return ""


func register(NamePlayer:String,GmailPlayer:String,PasswordPlayer:String,http:HTTPRequest)->void:
	var body:={
		"NamePlayer":NamePlayer,
		"GmailPlayer":GmailPlayer,
		"PasswordPlayer":PasswordPlayer,
	}
	var headers = ["Content-Type: application/json"]
	http.request(registerUrl,headers,false,HTTPClient.METHOD_POST,to_json(body))
	var result := yield(http,"request_completed")as Array
	if result[1] == 200:
		current_token = _get_token_id_from_result(result)

func login(NamePlayer:String,PasswordPlayer:String,http:HTTPRequest)->void:
	var body:={
		"NamePlayer":NamePlayer,
		"PasswordPlayer":PasswordPlayer,
	}
	var headers = ["Content-Type: application/json"]
	   # Agrega la clave de API como encabezado de autorización
	headers.append("Authorization: Bearer " + api_key)
	http.request(loginUrl, headers, false, HTTPClient.METHOD_POST, to_json(body))
	http.connect("request_completed", self, "_on_request_completed")
	add_child(http)
	
	
	http.request(loginUrl,headers,false,HTTPClient.METHOD_POST,to_json(body))
	print(NamePlayer)
	print(PasswordPlayer)
