extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	rotation_degrees = randf_range(-90,90)
	# Set a random impulse on spawn
	var forceDirection = Vector2(randf_range(-1,1),randf_range(-1,1))
	_apply_swim_force()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _apply_swim_force():
	var forceDirection = Vector2.UP.rotated(rotation)
	#linear_velocity += movement.y * Vector2.UP.rotated(ship.rotation) * max_linear_velocity * delta
	apply_central_force(forceDirection * 15000)
	apply_torque(randf_range(-1,1) * 200000)
	
	$SwimTimer.start(1)

func _on_swim_timer_timeout() -> void:
	print("swimSwam")
	_apply_swim_force()
	pass # Replace with function body.
