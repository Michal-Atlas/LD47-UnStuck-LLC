extends ParallaxBackground

var scroll = 0

func _process(delta):	
	# Scroll background
	scroll -= 200 * delta;
	scroll_offset.x = scroll;
