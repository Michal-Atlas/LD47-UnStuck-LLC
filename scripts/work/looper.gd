extends Node2D


var rng = RandomNumberGenerator.new()
var new_loop = []	

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	new_loop = generate_new_loop()
	print (new_loop)

func generate_new_loop():
	var loop = []
	var chord = rng.randi_range(3,5)
	for i in range(rng.randi_range(10,12)):
		if chord <=2:
			chord += rng.randi_range(0,2)
			chord = max (1, min(abs(chord),7))
		elif chord >= 6:
			chord += rng.randi_range(-2,0)
			chord = max (1, min(abs(chord),7))
		else:
			chord += rng.randi_range(-2,2)
			chord = max (1, min(abs(chord),7))	
		for j in range(rng.randi_range(1,4)):
			loop.append(chord)
	return(loop)

func return_loop():
	return(new_loop)
