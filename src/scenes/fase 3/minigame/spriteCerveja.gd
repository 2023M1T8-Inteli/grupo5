extends KinematicBody2D

var random = RandomNumberGenerator.new()
var num
# Called when the node enters the scene tree for the first time.


var andar = Vector2() #movimento
var velocidade = 20 #velocidade


func _ready():
	andar.y = 10
func _physics_process(delta):
	
	#var collision = move_and_collide(andar * delta)
	move_and_slide(andar)

	# Movimento que quando colidir com algo vai ser decidido uma direção aleatória para seguir
	random.randomize()
	var collision = move_and_collide(andar * delta)
	if collision:
		num = random.randi_range(1, 4)
		print(num)
		
		if num == 1:
			andar.y = 0
			andar.x = velocidade #direita
		elif num == 2:
			andar.y = 0
			andar.x = - velocidade #esquerda
		elif num == 3:
			andar.x = 0
			andar.y = velocidade #baixo
		elif num == 4:
			andar.x = 0
			andar.y = - velocidade #cima
			

	


