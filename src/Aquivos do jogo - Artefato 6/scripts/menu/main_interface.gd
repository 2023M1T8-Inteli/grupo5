extends Node2D
var points

func _ready():
	$Sprite2/AnimationPlayer.play("Mapa")
	
	points = get_node("/root/Points")
	
func _process(delta):
	$Container/score.text = str(Points.points) + " pts"
	
# Botão para ir para a fase 1
func _on_Button_pressed():
	get_tree().change_scene("res://Dialogos/dialogo_fase1_1.tscn")

# Botão para ir para a fase do crossingroad (fase 2)
func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/fase 2/Dialogos fase 3/dialogo_fase2.tscn")

# Botão para voltar para o menu
func _on_Button4_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")

# Botão para ir para a fase 3
func _on_Button3_pressed():
	get_tree().change_scene("res://scenes/pacman.tscn")
