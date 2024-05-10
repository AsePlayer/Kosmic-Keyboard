extends Node

var default_words:Array[String] = [
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

var words:Array[String] = default_words.duplicate()


func get_word():
	if words.size() == 0: # Null safeguard
		words = default_words.duplicate()
	
	var word = words.pick_random() # Pick random word
	words.erase(word) # Prevent duplicate words
	
	return word
