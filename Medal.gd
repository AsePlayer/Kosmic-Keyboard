extends Node2D
class_name Medal

const FADE_DURATION = 0.5 # Duration for fading in and out
const FADE_DELAY = 1.5 # Delay before starting to fade out

const BRONZE_MEDAL = preload("res://Assets/Medals/PNG/shaded_medal2.png") # 50%-
const SILVER_MEDAL = preload("res://Assets/Medals/PNG/shaded_medal3.png") # 75%+
const GOLD_MEDAL = preload("res://Assets/Medals/PNG/shaded_medal4.png") # 90%+
const BEST_MEDAL = preload("res://Assets/Medals/PNG/shaded_medal1.png") # 100%

var tween: Tween
# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = 200
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1), 2)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 3)	


func set_medal(percent:float):
	percent = snapped(percent, 1) # No decimals
	if percent == 100: $Sprite2D.texture = BEST_MEDAL
	elif percent >= 75: $Sprite2D.texture = GOLD_MEDAL
	elif percent >= 51: $Sprite2D.texture = SILVER_MEDAL
	elif percent <= 50: $Sprite2D.texture = BRONZE_MEDAL
	
	$AccuracyLabel.text = "Accuracy:  " + str(snapped(percent, 1)) + "%"
	$AccuracyBonusLabel.text = "Accuracy Bonus:  " + str(snapped(percent * 13.78, 1)) + "pts"
	# TODO add score


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
