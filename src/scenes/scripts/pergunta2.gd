extends Node2D

# Botão com a resposta certa
func _on_RESPOSTA3_pressed():
	
	$Correct/acertou.visible = true
	$Correct/acertouText.visible = true
	
	yield(get_tree().create_timer(5), 'timeout')
	get_tree().change_scene("res://scenes/fase 2/Dialogos fase 3/dialogo_fase2_2.tscn")
	if Points.pergunta21 == false:
		Points.addpoint()
		Points.pergunta21 = true
