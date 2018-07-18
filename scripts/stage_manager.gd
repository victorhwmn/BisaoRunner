extends Node

var score=0

const STAGE_GAME = "res://cenas/mainGame.tscn"
const STAGE_CREDITS = "res://cenas/creditos.tscn"
const STAGE_MENU = "res://cenas/mainMenu.tscn"

func _ready():
	
	pass

func change_stage(stage_path):
	# fade to black
	get_node("anim").play("fade_in")
	#yield(get_node("anim"), "finished")
	
	# change stage
	get_tree().change_scene(stage_path)
	
	# fade from black
	get_node("anim").play("fade_out")
	pass