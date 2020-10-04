extends Node

export var NewScenePath : String;
export var TargetCoords = 0;
onready var player = get_tree().get_nodes_in_group("Player")[0];
export var Enabled = true;

func _input(event):
	if Enabled:
		if Input.is_action_just_pressed("ui_up") && player in $".".get_overlapping_bodies():
			$"/root/Globals".PlayerSpawnPointX = TargetCoords;
			get_tree().change_scene(NewScenePath);
			
func _process(delta):
	if Enabled:
		if player in $".".get_overlapping_bodies():
			$ButtonLabel.visible = true;
		else:
			$ButtonLabel.visible = false;
	else:
		$ButtonLabel.visible = false;
