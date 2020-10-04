extends AudioStreamPlayer

var index = 1
onready var loop = get_node("../looper").return_loop()
#onready var loop = [1,2,3,4,5,6,7,6,5,4,3,2]
var dict = {
1:load("res://Chords/Ver_3/C.ogg"),
2:load("res://Chords/Ver_3/D.ogg"),
3:load("res://Chords/Ver_3/E.ogg"),
4:load("res://Chords/Ver_3/F.ogg"),
5:load("res://Chords/Ver_3/G.ogg"),
6:load("res://Chords/Ver_3/A.ogg"),
7:load("res://Chords/Ver_3/B.ogg")}

# Called when the node enters the scene tree for the first time.
func _ready():
	 pass

func make_sound():
	#if not (index > 0 and loop[index-1]==loop[index]):
	#	self.stream = dict[loop[index]]
	#	self.play()
	self.stream = dict[loop[index]]
	self.play()

func _on_Timer_timeout():
	self.make_sound()
	index += 1
	if index >= len(loop):
		index = 0
