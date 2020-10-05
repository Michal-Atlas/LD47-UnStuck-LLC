extends Node

var Time = 0;
var Money = 5;
var Bill = [];
var Beard = 2;
var Beer = false;
var Food = false;
var Wife = 4;
var BeerDays = 0;

var PlayerSpawnPointX = 0;
var WorkedToday = false;
var ShoppedToday = false;
var YesterdayHadNoMoney = false;

func end_day():
	Bill += [-3, "Rent"]
	if len($"/root/Globals".Bill)==0 and not $"/root/Globals".WorkedToday:
		$"/root/Quester/Control/AnimationPlayer/Spinner/AnimatedSprite3".frame = 2;
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
	if Wife >= 7:
		get_tree().change_scene("res://Endings/END_Happy.tscn");
	if YesterdayHadNoMoney and Money <= 0:
		get_tree().change_scene("res://Endings/END_Street.tscn")
	elif Money <= 0:
		YesterdayHadNoMoney = true;
	else:
		YesterdayHadNoMoney = false;
	Food = false;
	Beer = false;
	WorkedToday = false;
	ShoppedToday = false;
	Time += 1;
