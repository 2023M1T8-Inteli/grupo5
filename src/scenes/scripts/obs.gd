extends KinematicBody2D

# Código para controlar o movimento do obstáculo
var move = Vector2()
var speed = 15

func _ready():
	set_position(Vector2(205,106))
	set_z_index(1)
	

func _physics_process(delta):
	# Movimento do obstáculo
	if position.x == 205:
		move.x = speed
	if position.x == 258:
		move.x = - speed
	if position.y == 106:
		move.y = speed
	if position.y == 426:
		move.y = - speed

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	# Colisão do obstáculo apenas com o player
	if collide:
		get_tree().change_scene("res://scenes/whg.tscn")
		if collide:
			var colisor = str(collide.collider.name)
			if colisor == "KinematicBody2D":
				get_tree().reload_current_scene()
