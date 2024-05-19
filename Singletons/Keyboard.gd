extends Node

var target:TypingItem
var typing_items

var closest_item:TypingItem

# Scans for all keystrokes
func _unhandled_key_input(event:InputEvent):
	if GameManager.state == GameManager.State.GAME_OVER: return
	if event.is_pressed() and event.is_echo() == false:
		search_letter_in_words(event.as_text())


func sort_by_distance(a:Node2D, b:Node2D):
	var player_pos = GameManager.player.position
	if abs(a.position - player_pos) < abs(b.position - player_pos):
		return true
	return false

func search_letter_in_words(letter:String):
	var letter_found:bool = false
	var char_found:bool = false
	
	var player = GameManager.player
	var closest_distance = Vector2.INF
	var targets_sorted_by_distance:Array[TypingItem] = []
	
	# Cache TypingItems parent that contains every TypingItem child
	if typing_items == null: typing_items = get_tree().get_first_node_in_group("TypingItems")
	
	for t in typing_items.get_children():
		targets_sorted_by_distance.append(t)
	targets_sorted_by_distance.sort_custom(sort_by_distance)

	# Search through all TypingItems
	for item:TypingItem in targets_sorted_by_distance:
		# Set target to lock-on to using first letter in word
		if item.on_screen and target == null and letter == item.word[0]:
			target = item

		# Check if the target's correct letter is typed
		if target != null and item == target and target.is_word:
			letter_found = item.add_character(letter)
		
		# Type 1 projectile despite being mid-word
		if not item.is_word and item.word[0] == letter and not char_found:
			char_found = item.add_character(letter)
	
	# Letter not found on any items
	if (not letter_found and not char_found): 
		UI.display_wrong_letter_message(letter, false)
	
	GameManager.update_accuracy(letter_found or char_found)
