extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	connect("pressed", self, "onPressed")
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		onPressed();

func onPressed() :
	get_tree().quit()
	pass