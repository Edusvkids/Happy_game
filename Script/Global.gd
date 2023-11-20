extends Node

const api_key = "Key.JWTAPIMinimal2023.API"
const loginUrl := "https://localhost:7294/account/signin"
const registerUrl = "https://localhost:7294/account/signup"

var current_token = ""
var contador = 0
var vidas = 100
var puerta = 0
var jefe_1 = 100

var nameuser = ""
var modoinvitado = false

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
		"namePlayer":NamePlayer,
		"gmailPlayer":GmailPlayer,
		"passwordPlayer":PasswordPlayer,
	}
	var headers = ["Content-Type: application/json", "Authorization: Bearer "+api_key]

	http.request(registerUrl,headers,false,HTTPClient.METHOD_POST,to_json(body))
	var result := yield(http,"request_completed")as Array
	if result[1] == 200:
		current_token = _get_token_id_from_result(result)

func login(userName:String,password:String,http:HTTPRequest)->void:
	var body:={
		"userName":userName,
		"password":password,
	}
	var headers = ["Content-Type: application/json"]
	http.request(loginUrl,headers,false,HTTPClient.METHOD_POST,to_json(body))
	var result := yield(http,"request_completed")as Array
	if result[1] == 200:
		current_token = _get_token_id_from_result(result)
	
	
	http.request(loginUrl,headers,false,HTTPClient.METHOD_POST,to_json(body))
	nameuser=userName
