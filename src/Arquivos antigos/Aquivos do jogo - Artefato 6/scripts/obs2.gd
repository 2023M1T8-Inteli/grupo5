extends KinematicBody2D

# Código para controlar o movimento do obstáculo
var move = Vector2()
var speed = 15

func _ready():
	set_position(Vector2(62,290))
	set_z_index(1)
func _physics_process(delta):
	
	if position.x == 245:
		move.x = - speed
	if position.x == 62:
		move.x = speed

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	if collide:
		get_tree().change_scene("res://scenes/whg.tscn")
