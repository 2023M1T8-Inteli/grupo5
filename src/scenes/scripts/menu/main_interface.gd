extends Node2D

var points

# Variáveis usadas para detectar quando a fase está completa e atualizar a sprite do botão para uma nvoa
var oneCompleted= load("res://sprites/assedio_buttonsheet_completa.png")

var twoCompleted = load("res://sprites/corruption-button-Sheet_completed.png")

var threeCompleted = load("res://sprites/ambienteseguro-button-Sheet_completo.png")

func _ready():
	
	Points.currentSaveCode()
	
	if Points.stateLevel1 == 5:
		$Button.set_normal_texture(oneCompleted)
	
	if Points.stateLevel2 == 6:
		$Button2.set_normal_texture(twoCompleted)
		
	if Points.stateLevel3 == 5:
		$Button3.set_normal_texture(threeCompleted)
		
	# Animação do mapa
	$Sprite2/AnimationPlayer.play("Mapa")
	
	# Mostra os pontos do jogador
	points = get_node("/root/Points")
	
	if Points.stateLevel1 == 5 and Points.stateLevel2 == 6 and Points.stateLevel3 == 5:
		$finish.visible = true
		$exit.visible = true
		$finished.visible = true
		
	$Container/score.text = str(Points.points) + " V Coins"
		
# Mostra os pontos do jogador
	
# Botão para ir para a fase 1
func _on_Button_pressed():
	get_tree().change_scene("res://Dialogos/dialogo_fase1_1.tscn")

# Botão para ir para a fase do crossingroad (fase 2)
func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/fase 2/Dialogos fase 2/dialogo_fase2_1.tscn")

# Botão para voltar para o menu
func _on_Button4_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")

# Botão para ir para a fase 3
func _on_Button3_pressed():
	get_tree().change_scene("res://scenes/fase 3/Dialogos/dialogo_fase3_1.tscn")


func _on_exit_pressed():
	get_node("finish").visible = false
	get_node("exit").visible = false


func _on_finished_pressed():
	get_tree().reload_current_scene()
