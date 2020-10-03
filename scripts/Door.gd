extends Area2D

export var NewScenePath = "";
export var TargetCoords = Vector2(0,0);
func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_up") && $"/root/Player" in get_overlapping_bodies():
		$"/root/Player".position.x = TargetCoords.x;
		$"/root/Player".position.y = TargetCoords.y;
		get_tree().change_scene(NewScenePath);
		
func _process(delta):
	if get_tree().get_root().get_node("Player") in get_overlapping_bodies():
		get_node("../ButtonLabel").visible = true;
	else:
		get_node("../ButtonLabel").visible = false;
