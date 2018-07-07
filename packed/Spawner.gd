extends Timer

#Carrega os inimigos
var spawn_items = [
	preload("res://packed/Obst_1.tscn"),
	preload("res://packed/Obst_2.tscn"),
	preload("res://packed/Obst_3.tscn"),
	#preload("res://packed/Obst_Bus.tscn"),
	#preload("res://packed/Obst_Car.tscn"),
	preload("res://packed/Obst_Spd.tscn"),
	preload("res://packed/Item_1.tscn"),
	preload("res://packed/Item_2.tscn")]
	
var linhaAtual = [-1,-1,-1]
var iLinhaAtual = 0
var rndMtx=0
var matrizesNPCs = [
						[
							[-1,4,-1],
							[-1,4,-1],
							[3,-1,5],
							[-1,4,-1]
						],[
							[-1,-1,5],
							[-1,4,-1],
							[5,-1,3],
							[-1,4,-1]
						],[
							[-1,5,-1],
							[-1,5,-1],
							[-1,1,-1],
							[-1,-2,-1]
						],[
							[4,-1,-1],
							[-1,4,-1],
							[2,-1,4],
							[4,-1,-1]
						],[
							[-1,5,-1],
							[-1,4,0],
							[-1,5,-1],
							[-1,0,-1]
						],[
							[0,-1,-1],
							[-1,5,-1],
							[-1,-1,-1],
							[1,5,-1]
						]
					]

#Carrega o PathFollow, container com script que segue o caminho das trilhas
var path_follow = preload("res://packed/SegueCaminho.tscn")
var player = preload("res://packed/Player.tscn")

func _ready():
	#chama a função_on_timeout quando o contador acaba
	connect("timeout",self,"_on_timeout")
	
func _on_timeout():
	for i in range(3):
		_spawn_line(i);
		
func _next_line():
	print(iLinhaAtual)
	#Se a matriz acabou
	if(iLinhaAtual > 3):
		#Randomiza as variáveis
		randomize();
		#Escolhe uma Matriz aleatória
		rndMtx = int(rand_range(0,matrizesNPCs.size()))
		iLinhaAtual=0
	else:
		#Define a proxima da matriz como a linha atual
		linhaAtual=matrizesNPCs[rndMtx][iLinhaAtual]
		iLinhaAtual+=1
	
	for i in range(3):
		_spawn_line(i);
	
	
func _spawn_line(var i):

	#Instancia o pathfollow para receber o inimigo
	var segue_caminho=path_follow.instance();
	segue_caminho.init(i)
	var jogador=player.instance();

	#Instancia um inimigo alatório do vetor no pathfollow
	#var r = int(rand_range(0,spawn_items.size()+(5-(jogador.velocidade/500))))
	if(linhaAtual[i] != -1):	
		var item = spawn_items[linhaAtual[i]].instance()
		segue_caminho.add_child(item)
	#Recebe o nó de caminhos
	var caminhos = get_child(0)

	#Instancia o inimigo no caminho definido acima
	caminhos.get_child(i).add_child(segue_caminho)

	

