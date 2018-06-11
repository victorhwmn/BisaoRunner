extends RigidBody2D
#Enemy BIZAO

var speed=1
var _player = null
#var _acceleration=0
#var _max_speed=5

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#_player = get_node('Player')
	add_to_group("Inimigo")
	set_process(true)
	
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#speed += _acceleration
	#speed = min(speed,_max_speed)
	#if(speed < _max_speed):
	#	_acceleration += delta
	
	#posição do player
	#var new_pos = position + Vector2(-0.2,speed)
	#set_position(new_pos)
	#set_scale(scale*1.005)
	pass
func hit_by_player():
	get_parent().remove_child(self)
	pass


