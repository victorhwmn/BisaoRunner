extends RigidBody2D
#Enemy Unicornio

var speed=1.3

func _ready():
	add_to_group("Inimigo")
	set_process(true)
	
	$sfx.play()
	
	pass

func _process(delta):
	pass
func hit_by_player():
	get_parent().remove_child(self)
	pass



func _on_sfx_finished():
	$sfx.play()
	pass # replace with function body
