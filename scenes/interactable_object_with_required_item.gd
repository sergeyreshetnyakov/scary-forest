extends InteractableObjectWithRequiredItem

func _interact(_inventory: Inventory) -> void:
	queue_free()
