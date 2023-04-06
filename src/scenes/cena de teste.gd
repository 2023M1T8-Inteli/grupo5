extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Node2D/Popup.hide()

func _process(delta):
	
	if $Sprite.position.x == 300:
		$Sprite.position.x -= 1
	else:
		$Sprite.position.x += 1


func _on_Button_pressed():
	$Node2D/Popup.show()
