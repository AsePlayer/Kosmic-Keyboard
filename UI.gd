extends Node

var wrong_letter_ui:Label
var time_until_removed_message:Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	wrong_letter_ui = get_tree().get_first_node_in_group("WrongLetter") # Label
	time_until_removed_message = wrong_letter_ui.get_child(0) # Timer
	
	wrong_letter_ui.visible = false


func _process(delta):
	# Remove wrong letter message in 2 seconds
	if time_until_removed_message.time_left <= 0: 
		wrong_letter_ui.visible = false


func display_wrong_letter_message(letter:String, target_currently_selected:bool):
	wrong_letter_ui.visible = true
	
	if target_currently_selected: 
		wrong_letter_ui.text = "No letter '" + letter + "' in current word!"
	else: 
		wrong_letter_ui.text = "No letter '" + letter + "' found in available words!"
	
	time_until_removed_message.start()
