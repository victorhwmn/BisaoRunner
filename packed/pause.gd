extends Button

func _ready():
	connect("pressed", self, "_on_pause_pressed");
	pass

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		_on_pause_pressed();
	pass

func _on_pause_pressed():
	var texto = get_node("/root/mainGame/Pause");
	print(texto)
	texto.set_visible(!texto.is_visible());
	get_tree().paused = !(get_tree().paused)
	pass
