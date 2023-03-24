extends KinematicBody2D

var move = Vector2().normalized()
var speed = 5000
var bateu
var tocou = false
var keyCard = [0]

# Variáveis e funções para o funcionamento touch do jogo no mobile
var cima = false
var baixo = false
var esquerda = false
var direita = false
var entrou
var ganhou
var nome

# Funções e variáveis para fazer o movimento do player no celular
func _on_Esquerda_pressed():
	esquerda = true
func _on_Esquerda_released():
	esquerda = false

func _on_Direita_pressed():
	direita = true
func _on_Direita_released():
	direita = false

func _on_Baixo_pressed():
	baixo = true
func _on_Baixo_released():
	baixo = false

func _on_Cima_pressed():
	cima = true
func _on_Cima_released():
	cima = false


func _physics_process(delta):
	
	print(position.x, position.y)
	# Movimentação do personagem
	if Input.is_action_pressed("ui_up") or cima:
		move.y = - speed * delta

	elif Input.is_action_pressed("ui_down") or baixo:
		move.y = speed * delta

	elif Input.is_action_pressed("ui_right") or direita:
		move.x = speed * delta

	elif Input.is_action_pressed("ui_left") or esquerda:
		move.x = - speed * delta

	else:
		move.x = 0
		move.y = 0
	
	move_and_slide(move)

	var collision = move_and_collide(move * delta)
	var checkCollision = ['TileMap','key', 'key2', 'key3']
	
	# Dependendo do que o personagem colidir acontece algo diferente
	if collision:
		bateu = collision.collider.name
		if bateu == 'key' :
			keyCard[0] += 1
			get_node("../Camera").modulate = Color(1,1,1,1)
			get_node("../key/key").queue_free()
		elif bateu == 'key2':
			keyCard[0] += 1
			get_node("../Cell").modulate = Color(1,1,1,1)
			get_node("../key/key2").queue_free()
		elif bateu == 'key3':
			keyCard[0] += 1
			get_node("../Pasta").modulate = Color(1,1,1,1)
			get_node("../key/key3").queue_free()
			

		elif (bateu in checkCollision):
			
			print(bateu)
			
		elif !(bateu in checkCollision):
			position = Vector2(0,0)
			

# Quando o player chega no lugar
func _on_Compliance_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if keyCard == [3]:
		ganhou = true
		get_node("../PopUp").show()
		get_tree().paused = true
		get_node("../PopUp/Label").text = "Parabéns, você foi ao lugar correto!\nO Compliance é o lugar ideal para fazer\nreclamações e denúncias!\n\nToque na tela para continuar"
		# Jogador vence o jogo quando coletar as 3 chaves e recebe mais um ponto na variável global
		if Points.whg == false:
			# Adiciona ponto e seta o estado da fase como true
			Points.addpoint()
			Points.whg = true
		


# Quando o jogador vai para o lugar errado
func _on_RH_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	entrou = true
	get_node("../PopUp").show()
	get_tree().paused = true
	get_node("../PopUp/Label").text = "Lugar errado!\n \nPor mais que tenha relação com\no assunto, o RH não é o lugar ideal!\n \nToque na tela para tentar novamente."

func _on_Agua_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	entrou = true
	get_node("../PopUp").show()
	get_tree().paused = true
	get_node("../PopUp/Label").text = "Lugar errado!\nToque na tela para tentar novamente."

func _on_Planta_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	entrou = true
	get_node("../PopUp").show()
	get_tree().paused = true
	get_node("../PopUp/Label").text = "Lugar errado!\nToque na tela para tentar novamente."

func _on_TouchScreenButton_pressed():
	if entrou:
		get_node("../PopUp").hide()
		get_tree().paused = false
		get_tree().reload_current_scene()
		
	if ganhou:
		get_node("../PopUp").hide()
		get_tree().paused = false
		get_tree().change_scene("res://scenes/fase 1/Peguntas/pergunta4.tscn")



