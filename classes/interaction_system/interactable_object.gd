extends AnimatableBody3D
class_name InteractableObject

@export var object_name := " "
@export var description := " "
@export var interaction_message := " "

func interact(inventory: Inventory) -> String:
	return interaction_message
