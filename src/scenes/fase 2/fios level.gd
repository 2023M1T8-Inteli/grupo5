extends Node2D

# Variável que detecta se algum fio está selecionado
var selected = false

# Variáveis de verificação do fio que está selecionado
var red_wire = false
var green_wire = false
var blue_wire = false
var orange_wire = false

# Variáveis que validam se a conexão foi feita certa
var red_connected = false
var green_connected = false
var blue_connected = false
var orange_connected = false

# Variável que armazena os erros do jogador
var erros = 0

# Variável que armazena a posição do toque do jogador
var touch_position 

# Váriaveis das linhas dos fios
onready var line := $Red_line
onready var line2 := $Green_line

# Variável que muda de acordo com a linha selecionada
onready var current_line := $Red_line

func _ready():
	current_line.points[0] = Vector2(-10, 0)

func _process(delta):
	# Posição do toque na tela
	touch_position = get_viewport().get_mouse_position()
	
	# Quando algum fio está selecionado o segundo ponto do fio é igual a direção do toque do usuário
	if selected:
		current_line.points[1] = Vector2(touch_position.x-current_line.position.x,touch_position.y-current_line.position.y)
	
	# Detecta quando todos os fios estão conectados corretamente o usuário vence o jogo 
	if red_connected and blue_connected and orange_connected and green_connected:
		$AnimatedSprite.play("win")
		$Background.stop()
		if $Win.playing == false:
			$Win.play()
		yield(get_tree().create_timer(1.72), 'timeout')
		
		# Adciona ponto ao jogador
		if Points.fios == false:
			Points.addpoint()
			Points.fios = true
		get_tree().change_scene("res://scenes/fase 2/Dialogos fase 2/dialogo_fase2_4.tscn")
	
	# Feedback visual dos erros do usuário e o jogo é reiniciado após 3 erros
	if erros >= 1:
		$AnimatedSprite.play("oneError")
	if erros >= 2:
		$AnimatedSprite.play("twoError")
	if erros >= 3:
		$AnimatedSprite.play("threeError")
		get_tree().reload_current_scene()


# FUNÇÕES DE SELEÇÃO DO FIO

# Função que faz o fio ser selecionado com um clique/toque
func _on_Red_selection_input_event(viewport, event, shape_idx):
	# Determina que existe algum fio selecionado e que corresponde ao fio da cor que foi clicado
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		selected = true
		red_wire = true
		current_line = $Red_line
		current_line.visible = true
		print(current_line)

# Função que faz o fio ser selecionado com um clique/toque
func _on_Green_selection_input_event(viewport, event, shape_idx):
	# Determina que existe algum fio selecionado e que corresponde ao fio da cor que foi clicado
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
			selected = true
			green_wire = true
			current_line = $Green_line
			current_line.visible = true

# Função que faz o fio ser selecionado com um clique/toque
func _on_Blue_selection_input_event(viewport, event, shape_idx):
	# Determina que existe algum fio selecionado e que corresponde ao fio da cor que foi clicado
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
			selected = true
			blue_wire = true
			current_line = $Blue_line
			current_line.visible = true

# Função que faz o fio ser selecionado com um clique/toque
func _on_Orange_selection_input_event(viewport, event, shape_idx):
	# Determina que existe algum fio selecionado e que corresponde ao fio da cor que foi clicado
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
			selected = true
			orange_wire = true
			current_line = $Orange_line
			current_line.visible = true

# FUNÇÕES DOS TERMINAIS

# O terminal executa algum comando quando o usuário entra na área dele com algum fio selecionado
func _on_Orange_terminal_mouse_entered():
	# Quando existe algum fio slecionado e é o fio da cor correspondente ao teminal, o fio é conectado
	if selected == true and orange_wire == true:
		$Certo.play()
		selected = false
		current_line.points[1] = Vector2(300, -165)
		
		# Colisão do terminal é desativada para não ser mais selecionada
		$Orange_selection/CollisionShape2D.set_deferred("disabled", true)
		orange_connected = true
		
	# Quando existe algum fio slecionado e é o fio errado, o jogador perde uma vida
	elif selected == true and orange_wire == false:
		$Erro.play()
		erros += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		current_line.visible = false
		print(erros)

# O terminal executa algum comando quando o usuário entra na área dele com algum fio selecionado
func _on_Blue_terminal_mouse_entered():
	# Quando existe algum fio slecionado e é o fio da cor correspondente ao teminal, o fio é conectado
	if selected == true and blue_wire == true:
		selected = false
		$Certo.play()
		current_line.points[1] = Vector2(290, 137)
		
		# Colisão do terminal é desativada para não ser mais selecionada
		$Blue_selection/CollisionShape2D.set_deferred("disabled", true)
		blue_connected = true
		
	# Quando existe algum fio slecionado e é o fio errado, o jogador perde uma vida
	elif selected == true and blue_wire == false:
		$Erro.play()
		erros += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		current_line.visible = false
		print(erros)

# O terminal executa algum comando quando o usuário entra na área dele com algum fio selecionado
func _on_Green_terminal_mouse_entered():
	# Quando existe algum fio slecionado e é o fio da cor correspondente ao teminal, o fio é conectado
	if selected == true and green_wire == true:
		selected = false
		$Certo.play()
		current_line.points[1] = Vector2(390, 208)
		
		# Colisão do terminal é desativada para não ser mais selecionada
		$Green_selection/CollisionShape2D.set_deferred("disabled", true)
		green_connected = true
		print(erros)
		
	# Quando existe algum fio slecionado e é o fio errado, o jogador perde uma vida
	elif selected == true and green_wire == false:
		$Erro.play()
		erros += 1
		current_line.points[1] = current_line.points[0]
		selected = false
#		current_line.visible = false
		print(erros)

# O terminal executa algum comando quando o usuário entra na área dele com algum fio selecionado
func _on_Red_terminal_mouse_entered():
	# Quando existe algum fio slecionado e é o fio da cor correspondente ao teminal, o fio é conectado
	if selected == true and red_wire == true:
		selected = false
		$Certo.play()
		current_line.points[1] = Vector2(265, -190)
		
		# Colisão do terminal é desativada para não ser mais selecionada
		$Red_selection/CollisionShape2D.set_deferred("disabled", true)
		red_connected = true
		
	# Quando existe algum fio slecionado e é o fio errado, o jogador perde uma vida
	elif selected == true and red_wire == false:
		$Erro.play()
		erros += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		current_line.visible = false
		print(erros)

# Terminal errado independente de qual for o fio selecionado
func _on_Gray_terminal_mouse_entered():
	if selected == true:
		$Erro.play()
		erros += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		print(erros)

# Função do botão de pause
func _on_Pausar_pressed():
	get_tree().paused = true
	$FundoPause.show()

# Função para continuar o jogo depois do pause
func _on_Button2_pressed():
	get_tree().paused = false
	$FundoPause.hide()

# Variáveis do som e pontuação do jogador
var audio = AudioServer.get_bus_index("Master")
var pontos = "Você tem " + str(Points.points) + " pontos"

# Controlador do volume do jogo
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(audio, value)
	if value == -30:
		AudioServer.set_bus_mute(audio,true)
	else:
		AudioServer.set_bus_mute(audio,false)
#
	pass

# Função do botão para volar a cena de seleção de fases
func _on_Button3_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")
