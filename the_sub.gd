extends RigidBody2D

# Values for handling making the sub come up and down. 
const gravity_sinking = 1
const gravity_surfacing = -4

var surfacingIntiated = false
var player

var newFish

var oxygen = 1.0
var velocity


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button_surfacing = $Area2D_Button
	
	# get the fish ready for when we need it
	newFish = load("res://Fish.tscn")
	newFish = preload("res://Fish.tscn")
	
	# Start the timer to spawn a fish
	_spawn_a_fish()
	
	# Start the timer to finish. 
	_startEndTimer()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Player hit the escape area!
	if $Area2D_Button.overlaps_body(player):
		print("Player Overlapped Escape!")
		_surfaceSub()
	
	
	velocity = linear_velocity.length()
	# Tick away our oxygen a little every frame
	oxygen -= 0.005 * delta
	
	
	if global_position.y < 0 and surfacingIntiated:
		# This fires when the sub comes above the surface. 
		gravity_scale = gravity_sinking
	elif global_position.y > 0 and surfacingIntiated:
		gravity_scale = gravity_surfacing
	
	
	# Self-oriantate the sub
	var correctionTorque = -rotation * 100000000 * delta
	apply_torque(correctionTorque)
	
	
func _startEndTimer():
	# Start a timer, once it finishes, then we want to surface the sub. 
	await get_tree().create_timer(60).timeout
	# Timer has finished now!!!
	print("Lift the sub now")
	# Reverse gravity!
	_surfaceSub()
	
func _surfaceSub():
	surfacingIntiated = true
	gravity_scale = gravity_surfacing


func _spawn_a_fish():
	# randomize the spawn position of the fish.
	$FishSpawner_Pivot.rotation = randf_range(-1,1)
	
	# Actually spawn in the fish. 
	var fishInstance = newFish.instantiate() 
	add_child(fishInstance)
	fishInstance.global_position = $FishSpawner_Pivot/FishSpawner_Point.global_position
	$TimerFishSpawn.start(randf_range(0.5,4))
	pass


func _on_timer_fish_spawn_timeout() -> void:
		print("Timer Finished?")
		_spawn_a_fish()
		
