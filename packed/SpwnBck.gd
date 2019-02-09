extends Timer

var i = 0;
#Carrega os inimigos
var spawn_items = [
	preload("res://packed/Arvore.tscn"),
	preload("res://packed/Arvore2.tscn"),
	preload("res://packed/Arbusto.tscn")]

#Carrega o PathFollow, container com script que segue o caminho das trilhas
var path_follow = preload("res://packed/SegueCaminho.tscn")

func _ready():
	#chama a função_on_timeout quando o contador acaba
	connect("timeout",self,"_on_timeout")
	
func _on_timeout():
	_spawn_line();
	
func _next_line():
	_spawn_line()	
	
func _spawn_line():
	#Randomiza as variáveis
	randomize();
	
	#Instancia o pathfollow para receber o cenario
	var segue_caminho=path_follow.instance();
	
	#Instancia um cenario alatório do vetor no pathfollow
	var r = rand_range(0,spawn_items.size());
	var item = spawn_items[r].instance();
	#Corrige proporção
	item.set_scale(Vector2(0.6,1));
	segue_caminho.add_child(item);
	
	#Recebe o nó de caminhos
	var caminhos = get_child(0)
	
	#Escolhe um caminho (Índice) aleatório
	r = rand_range(0 , caminhos.get_child_count())
	
	#Instancia o inimigo no caminho definido acima
	caminhos.get_child(r).add_child(segue_caminho)
	

