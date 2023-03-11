extends KinematicBody2D

func _ready():
	set_position(Vector2(-250, 100))
	# Coloca a sprite do carro acima das outras
	set_z_index(1)
	
# Faz o carro andar tirando -1 valor da posição atual dele
func _process(delta):
	position.x += 2.7
