extends CharacterBody2D

@export var speed = 150
var playerNode

func _ready():
	playerNode = get_node("../../Player")
	
func _process(delta):
	velocity = (playerNode.position - position) / position.distance_to(playerNode.position) * speed
	move_and_slide()
