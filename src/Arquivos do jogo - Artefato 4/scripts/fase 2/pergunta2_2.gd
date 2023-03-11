extends Node2D

func _ready():
	pass

# Botão com a resposta certa
func _on_RESPOSTA3_pressed():
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")
