extends KinematicBody2D

# Código para controlar o movimento do obstáculo
var move = Vector2()
var speed = 15

func _ready():
	# Posição inicial
	set_position(Vector2(60, 480))
	set_z_index(1)
	
func _physics_process(delta):
	# Movimento de patrula do obstáculo
	if position.x == 200:
		move.x = - speed
	if position.x == 60:
		move.x = speed
	if position.y == 480:
		move.y = speed
	if position.y == 500:
		move.y = -speed

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	# Colisão do obstáculo apenas com o player
	if collide:
		Points.collision = 1
