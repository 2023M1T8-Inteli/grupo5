extends KinematicBody2D

func _ready():
	pass # Replace with function body.


var andar = Vector2() #movimento
var velocidade = 65 #velocidade
# Variáveis utilizadas para controlar o player no celular
var cima = false
var baixo = false
var coletaveis = [0]
var bateu

var vida = 3

# Funções utilizadas para controlar o player no celular
var esquerda = false
var direita = false 
func _on_Cima_pressed():
	cima = true
func _on_Baixo_pressed():
	baixo = true
func _on_Direita_pressed():
	direita = true
func _on_Esquerda_pressed():
	esquerda = true

func _process(delta):
	# Verifica se foi coletado todos os número bons
	if coletaveis[0] == 4:
		get_node("../texto final").visible = true
		yield(get_tree().create_timer(1.5), 'timeout')
		
		# Variável global que verifica se a fase está completa e adciona um ponto ao jogador
		if Points.pacMan == false:
			Points.addpoint()
			Points.pacMan = true
		
		get_tree().change_scene("res://scenes/fase 3/Dialogos/dialogo_fase3_3.tscn")

	# Código que configura a vida do player
	if vida == 3:
		get_node("../Hearts/AnimationPlayer").play("Lifes3")
	elif vida == 2:
		get_node("../Hearts/AnimationPlayer").play("Lifes2")
	elif vida == 1:
		get_node("../Hearts/AnimationPlayer").play("Lifes1")
	elif vida == 0:
		get_tree().reload_current_scene()
		

func _physics_process(delta):
	move_and_slide(andar)
	# Controle do Personagem
	if Input.is_action_just_pressed("ui_down") or baixo:
		andar.y = velocidade
		andar.x = 0
		baixo = false
		
	if Input.is_action_just_pressed("ui_up") or cima:
		andar.y = -velocidade
		andar.x = 0
		cima = false

	if Input.is_action_just_pressed("ui_right") or direita:
		andar.x = velocidade
		andar.y = 0
		direita = false
		$AnimatedSprite.set_flip_h(false)

	if Input.is_action_just_pressed("ui_left") or esquerda:
		andar.x = -velocidade
		andar.y = 0
		esquerda = false
		$AnimatedSprite.set_flip_h(true)

	
	# Detectar colisões com os inimigos e paredes
	var collision = move_and_collide(andar * delta)
	var checkCollision = ['spriteCerveja', 'spriteCerveja2', 'spriteCerveja3', 'spriteCerveja4']
	
	var my_group_members = get_tree().get_nodes_in_group("inimigos")
	
	# Detectar colisões apenas com os inimigos
	if collision:
		bateu = collision.collider.name
		for i in len(checkCollision):
			if bateu == str(checkCollision[i]):
				print("morreu")
				# Quando o player colide com o inimigo a posição é deifinida para a inicial e perde uma vida
				get_node("../Person").position = Vector2(181, 338)
				andar.x = 0
				andar.y = 0
				vida -= 1


# Funções para detectar quando o player coletam um item bom
func _on_Capacete2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		get_node("../good/Capacete2").position = Vector2(402, 107)
		coletaveis[0] += 1
		print(coletaveis)

func _on_Capacete_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		coletaveis[0] += 1
		get_node("../good/Capacete").position = Vector2(402, 107)
		print(coletaveis)

func _on_Capacete3_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		coletaveis[0] += 1
		get_node("../good/Capacete3").position = Vector2(402, 107)
		print(coletaveis)

func _on_Capacete4_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		coletaveis[0] += 1
		get_node("../good/Capacete4").position = Vector2(402, 107)
		print(coletaveis)
