extends Node2D



func _on_Resposta3_pressed():
	get_tree().change_scene("res://scenes/fase 1/Peguntas/pergunta2.tscn")
	if Points.pergunta11 == false:
		Points.addpoint()
	Points.pergunta11 = true
