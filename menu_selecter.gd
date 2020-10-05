extends Node


var pos = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if $"/root/Globals".WorkedToday and $"/root/Globals".ShoppedToday :
		pos = 0
		if Input.is_action_just_pressed("spacebar"):
			$"../HomeButton".press()
			
	elif $"/root/Globals".WorkedToday:
		if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
			if pos == 2:
				pos = 0
			elif pos ==1:
				pos = 0
			else:
				pos = 2
				
		elif Input.is_action_just_pressed("spacebar"):
			if pos == 0:
				$"../HomeButton".press()
			elif pos ==2:
				$"../ShopButton".press()
		
	elif $"/root/Globals".ShoppedToday:
		if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
			if pos == 2:
				pos = 0
			elif pos == 1:
				pos = 0
			else:
				pos = 1
				
		elif Input.is_action_just_pressed("spacebar"):
			if pos == 0:
				$"../HomeButton".press()
			elif pos == 1:
				$"../WorkButton".press()
	
	
	else:
		if Input.is_action_just_pressed("ui_down"):
			if pos == 2:
				pos = 0
			else:
				pos +=1
			
		elif Input.is_action_just_pressed("ui_up"):
			if pos == 0:
				pos = 2
			else:
				pos -= 1
		elif Input.is_action_just_pressed("spacebar"):
			if pos == 0:
				$"../HomeButton".press()
			elif pos ==1:
				$"../WorkButton".press()
			elif pos ==2:
				$"../ShopButton".press()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
