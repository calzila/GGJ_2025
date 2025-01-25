extends Area2D

var player
@export var theSub: Node
@export var associatedLever: Node2D
var playerInRange = false

# Store the hand components like this. I'm not totally sure how to grab them someplace else otherwise. 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if associatedLever != null:
		associatedLever.parentGrabber = self
	else:
		pass
	
	
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
		# Player has tried grabbing!
		if theSub.player.holdingLever:
			# in this scenario, the player should let go. 
			associatedLever.playerIsHolding = false
			theSub.player.holdingLever = false
			
		else:
			# Make the player grab the lever
			associatedLever.playerIsHolding = true
			theSub.player.holdingLever = true
			
			associatedLever.player = player
		
		
		
