extends InteractableObjectWithRequiredItem

@onready var animation := $"AnimationPlayer"

enum State { OPENED, CLOSED }
var current_state := State.CLOSED

func switch_state() -> void:
	match current_state:
		State.OPENED:
			animation.play_backwards("door_open")
			current_state = State.CLOSED
		State.CLOSED:
			animation.play("door_open")
			current_state = State.OPENED
			
func unlock() -> void:
	is_required_item_used = true
	object_name = object_name_when_required_item_used

func _interact(_inventory: Inventory) -> void:
	switch_state()
