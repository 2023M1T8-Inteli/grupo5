extends Node2D

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
	

	
func _process(delta):
	#Soma da lista connected para causar a conexão dos fios
	check = sum(connected)
	#Conexão do fio vermelho
	if check == 40:
		$Connecteds/ConnectRed.visible = true
		$Fios/F_red/Red.visible = false
		get_node("terminais/term100/100").visible = false
		connected.clear()
		on()
		
	#Conexão do fio amarelo
	if check == 7:
		$Connecteds/ConnectYellow.visible = true
		$Fios/F_yellow/Yellow.visible = false
		get_node("terminais/term400/400").visible = false
		connected.clear()
		on()

	#Conexão do fio azul
	if check == 75:
		$Connecteds/ConnectBlue.visible = true
		$Fios/F_blue/Blue.visible = false
		get_node("terminais/term500/500").visible = false
		connected.clear()
		on()
		
	#Conexão do fio branco
	if check == 232:
		$Connecteds/ConnectWhite.visible = true
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
		$Fundo/AnimatedSprite.play("oneError")
	
	if sum(errosCheck) == 34:
		$Fundo/AnimatedSprite.play("twoError")
		
	if sum(errosCheck) == 51:
		$Fundo/AnimatedSprite.play("ThreeError")
		
	if sum(errosCheck) == 68:
		$Again/AgainButton.visible = true
		$Again/AgainFundo.visible = true
		$Again/AgainText.visible = true
	
	#Passou de fase
	if correct == 8:
		$Fundo/AnimatedSprite.play("Win")
		yield(get_tree().create_timer(3), 'timeout')
		if Points.fios == false:
			Points.addpoint()
			Points.fios = true
		get_tree().change_scene("res://scenes/fase 2/Dialogos fase 2/dialogo_fase2_4.tscn")
		
		
		
		
	#Garante que os fios sejam apertados na ordem correta
	if connected.size() == 2:
		connected.clear()
	

#Determina as conexões do fio vermelho
func _on_Red_pressed():
	redWire = 19
	connected.append(redWire)


func _on_100_pressed():
	redConnection = 21
	connected.append(redConnection)

#Determina as conexões do fio amarelo
func _on_Yellow_pressed():
	yellowWire = 3
	connected.append(yellowWire)


func _on_400_pressed():
	yellowConnection = 4
	connected.append(yellowConnection)


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
	
var audio = AudioServer.get_bus_index("Master")

func _on_Pausar_pressed():
	get_tree().paused = true
	$FundoPause.show()

func _on_Button2_pressed():
	get_tree().paused = false
	$FundoPause.hide()
	
var pontos = "Você tem " + str(Points.points) + " pontos"
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(audio, value)
	if value == -30:
		AudioServer.set_bus_mute(audio,true)
	else:
		AudioServer.set_bus_mute(audio,false)
	
func _ready():
	$FundoPause/Label2.text = "Seu código atual é:"+Points.currentCode
	$FundoPause/Label.text = pontos

func _on_Button3_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")
