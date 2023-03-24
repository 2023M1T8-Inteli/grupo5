extends Node

var ipAdress: Array
var premio = str(Points.points)
# Variável que declara a informação no qr gerado baseado no código
var url = "https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=Parabens%20voce%20fez%20"+premio+"%20pontos%20"+Points.currentCode+"%20é%20seu%20código"

func _ready():
	
	# Mostra o código atual do jogador
	$Atual.text = "Seu código atual é:"+Points.currentCode
	
	# Cria uma solicitação HTTP e conecta seu sinal de conclusão.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", self, "_http_request_completed")

	# Executa a solicitação HTTP. A URL abaixo retorna uma imagem PNG como da escrita
	var error = http_request.request(url)
	if error != OK:
		push_error("An error occurred in the HTTP request.")


# Função chamada quando o HTTP request está completa
func _http_request_completed(result, response_code, headers, body):
	# Uma vez que o HTTP request está completo é criado o qr code
	var image = Image.new()
	var error = image.load_png_from_buffer(body)
	if error != OK:
		push_error("Couldn't load the image.")
	
	# Cria um nó de ImageTexture para carregar o QR code
	var texture = ImageTexture.new()
	texture.create_from_image(image)

	#Mostra a imagem em um texturerect
	var texture_rect = TextureRect.new()
	add_child(texture_rect)
	texture_rect.texture = texture
	texture_rect.set_position(Vector2(100, 200))
	
#Colocar save code no jogo
func _on_SaveCodeButton_pressed():
	if Points.permission == 0:
		Points.currentCode = ($LineEdit.text)
		Points.currentCodeArray.clear()
		Points.permission = 1
		
		# Transformar os números que estão em um string em int
		for i in range(Points.currentCode.length()):
			Points.currentCodeArray.append(int(Points.currentCode[i]))
			print(Points.currentCode[i])
			
		# Chama a função que verifica se o código iserido é válido
		Points.addSaveCode()
		if Points.next == true:
			Points.currentSaveCode()
			get_tree().reload_current_scene()
		else:
			$Atual.text = "O código inserido é invalido"
		print("codigo:", Points.currentCode,"\narray:", Points.currentCodeArray, "\nlevel1: ", Points.stateLevel1, "\nlevel2: ", Points.stateLevel2, "\nlevel3: ", Points.stateLevel3, "\nPontos: ",Points.points)
	else:
		$Atual.set_position(Vector2(45, 500))
		$Atual.text = "Para inserir um novo código, por favor, feche o jogo e abra novamente"

# Botão que volta para o menu
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
