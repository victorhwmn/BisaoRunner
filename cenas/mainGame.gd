extends Node2D

onready var filtro_corote = get_node("Distorcao")
onready var music = get_node("music")
onready var music_veneno = get_node("music_veneno")
onready var tween = get_node("Tween")

export var transition_duration = 0.01
export var transition_type = 1 # SINE

func _on_Player_veneno_flag():
	fade_out(music)
	fade_in(music_veneno)

func _on_Timer_timeout():
	fade_out(music_veneno)
	fade_in(music)

func fade_out(stream_player):
    tween.interpolate_property(stream_player, "volume_db", 0, -40, transition_duration, transition_type, Tween.EASE_IN, 0)
    tween.start()
	
func fade_in(stream_player):
    tween.interpolate_property(stream_player, "volume_db", -40, 0, transition_duration, transition_type, Tween.EASE_IN, 0)
    tween.start()

