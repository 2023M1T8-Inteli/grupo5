extends Popup

# Botão que leva para a próxima etapa na fase
func _on_Proxima_pressed():
	get_tree().change_scene("res://scenes/fase 1/Peguntas/pergunta1.tscn")
