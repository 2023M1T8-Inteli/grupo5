extends Node2D

var erro = Color(1, 0, 0, 1)
var errosCheck = []

var connections = []
var connected = []
var check = 0

#Variaveis fio vermelho
var redWire
var redConnection

#Variaveis fio amarelo
var yellowWire
var yellowConnection

#Variaveis fio azul
var blueWire
var blueConnection

#Variaveis fio 
var whiteWire
var whiteConnection

#Avalia se é possivel passar de fase
var on = []
var correct

static func sum(array):
	var sum = 0.0
	for element in array:
		sum+= element
	return sum
	
func wrong():
	errosCheck.append(17)
	
#Sempre que chamada, significa que a pessoa está mais perto de passar de fase
func on():
	on.append(2)
	correct = sum(on)
	
func _ready():
	pass
	
func _process(delta):
	
	print(errosCheck)
	#Soma da lista connected para causar a conexão dos fios
	check = sum(connected)
	
	#usando apenas para verificar 
	print(check)
		
	#Conexão do fio vermelho
	if check == 40:
		$Fundo/Connecteds/ConnectRed.visible = true
		$Fios/F_red/Red.visible = false
		get_node("terminais/term100/100").visible = false
		connected.clear()
		on()
		
	#Conexão do fio amarelo
	if check == 7:
		$Fundo/Connecteds/ConnectYellow.visible = true
		$Fios/F_yellow/Yellow.visible = false
		get_node("terminais/term400/400").visible = false
		connected.clear()
		on()

	#Conexão do fio azul
	if check == 75:
		$Fundo/Connecteds/ConnectBlue.visible = true
		$Fios/F_blue/Blue.visible = false
		get_node("terminais/term500/500").visible = false
		connected.clear()
		on()
		
	#Conexão do fio branco
	if check == 232:
		$Fundo/Connecteds/ConnectWhite.visible = true
		$Fios/F_white/White.visible = false
		get_node("terminais/term1GB/1GB").visible = false
		connected.clear()
		on()
		
	#Conexões incorretas
	#Vermelho - 1GB
	if check == 206:
		wrong()
		
	#Vermelho - 500
	if check == 41:
		wrong()

	#Vermelho - 300
	if check == 1019:
		wrong()
	
	#Vermelho - 400
	if check == 23:
		wrong()
		
	#Amarelo - 1GB
	if check == 190:
		wrong()
	
	if check == 25:
		wrong()
	
	if check == 24:
		wrong()
		
	if check == 1003:
		wrong()
		
	if check == 74:
		wrong()
	
	if check == 57:
		wrong()
	
	if check == 240:
		wrong()

	if check == 1053:
		wrong()
	
	 #erros branco
	if check == 66:
		wrong()
		
	if check == 49:
		wrong()
		
	if check == 67:
		wrong()
		
	
	if check == 1045:
		wrong()

	#visualização do erro
	if sum(errosCheck) == 17:
		$erros/vida11.color = erro
		$erros/vida12.color = erro
	
	if sum(errosCheck) == 34:
		$erros/vida21.color = erro
		$erros/vida22.color = erro
		
	if sum(errosCheck) == 51:
		$erros/vida31.color = erro
		$erros/vida32.color = erro
		
	if sum(errosCheck) == 68:
		$Again/AgainButton.visible = true
		$Again/AgainFundo.visible = true
		$Again/AgainText.visible = true
	
	#Passou de fase
	if correct == 8:
		get_node("Fundo/Fire").play("run")
		get_node("Fundo/Fire").visible = true
		get_node("Fundo/Fire2").play("run")
		get_node("Fundo/Fire2").visible = true
		get_node("Fundo/Fire3").play("run")
		get_node("Fundo/Fire3").visible = true
		yield(get_tree().create_timer(5), 'timeout')
		if Points.fios == false:
			Points.addpoint()
		Points.fios == true
		get_tree().change_scene("res://scenes/fase 2/Perguntas/pergunta1.tscn")
		
		
		
		
	#Garante que os fios sejam apertados na ordem correta
	if connected.size() == 2:
		connected.clear()
	
	print(on)
#Determina as conexões do fio vermelho
func _on_Red_pressed():
	redWire = 19
	connected.append(redWire)
	print(connected)

func _on_100_pressed():
	redConnection = 21
	connected.append(redConnection)
	print(connected)

#Determina as conexões do fio amarelo
func _on_Yellow_pressed():
	yellowWire = 3
	connected.append(yellowWire)
	print(connected)

func _on_400_pressed():
	yellowConnection = 4
	connected.append(yellowConnection)
	print(connected)

#Determina as conexões do fio azul
func _on_Blue_pressed():
	blueWire = 53
	connected.append(blueWire)

func _on_500_pressed():
	blueConnection = 22
	connected.append(blueConnection)

#Determina as conexões do fio branco
func _on_White_pressed():
	whiteWire = 45
	connected.append(whiteWire)

func _on_1GB_pressed():
	whiteConnection = 187
	connected.append(whiteConnection)

#conexão 300(sem fio aparente)
func _on_300_pressed():
	connected.append(1000)

#Tentar novamente
func _on_AgainButton_pressed():
	get_tree().reload_current_scene()
