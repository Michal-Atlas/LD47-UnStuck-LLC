extends CanvasLayer

var shown = false;
	
func _process(_delta):
	$ColorRect/Beer.modulate = Color(1,1,1,1) if $"/root/Globals".Beer else Color(1,1,1,0.3);
	$ColorRect/Food.modulate = Color(1,1,1,1) if $"/root/Globals".Food else Color(1,1,1,0.3);
func hide():
	$ColorRect.visible = false;

func show():
	$ColorRect.visible = true;
