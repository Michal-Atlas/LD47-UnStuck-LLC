extends Node2D

onready var player = get_tree().get_nodes_in_group("Player")[0];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_up") && player in $"Area2D".get_overlapping_bodies() && $"/root/Globals".Beer == true:
		if $"/root/Globals".Food and not $"/root/Globals".Beer:
			$"/root/Quester/Control/AnimationPlayer/Spinner/AnimatedSprite3".frame = 1;
		
		$"/root/Globals".Beer = false;
		$"/root/Quester".set_to(0);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"/root/Globals".WorkedToday == false:
		if player in $"Area2D".get_overlapping_bodies():
			$WLabel.visible = true
			$Label.visible = true
			$AnimatedSprite.frame = 3
		else:
			$WLabel.visible = false
			$Label.visible = false
			$AnimatedSprite.frame = 0
	else:
		if player in $"Area2D".get_overlapping_bodies():
			$WLabel.visible = true
			$Label.visible = true
			$AnimatedSprite.frame = 2
		else:
			$WLabel.visible = false
			$Label.visible = false
			$AnimatedSprite.frame = 1
