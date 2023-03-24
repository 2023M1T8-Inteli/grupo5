extends KinematicBody2D

func _ready():
	# Determina a posição
	set_position(Vector2(205, 185))
	# Coloca a sprite do carro acima das outras
	set_z_index(1)

# Faz o carro andar tirando uma valor determinado dele
func _process(delta):
	position.x -= 140 * delta
