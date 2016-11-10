
extends Node2D

const GRAVITY = 200.0
const WALK_SPEED = 200

var velocity = Vector2()

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity.y += delta * GRAVITY

	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
	elif (Input.is_action_pressed("ui_right")):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	var motion = velocity * delta
	get_node("KinematicBody2D").move(motion)
	pass