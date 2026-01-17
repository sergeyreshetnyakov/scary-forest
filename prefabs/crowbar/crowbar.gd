extends InteractableObjectWithRequiredItem

var is_electricy_on = true

func on_electricy_turned(_is_electricy_on: bool) -> void:
	is_electricy_on = _is_electricy_on

func interact(inventory: Inventory) -> String:
	if is_electricy_on == false:
		inventory.add_item(Items.Item.CROWBAR, -1)
		queue_free()
		return success_message
	else:
		return fail_message
