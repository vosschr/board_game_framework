class_name Board extends Control

@export var rows: int
@export var cols: int

@onready var tile_scene: PackedScene = preload("res://tile.tscn")
@onready var test_object_scene: PackedScene = preload("res://test_object.tscn")
@onready var grid_container: GridContainer = $GridContainer

var tile_array: Array[Tile]


func _ready() -> void:
	init_tiles()  # instantiates tiles, adds them to grid_container and stores them in tile_array
	
	# test
	var test_object = test_object_scene.instantiate()
	tile_array_get(1, 1).set_object(test_object)
	move_tile_object(1, 1, 2, 3)


### helper functions for tile manitpulation ###

func move_tile_object(from_row: int, from_col: int, to_row: int, to_col: int) -> void:
	var source: Tile = tile_array_get(from_row, from_col)
	var target: Tile = tile_array_get(to_row, to_col)
	if source.is_empty():
		print("nothing to move")
		return
	if not target.is_empty():
		print("target tile blocked")
		return
	var object = source.get_object()
	object.reparent(target, false)  # 2nd param is keep_global_transform


func init_tiles() -> void:
	tile_array = []
	grid_container.columns = cols
	for i in rows:
		for j in cols:
			var tile: Tile = tile_scene.instantiate()
			grid_container.add_child(tile)
			tile_array.append(tile)


### helper functions for tile array manipulation ###

func tile_array_get(row: int, col: int) -> Tile:
	var index := row * cols + col
	return tile_array[index]


func tile_array_set(row: int, col: int, tile: Tile) -> void:
	var index := row * cols + col
	tile_array[index] = tile
