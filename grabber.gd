extends Area2D

var player
@export var theSub: Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if player == null and theSub.player != null:
		player = theSub.player
	
	
	if overlaps_body(player):
		$E.visible = true
	else:
		$E.visible = false
