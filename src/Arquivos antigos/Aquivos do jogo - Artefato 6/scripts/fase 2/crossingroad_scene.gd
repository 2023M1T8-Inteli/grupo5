extends Node2D

# Carrega as cenas que estão os carros que aparecem na rua
var carScene = preload("res://scenes/fase 2/carro.tscn")
var car

var carScene2 = preload("res://scenes/fase 2/carro2.tscn")
var car2

var carScene3 = preload("res://scenes/fase 2/carro3.tscn")
var car3



# Limite do timer
var timer_limit = 1000

# Variáveis para gerar valores aleatorios do tempo que os carros surgem na tela
var random1 = 1
var random2 = 1
var random3 = 2


# Variáveis para criação a node do de timer para cada carro
var timer = Timer.new()
var timer2 = Timer.new()
var timer3 = Timer.new()


func _ready():
	
	# Setar o timer para dar loop
	timer.set_one_shot(false)
	timer2.set_one_shot(false)
	timer3.set_one_shot(false)

	# Conecte seu o de timeout à função que deseja repetir
	# Quando o tempo determinado acabar (timeout) a função reinicia
	timer.connect("timeout", self, "car_spaw_1")
	timer2.connect("timeout", self, "car_spaw_2")
	timer3.connect("timeout", self, "car_spaw_3")

	
	# Adicionar à árvore como filho do nó atual
	add_child(timer)
	timer.start()
	
	add_child(timer2)
	timer2.start()
	
	add_child(timer3)
	timer3.start()
	

# Faz a instancia (adiciona) da cena do carro 1 nessa cena
func car_spaw_1():
	car = carScene.instance()
	add_child(car)

	# Cria um valor aleatório para o tempo
	random1 = rand_range(3, 5)

	# Determina o valor aleatório criado acima como o intervalo de tempo para o carro aparecer
	timer.set_wait_time(random1)

# Faz a instancia (adiciona) da cena do carro 2 nessa cena
func car_spaw_2():
	car2 = carScene2.instance()
	add_child(car2)
	
	random2 = rand_range(3, 5)
	
	# Set timer interval
	timer2.set_wait_time(random2)

# Faz a instancia (adiciona) da cena do carro 3 nessa cena
func car_spaw_3():
	car3 = carScene3.instance()
	add_child(car3)

	random3 = rand_range(3, 5)

	# Set timer interval
	timer3.set_wait_time(random3)


func _process(delta):
	# Bloqueia o movimento do personagem além dos limites da tela
	if $mapa/Personagem.position.x > 360 or $mapa/Personagem.position.x == 0 or $mapa/Personagem.position.y == 0 or $mapa/Personagem.position.y == 640:
		 $mapa/Personagem.set_position(Vector2(180, 610))
		



	

