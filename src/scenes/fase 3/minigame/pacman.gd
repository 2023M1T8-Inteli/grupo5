extends Node2D

# Variável que guarda o volume geral do jogo
var audio = AudioServer.get_bus_index("Master")

func _ready():
	$FundoPause/Label.text = pontos
	$FundoPause/Label2.text = "Seu código atual é:"+ Points.currentCode
	$AnimatedSprite.play("default")

# Função do botão que abre o menu de pause da fase
func _on_Pausar_pressed():
	get_tree().paused = true
	$FundoPause.show()

# Função do botão que fecha o menu de pause da fase
func _on_Button2_pressed():
	get_tree().paused = false
	$FundoPause.hide()

# Pontos do jogador na fase
var pontos = "Você tem " + str(Points.points) + " pontos"

# Função de slider para alterar o volume do jogo
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(audio, value)
	if value == -30:
		AudioServer.set_bus_mute(audio,true)
	else:
		AudioServer.set_bus_mute(audio,false)
	
# Função do botão que leva para a cena de seleção de fases
func _on_Button3_pressed():
	# Define a variável de pause da fase como falsa
	get_tree().paused = false
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")
