extends Node2D



# Código para adicionar o obstáculo na fase 1
var obstaculoScene = preload("res://scenes/fase 3/minigame/Obstaculo.tscn")
var obs

func obstacle():
	# Instância essa cena na cena da fase 1
	obs = obstaculoScene.instance()
	add_child(obs)
	
var audio = AudioServer.get_bus_index("Master")

func _ready():
	obstacle()

func _process(delta):
	
	
	if Points.collision == 1:
		$perdeu.play()
		
	
	$FundoPause/Label.text = pontos
	$FundoPause/Label2.text = "Seu código atual é:"+Points.currentCode
	
	if Points.collision == 1:
		$KinematicBody2D.position = Vector2(55,570)
		Points.collision = 0
	
func _on_Pausar2_pressed():
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

func _on_Button3_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/fase 1/Peguntas/pergunta4.tscn")

#Feedback visual areas do mapa
func _on_RHnotifier_body_entered(body):
	if body == $KinematicBody2D:
		$RHnotifier/RH.show()
func _on_RHnotifier_body_exited(body):
	if body == $KinematicBody2D:
		$RHnotifier/RH.hide()
		
func _on_SPnotifier_body_entered(body):
	if body == $KinematicBody2D:
		$SPnotifier/SP.show()
func _on_SPnotifier_body_exited(body):
	if body == $KinematicBody2D:
		$SPnotifier/SP.hide()

func _on_COMnotifier_body_entered(body):
	if body == $KinematicBody2D:
		$COMnotifier/COMPLIANCE.show()
func _on_COMnotifier_body_exited(body):
	if body == $KinematicBody2D:
		$COMnotifier/COMPLIANCE.hide()
