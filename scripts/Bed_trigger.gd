extends Area2D

onready var player = get_tree().get_nodes_in_group("Player")[0];

func _input(event):
	if Input.is_action_just_pressed("ui_up") && player in get_overlapping_bodies():
		get_tree().change_scene("res://HomeScenes/Sleeping.tscn");
		
func _process(delta):
	if player in get_overlapping_bodies():
		$ButtonLabel.visible = true;
	else:
		$ButtonLabel.visible = false;
		
