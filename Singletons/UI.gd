extends Node

var wrong_letter_ui:Label
var time_until_removed_message:Timer

var accuracy
var accuracy_text:RichTextLabel
var game_over_node

# Called when the node enters the scene tree for the first time.
func _ready():
	print(GameManager.state)
	if GameManager.state == GameManager.State.START_TYPING:
		cache_UI_elements()
		wrong_letter_ui.visible = false


func _process(delta):
	if GameManager.state == GameManager.State.MAIN_MENU: return
	# Cache UI Elements on Restart
	if not is_instance_valid(wrong_letter_ui) or not is_instance_valid(time_until_removed_message): 
		cache_UI_elements()
	
	# Remove wrong letter message in 2 seconds
	if time_until_removed_message.time_left <= 0: 
		wrong_letter_ui.visible = false
		
	accuracy_text.text = str(GameManager.get_accuracy()) + "%"
	

func display_wrong_letter_message(letter:String, target_currently_selected:bool):
	wrong_letter_ui.visible = true
	
	if target_currently_selected: # Wrong letter for current word
		wrong_letter_ui.text = "No letter '" + letter + "' in current word!"
	else: # Wrong letter for ANY word
		wrong_letter_ui.text = "No letter '" + letter + "' found in available words!"
	
	time_until_removed_message.start()


func cache_UI_elements():
	print("Cacheing")
	wrong_letter_ui = get_tree().get_first_node_in_group("WrongLetter") # Label
	time_until_removed_message = wrong_letter_ui.get_child(0) # Timer
	
	accuracy = get_tree().get_first_node_in_group("Accuracy")
	accuracy_text = accuracy.get_child(0)
	
	game_over_node = get_tree().get_first_node_in_group("GameOver")
	
	call_game_over(false)


func call_game_over(isGameOver:bool):
	game_over_node.visible = isGameOver
	accuracy.visible = isGameOver
