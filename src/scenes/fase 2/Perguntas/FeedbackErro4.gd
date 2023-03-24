extends Popup

# Botão que leva para a próxima etapa na fase
func _on_TentarNovamente_pressed():
	get_tree().change_scene("res://scenes/fase 2/Perguntas/pergunta4.tscn")
