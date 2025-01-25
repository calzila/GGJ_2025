extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set a random impulse on spawn
	_apply_swim_force()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _apply_swim_force():
	var forceDirection = Vector2(randf_range(-1,1),randf_range(-1,1))
	apply_central_force(forceDirection * 10000)
	apply_torque(1 * 1)
	
