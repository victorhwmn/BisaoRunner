extends Node

var score=0
var rank = [0,0,0,0,0]
var save_game = File.new()
var save_path = "user://saveBizao.save"
var i
var save_data = { 
	"highscore0" : 0,
	"highscore1" : 0,
	"highscore2" : 0,
	"highscore3" : 0,
	"highscore4" : 0
	}	 

const STAGE_GAME = "res://cenas/mainGame.tscn"
const STAGE_CREDITS = "res://cenas/creditos.tscn"
const STAGE_MENU = "res://cenas/mainMenu.tscn"

func _ready():
	load_game()
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
func save_game() :
	save_game.open_encrypted_with_pass(save_path,File.WRITE,"BIZAO")
	i = 0
	for i in 5 :
		save_data["highscore"+str(i)] = rank[i]
	save_game.store_var(save_data)
	save_game.close()
func load_game() :
	if not save_game.file_exists(save_path) :
		return
	save_game.open_encrypted_with_pass(save_path,File.READ,"BIZAO")
	var save_data = save_game.get_var()
	save_game.close()
	i = 0
	for i in 5 :
		rank[i] = save_data["highscore"+str(i)]
		
		
	
	
	