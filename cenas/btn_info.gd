# script btn_info

extends TextureButton


# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	connect("pressed", self, "onPressed")
	# "pressed" is a signal
	# "self" is the button
	# "onPressed" is a function
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	pass
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		onPressed();

func onPressed() :
	stage_manager.change_stage(stage_manager.STAGE_CREDITS)
	pass