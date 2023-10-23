extends Node2D


var http_request = HTTPRequest.new()


#func _ready():
#	http_request.request("https://localhost:7294/userplayer",[],HTTPClient.METHOD_POST)
#	var request_data ={
#		"NamePlayer": $NameTXT,
#		"GmailPlayer": $GmailTXT,
#		"PasswordPlayer": $PasswordTXT
#	}
#	var json_data = JSON.print(request_data)
#	http_request.reques_data = json_data
#	http_request.request_headers["content-Type"]="application/json"
#	http_request.connect("request_completed",self,"_on_request_completed")


