extends Node

var Time = 0;
var Money = 0;
var Bill = [[8,"Work"],[-5,"Beer"], [-3,"Wife"]];
var Beard = 2;
var Beer = false;
var Food = false;
var Wife = 3;
var BeerDays = 0;

var PlayerSpawnPointX = 0;
var WorkedToday = false;

func end_day():
	if len($"/root/Globals".Bill)==0 and not $"/root/Globals".WorkedToday:
		$"/root/Quester/Control/AnimationPlayer/Spinner/AnimatedSprite3".frame = 2;
	clear_day();
func clear_day():
	for i in $"/root/Globals".Bill:
		$"/root/Globals".Money += i[0];
	$"/root/Globals".Bill = []
	$"/root/Globals".Beard += 1;
	
	if Beer and not Food:
		BeerDays += 1;
	if BeerDays >= 5:
		get_tree().change_scene("res://Endings/END_L8p.tscn");
	if Wife <= 0:
		get_tree().change_scene("res://Endings/END_Divorce.tscn");
	if Wife >= 5:
		get_tree().change_scene("res://Endings/END_Happy.tscn");
	if Money <= 0:
		get_tree().change_scene("res://Endings/END_Street.tscn")
	
	Food = false;
	Beer = false;
	Time += 1;
