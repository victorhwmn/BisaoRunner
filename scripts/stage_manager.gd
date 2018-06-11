extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const STAGE_GAME = "res://cenas/mainGame.tscn"
const STAGE_CREDITS = "res://cenas/creditos.tscn"
const STAGE_MENU = "res://cenas/mainMenu.tscn"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func change_stage(stage_path):
	# fade to black
	get_node("anim").play("fade_in")
	#yield(get_node("anim"), "finished")
	
	# change stage
	get_tree().change_scene(stage_path)
	
	# fade from black
	get_node("anim").play("fade_out")
	pass