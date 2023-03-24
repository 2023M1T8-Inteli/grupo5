extends KinematicBody2D

var speed = 100
var temp = randf()
var move = Vector2()


func _ready():
	# Determina a posição do carro
	set_position(Vector2(250, -116))
	# Coloca a sprite do carro acima das outras
	set_z_index(1)

# Faz o carro andar tirando uma valor determinado dele
func _process(delta):
	pass

func _physics_process(delta):
	move.x = -140
	# Detecta colisões do personagem
#	move_and_slide(move)
	var collision = move_and_collide(move * delta)
	
	# Se houver uma colisão a cena reinicia
	if collision:
		print(collision.collider.name)
		get_tree().change_scene("res://scenes/fase 2/crossingroad.tscn")
