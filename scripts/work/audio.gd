extends AudioStreamPlayer

var index = 0
onready var loop = get_node("../looper").return_loop()
#onready var loop = [1,2,3,4,5,6,7,6,5,4,3,2]
var dict = {1:load("res://audio/Ver_1/Ami.ogg"),
2:load("res://audio/Ver_1/Bdim.ogg"),
3:load("res://audio/Ver_1/Cmaj7.ogg"),
4:load("res://audio/Ver_1/Dmi.ogg"),
5:load("res://audio/Ver_1/Emi.ogg"),
6:load("res://audio/Ver_1/F.ogg"),
7:load("res://audio/Ver_1/G.ogg")}

# Called when the node enters the scene tree for the first time.
func _ready():
	 pass

func make_sound():
	self.stream = dict[loop[index]]
	self.play()

func _on_Timer_timeout():
	self.make_sound()
	index += 1
	if index >= len(loop):
		index = 0
	pass # Replace with function body.
