extends RayCast3D
class_name InteractionRay

@export var inventory: Inventory

signal change_object_name_label(name: String)
signal change_message_label(name: String, timeout: float)

func _process(_delta: float) -> void:
	if is_colliding():
		var collider = get_collider()
		if collider is InteractableObject:
			change_object_name_label.emit(collider.object_name)
			if Input.is_action_just_pressed("interact"):
				var message: String = collider.interact(inventory)
				change_message_label.emit(message, collider.message_display_timeout)
		else:
			change_object_name_label.emit("")
	else:
		change_object_name_label.emit("")
