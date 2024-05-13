extends Node
class_name EnemySpawner

const TYPING_ITEM = preload("res://Scenes/TypingItem.tscn")
const TYPING_ITEM_PROJECTILE = preload("res://Scenes/TypingItemProjectile.tscn")

var maxEnemiesPerWave = 3
var currentEnemies:Array = []
var timeBetweenWaves = 5.0
var currentTimeUntilNextWave = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentTimeUntilNextWave -= delta
	if currentTimeUntilNextWave <= 0 and currentEnemies.size() == 0:
		print("Started next wave with " + str(currentEnemies.size()) + " enemies...") 
		startNextWave()


func startNextWave():
	for i in range(maxEnemiesPerWave):
		spawnEnemyOutsideScreen()

	# Reset timer for the next wave
	currentTimeUntilNextWave = timeBetweenWaves
	maxEnemiesPerWave += 1
	
	
func spawnEnemyOutsideScreen():
	# Create enemy instance
	var enemy = TYPING_ITEM.instantiate()

	# Set enemy position outside the screen
	var screenSize: Rect2 = get_viewport().get_visible_rect()

	# Calculate random spawn position outside the screen
	var spawnX = randi_range(-screenSize.size.x, screenSize.size.x * 2)
	var spawnY = randi_range(-screenSize.size.y, screenSize.size.y * 2)

	# Ensure enemy spawns completely outside the screen
	if spawnX > 0:
		spawnX += screenSize.size.x
	if spawnY > 0:
		spawnY += screenSize.size.y

	enemy.position = Vector2(spawnX, spawnY)

	# Add enemy to scene and to the list of current enemies
	add_child(enemy)
	currentEnemies.append(enemy)


func enemy_died(is_word):
	if is_word: currentEnemies.pop_back()
	print("enemy died")

