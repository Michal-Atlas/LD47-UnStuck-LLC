extends Node2D


onready var loop = get_node("../looper").return_loop()
#onready var loop = [1,2,3,4,5,6,7,6,5,4,3,2]
const vel = 20
var starting_index = 0
var line_color = Color.blue
# Called when the node enters the scene tree for the first time.

func _ready():	
	pass # Replace with function body.

func _draw():
	var help_x = 0
	var index = starting_index
	while help_x < 200:
		var chord = loop[index]
		draw_line(Vector2(help_x*vel,-chord*vel),Vector2((help_x*vel + vel),-chord*vel),
		line_color,vel)
		help_x += 1
		index += 1
		if index == len(loop):
			index = 0


func _on_Timer_timeout():
	starting_index += 1
	if starting_index >= len(loop):
		starting_index = 0
	update()

func _on_gamer_recording_on():
	line_color = Color.red

func _on_gamer_recording_off():
	line_color = Color.blue



