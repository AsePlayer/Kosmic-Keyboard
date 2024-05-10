extends Node2D
class_name TypingItem

@onready var label = $Label


var word:String
var word_length
var word_progress = 0

var center_labels = ["[center]", "[/center]"]
var color_labels = ["[color=#FFFF00]", "[/color]"]

# Called when the node enters the scene tree for the first time.
func _ready():
	word = WordBank.get_word()
	word_length = word.length()
	
	label.text = word
	update_formatting()


func add_character(letter:String):
	check_correct_letter(letter)
	update_formatting()
	
	# Temporary kill code
	if word_progress >= word_length:
		queue_free() # destroys for now


func check_correct_letter(letter:String):
	if letter == word[word_progress]: 
		word_progress += 1
	else: 
		UI.display_wrong_letter_message(letter, true)


func update_formatting():
	var formatted_word:String = word
	
	# Determine where yellow (word progress) stops
	formatted_word = formatted_word.insert(word_progress,"[/color]") 
	
	# Format word with:  [center -> color_progress -> WORD <- color_progress <- center]
	formatted_word = "%s%s%s%s" % ["[center]", "[color=#FFFF00]", formatted_word, "[/center]"]
	label.text = formatted_word
