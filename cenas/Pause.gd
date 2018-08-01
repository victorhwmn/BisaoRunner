extends Node

func _ready():
	
	pass

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		var texto = get_child(0);
		texto.set_visible(!texto.is_visible());
		get_tree().paused = !(get_tree().paused)
	pass