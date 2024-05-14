extends Panel

var game_scene = load("res://Scenes/game_scene.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_easy_pressed():
	GameManager.difficulty = GameManager.Difficulty.EASY
	go_to_game_scene()


func _on_button_normal_pressed():
	GameManager.difficulty = GameManager.Difficulty.NORMAL
	go_to_game_scene()
	pass # Replace with function body.


func _on_button_hard_pressed():
	GameManager.difficulty = GameManager.Difficulty.HARD
	go_to_game_scene()


func _on_button_expert_pressed():
	GameManager.difficulty = GameManager.Difficulty.EXPERT
	go_to_game_scene()


func _on_button_x_treme_pressed():
	GameManager.difficulty = GameManager.Difficulty.XTREME
	go_to_game_scene()


func go_to_game_scene():
	get_tree().change_scene_to_packed(game_scene)
