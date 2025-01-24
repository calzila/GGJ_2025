extends RichTextLabel

var depthValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Display the depth on the Text Component
	depthValue = global_position.y * 0.01
	depthValue = str(int(depthValue * -1), " Meters")
	text = depthValue
