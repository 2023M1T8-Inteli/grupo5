extends Popup

# Botão que leva para a próxima etapa na fase
func _on_Proxima_pressed():
	get_tree().change_scene("res://Dialogos/dialogo_fase1_4.tscn")
