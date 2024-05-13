extends Node2D

@export var lives:int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area:Area2D):
	if area.get_parent().is_in_group("TypingItem"):
		print("damaged")
		area.get_parent().queue_free()
		lives -= 1
		if not is_player_alive():
			rotation = 180


func is_player_alive():
	return lives > 0
