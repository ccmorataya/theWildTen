
extends Node2D

const GRAVITY = 200.0
var velocity = Vector2()

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity.y += delta * GRAVITY

	var motion = velocity * delta
	get_node("KinematicBody2D").move(motion)
	pass