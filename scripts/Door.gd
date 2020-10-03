extends Node

export var NewScenePath : String;
export var TargetCoords = Vector2(0,0);
onready var player = get_tree().get_nodes_in_group("Player")[0];

func _input(event):
	if Input.is_action_just_pressed("ui_up") && player in $Area2D.get_overlapping_bodies():
		player.position.x = TargetCoords.x;
		player.position.y = TargetCoords.y;
		get_tree().change_scene(NewScenePath);
		
func _process(delta):
	if player in $Area2D.get_overlapping_bodies():
		$ButtonLabel.visible = true;
	else:
		$ButtonLabel.visible = false;
