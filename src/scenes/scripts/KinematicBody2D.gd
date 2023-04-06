extends KinematicBody2D

var player

var move = Vector2().normalized()
var actualPosition
var speed = 5000
var bateu
var tocou = false
var keyCard = 0

# Variáveis e funções para o funcionamento touch do jogo no mobile
var cima = false
var baixo = false
var esquerda = false
var direita = false

var entrou
var ganhou
var nome

func _ready():
	player = get_node("../KinematicBody2D")

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

func item():
	keyCard += 1
	get_node("../Item").play()

func _physics_process(delta):
	
	# Movimentação do personagem
	if Input.is_mouse_button_pressed(1):
		position = position.move_toward(get_global_mouse_position(), 2)
	
		var collision = move_and_collide(move * delta)
		var checkCollision = ['mapa','key', 'key2', 'key3']
		
		# Dependendo do que o personagem colidir acontece algo diferente
		if collision:
			position = Vector2(55,570)
			get_node("../perdeu").play()
				

# Quando o player chega no lugar
func _on_Compliance_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if keyCard == 3:
		ganhou = true
		get_node("../PopUp").show()
		get_node("../AudioStreamPlayer").stop()
		get_node("../Win").play()
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
	get_node("../PopUp/Sprite2/Label").text = "Lugar errado!\n \nPor mais que tenha relação com\no assunto, o RH não é o lugar ideal"

func _on_Agua_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	entrou = true
	get_node("../PopUp").show()
	get_tree().paused = true
	get_node("../PopUp/Sprite2/Label").text = "Lugar errado"

#Pegando as provas pelo mapa
func _on_key_body_entered(body):
	if body == player:
		get_node("../key/key").queue_free()
		get_node("../Camera").modulate = Color(1,1,1,1)
		item()

func _on_key2_body_entered(body):
	if body == player:
		get_node("../key/key2").queue_free()
		get_node("../Cell").modulate = Color(1,1,1,1)
		item()

func _on_key3_body_entered(body):
	if body == player:
		get_node("../key/key3").queue_free()
		get_node("../Pasta").modulate = Color(1,1,1,1)
		item()

func _on_Button_pressed():
	if entrou ==  true:
		get_tree().paused = false
		get_tree().reload_current_scene()
