extends Node2D


var rng = RandomNumberGenerator.new()
var new_loop = []	

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	new_loop = generate_new_loop()
	print (new_loop)

func generate_new_loop():
	if $"/root/Globals".Time == 0:
		var loop = [2,2,3,3,4,4,5,5,5,4,4,3,3]
		return(loop)
	else:
		var loop = []
		var chord = rng.randi_range(3,5)
		for i in range(rng.randi_range(10,12)):
			if chord <=2:
				var moves = [0,1,1,1,2]
				var step = moves[rng.randi_range(0,4)]
				chord += step
				chord = max (1, min(abs(chord),7))
			elif chord >= 6:
				var moves = [-1,-1,-1,-2,0]
				var step = moves[rng.randi_range(0,4)]
				chord += step
				chord = max (1, min(abs(chord),7))
			else:
				var moves = [-1,-1,-1,0,1,1,1,2]
				var step = moves[rng.randi_range(0,7)]
				chord += step
				chord = max (1, min(abs(chord),7))	
			for j in range(rng.randi_range(1,3)):
				loop.append(chord)
		return(loop)

func return_loop():
	return(new_loop)
