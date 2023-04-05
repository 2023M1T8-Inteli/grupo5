extends Node2D



func _on_Resposta2_pressed():
	get_tree().change_scene("res://scenes/fase 1/Peguntas/pergunta3.tscn")
	if Points.pergunta12 == false:
		Points.addpoint()
	Points.pergunta12 = true
