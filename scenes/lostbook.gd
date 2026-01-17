extends InteractableObjectWithRequiredItem

signal on_book_pushed

func unlock() -> void:
	disabled = false

func disable() -> void:
	disabled = true

func _interact(_inventory: Inventory) -> void:
	on_book_pushed.emit()
	disable()
