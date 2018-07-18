extends AudioStreamPlayer

var pitch = AudioServer.get_bus_effect(AudioServer.get_bus_index("BGM"), 0) # get PitchSift Effect from BGM audio bus
onready var filtro_corote = get_node("../Distorcao")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if filtro_corote.visible == true:
		pitch.set_pitch_scale(randi() % 8 + 0.01)
		
	else:
		#self.volume_db = 0
		pitch.set_pitch_scale(1)
	pass
