extends Popup

# Função que reinicia a fase quando é escolhido a resposta errada
func _on_TentarNovamente_pressed():
	get_tree().change_scene("res://scenes/fase 1/Peguntas/pergunta3.tscn")
