extends Node2D

var paused = false
signal freeze
signal unfreeze
var boss_line = 0
var boss_dialogs = [
	"Hey TP, welcome back from the vacay. Hope you enjoyed it, but it’s time to get back to work here at UnStuck LLC.",
"Our job is to get our fellow citizens UnStuck, when they get stuck in a loop. Here’s your work desk. The new Loopers came in, so I’ll show you how to work with them. Press W to get started.",
]


# Called when the node enters the scene tree for the first time.
func _ready():
	if not $"/root/Globals".WorkedToday:
		_on_boss_dialog_timer_timeout(); # Replace with function body.

func cowsay(msg):
	$textbox/dialog.text = msg;
	$textbox.visible = true;
	$dialog_timer.start();

func _on_dialog_timer_timeout():
	$textbox.visible = false;

func _on_boss_dialog_timer_timeout():
	if boss_line < len(boss_dialogs):
		if $"/root/Globals".Time == 0:
			if !paused:
				if boss_line == 0:
					emit_signal("freeze")
				cowsay(boss_dialogs[boss_line])
				boss_line += 1
				if boss_line == 1:
					emit_signal("unfreeze")
		
		if $"/root/Globals".Time == 1:
			if !paused:		
				cowsay("Good morning TP, you know how it’s done, so get Mr. King UnStuck!")
				emit_signal("unfreeze")
				paused = true
