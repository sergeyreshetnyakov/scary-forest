extends CharacterBody3D
class_name PlayerController

@onready var head := $Head
@onready var animation_player := $AnimationPlayer
@onready var can_stand_up_ray := $CanStandUpRay
@onready var interaction_system: InteractionRay = $Head/Camera3D/InteractionRay

enum State { WALK, SPRINT, CRAWL }

var current_state := State.WALK
var current_speed := Constants.PlAYER_WALK_SPEED

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = Constants.JUMP_VELOCITY
	
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction2D := input_dir.rotated(-head.rotation.y)
	var direction := (transform.basis * Vector3(direction2D.x, 0, direction2D.y)).normalized()
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("sprint"):
		if current_state == State.WALK:
			change_state(State.SPRINT)
		else:
			change_state(State.WALK)
	if Input.is_action_just_pressed("crawl"):
		if current_state == State.CRAWL:
			change_state(State.WALK)
		else:
			change_state(State.CRAWL)

func change_state(new_state: State) -> void:
	if current_state == State.CRAWL: 
		if new_state != State.CRAWL:
			if !can_stand_up_ray.is_colliding():
				animation_player.play_backwards("crawl")
			else:
				return
		
	current_state = new_state
	match new_state:
		State.WALK:
			current_speed = Constants.PlAYER_WALK_SPEED
		State.SPRINT:
			current_speed = Constants.PlAYER_SPRINT_SPEED
		State.CRAWL:
			current_speed = Constants.PLAYER_CRAWL_SPEED
			animation_player.play("crawl")
