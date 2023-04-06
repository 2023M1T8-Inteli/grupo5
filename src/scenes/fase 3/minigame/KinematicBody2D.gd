extends KinematicBody2D

func _ready():
#	print(SwipeControl.down)
	pass


var andar = Vector2() #movimento
var velocidade = 65 #velocidade
# Variáveis utilizadas para controlar o player no celular

var coletaveis = [0]
var bateu

var vida = 3
onready var Swipe = get_parent().get_node("controls/SwipeScreenButton")
# Funções utilizadas para controlar o player no celular
var left = false
var right = false
var up = false
var down = false
#no começo todas são setadas como false para o jogador não se mover
func _input(event):
	if event is InputEventScreenDrag:
		if Swipe.get_swipe_direction(event.relative,4) == Vector2.DOWN:
			down = true
		if Swipe.get_swipe_direction(event.relative,4) == Vector2.UP:
			up = true
		if Swipe.get_swipe_direction(event.relative,4) == Vector2.RIGHT:
			right = true
		if Swipe.get_swipe_direction(event.relative,4) == Vector2.LEFT:
			left = true
			
func Item():
	coletaveis[0] += 1
	get_node("../Collect").play()
	if coletaveis[0] == 4:
		get_node("../Win").play()
	
#essa função verifica se o jogador está tocando a tela e se ele está arrastando o dedo para cima, baixo, direita ou esquerda e faz eles se mover para a direção que o jogador arrastou o dedo
func _process(delta):
	# Verifica se foi coletado todos os número bons	
	if coletaveis[0] == 4:
		get_node("../Popup").visible = true
		get_node("../AudioStreamPlayer").stop()
		Item()
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
	if Input.is_action_just_pressed("ui_down") or down:
		andar.y = velocidade
		andar.x = 0
		down = false
		
	if Input.is_action_just_pressed("ui_up") or up:
		andar.y = -velocidade
		andar.x = 0
		up = false

	if Input.is_action_just_pressed("ui_right") or right:
		andar.x = velocidade
		andar.y = 0
		right = false
		$AnimatedSprite.set_flip_h(false)

	if Input.is_action_just_pressed("ui_left") or left:
		andar.x = -velocidade
		andar.y = 0
		left = false
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
				get_node("../Error").play()
				andar.x = 0
				andar.y = 0
				
				vida -= 1


# Funções para detectar quando o player coletam um item bom
func _on_Capacete2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		get_node("../good/Capacete2").position = Vector2(402, 107)
		Item()
		print(coletaveis)

func _on_Capacete_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		Item()
		get_node("../good/Capacete").position = Vector2(402, 107)
		print(coletaveis)

func _on_Capacete3_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		Item()
		get_node("../good/Capacete3").position = Vector2(402, 107)
		print(coletaveis)

func _on_Capacete4_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Person":
		Item()
		get_node("../good/Capacete4").position = Vector2(402, 107)
		print(coletaveis)



