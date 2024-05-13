extends Node

var player
var accuracy:float = 100.0

var total_chars:float
var correct_chars:float

enum State {
	START_TYPING,
	IN_GAME,
	GAME_OVER
}

var state:State = State.IN_GAME

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_instance_valid(player): reset_game()
	if not player.is_player_alive(): state = State.GAME_OVER
	
	UI.call_game_over(state == State.GAME_OVER)


func update_accuracy(correct:bool):
	total_chars += 1
	if correct: correct_chars += 1


func get_accuracy():
	if not total_chars: return 100 # Game just started, return 100%
	return snapped(correct_chars / total_chars * 100, 0.01) # Locked to hundreths place


func reset_game():
	total_chars = 0
	correct_chars = 0
	player = get_tree().get_first_node_in_group("Player")
	state = State.IN_GAME
