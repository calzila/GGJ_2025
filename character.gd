extends RigidBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and (get_contact_count() > 0):
		print("Plz jump")
		apply_central_force(Vector2(0,-1) * 3000000 * delta)
		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	
	apply_central_force(direction * 100000 * delta)
	
	
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	#move_and_slide()
