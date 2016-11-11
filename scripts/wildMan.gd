
extends Node2D

const GRAVITY = 100
const WALK_SPEED = 200

var velocity = Vector2()
onready var player = get_node("KinematicBody2D")

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
	motion = player.move(motion)

	#change this snipet to detect the collision with the floor
	#if (player is colliding):
		#velocity.y = 0
	if (player.is_colliding()):
		var n = player.get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		player.move(motion)
