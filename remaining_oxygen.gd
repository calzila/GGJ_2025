extends RichTextLabel

# ref to Sub
@export var theSub: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if theSub != null:
		#Display the depth on the Text dComponent
		var oxygenLocal = theSub.oxygen * 100
		oxygenLocal = str(int(oxygenLocal), " % Oxygen Remaining")
		
		text = str(oxygenLocal)
