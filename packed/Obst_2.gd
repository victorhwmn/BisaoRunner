extends RigidBody2D

#Enemy LIXERA

var _player = null
var speed=1.2

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#_player = get_node('Player')
	add_to_group("Inimigo")
	set_process(true)
	
	$sfx.play()
	
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
func hit_by_player():
	get_parent().remove_child(self)
	pass