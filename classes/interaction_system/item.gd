extends InteractableObject
class_name Item

@export var item: Items.Item
@export var amount := 1
@export var destroy_on_interaction := true

func interact(inventory: Inventory) -> String:
	inventory.add_item(item, amount)
	if destroy_on_interaction:
		queue_free()
	return interaction_message
