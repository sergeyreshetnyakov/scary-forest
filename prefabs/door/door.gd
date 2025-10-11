extends InteractableObject

@onready var animation := $AnimationPlayer

enum State { OPENED, CLOSED }
var current_state := State.CLOSED

func switch_state():
	match current_state:
		State.OPENED:
			animation.play_backwards("door_open")
			current_state = State.CLOSED
		State.CLOSED:
			animation.play("door_open")
			current_state = State.OPENED
			
func _interact(_inventory: Inventory):
	switch_state()
