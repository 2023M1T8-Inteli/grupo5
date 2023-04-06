extends Control

# Variável que detecta se o jogo está pausado
var is_paused = false setget set_is_paused

func _unhandled_input(event):
	# Opção de desenvelvedor para testar a funcionalidade do pause
	if event.is_action_pressed("ui_end"):
		self.is_paused = !is_paused

# Função que pausa o jogo e define a tela de pause como vísisel
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

# Botão que pausa o jogo
func _on_continue_pressed():
	self.is_paused = false
