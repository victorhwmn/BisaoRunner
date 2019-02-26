extends RigidBody2D

#Atributos do player
var velocidade = 500;
const INCR_VELOC = 0.05;
var pontuacao;
var movimentacao;
var newMov;
var veneno=0

# Movimentação
var direcao=0;
var flag=0;
var flag_y = 0;
const SWIPE_MIN = 5;
var deslocamento = Vector2(5,0)
var deslocamento_y = Vector2(0,5)

#Maquina de estados de posições
enum CAMINHO { CENTRAL , DIREITO , ESQUERDO};
var caminhoAtual=CENTRAL;

#Sinais do Player
signal veneno_flag

func _ready():
	#Cria particulas invisíveis para deixar em cache e evitar travamentos
	
	get_node("Particles2D").set_emitting(true);
	connect("body_entered",self,"_on_body_enter")
	set_process(true);
	set_process_input(true);
	
	#Inicializa pontuação
	pontuacao=0
	
	pass

func _physics_process(delta):
	var colisao = get_child(4);
	
	if(abs(flag_y) == 1) : 
		colisao.set_disabled(1)
	elif(flag_y == 0) :
		colisao.set_disabled(0)
		
	
	#Distorce com o veneno
	if(veneno>0):
		set_rotation_degrees(sin(pontuacao)*(veneno*10))
	
	#Atualiza posição do player
	_atualiza_pos(direcao);
	
	velocidade+=INCR_VELOC;
	#print("velociade :", velocidade);
	pass

func _input(event):
	
	var inputDireita=false;
	var inputEsquerda=false;
	var inputCima = false;
	
	if(!veneno): #Movimentação normal 
		inputEsquerda = event.is_action_pressed("ui_left") or (event is InputEventScreenDrag and event.relative.x<-SWIPE_MIN);
		inputDireita = event.is_action_pressed("ui_right") or (event is InputEventScreenDrag and event.relative.x>SWIPE_MIN);
	else:        #Movimentação invertida
		inputEsquerda = event.is_action_pressed("ui_right") or (event is InputEventScreenDrag and event.relative.x>SWIPE_MIN);
		inputDireita = event.is_action_pressed("ui_left") or (event is InputEventScreenDrag and event.relative.x<-SWIPE_MIN);
	
	inputCima = event.is_action_pressed("ui_up") or (event is InputEventScreenDrag and event.relative.y<-SWIPE_MIN);
	
	#Tratamento do input
	if inputEsquerda:
		direcao=-1;
	elif inputDireita:
		direcao=1;
	elif inputCima :
		direcao=2;
	else:
		direcao=0;
	pass


func _atualiza_pos(direcao):
	
	if(abs(direcao) == 1 or abs(flag) == 1) : 
		#Atualiza o caminho atual quando chega na posição certa
		if(position.x == 72):
			caminhoAtual=CAMINHO.CENTRAL;
		if (position.x == 17):
			caminhoAtual=CAMINHO.ESQUERDO;
		if(position.x == 127):
			caminhoAtual=CAMINHO.DIREITO;
	
		match caminhoAtual:
			
			CAMINHO.CENTRAL:
				if(position.x>=17 and ( direcao<0 or flag <0)):
					flag=-1;
					set_position(position+deslocamento*-1);
					if(position.x == 17) :
						flag = 0;
						caminhoAtual=CAMINHO.ESQUERDO;
				if(position.x<=127 and (direcao>0 or flag>0)):
					flag=1;
					set_position(position+deslocamento*1);
					if(position.x == 127) :
						flag = 0;
						caminhoAtual=CAMINHO.DIREITO;
		
			CAMINHO.ESQUERDO:
				if(position.x<=72 and (direcao>0 or flag>0)):
					flag = 1;
					set_position(position+deslocamento*1);
					if(position.x==72) :
						flag = 0;
						caminhoAtual=CAMINHO.CENTRAL;
				
			CAMINHO.DIREITO:
				if(position.x>=72 and (direcao<0 or flag<0)):
					flag = -1;
					set_position(position+deslocamento*-1);
					if(position.x==72) :
						flag = 0;
						caminhoAtual=CAMINHO.CENTRAL;
						
	if(direcao == 2 or flag_y != 0) :
		if(direcao ==  2 and flag_y == 0) :
			flag_y = 1;
		if(flag_y == 1):
			set_position(position-deslocamento_y);
			if(position.y == 95):
				flag_y = -1;
		elif(flag_y == -1):
			set_position(position+deslocamento_y);
			if(position.y == 200):
				flag_y = 0;
		
		
func _pontuacao():
	#Aumenta a pontuação de acordo com o tempo
		pontuacao+=1;

func _on_body_enter(other):
	
	
	if(other.is_in_group("Inimigo")):
		other.hit_by_player();
		#Envia o score para o stage manager
		stage_manager.score=pontuacao;
		#Cria uma nova arvore de jogo e deleta a atual
		get_tree().change_scene("res://cenas/replay.tscn");
	
	elif(other.is_in_group("ItemRuim")):
		other.hit_by_player();
		get_node("../Distorcao").set_visible(true);
		get_node("../Distorcao/Timer").start();
		veneno=1;
		emit_signal("veneno_flag")
	
	
	elif(other.is_in_group("Item")):
		other.hit_by_player();
		
		var particulas=get_node("Particles2D");
		
		#Exibir particulas
		if(particulas.get_modulate().a==0):
			var cor=Color(particulas.get_modulate().r,particulas.get_modulate().g,particulas.get_modulate().b,1);
			get_node("Particles2D").set_modulate(cor);
			
		#Emitir particulas
		get_node("Particles2D").set_emitting(true);
		
		#Aumenta a pontuação do player
		pontuacao+=250;
		velocidade+=2;
	pass
