extends Node2D


func _on_Resposta3_pressed():
	if Points.pergunta22 == false:
		Points.addpoint()
	Points.pergunta22 = true
	get_tree().change_scene("res://scenes/fase 2/Perguntas/pergunta3.tscn")
