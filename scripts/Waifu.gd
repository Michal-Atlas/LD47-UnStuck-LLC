extends Node2D

onready var player = get_tree().get_nodes_in_group("Player")[0];

func _ready():
	cowsay("You're late!");
	if $"/root/Globals".Wife < 3:
		$AnimatedSprite.animation = "angry";
	else:
		$AnimatedSprite.animation = "idle";

func cowsay(msg):
	$ColorRect/Label.text = msg;
	$ColorRect.visible = true;
	$Timer.start();

func _on_Timer_timeout():
	$ColorRect.visible = false;
	
func _process(delta):
	$AnimatedSprite.flip_h = true if player.position.x > position.x else false;
	
