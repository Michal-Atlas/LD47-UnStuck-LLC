extends KinematicBody2D

func cowsay(msg):
	$ColorRect/Label.text = msg;
	$ColorRect.visible = true;
	$Timer.start();

func _on_Timer_timeout():
	$ColorRect.visible = false;
