extends InteractableObjectWithRequiredItem

signal on_remove

func _interact(_inventory: Inventory) -> void:
	on_remove.emit()
	queue_free()
