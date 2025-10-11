extends Control
class_name HUB

@onready var object_name_label := $ObjectNameLabel
@onready var message_label := $MessageLabel
@onready var timer := $Timer

func set_object_name_label_text(object_name: String) -> void:
	object_name_label.text = object_name

func set_object_message_label_text(message: String, timeout: float) -> void:
	message_label.text = message
	timer.start(timeout)

func _on_timer_timeout() -> void:
	message_label.text = ""
