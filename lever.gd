extends Node2D

@export var thrustsShip: bool = false
@export var movesLight: bool = false

@export var lightRef: Node2D
@export var projectileSpawnRef: Node2D

var playerIsHolding = false
var inputValue = 0.0

var player
var parentGrabber
var theSub

var main
var projectile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main = get_tree().get_root().get_node("WorldRoot")
	projectile = load("res://projectile.tscn")
	
	theSub = parentGrabber.theSub
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	# Handle tracking the players inputs
	if playerIsHolding:
		inputValue = Input.get_axis("move_left", "move_right")
		$PivotPoint.rotation = $PivotPoint.rotation + (inputValue * 0.5 - $PivotPoint.rotation) * (delta * 10)
		
		# handle Space input
		if Input.is_action_just_pressed("ui_accept"):
			var instance = projectile.instantiate()
			instance.dir = lightRef.rotation
			instance.spawnPos = projectileSpawnRef.global_position
			instance.spawnRot = lightRef.rotation
			main.add_child.call_deferred(instance)
			
			instance.theSub = theSub
		
		if thrustsShip:
			parentGrabber.theSub.apply_central_force(Vector2(inputValue,0) * 90000 * delta)
			parentGrabber.theSub.apply_torque((inputValue) * 20000000 * delta)
		
		if movesLight:
			lightRef.rotation += inputValue * 1 * delta
		
		if player != null:
			# put the hand on the lever
			player.hand_L.global_position = $PivotPoint/HandSpot_L.global_position
			player.hand_R.global_position = $PivotPoint/HandSpot_R.global_position
			
			player.hand_L.z_index = 10
			player.hand_R.z_index = 10
