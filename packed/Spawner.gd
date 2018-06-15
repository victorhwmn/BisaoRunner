extends Timer

#Carrega os inimigos
var spawn_items = [
	preload("res://packed/Obst_1.tscn"),
	preload("res://packed/Obst_2.tscn"),
	preload("res://packed/Obst_3.tscn"),
#	preload("res://packed/Obst_Bus.tscn"),
#	preload("res://packed/Obst_Car.tscn"),
	preload("res://packed/Obst_Spd.tscn"),
	preload("res://packed/Item_1.tscn"),
	preload("res://packed/Item_2.tscn")]

#Carrega o PathFollow, container com script que segue o caminho das trilhas
var path_follow = preload("res://packed/SegueCaminho.tscn")

func _ready():
	#chama a função_on_timeout quando o contador acaba
	connect("timeout",self,"_on_timeout")
	
func _on_timeout():
	#Randomiza as variáveis
	randomize()
	
	#Instancia o pathfollow para receber o inimigo
	var segue_caminho=path_follow.instance();
	
	#Instancia um inimigo alatório do vetor no pathfollow
	var r = rand_range(0,spawn_items.size())
	var item = spawn_items[r].instance()
	segue_caminho.add_child(item)
	
	#Recebe o nó de caminhos
	var caminhos = get_child(0)
	
	#Escolhe um caminho (Índice) aleatório
	r = rand_range(0 , caminhos.get_child_count())
	
	#Instancia o inimigo no caminho definido acima
	caminhos.get_child(r).add_child(segue_caminho)
	

