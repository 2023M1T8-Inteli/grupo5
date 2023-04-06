extends KinematicBody2D

# Código para controlar o movimento do obstáculo
var move = Vector2()
var speed = 15

func _ready():
	# Posição inicial
	set_position(Vector2(150, 300))
	set_z_index(1)
	
func _physics_process(delta):
	# Movimento de patrula do obstáculo
	if position.x == 150:
		move.x = speed
		move.y = -speed
	if position.y == 180:
		move.y = speed
		move.x = -speed

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	# Colisão do obstáculo apenas com o player
	if collide:
		Points.collision = 1
