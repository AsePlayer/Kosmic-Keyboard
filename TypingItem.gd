extends Node2D
class_name TypingItem

@onready var label = $Label


var word:String
var word_length
var word_progress = 0

var center_labels = ["[center]", "[/center]"]
var color_labels = ["[color=#FFFF00]", "[/color]"]

var words = [
	"APPLE", "LEMON", "GRAPE", "MELON", "BANANA",  # 5-letter words
	"ORANGE", "PEACH", "CARROT", "POTATO", "TOMATO",  # 6-letter words
	"AVOCADO", "LETTUCE", "SPINACH", "BROCCOLI", "CABBAGE",  # 7-letter words
	"COFFEE", "JUICE", "MUFFIN", "COOKIE", "DONUT",  # 5-letter words
	"CHEESE", "BUTTER", "YOGURT", "BREAD", "SALAD",  # 6-letter words
	"SANDWICH", "PANCAKE", "WAFFLE", "SAUSAGE", "BACON",  # 7-letter words
	"PENCIL", "MARKER", "PAPER", "BOOKS", "CHALK",  # 5-letter words
	"CRAYON", "GLUE", "RULER", "ERASER", "PAINT",  # 6-letter words
	"SCISSORS", "BACKPACK", "NOTEBOOK", "DESKTOP", "TABLET",  # 7-letter words
	"BASKET", "SOCCER", "TENNIS", "GOLF", "HOCKEY",  # 5-letter words
	"FOOTBALL", "CRICKET", "BOWLING", "SWIMMING", "RUNNING",  # 7-letter words
]

# Called when the node enters the scene tree for the first time.
func _ready():
	word = words.pick_random()
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
