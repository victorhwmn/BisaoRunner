extends RigidBody2D
#Enemy Carro

var speed=1.3
func _ready():
	add_to_group("Inimigo")
	set_process(true)
	
	$sfx.play()
	$honk.play()
	
	pass

func _process(delta):

	pass
func hit_by_player():
	get_parent().remove_child(self)
	pass

