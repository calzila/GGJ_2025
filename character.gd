extends RigidBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0

var holdingLever = false

var hand_L
var hand_R
var hand_L_RestingPosition
var hand_R_RestingPosition


func _ready() -> void:
	hand_L = $Hand_L
	hand_R = $Hand_R
	
	hand_L_RestingPosition = hand_L.position
	hand_R_RestingPosition = hand_R.position
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta
	
	# Bob the player
	var velocity = linear_velocity
	var bobBase = sin(Time.get_ticks_msec() / 1000.0 * 15)
	$Body.position = (Vector2(0,-32.8) + (Vector2(0,bobBase * 5)))
	
	print(velocity.length())
	
	var headLookDirection = linear_velocity.normalized()
	headLookDirection = Vector2(headLookDirection.x * 0.35, headLookDirection.y * 0.08)
	$HeadAttachment/Head.global_position = $HeadAttachment.global_position + (headLookDirection * 50)
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and (get_contact_count() > 0):
		print("Plz jump")
		apply_central_force(Vector2(0,-1) * 3000000 * delta)
		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	
	
	# don't let the player move if we're holding onto a lever
	if holdingLever:
		# do some other shit if we're holding?
		pass
	else:
		apply_central_force(direction * 100000 * delta)
		
	# Self-oriantate the sub
	var correctionTorque = -rotation * 10000000 * delta
	apply_torque(correctionTorque)
	
	# orient head to always face up
	$HeadAttachment/Head.global_rotation = $HeadAttachment/Head.global_rotation + (0 - $HeadAttachment/Head.global_rotation) * (delta * 7)

	rotation
	
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	#move_and_slide()
