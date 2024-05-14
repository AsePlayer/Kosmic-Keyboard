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
	spawnStartTyping() # Spawn the "start" screen


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentTimeUntilNextWave -= delta
	if currentTimeUntilNextWave <= 0 and currentEnemies.size() == 0:
		print("Started next wave with " + str(currentEnemies.size()) + " enemies...") 
		startNextWave()


func startNextWave():
	GameManager.enemy_wave_finished()
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
	var spawnX; var spawnY
	
	var rng = randi_range(0,1)
	if rng == 1: spawnX = randi_range(-screenSize.size.x * 2, -screenSize.size.x) # left
	else: spawnX =  randi_range(screenSize.size.x, screenSize.size.x * 2) # right
	
	rng = randi_range(0,1)
	if rng == 1: spawnY = randi_range(-screenSize.size.y * 2, -screenSize.size.y) # down
	else: spawnY =  randi_range(screenSize.size.y, screenSize.size.y * 2) # up
	#print("X:" + str(spawnX) + " Y:" + str(spawnY))
	

	enemy.position = Vector2(spawnX, spawnY)

	# Add enemy to scene and to the list of current enemies
	add_child(enemy)
	currentEnemies.append(enemy)
	

func spawnStartTyping():
	var enemy = TYPING_ITEM.instantiate()
	var ti:TypingItem = enemy as TypingItem
	ti.set_word("START")
	ti.start_typing = true # disables enemy from generating word and shooting
	ti.position.x -= 300 # to left of player
	ti.disable_enemy() # speed = 0
	add_child(ti)
	currentEnemies.append(ti)
	
	enemy = TYPING_ITEM.instantiate()
	ti = enemy as TypingItem
	ti.set_word("TYPING")
	ti.start_typing = true # disables enemy from generating word and shooting
	ti.position.x += 300 # to right of player
	ti.disable_enemy() # speed = 0
	add_child(ti)
	currentEnemies.append(ti)


func enemy_died(is_word):
	if is_word: currentEnemies.pop_back()
	print("enemy died")


func sort_children():
	var center = get_viewport().get_visible_rect().size / 2
	# Sort children based on distances from the center
	get_children().sort_custom(_compare_distance_to_center)
		
		
# Custom comparison function to sort nodes based on their distance to the center
func _compare_distance_to_center(a, b):
	var center = Vector2.ZERO
	if a is Node2D and b is Node2D:
		# Calculate the distance from each node to the center
		var distance_a = a.global_position.distance_squared_to(center)
		var distance_b = b.global_position.distance_squared_to(center)
		# Return the comparison result
		return distance_a - distance_b
	else:
		# If either a or b is not a Node2D, maintain the current order
		return 0
