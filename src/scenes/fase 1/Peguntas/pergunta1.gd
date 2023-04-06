extends Node2D

# Funções dos botões que carrega as sprites dos botões quando a resposta é correta ou errada
var errou = load("res://sprites/Buttonvermelho.png")
var acertou = load("res://sprites/Buttonverde.png")

func _process(delta):
	# Mostra o pontos do jogador
	$Points.text = str(Points.points) + "V Coins"

# Função do botão com a resposta certa
func _on_TextureButton3_button_up():
	# Mudanças nas texturas quando o mouse é passado por cima
	$TextureButton3.texture_normal = acertou
	$TextureButton3.texture_pressed = acertou
	$TextureButton3.texture_hover = acertou
	$sounds/Correct.play()
	# Adiciona pontos quando a resposta certa é escolhida
	# Pontos são adicionados apenas na primeira vez que a fase é realizada
	if Points.pergunta14 == false:
		Points.addpoint()
		Points.addpoint()
		Points.pergunta14 = true
	
	# Timer e popup com o feedback da resposta
	yield(get_tree().create_timer(0.5), 'timeout')
	$FeedbackAcerto1/Popup.show()

# Função do botão com a resposta errada
func _on_TextureButton2_button_up():
	# Mudanças nas texturas quando o mouse é passado por cima
	$TextureButton2.texture_normal = errou
	$TextureButton2.texture_pressed = errou
	$TextureButton2.texture_hover = errou
	$sounds/Wrong.play()
	
	
	# Timer e popup com o feedback da resposta
	yield(get_tree().create_timer(0.5), 'timeout')
	$FeedbackErro1/Popup.show()
	

# Função do botão com a resposta errada
func _on_TextureButton_pressed():
	# Mudanças nas texturas quando o mouse é passado por cima
	$TextureButton.texture_normal = errou
	$TextureButton.texture_pressed = errou
	$TextureButton.texture_hover = errou
	$sounds/Wrong.play()
		
	# Timer e popup com o feedback da resposta
	yield(get_tree().create_timer(0.5), 'timeout')
	$FeedbackErro1/Popup.show()
	
