extends Node2D
class_name TypingItem

@onready var label = $Label
@onready var shoot_timer = $ShootTimer
@export var is_word:bool
@export var speed:int = 25

var word:String
var word_length
var word_progress = 0

var center_labels = ["[center]", "[/center]"]
var color_labels = ["[color=#FFFF00]", "[/color]"]

var bullet_scene = preload("res://Scenes/TypingItemProjectile.tscn")
var on_screen = false

var spawner

var start_typing:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	spawner = get_parent()
	if start_typing: return
	if is_word: 
		set_word(WordBank.get_word())
		shoot_timer.start()
	else: 
		set_word(WordBank.get_letter())

	update_formatting()

func _process(delta):
	if GameManager.state == GameManager.State.IN_GAME:
		var direction = (GameManager.player.global_position - global_position).normalized()
		position += direction * (speed * delta + 2 * int(not on_screen))
	
	if word_progress > 0: z_index = 2 # Prioritize current word being typed
	if not is_word: z_index = 3 # Super Prioritize single character projectiles


func add_character(letter:String):
	if not on_screen: return false
	
	var is_it_correct:bool = check_correct_letter(letter)
	update_formatting()
	
	return is_it_correct


func check_correct_letter(letter:String):
	if word_progress >= word_length: return false
	if letter == word[word_progress]: 
		word_progress += 1
		return true
	return false


func update_formatting():
	# Destroy for now if word is finished
	if word_progress >= word_length: 
		spawner.enemy_died(is_word)
		queue_free()
		
	# Format word with:  [center -> color -> WORD <- color <- center]
	$Label.text = "%s%s%s%s" % [center_labels[0],       # Start center
	color_labels[0],                                   # Start yellow
	word.insert(word_progress, color_labels[1]),       #   End yellow
	center_labels[1]]                                  #   End center
	

func shoot_bullets():
	var bullet = bullet_scene
	bullet = bullet.instantiate()
	bullet.global_position = global_position
	bullet.position.y += 100
	get_tree().get_first_node_in_group("TypingItems").add_child(bullet)


func _on_shoot_timer_timeout():
	if GameManager.state == GameManager.State.IN_GAME:
		shoot_bullets()


func _on_word_visible_on_screen_screen_entered():
	on_screen = true


func set_word(w:String):
	word = w
	word_length = word.length()
	update_formatting()


func disable_enemy():
	speed = 0

