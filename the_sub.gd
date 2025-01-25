extends RigidBody2D

# Values for handling making the sub come up and down. 
const gravity_sinking = 1
const gravity_surfacing = -4

var surfacingIntiated = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var button_surfacing = $Area2D_Button
	
	# Start the timer to finish. 
	_startEndTimer()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var velocity = linear_velocity.length()
	print(velocity * 0.002)
	
	if global_position.y < 0 and surfacingIntiated:
		# This fires when the sub comes above the surface. 
		gravity_scale = gravity_sinking
	elif global_position.y > 0 and surfacingIntiated:
		gravity_scale = gravity_surfacing
		
	
func _startEndTimer():
	# Start a timer, once it finishes, then we want to surface the sub. 
	await get_tree().create_timer(4).timeout
	# Timer has finished now!!!
	print("Lift the sub now")
	# Reverse gravity!
	surfacingIntiated = true
	gravity_scale = gravity_surfacing
	
