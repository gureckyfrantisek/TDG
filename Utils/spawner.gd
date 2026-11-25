extends Node2D

@export_enum("left", "right") var side = "left"

@export var unit_mapping = {
	"unit_1": "res://Units/tank.tscn",
	"unit_2": "res://Units/base_unit.tscn",
	"unit_3": "res://Units/pesek.tscn",
	"unit_4": "",
	"unit_5": "",
	"unit_6": "res://Units/tank.tscn",
	"unit_7": "res://Units/base_unit.tscn",
	"unit_8": "res://Units/pesek.tscn",
	"unit_9": "",
	"unit_10": ""
}

@onready var level_node = get_parent()

func _ready():
	if side == "right":
		$AnimatedSprite2D.flip_h = true
		
	$AnimatedSprite2D.play("idle")

func spawn_unit(unit_resource: Resource) -> void:
	if not unit_resource:
		print("No unit to spawn")
		return
	var child = unit_resource.instantiate()
	child.global_position = global_position
	child.side = side
	level_node.add_child(child)
	
func _input(event: InputEvent) -> void:
	var start_index: int = 1
	var end_index: int = 5
	
	if side == "right":
		start_index = 6
		end_index = 10
		
	for i in range(start_index, end_index + 1):
		var action_name = "unit_" + str(i)
		
		if event.is_action_pressed(action_name):
			var scene_path = unit_mapping.get(action_name, "")
			
			if scene_path == "":
				print("No unit to spawn for action: ", action_name)
				return
				
			var loaded = load(scene_path)
			spawn_unit(loaded)
