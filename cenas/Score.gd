extends Label

func _ready():
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	var ranking = [0, 0, 0, 0, 0];
	var points = stage_manager.score;
	
	for i in range(4):
		if(ranking[i] < points):
			ranking[i] = points;
			break;
	
	set_text(str(ranking[0])+"\n"+str(ranking[1]));
	pass