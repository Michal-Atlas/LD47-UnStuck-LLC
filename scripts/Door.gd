extends Area2D

export var NewScenePath = "";

func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_up") && get_tree().get_root().get_node("Scene/Player") in get_overlapping_bodies():
		get_tree().change_scene(NewScenePath);
		
func _process(delta):
	if get_tree().get_root().get_node("Scene/Player") in get_overlapping_bodies():
		get_node("../ButtonLabel").visible = true;
	else:
		get_node("../ButtonLabel").visible = false;
