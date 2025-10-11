extends Node3D

@onready var animation := $AnimationPlayer
@export var is_blocked := false

enum State { UP, DOWN }
var current_state := State.DOWN

func turn_on() -> void:
	is_blocked = false

func switch_state() -> void:
	if is_blocked == false:
		match current_state:
			State.UP:
				animation.play_backwards("move_up")
				current_state = State.DOWN
			State.DOWN:
				animation.play("move_up")
				current_state = State.UP
