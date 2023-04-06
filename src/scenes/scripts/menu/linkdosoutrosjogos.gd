extends Node2D


	
# Link do jogo do grupo 1
func _on_As_aventuras_de_fibrinha_pressed():
	OS.shell_open("https://2023m1t8-inteli.github.io/grupo1/")

# Link do jogo do grupo 2
func _on_Vitlicios_pressed():
	OS.shell_open("https://2023m1t8-inteli.github.io/grupo2/")
	
# Link do jogo do grupo 3
func _on_Mr_Vtal_pressed():
	OS.shell_open("https://2023m1t8-inteli.github.io/grupo3/")

# Link do jogo do grupo 4
func _on_Moraltica_pressed():
	OS.shell_open("https://2023m1t8-inteli.github.io/grupo4/")
	
# voltar para página de ajustes
func _on_voltar_pressed():
	get_tree().change_scene("res://scenes/menu/Ajustes.tscn")
