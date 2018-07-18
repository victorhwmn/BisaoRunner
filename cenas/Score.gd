extends Label

func _ready():

#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	var ranking = stage_manager.rank;
	var points = stage_manager.score;
	
	for i in range(5):
		if(ranking[i] < points):
			var j = 4;
			
			while(j > i):
				print(ranking[i]);
				print(ranking[j]);
				ranking[j] = ranking[j-1];
				j-=1;
			
			ranking[i] = points;
			break;
		
	for i in range(5):
		set_text(get_text()+str(i+1)+"º:   "+str(ranking[i])+"\n\n");
	
	pass