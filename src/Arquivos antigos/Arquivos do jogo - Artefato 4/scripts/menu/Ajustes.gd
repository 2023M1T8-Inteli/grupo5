extends Node2D


# Botão para voltar para o menu
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
