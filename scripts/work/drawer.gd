extends Node2D


onready var loop = get_node("../looper").return_loop()
#onready var loop = [1,2,3,4,5,6,7,6,5,4,3,2]
onready var difficulty = set_difficulty($"/root/Globals".Time)
	
onready var vel = min(480/(len(loop)-difficulty), 140/7)
var starting_index = 0
var line_color = Color.blue
# Called when the node enters the scene tree for the first time.

func _ready():	
	pass # Replace with function body.

func _draw():
	var help_x = 0 if !$"/root/Globals".HardCore else 5*vel
	var index = starting_index
	while help_x < len(loop)-difficulty:
		var chord = loop[index]
		draw_line(Vector2(help_x*vel,-chord*vel),Vector2((help_x*vel + vel),-chord*vel),
		line_color,vel)
		help_x += 1
		index += 1
		if index == len(loop):
			index = 0
			
func set_difficulty(day):
	if day == 0:
		var diff = 0
		return (diff)
	elif $"/root/Globals".HardCore:
		var diff = len(loop)-5
		return(diff)
	else:
		var diff = min(len(loop)-1,5 + day)
		return (diff)
		
func _on_Timer_timeout():
	starting_index += 1
	if starting_index >= len(loop):
		starting_index = 0
	update()

func _on_gamer_recording_on():
	line_color = Color.red

func _on_gamer_recording_off():
	line_color = Color.blue



