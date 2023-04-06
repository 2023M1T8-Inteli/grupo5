extends KinematicBody2D

# Código para controlar o movimento do obstáculo
var move = Vector2()
var speed = 15

func _ready():
	set_position(Vector2(73,374))
	set_z_index(1)
	

func _physics_process(delta):
	# Movimento do obstáculo
	if position.x == 73:
		move.x = speed
	if position.x == 173:
		move.x = - speed
	if position.y == 374:
		move.y = speed
	if position.y == 400:
		move.y = - speed

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	if collide:
		Points.collision = 1
