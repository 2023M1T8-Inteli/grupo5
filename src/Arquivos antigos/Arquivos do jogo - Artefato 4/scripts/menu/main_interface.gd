extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Botão para ir para a fase 1
func _on_Button_pressed():
	get_tree().change_scene("res://Dialogos/dialogo_fase1_1.tscn")

# Botão para ir para a fase do crossingroad (fase 2)
func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/fase 2/Dialogos fase 3/dialogo_fase2.tscn")

# Botão para voltar para o menu
func _on_Button4_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
