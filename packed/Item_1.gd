extends RigidBody2D

#Item RU

var _player = null
var hitted = false	#Flag indica se item foi atingido por player
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#_player = get_node("/root").get_node('Player')
	add_to_group("Item")
	set_process(true)
	
	pass

func _process(delta):
	rotate(sin(delta*1000)*0.01)
	
	if $sfx.playing == false && hitted == true:
		get_parent().remove_child(self)
	pass
func hit_by_player():
	$sfx.play()
	hitted = true
	visible = false
	$CollisionShape2D.disabled = true
	pass