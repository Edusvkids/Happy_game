extends Node

var http_request = HTTPRequest.new()
var json_data  # Declarada en el ámbito global

func _ready():
	# Configura la URL de la API para la creación de un nuevo jugador
	http_request.connect("request_completed", self, "_on_request_completed")
	http_request.request("https://localhost:7294/userplayer", [], HTTPClient.METHOD_POST)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code == 200:
		# Procesa la respuesta (si es necesario)
		var response_data = JSONParseResult.new()
		if response_data.open_buffer(body) == OK:
			var response_dict = response_data.get_data()
			# Procesa la respuesta de la API, por ejemplo, puedes obtener un ID de jugador o información adicional

		print("Solicitud POST exitosa")
	else:
		# Maneja errores de solicitud
		print("Error en la solicitud POST: " + str(response_code))


func _on_Button_pressed():
	# Configura los datos a enviar en formato JSON
	json_data = {
		"NamePlayer": "NombreDelJugador",
		"GmailPlayer": "correo@example.com",
		"PasswordPlayer": "contrasena123"
	}
	var json_data_str = JSON.print(json_data)
	
	# Realiza la solicitud POST con los datos directamente en el método request
	http_request.request("https://localhost:7294/userplayer", [], HTTPClient.METHOD_POST, json_data_str)
