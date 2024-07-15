class_name Tile extends Control

@onready var object_container: Control = $ObjectContainer


func is_empty() -> bool:
	return object_container.get_child_count() == 0


func get_object():
	if object_container.get_child_count() != 1:
		print("not exactly 1 child")
	return object_container.get_children()[0]


func set_object(o) -> void:
	if not is_empty():
		print("tile is not free")
		return
	object_container.add_child(o)
