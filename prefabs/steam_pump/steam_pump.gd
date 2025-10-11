extends InteractableObject

signal on_steam_pump_turning_on

func _interact(_inventory: Inventory):
	on_steam_pump_turning_on.emit()
