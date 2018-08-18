extends AnimatedSprite

func _ready():
	pass
	
func _process(delta):
	var veloc = 2;
	#Recebe a velocidade do player
	var player = get_node("/root/mainGame/Player");
	if(player):
		veloc = player.velocidade/50;
	#Define como velocidae da animação
	frames.set_animation_speed("chao",veloc);
	pass
