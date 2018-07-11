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
const SWIPE_MIN = 5;

#Maquina de estados de posições
enum CAMINHO { CENTRAL , DIREITO , ESQUERDO};
var caminhoAtual=CENTRAL;

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
	#Distorce com o veneno
	if(veneno>0):
		set_rotation_degrees(sin(pontuacao)*(veneno*10))
	
	#Atualiza posição do player
	_atualiza_pos(direcao);	
	
	
	velocidade+=INCR_VELOC;
	#print("velociade :", velocidade);
	pass

func _input(event):
	
	if event.is_action("ui_click") or (event.is_action_released("ui_click")):
		direcao=0;
		get_tree().set_input_as_handled();
	elif(event.is_action_pressed("ui_left") or (event is InputEventScreenDrag and event.relative.x<-SWIPE_MIN)):
		direcao=-1;
	elif(event.is_action_pressed("ui_right") or (event is InputEventScreenDrag and event.relative.x>SWIPE_MIN)):
		direcao=1;
	else :
		direcao=0;
	pass


func _atualiza_pos(direcao):
	
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
				set_position(position+Vector2(-5,0));
				if(position.x == 16) :
					flag = 0;
					caminhoAtual=CAMINHO.ESQUERDO;
			if(position.x<=127 and (direcao>0 or flag>0)):
				flag=1;
				set_position(position+Vector2(5,0));
				if(position.x == 16) :
					flag = 0;
					caminhoAtual=CAMINHO.DIREITO;
		
		CAMINHO.ESQUERDO:
			if(position.x<=72 and (direcao>0 or flag>0)):
				flag = 1;
				set_position(position+Vector2(5,0));
				if(position.x==72) :
					flag = 0;
					caminhoAtual=CAMINHO.CENTRAL;
				
		CAMINHO.DIREITO:
			if(position.x>=72 and (direcao<0 or flag<0)):
				flag = -1;
				set_position(position+Vector2(-5,0));
				if(position.x==72) :
					flag = 0;
					caminhoAtual=CAMINHO.CENTRAL;
		
func _pontuacao():
	#Aumenta a pontuação de acordo com o tempo
		pontuacao+=1;

func _on_body_enter(other):
	
	
	if(other.is_in_group("Inimigo")):
		other.hit_by_player();
		#Cria uma nova arvore de jogo e deleta a atual
		get_tree().change_scene("res://cenas/mainMenu.tscn");
	
	elif(other.is_in_group("ItemRuim")):
		other.hit_by_player();
		get_node("../Distorcao").set_visible(true);
		get_node("../Distorcao/Timer").start();
		veneno+=1;
	
	
	elif(other.is_in_group("Item")):
		other.hit_by_player();
		
		var particulas=get_node("Particles2D");
		
		#Exibir particulas
		if(particulas.get_modulate().a==0):
			var cor=Color(particulas.get_modulate().r,particulas.get_modulate().g,particulas.get_modulate().b,1)
			get_node("Particles2D").set_modulate(cor);
			
		#Emitir particulas
		get_node("Particles2D").set_emitting(true);
		
		#Aumenta a pontuação do player
		pontuacao+=250;
		velocidade+=2;
	pass
