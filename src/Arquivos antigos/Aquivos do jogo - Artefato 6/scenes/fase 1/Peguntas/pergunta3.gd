extends Node2D

func _on_Resposta3_pressed():
	if Points.pergunta13 == false:
		Points.addpoint()
	Points.pergunta13 = true
	get_tree().change_scene("res://scenes/fase 1/Peguntas/pergunta4.tscn")
