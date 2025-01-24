extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Start the timer to finish. 
	_startEndTimer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _startEndTimer():
	# Start a timer, once it finishes, then we want to surface the sub. 
	await get_tree().create_timer(10).timeout
	# Timer has finished now!!!
	print("Lift the sub now")
	# Reverse gravity!
	gravity_scale = -4
	
