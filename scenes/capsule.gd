extends Node2D;

class_name Capsule;

@export var position_on_the_grid: Vector2;
@export var blocks: Array[Vitamin];
@export var is_vertical: bool;

var type: String= "capsule";

var vitamin_scene= preload("res://scenes/vitamin.tscn");

func can_go_down(blocks_list: Array)-> bool:
	if position_on_the_grid.y== 15:
		return false;
	# print(blocks);
	for vit in blocks:
		if not vit.can_go_down(blocks_list):#needs an update that takes the is_vertical into account
			return false;
		pass;
	return true;

func create(colors: Array, pos: Vector2):
	position_on_the_grid= pos;
	set_position_from_pos_in_grid();
	for i in range(colors.size()):
		var vit= vitamin_scene.instantiate();
		vit.is_orphan= false;
		vit.color= colors[i];
		vit.position= Vector2(i * 32, 0);
		vit.initialize(false);
		blocks.append(vit);
		add_child(vit);
		pass;
	pass;

func set_position_from_pos_in_grid():
	self.position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
	pass;

func update_pos(blocks_list: Array):
	if (can_go_down(blocks_list)):
		position_on_the_grid= Vector2(position_on_the_grid.x, position_on_the_grid.y + 1);
		position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
		pass;
	pass;

func refresh_elements():
	for i in range(blocks.size()):
		blocks[i].set_pos_on_the_grid(Vector2(position_on_the_grid.x + i, position_on_the_grid.y));
		pass;
	pass;

func set_pos(x: int, y: int):
	position_on_the_grid= Vector2(x, y);
	position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
	pass;

func get_global_grid_pos():
	return blocks[0].get_global_grid_pos();
