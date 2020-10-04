extends KinematicBody2D

const UP = Vector2(0,-1);
var movement = Vector2(0,0);

const SPEED = 200;

func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_pressed("ui_right") && $RightVisibilityNotifier2D.is_on_screen():
		movement.x = SPEED;
	elif Input.is_action_pressed("ui_left") && $LeftVisibilityNotifier2D.is_on_screen():
		movement.x = -SPEED;
	movement.x -= 5*sign(movement.x);
	
	if sign(movement.x) != 0:
		$AnimatedSprite.flip_h = true if sign(movement.x)==1 else false;
	$AnimatedSprite.animation = "idle" if abs(movement.x) < 20 else "run";
	movement = move_and_slide(movement, UP);
