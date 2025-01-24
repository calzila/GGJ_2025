extends RichTextLabel

var depthValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#depthValue = str(global_position.y)
	
	depthValue = global_position.y
	depthValue = str(int(depthValue))
	text = depthValue
	
	
	pass
