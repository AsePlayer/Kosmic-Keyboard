extends Node

var target:TypingItem
var typing_items


# Scans for all keystrokes
func _unhandled_key_input(event:InputEvent):
	if event.is_pressed() and event.is_echo() == false:
		search_letter_in_words(event.as_text())


func search_letter_in_words(letter:String):
	var letter_found:bool = false
	
	# Cache TypingItems parent that contains every TypingItem child
	if typing_items == null: typing_items = get_tree().get_first_node_in_group("TypingItems")
	
	# Search through all TypingItems
	for item:TypingItem in typing_items.get_children():
		# Set target to lock-on to
		if target == null and letter == item.word[0]: 
			target = item

		# Check if the target's correct letter is typed
		if target != null and item == target:
			target.add_character(letter)
			letter_found = true
	
	# Letter not found on any items
	if not letter_found: UI.display_wrong_letter_message(letter, false)
