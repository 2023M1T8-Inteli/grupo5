extends Node2D

# Botão que leva para a cena principal
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/main_interface.tscn")
