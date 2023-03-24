extends Node2D

var points

# Variáveis usadas para detectar quando a fase está completa e atualizar a sprite do botão para uma nvoa
var one = load("res://sprites/assedio_buttonsheet.png")
var oneCompleted= load("res://sprites/assedio_buttonsheet.png")

var two = load("res://sprites/corruption-button-Sheet_incompleto.png")
var twoCompleted = load("res://sprites/corruption-button-Sheet_completed.png")

var three = load("res://sprites/ambienteseguro-button-Sheet_incompleto.png")
var threeCompleted = load("res://sprites/ambienteseguro-button-Sheet_completo.png")

func _ready():
	# Animação do mapa
	$Sprite2/AnimationPlayer.play("Mapa")
	
	# Mostra os pontos do jogador
	points = get_node("/root/Points")
	
# Mostra os pontos do jogador
func _process(delta):
	$Container/score.text = str(Points.points) + " Vcoins"
	
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




