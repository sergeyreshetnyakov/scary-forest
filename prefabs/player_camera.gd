extends Node3D

@onready var camera := $Camera3D
var player

var t_bob := 0.0

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player = get_parent()
	if player is not CharacterBody3D:
		push_error("Player camera node must be player\'s child")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * Constants.MOUSE_SENSITIVITY)
		camera.rotate_x(-event.relative.y * Constants.MOUSE_SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-70), deg_to_rad(70))

func _physics_process(delta: float) -> void:
	t_bob += delta * player.velocity.length() * float(player.is_on_floor())
	camera.transform.origin = headbob(t_bob)
	
func headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * Constants.PLAYER_HEADBOB_FREQ) * Constants.PLAYER_HEADBOB_AMP
	pos.x = cos(time * Constants.PLAYER_HEADBOB_FREQ / 2) * Constants.PLAYER_HEADBOB_AMP
	return pos
