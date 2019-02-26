extends AudioStreamPlayer

# var BGM_Bus = AudioServer.get_bus_effect(AudioServer.get_bus_index("BGM"), 0)
# onready var filtro_corote = get_node("../Distorcao")
# var pitch_level_aux = 0
# var pitch_shift_value

# func _process(delta):
# 	if filtro_corote.visible == true:
# 		pitch_level_aux = pitch_level_aux + 1
# 		var pitch_shift_value = max(1*sin(pitch_level_aux*0.15) + 1 , 0.5)
# 		BGM_Bus.set_pitch_scale(pitch_shift_value)
# 	else:
# 		pitch_level_aux = 0
# 		BGM_Bus.set_pitch_scale(1)
# 	pass
