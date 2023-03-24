extends KinematicBody2D

var speed = 100
var temp = randf()
var move = Vector2()

var pos = [-10, 70, 4, 5, 6]

func _ready():
	# Determina a posição
	set_position(Vector2(250, -110))
	# Coloca a sprite do carro acima das outras
	set_z_index(1)

# Faz o carro andar tirando uma valor determinado dele
func _process(delta):
	position.x -= 140 * delta
