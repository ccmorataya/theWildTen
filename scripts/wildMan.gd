
extends Node2D

export var GRAVITY = 1000
const WALK_SPEED = 200

var velocity = Vector2()
onready var player = get_node("KinematicBody2D")
	
func _ready():
	set_fixed_process(true)

func _fixed_process(delta):

	var inGround = true
	var playerPosition = player.get_pos()
	var jumpPostion = Vector2()
	velocity.y += delta * GRAVITY

	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
		
	elif (Input.is_action_pressed("ui_right")):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	var motion = velocity * delta
	motion = player.move(motion)

	if (player.is_colliding()):
		inGround = true
		var n = player.get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		player.move(motion)

	if (inGround):
		if (Input.is_action_pressed("ui_up")):
			velocity.y -= 50
			inGround = false