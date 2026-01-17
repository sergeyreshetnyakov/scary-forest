extends Node3D
class_name Scene

@onready var player: PlayerController
@onready var hub: HUB

enum WaterLevel { NULL, FIRST, SECOND }

signal on_turning_elevator_on
signal on_turning_electricy(_is_electricy_on: bool)

var water_level := WaterLevel.NULL

var is_electricy_on := true
var is_pump_on := false
var is_steam_pump_on := false

func _ready() -> void:
	player = get_node("PlayerController")
	hub = get_node("HUB")
	player.interaction_system.change_message_label.connect(hub.set_object_message_label_text)
	player.interaction_system.change_object_name_label.connect(hub.set_object_name_label_text)

func turn_elevator_on() -> void:
	if is_pump_on and is_steam_pump_on:
		print("elevator is on")
		on_turning_elevator_on.emit()

func turn_pump_on() -> void:
	is_pump_on = true
	turn_elevator_on()
	print("pump is on")

func turn_steam_pump_on() -> void:
	is_steam_pump_on = true
	turn_elevator_on()
	print("steam pump is on")
	
func on_electricy_turned(_is_electricy_on: bool) -> void:
	is_electricy_on = _is_electricy_on
	on_turning_electricy.emit(is_electricy_on)
