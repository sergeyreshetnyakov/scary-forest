extends InteractableObject
class_name InteractableObjectWithRequiredItem

@export var required_item := Items.Item.NONE
@export var success_message := ""
@export var fail_message := ""
@export var object_name_when_required_item_used := ""
var is_required_item_used := false

func interact(inventory: Inventory) -> String:
	if is_required_item_used == false:
		if inventory.use_item(required_item):
			object_name = object_name_when_required_item_used
			return success_message
		else:
			return fail_message
	else:
		_interact(inventory)
		return interaction_message

func _interact(_inventory: Inventory) -> void:
	pass
