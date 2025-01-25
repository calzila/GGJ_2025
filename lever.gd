extends Node2D

var playerIsHolding = false
var inputValue = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$PivotPoint.rotation = inputValue * 10
	pass
