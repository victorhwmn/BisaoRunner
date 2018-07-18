extends Node

func _ready():
	
	pass

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		get_tree().paused = !(get_tree().paused);
		get_child(0).set_visible(!get_child(0).is_visible());
	pass