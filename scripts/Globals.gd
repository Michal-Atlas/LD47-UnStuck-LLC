extends Node

var Time = 0;
var Money = 5;
var Bill = [];
var Beard = 2;
var Beer = false;
var Food = false;
var Wife = 4;
var WifeHistory = [4];

var PlayerSpawnPointX = 0;
var WorkedToday = false;
var ShoppedToday = false;
var YesterdayHadNoMoney = false;
var HardCore = false;
var LastBill = [];

func end_day():
	if len($"/root/Globals".Bill)==0:
		$"/root/Quester/Control/AnimationPlayer/Spinner/AnimatedSprite2".frame = 2;
	Bill += [-3, "Rent"]
func clear_day():
	$"/root/Globals".Bill = []
	$"/root/Globals".Beard += 1;
	
	if HardCore:
		if Bill == LastBill:
			get_tree().change_scene("res://Endings/END_L8p.tscn");
		else:
			LastBill = Bill;
	if len(WifeHistory) > 0 and Wife == WifeHistory[0]:
		if len(WifeHistory) >= 3:
			get_tree().change_scene("res://Endings/END_L8p.tscn");
		else:
			WifeHistory.append(Wife);
	else:
		WifeHistory.clear();
		WifeHistory.append(Wife);
		
	if Wife <= 0:
		get_tree().change_scene("res://Endings/END_Divorce.tscn");
	if Wife >= 7:
		get_tree().change_scene("res://Endings/END_Happy.tscn");
	if YesterdayHadNoMoney and Money <= 0:
		get_tree().change_scene("res://Endings/END_Street.tscn")
	elif Money <= 0:
		YesterdayHadNoMoney = true;
		Wife -= 1;
		Money = 0;
	else:
		YesterdayHadNoMoney = false;
	Food = false;
	Beer = false;
	WorkedToday = false;
	ShoppedToday = false;
	Time += 1;
