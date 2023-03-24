extends KinematicBody2D

# Código para controlar o movimento do obstáculo
var move = Vector2()
var speed = 15

func _ready():
	set_position(Vector2(276,408))
	set_z_index(1)
	

func _physics_process(delta):
	# Movimento do obstáculo
	if position.x == 276:
		move.x = speed
	if position.x == 276 + 14:
		move.x = - speed
	if position.y == 408:
		move.y = speed
	if position.y == 408 + 140:
		move.y = - speed

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	if collide:
		get_tree().change_scene("res://scenes/whg.tscn")
