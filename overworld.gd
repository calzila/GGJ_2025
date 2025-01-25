extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the refs between Nodes, from here, the common parent. 
	$"The Sub".player = $Player
	$Player.theSub = $"The Sub"
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
