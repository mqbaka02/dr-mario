extends Node2D;

class_name Block_Abstract;

@export var position_on_the_grid: Vector2;
@export var color: Color;
@export var outColor: Color;
var type: String;

func get_position_in_px():
	return Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
	
func initialize(orphan: bool= true)-> void:
	if orphan:
		position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
		pass;

	self.get_node("Inside").color= color;
	self.get_node("Outline").color= outColor;
	# print("initialize");
	pass;

func refresh():
	position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
	pass;


func get_global_grid_pos():
	return Vector2(global_position.x / 32, global_position.y / 32);
