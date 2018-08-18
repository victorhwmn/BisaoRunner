extends AudioStreamPlayer

var pitch = AudioServer.get_bus_effect(AudioServer.get_bus_index("BGM"), 0)
onready var filtro_corote = get_node("../Distorcao")
var gambi = 0
var pitch_shift_value

func _process(delta):
	gambi = gambi + 1
	var pitch_shift_value = max(1*sin(gambi*0.15) + 1 , 0.5)
	if filtro_corote.visible == true:
		pitch.set_pitch_scale(pitch_shift_value)
		
	else:
		#self.volume_db = 0
		pitch.set_pitch_scale(1)
	pass
