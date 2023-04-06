extends KinematicBody2D
var down = false
var up = false
var right = false
var left = false

onready var initialPos = position

# Funções e variáveis para fazer o movimento do player no celular
func _on_buttonUp_pressed():
	up = true
func _on_buttonUp_released():
	up = false
	move.y = 0
func _on_buttonDown_pressed():
	down = true
func _on_buttonDown_released():
	down = false
	move.y = 0
func _on_buttonRight_pressed():
	right = true
func _on_buttonRight_released():
	right = false
	move.x = 0
func _on_buttonLeft_pressed():
	left = true
func _on_buttonLeft_released():
	left = false
	move.x = 0
	

# Velocidade de movimento do personagem
var speed = 4000
# Define o movimento em 2 eixos
var move = Vector2()
# Inicia a fsica do jogo
func _physics_process(delta):
	# Controles do personagem
	if Input.is_action_pressed("ui_right") or right:
		move.x = speed * delta
		
		$AnimationPlayer.play("andar para direita") 
	elif Input.is_action_pressed("ui_left") or left: 
		move.x = -speed * delta
		
		$AnimationPlayer.play("andar para esquerda")
	elif Input.is_action_pressed("ui_up") or up: 
		move.y = -speed * delta
		
		$AnimationPlayer.play("andar para frente")
	elif Input.is_action_pressed("ui_down") or down:
		move.y = speed * delta
		
		$AnimationPlayer.play("andar para trás")
	else:
		move.x = 0
		move.y = 0
		$AnimationPlayer.stop()
	
	# Detecta colisões do personagem
	var collision = move_and_collide(move  * delta)
	
	# Se houver uma colisão a cena reinicia
	if collision:
		if collision.collider.name != "Barreira":
			position = initialPos
			print(collision.collider.name)

# Se o objeto toca a casa ele vence a fase 
func _on_casa_body_entered(body):
	
	if Points.crossingroad == false:
		Points.addpoint()
		Points.crossingroad = true
	

	get_node("../../AudioStreamPlayer").stop()
	get_node("../../win").play()
	yield(get_tree().create_timer(1.5), 'timeout')
	get_tree().change_scene("res://scenes/fase 2/Perguntas/pergunta4.tscn")
