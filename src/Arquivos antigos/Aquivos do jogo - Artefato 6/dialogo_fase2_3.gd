extends Node2D

func _ready():
	pass

# Quando o botão precionado vai para o menu do jogo
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
