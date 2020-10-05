extends RichTextLabel

func show_bill():
	clear();
	append_bbcode("[shake rate=5 level=5]");
	add_text("Day "+str($"/root/Globals".Time+1));
	newline()
	newline()
	add_text("Your Bill:");
	newline();
	push_table(2);
	for item in $"/root/Globals".Bill:
		push_cell();
		if (item[0] < 0):
			push_color(Color(1,0,0,1));
		elif (item[0] > 0):
			push_color(Color(0,1,0,1));
		push_align(RichTextLabel.ALIGN_RIGHT);
		add_text(str(item[0])+"$");
		pop();
		pop();
		pop();
		push_cell();
		add_text("\t"+item[1]);
		pop();
	pop();
	newline();
	add_text("--------");
	newline();
	push_table(2);
	push_cell();
	push_align(RichTextLabel.ALIGN_RIGHT);
	if ($"/root/Globals".Money < 1):
		append_bbcode("[shake rate=20 level=20]");
	add_text(str($"/root/Globals".Money)+"$");
	if ($"/root/Globals".Money < 1):
		pop();
	pop();
	pop();
	push_cell();
	add_text("\tTotal");
	pop();
	pop();
	pop();
	$"../../Control".play("Bill_flyin");
