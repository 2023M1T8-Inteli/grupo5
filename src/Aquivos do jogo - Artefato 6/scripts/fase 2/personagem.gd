extends KinematicBody2D


var direita
func _on_direita_pressed():
	direita = true
func _on_direita_released():
	direita = false

var esquerda
func _on_esquerda_pressed():
	esquerda = true
func _on_esquerda_released():
	esquerda = false
	
var cima 
func _on_cima_pressed():
	cima = true
func _on_cima_released():
	cima = false
	
var baixo
func _on_baixo_pressed():
	baixo = true
func _on_baixo_released():
	baixo = false

# Velocidade de movimento do personagem
var speed = 4000
# Define o movimento em 2 eixos
var move = Vector2()

# Inicia a fsica do jogo
func _physics_process(delta):
	
	# Controles do personagem
	if Input.is_action_pressed("ui_right") or direita:
		move.x = speed * delta
		$AnimationPlayer.play("andar para direita") 
	elif Input.is_action_pressed("ui_left") or esquerda: 
		move.x = -speed * delta
		$AnimationPlayer.play("andar para esquerda")
	elif Input.is_action_pressed("ui_up") or cima: 
		move.y = -speed  * delta
		$AnimationPlayer.play("andar para frente")
	elif Input.is_action_pressed("ui_down") or baixo:
		move.y = speed  * delta
		$AnimationPlayer.play("andar para trás")
	else:
		move.x = 0
		move.y = 0
		$AnimationPlayer.stop()
		
	
	
	# Detecta colisões do personagem
#	move_and_slide(move)
	var collision = move_and_collide(move  * delta)
	
	# Se houver uma colisão a cena reinicia
	if collision:
		if collision.collider.name != "Barreira":
			get_tree().reload_current_scene()
			print(collision.collider.name)

# Se o objeto toca a casa ele vence a fase 
func _on_casa_body_entered(body):
	
	if Points.crossingroad == false:
		Points.addpoint()
	Points.crossingroad = true
	get_tree().change_scene("res://scenes/fase 2/Dialogos fase 3/dialogo_fase2_2.tscn")
