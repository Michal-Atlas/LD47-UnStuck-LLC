extends Node2D

var paused = false
signal freeze
signal unfreeze
var boss_line = 0
var boss_dialogs = [
	"You can see the loop playing at the bottom. Your job is to identify the loop and record it. Start by pressing the “Record” button, then press “Stop” once you are at the same spot in the loop. The closer, the better.",
"And one last thing: Don’t get stuck! If you don’t stop the recording after a while, it probably means you got stuck too and we’ll have to get you UnStuck.",
"Here, have a try at this sample one, tomorrow you’ll have customers."
]


# Called when the node enters the scene tree for the first time.
func _ready():
	_on_boss_dialog_timer_timeout();
	if $"/root/Globals".Time > 0:
		paused = true; # Replace with function body.

func cowsay(msg):
	$textbox/dialog.text = msg;
	$textbox.visible = true;
	$dialog_timer.start();

func _on_dialog_timer_timeout():
	$textbox.visible = false;

func _on_boss_dialog_timer_timeout():
	boss_line %= len(boss_dialogs)
	if $"/root/Globals".Time == 0:
		if !paused:
#			if boss_line == 0:
#				emit_signal("freeze")
			cowsay(boss_dialogs[boss_line])
			boss_line += 1
#			if boss_line == 2:
#				emit_signal("unfreeze")
