extends InteractableObject

@export var interaction_message_when_off: String
@export var is_electricy_on = true

signal on_electricy_turned(_is_electricy_on: bool)

func interact(_inventory: Inventory) -> String:
	is_electricy_on = !is_electricy_on
	on_electricy_turned.emit(is_electricy_on)
	
	if !is_electricy_on:
		return interaction_message
	else:
		return interaction_message_when_off
