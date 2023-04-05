extends KinematicBody2D

var move = Vector2()
var speed = 5000
var bateu

var keyCard = [0]

# Variáveis e funções para o funcionamento touch do jogo no mobile
var cima = false
var baixo = false
var esquerda = false
var direita = false

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

func _process(delta):
	# A cada keycard pega em um posição ela muda
	if keyCard == [1]:
		get_node("../key/key").position = Vector2(271, 429)
#		get_node("../key/KeyCheck").visible = true
	if keyCard == [2]:
		get_node("../key/key").position = Vector2(268, 190)
	if keyCard == [3]:
		get_node("../key/key").visible = false
		get_node("../key/key").position = Vector2(560, 381)

func _physics_process(delta):
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
	var checkCollision = ['parede1','parede2','parede3','parede4','parede5','parede6','parede7','parede8','parede9','parede10', 'parede11','parede12','parede13','parede14','key']
	
	# Dependendo do que o personagem colidir acontece algo diferente
	if collision:
		bateu = collision.collider.name
		if bateu == 'key':
			# Adiciona +1 ao valor anterior
			keyCard[0] += 1
			print(keyCard)

		elif !(bateu in checkCollision):
			
			print(bateu)
	

# Quando o player chega no lugar
func _on_Compliance_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if keyCard == [3]:
		print("Deu certo caralho")
		# Jogador vence o jogo quando coletar as 3 chaves e recebe mais um ponto na variável global
		if Points.whg == false:
			Points.addpoint()
		Points.whg = true
		get_tree().change_scene("res://Dialogos/dialogo_fase1_2.tscn")
	else: 
		print("Folgado, vai pegar a key")

# Quando o jogador vai para o lugar errado
func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("ruinzão")




