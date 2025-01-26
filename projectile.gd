extends CharacterBody2D

@export var SPEED = 1000

var dir : float
var spawnPos : Vector2
var spawnRot : float

var fishCheck

var theSub

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	
	# Load the tscn, ready to chek if it's a fish
	fishCheck = load("res://fish.gd")

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, SPEED).rotated(dir)
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is RigidBody2D:
		print("This is a fish I think")
		body.queue_free()
		theSub.weightFromFish += 1
		pass
	
