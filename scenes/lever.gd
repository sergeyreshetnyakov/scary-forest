extends InteractableObject

@onready var timer = $Timer
@export var book_counter_target_value := 3

var is_lost_book_inserted := false
var book_count := 0

signal unlock_the_door
signal unlock_the_books
signal lock_the_books

func increase_book_counter() -> void:
	book_count += 1
	print(book_count)
	if book_count == book_counter_target_value:
		unlock_the_door.emit()

func _interact(_inventory: Inventory) -> void:
	if is_lost_book_inserted:
		interaction_message = ""
		book_count = 0
		unlock_the_books.emit()
		timer.start()

func _on_lost_book_inserted() -> void:
	is_lost_book_inserted = true

func _on_timer_timeout() -> void:
	lock_the_books.emit()
	print("timeout", book_count, book_counter_target_value)
