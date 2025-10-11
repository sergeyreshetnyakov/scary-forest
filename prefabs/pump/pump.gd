extends InteractableObject

signal on_pump_turning_on

func _interact(_inventory: Inventory):
	on_pump_turning_on.emit()
