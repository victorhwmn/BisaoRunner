extends Label

func _ready():
	pass

func _process(delta):
	if(get_node("../Particles2D").is_emitting() and get_node("../Particles2D").get_modulate().a==1):
		set_visible(true);
	else:
		hide();
	pass