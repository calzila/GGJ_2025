extends Node2D

var playerIsHolding = false
var inputValue = 0.0

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Handle tracking the players inputs
	if playerIsHolding:
		inputValue = Input.get_axis("move_left", "move_right")
		$PivotPoint.rotation = $PivotPoint.rotation + (inputValue * 0.5 - $PivotPoint.rotation) * (delta * 10)
		
		if player != null:
			player.hand_L.global_position = $PivotPoint/HandSpot_L.global_position
			player.hand_R.global_position = $PivotPoint/HandSpot_R.global_position
			
			player.hand_L.z_index = 10
			player.hand_R.z_index = 10
