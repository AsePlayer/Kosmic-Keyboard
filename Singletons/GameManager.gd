extends Node

var player
var accuracy:float = 100.0

var total_chars:float
var correct_chars:float

var current_total_chars:float
var current_currect_chars:float

enum State {
	MAIN_MENU,
	START_TYPING,
	IN_GAME,
	GAME_OVER
}

enum Difficulty {
	EASY,
	NORMAL,
	HARD,
	EXPERT,
	XTREME
}

var state:State = State.MAIN_MENU

var difficulty:Difficulty = Difficulty.EASY


const MEDAL = preload("res://Scenes/medal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == State.MAIN_MENU: return
	
	if not is_instance_valid(player): reset_game()
	if not player.is_player_alive(): state = State.GAME_OVER
	
	UI.call_game_over(state == State.GAME_OVER)


func update_accuracy(correct:bool):
	total_chars += 1
	current_total_chars +=1
	if correct: 
		correct_chars += 1
		current_currect_chars += 1


func get_accuracy():
	if not total_chars: return 100 # Game just started, return 100%
	return snapped(correct_chars / total_chars * 100, 0.01) # Locked to hundreths place


func reset_game():
	total_chars = 0
	correct_chars = 0
	current_currect_chars = 0
	current_total_chars = 0
	player = get_tree().get_first_node_in_group("Player")
	state = State.START_TYPING


func enemy_wave_finished():
	if state == State.START_TYPING:
		state = State.IN_GAME
	var medal:Medal = MEDAL.instantiate()
	medal.set_medal(current_currect_chars / current_total_chars * 100)
	add_child(medal)
	current_currect_chars = 0
	current_total_chars = 0
