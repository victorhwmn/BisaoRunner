extends Label

func _ready():
	var points = stage_manager.score;
	set_text(str(points));
	pass