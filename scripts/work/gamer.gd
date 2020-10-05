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
	$"/root/Globals".WorkedToday = true;
	if goal - length == -1 or goal - length == 1 or goal - length == 0:
		cash = 10
		$"praiser".visible = true
		$"praiser/Label".text = "Perfect!"
		$"Transition_Timer".start()
		
	elif goal - length == 2 or goal - length == -2 or goal - length == 3 or goal - length == -3:
		cash = 8
		$"praiser".visible = true
		$"praiser/Label".text = "Awesome!"
		$"Transition_Timer".start()
		
	elif goal - length == -4 or goal - length == 4:
		cash = 6
		$"praiser".visible = true
		$"praiser/Label".text = "Good!"
		$"Transition_Timer".start()
	
	elif length - goal >= 5:
		$"praiser".visible = true
		$"praiser/Label".text = "You got Stuck!"
		$"Transition_Timer".start()
	
	else:
		$"praiser".visible = true
		$"praiser/Label".text = "Failed!"
		$"Transition_Timer".start()
		
	#print("Cash ",cash)
	$"/root/Globals".Money += cash
	$"/root/Globals".Bill.append([cash,"Work"])

func game_on():			
	if recording:
		rec_length += 1
		
	if rec_length - goal >= 5:
		recording = false
		self.cash_out(rec_length)
		emit_signal("recording_off")
		
func _on_Timer_timeout():
	self.game_on()
	
func _process(delta):
	if Input.is_action_just_pressed("spacebar"):	
		if !recording:
			recording = true
			$rec_button.visible = true
			emit_signal("recording_on")

		else:
			recording = false
			$rec_button.visible = false
			emit_signal("recording_off")
			self.cash_out(rec_length)
			
			

func _on_Transition_Timer_timeout():
	get_tree().change_scene("res://Work.tscn");
