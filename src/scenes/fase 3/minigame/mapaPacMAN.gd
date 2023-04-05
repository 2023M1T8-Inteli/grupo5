extends Node2D

# Play na animação de luzes piscando na fase do pacman
func _ready():
	$AnimatedSprite.play("pisca")
