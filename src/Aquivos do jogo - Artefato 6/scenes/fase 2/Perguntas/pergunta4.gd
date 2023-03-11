extends Node2D


func _on_Resposta2_pressed():

	if Points.pergunta24 == false:
		Points.addpoint()
	Points.pergunta24 = true
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")
