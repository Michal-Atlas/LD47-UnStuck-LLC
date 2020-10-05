extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().position.y == 15:
		$AnimatedSprite2.frame = 1
	if get_parent().position.y == 40:
		$AnimatedSprite2.frame = 2
