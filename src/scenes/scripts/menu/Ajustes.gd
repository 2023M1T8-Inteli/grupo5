extends Node2D

onready var transition = get_node("Transition/fill")
onready var animation = get_node("Transition/fill/AnimationPlayer")

export (int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertical", "Corte Horizontal") var transition_type
export (float, 2.0) var duration = 1.0

var audio = AudioServer.get_bus_index("Master")

func _ready():
	transition.material.set_shader_param("type", transition_type)
	animation.playback_speed = duration
	$AudioStreamPlayer2D.play(true)


# Botão para voltar para o menu
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")

# Ajuste do volume do som do jogo
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(audio, value)
	
	if value == -30:
		AudioServer.set_bus_mute(audio,true)
	else:
		AudioServer.set_bus_mute(audio,false)
