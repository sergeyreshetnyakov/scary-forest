extends Node
class_name Inventory

var inventory: Dictionary

func add_item(item: Items.Item, amount: int) -> void:
	inventory.assign({
		item: amount
	})
	
func use_item(item: Items.Item) -> bool:
	if inventory.has(item):
		inventory[item] -= 1
		if inventory[item] == 0:
			inventory.erase(item)
		return true
	else:
		return false
