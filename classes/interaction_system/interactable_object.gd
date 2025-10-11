extends AnimatableBody3D
class_name InteractableObject

@export var object_name := " "
@export var message_display_timeout: float = 3
@export var interaction_message := " "

func interact(inventory: Inventory) -> String:
	_interact(inventory)
	return interaction_message

func _interact(_inventory: Inventory) -> void:
	pass
