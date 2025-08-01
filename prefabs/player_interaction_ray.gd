extends RayCast3D

@export var inventory: Inventory

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if is_colliding():
			var collider = get_collider()
			if collider is InteractableObject:
				collider.interact(inventory)
