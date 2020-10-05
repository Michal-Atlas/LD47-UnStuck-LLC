extends Node2D

func _ready():
	$Aisle/Shelves/Shop_Shelf/AnimatedSprite.frame = 1;
	$Aisle/Shelves/Shop_Shelf3/AnimatedSprite.frame = 1;
func _exit_tree():
	if $"/root/Globals".ShoppedToday and not $"/root/Globals".Food:
		$"/root/Globals".Wife -= 1;
