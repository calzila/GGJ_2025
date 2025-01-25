extends Area2D

var player
@export var theSub: Node
@export var associatedLever: Node2D
var playerInRange = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if player == null and theSub.player != null:
		player = theSub.player
	
	
	if overlaps_body(player):
		playerInRange = true
		$E.visible = true
	else:
		playerInRange = false
		$E.visible = false
	
	
	if Input.is_action_just_pressed("Grab") and playerInRange:
		associatedLever.playerIsHolding = true
		theSub.player.holdingLever = true
