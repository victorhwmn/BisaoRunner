extends Button

func _ready():
	connect("pressed", self, "on_pause_pressed");
	pass

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		on_pause_pressed();
	pass

func on_pause_pressed():
	var texto = get_child(0);
	texto.set_visible(!texto.is_visible());
	print(get_tree().paused);
	get_tree().paused = !(get_tree().paused)
	pass # replace with function body
