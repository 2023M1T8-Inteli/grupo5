extends Node2D

var connections = []
var connected = []
var check = 0

#Variaveis fio vermelho
var red_wire
var red_connection

#Variaveis fio amarelo
var yellow_wire
var yellow_connection

#Variaveis fio azul
var blue_wire
var blue_connection

#Variaveis fio 
var white_wire
var white_connection

#Avalia se é possivel passar de fase
var on = []
var correct

static func sum(array):
	var sum = 0.0
	for element in array:
		sum+= element
	return sum
	
#Sempre que chamada, significa que a pessoa está mais perto de passar de fase
func on():
	on.append(2)
	correct = sum(on)
	
func _ready():
	pass
	
func _process(delta):
	
	#Soma da lista connected para causar a conexão dos fios
	check = sum(connected)
	
	#usando apenas para verificar 
	print(check)
		
	#Conexão do fio vermelho
	if check == 40:
		$Fundo/Connecteds/ConnectRed.visible = true
		connected.clear()
		on()
	#Conexão do fio amarelo
	if check == 7:
		$Fundo/Connecteds/ConnectYellow.visible = true
		connected.clear()
		on()
	#Conexão do fio azul
	if check == 75:
		$Fundo/Connecteds/ConnectBlue.visible = true
		connected.clear()
		on()
	#Conexão do fio branco
	if check == 120:
		$Fundo/Connecteds/ConnectWhite.visible = true
		connected.clear()
		on()
	
	#Passou de fase
	if correct == 8:
		get_tree().change_scene("res://scenes/fase 2/pergunta2_2.tscn")
		
	#Garante que os fios sejam apertados na ordem correta
	if connected.size() == 2:
		connected.clear()
	
	print(on)
#Determina as conexões do fio vermelho
func _on_Red_pressed():
	red_wire = 19
	connected.append(red_wire)
	print(connected)

func _on_100_pressed():
	red_connection = 21
	connected.append(red_connection)
	print(connected)

#Determina as conexões do fio amarelo
func _on_Yellow_pressed():
	yellow_wire = 3
	connected.append(yellow_wire)
	print(connected)

func _on_50_pressed():
	yellow_connection = 4
	connected.append(yellow_connection)
	print(connected)

#Determina as conexões do fio azul
func _on_Blue_pressed():
	blue_wire = 53
	connected.append(blue_wire)

func _on_60_pressed():
	blue_connection = 22
	connected.append(blue_connection)

#Determina as conexões do fio branco
func _on_White_pressed():
	white_wire = 45
	connected.append(white_wire)

func _on_40_pressed():
	white_connection = 75
	connected.append(white_connection)
