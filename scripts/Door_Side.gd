extends Node

export var NewScenePath : String;
export var TargetCoords = 0;
onready var player = get_tree().get_nodes_in_group("Player")[0];

func _input(event):
	if Input.is_action_just_pressed("ui_up") && player in $".".get_overlapping_bodies():
		$"/root/Globals".PlayerSpawnPointX = TargetCoords;
		get_tree().change_scene(NewScenePath);
		
func _process(delta):
	if player in $".".get_overlapping_bodies():
		$ButtonLabel.visible = true;
		$ButtonLabel2.visible = true;
	else:
		$ButtonLabel.visible = false;
		$ButtonLabel2.visible = false;
