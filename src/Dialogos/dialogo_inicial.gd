extends ColorRect

#	Exportar o arquivo json
export var dialogPath = ""
export(float) var textSpeed = 0.05

var dialog

var phraseNum = 0 
var finished = false
var botao = false

func _ready():
	# Inciar a animação de fala dos personagens
	$PersonagemVtal/AnimationPlayer.play("boneca_falando")
	# Determina velocidaede que o texto aparece na tela
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	# Se o diálogo não for encontrado retrona essa mensagem
	assert(dialog, "Dialog not found")
	nextPhrase()
	
	# O botão para continuar depois do diálogo só aparece depois que acabar todo diálogo
	$Button.visible = false


var touch
func _on_touch_pressed():
	touch = true

func _process(delta):
	# Se for precisonado enter o texto avança e vai para a próxima frase
	if Input.is_action_just_pressed("ui_accept") or touch:
		if finished:
			nextPhrase()
			touch = false
		else:
			$Text.visible_characters = len($Text.text)
			touch = false
	
	if botao == true:
		$Button.visible = true
	

func getDialog() -> Array:
	# Check if the file of the dialogue exist
	var f = File.new()
	# se a condição for falso retorna essa mensagem
	assert(f.file_exists(dialogPath), "File path does not exist")
	
	# Abre o arquivo
	f.open(dialogPath, File.READ)
	# Transforma o conteúdo dentro do arquivo em um formato texto
	var json = f.get_as_text()
	
	# Transformar o texto em uma variável usavel
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func nextPhrase() -> void:
	# Checar se existe mais dialogo que precisa ser mostrado
	if phraseNum >= len(dialog):
	#	queue_free() # libera a memoria excluindo o tudo que está detro do colorect incluindo o botão
		botao = true
		return
	
	# Mostra se o dialogo acabou
	finished = false
	
	# Determinar o nome e texto em si que irá ser mostrado na tela
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
#	$Text.bbcode_text = "[color=#4ab3ff]"+dialog[phraseNum]["Text"]+"[/color]"
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
	
	finished = true
	phraseNum += 1
	return

# Quando o diálogo for finalizado o botão leva para o menu principal
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")


