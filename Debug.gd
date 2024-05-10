extends Node

@export var debug_enabled:bool
# Called when the node enters the scene tree for the first time.
func _ready():
	if debug_enabled: print("Debug Activated!")
	else: queue_free()


func _on_reset_button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
