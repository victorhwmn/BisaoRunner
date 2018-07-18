extends AnimatedSprite

func _ready():
	pass
	
func _process(delta):
	#Recebe a velocidade do player
	var veloc = get_node("/root/mainGame/Player").velocidade/60
	#Define como velocidae da animação
	frames.set_animation_speed("Movimento",veloc);
	pass
