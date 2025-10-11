extends InteractableObject

signal on_elevator_button_pressed

func _interact(_inventory: Inventory):
	on_elevator_button_pressed.emit()
