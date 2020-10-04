extends Control

var shown = false;

func _input(event):
	if Input.is_action_just_pressed("ui_down"):
		if shown:
			hide_invt();
			shown = false;
		else:
			show_invt();
			shown = true;
	
func show_invt():
	$AnimationPlayer/ColorRect/ItemList/Beer.modulate = Color(1,1,1,1) if $"/root/Globals".Beer else Color(1,1,1,0.3);
	$AnimationPlayer/ColorRect/ItemList/Food.modulate = Color(1,1,1,1) if $"/root/Globals".Food else Color(1,1,1,0.3);
	$AnimationPlayer.play("InventSlideIn");
func hide_invt():
	$AnimationPlayer.play_backwards("InventSlideIn");
