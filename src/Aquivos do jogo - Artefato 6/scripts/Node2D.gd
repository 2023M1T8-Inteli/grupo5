extends Node2D

# Código para adicionar o obstáculo na fase 1
var obstaculoScene = preload("res://scenes/Obstaculo.tscn")
var obs

func obstacle():
	# Instância essa cena na cena da fase 1
	obs = obstaculoScene.instance()
	add_child(obs)
	
func _ready():
	obstacle()
	pass
	
