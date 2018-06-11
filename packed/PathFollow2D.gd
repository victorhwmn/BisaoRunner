extends PathFollow2D


func _ready():
	
	pass

func _process(delta):
	#Recebe a velociade atual do player
	var player = get_node("/root/mainGame/Player");
	
	if(scale.x>=0.8):
		#Incrementa o offset no caminho, baseado no caminho total, para evitar problemas e sincronismo entre caminhos
		set_unit_offset(unit_offset+0.01*(player.velocidade/500));
		#Aumenta a escala dos elementos (profundidade)
		set_scale(scale*1.005);
	else:
		set_scale(scale*1.05);

	
	#Coloca na frente do player se o passou (para dar nocao de profundidade)
	set_z_index((position.y-40)/100);
	#if(position.y>=player.position.y-72):
	#	set_z_index(player.z_index+1);
	
	
	
	#Destroi se chegar ao final do caminho
	if(unit_offset >=1):
		get_parent().remove_child(self)

