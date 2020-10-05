extends Node2D


var rng = RandomNumberGenerator.new()
onready var player = get_tree().get_nodes_in_group("Player")[0];
var evening_dialogs = [
	[],#0 empty
	["..."],#1
	["Planing on drinking again?","As usual?...","Here we go again...","We can't have beer for dinner...","I'm done "],#2
	["Evening...","Could you do the shopping tommorow?","Maybe you could take care of dinner for once."],#3
	["Welcome back home TP!","Welcome home!","Good evening!"],#4
	["Welcome back home TP! How was work?", "Welcome back home TP! How was your day?", "Good evening TP! How was the day?" ],#5
	["Good evening TP, did everything go well today?","Welcome back home! Are you feeling well? How was your day?","I'm going to bed early tonight, love you darling."],#6
	["Good evening darling, how was your day?","Good evening darling, thank you so muc for yesterday, dinner was amazing!","Welcome back home darling, everything alright in work today?"],#7
]

var morning_dialogs_good = ["Good morning! Getting ready to go to work?",
"Good morning TP, did you sleep well?", 
"Good morning TP. You're taking a day off today?"
]
var morning_dialogs_bad = ["Shouldn't you be on your way to work?",
 "You could at least go do something with your life and go to work.", "Morning..."
	
]

func _ready():
	rng.randomize()
	if $"/root/Globals".WorkedToday:
		cowsay(evening_dialogs[$"/root/Globals".Wife][rng.randi_range(0,len(evening_dialogs[$"/root/Globals".Wife]))]);
	elif !$"/root/Globals".WorkedToday and $"/root/Globals".Wife <= 4:
		cowsay(morning_dialogs_bad[rng.randi_range(0,len(morning_dialogs_bad))])
	else:
		cowsay(morning_dialogs_good[rng.randi_range(0,len(morning_dialogs_good))])
		
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
	
