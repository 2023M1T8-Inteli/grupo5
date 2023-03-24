extends Node2D

# Botão para direcionar para interface com o mapa e com as fases
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")
