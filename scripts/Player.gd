extends KinematicBody2D

const UP = Vector2(0,-1);
var movement = Vector2(0,0);

const SPEED = 100;

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		movement.x = SPEED;
	elif Input.is_action_pressed("ui_left"):
		movement.x = -SPEED;
	movement.x -= 5*sign(movement.x);
	movement = move_and_slide(movement, UP);
