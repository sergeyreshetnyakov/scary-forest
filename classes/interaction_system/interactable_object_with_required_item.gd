extends InteractableObject
class_name InteractableObjectWithRequiredItem

@export var required_item := Items.Item.NONE
@export var required_equipment := Items.Equipment.NONE
@export var fail_message := ""

func interact(inventory: Inventory) -> String:
	if inventory.use_item(required_item):
		_interact(inventory)
		return interaction_message
	else:
		return fail_message

func _interact(_inventory: Inventory) -> void:
	pass
