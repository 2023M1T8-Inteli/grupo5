extends KinematicBody2D

var speed = 9000
var move = Vector2()

func _ready():
	# Determina a posição
	# Coloca a sprite do carro acima das outras
	set_z_index(2)

# Faz o carro andar tirando uma valor determinado dele
func _process(delta):
	pass

func _physics_process(delta):
	move.x = -speed * delta
	# Detecta colisões do personagem
#	move_and_slide(move)
	var collision = move_and_collide(move * delta)
	
	# Se houver uma colisão a cena reinicia
	if collision:
		print(collision.collider.name)
		get_tree().change_scene("res://scenes/fase 2/crossingroad.tscn")
