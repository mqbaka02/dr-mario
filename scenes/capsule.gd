extends Node2D;

@export var position_on_the_grid: Vector2;
@export var blocks: Array[Vitamin];
@export var is_vertical: bool;

var type: String= "capsule";

var vitamin_scene= preload("res://scenes/vitamin.tscn");

func can_go_down(blocks_list: Array)-> bool:
	for vit in blocks:
		if not vit.can_go_down(blocks_list):#needs an update that takes the is_vertical into account
			return false;
		pass;
	#print("CAN");
	return true;

func create(colors: Array, pos: Vector2):
	position_on_the_grid= pos;
	for i in range(colors.size()):
		var vit= vitamin_scene.instantiate();
		vit.color= colors[i];
		#vit.set_pos_on_the_grid(Vector2(position_on_the_grid.x + i, position_on_the_grid.y));
		vit.set_pos_on_the_grid(Vector2(5, 4));
		#vit.position= Vector2(i * 32, 0)
		add_child(vit);
		pass;
	pass;

func update_pos(blocks_list: Array):
	if (can_go_down(blocks_list)):
		position_on_the_grid= Vector2(position_on_the_grid.x, position_on_the_grid.y + 1);
		#position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
		position= Vector2(32, 32);
		#set_pos(position_on_the_grid.x, position_on_the_grid.y + 1);
		pass;
	pass;
	
func refresh_elements():
	for i in range(blocks.size()):
		blocks[i].set_pos_on_the_grid(Vector2(position_on_the_grid.x + i, position_on_the_grid.y));
		pass;
	pass;

func set_pos(x: int, y: int):
	position_on_the_grid= Vector2(x, y);
	#refresh_elements();
	position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
	print(position);
	print(position_on_the_grid);
	pass;
