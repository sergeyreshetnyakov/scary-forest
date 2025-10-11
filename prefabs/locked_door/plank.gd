extends InteractableObject

signal on_unlock

func _interact(_inventory: Inventory) -> void:
	on_unlock.emit()
	queue_free()
