extends Node2D

var recording =  false
var rec_length = 0
signal recording_on
signal recording_off
onready var loop = get_node("../looper").return_loop()
#onready var loop = [1,2,3,4,5,6,7,6,5,4,3,2]
onready var goal = len(loop)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func cash_out(length):
	var cash = 0
	if goal - length == 0:
		cash = 10
	elif goal - length == -1 or goal - length == 1:
		cash = 9
	elif goal - length == 2 or goal - length == -2 or goal - length == 3 or goal - length == -3:
		cash = 7
	elif goal - length == -4 or goal - length == 4:
		cash = 5
	
	print("Cash ",cash);
	$"/root/Globals".Money += cash;
	$"/root/Globals".Bill.append([cash,"Work"]);

func game_on():			
	if recording:
		rec_length += 1
		
	if rec_length - goal >= 5:
		#You got stuck
		recording = false
		self.cash_out(rec_length)
		emit_signal("recording_off")
		
func _on_Timer_timeout():
	self.game_on()
	
func _on_Button_pressed():
	if !recording:
		recording = true
		emit_signal("recording_on")
		get_node("../Button").text = "Stop"
	else:
		get_node("../Button").text = "Record"
		recording = false
		emit_signal("recording_off")
		self.cash_out(rec_length)
		rec_length = 0
