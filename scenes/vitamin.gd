extends Block_Abstract;

class_name Vitamin;

func _ready() -> void:
	outColor= Color.html("007900");
	type= "vitamin";
	initialize();
	pass;
	
func can_go_down(blocks_list):
	if position_on_the_grid.y== 15:
		return false;
		
	for block in blocks_list:
		if (block.position.x== position.x and block.position_on_the_grid.y== position_on_the_grid.y + 1):
			return false;
		pass;
	return true;

func update_pos(blocks_list):
	if (can_go_down(blocks_list)):
		position_on_the_grid= Vector2(position_on_the_grid.x, position_on_the_grid.y + 1);
		pass;
	refresh();
	pass;

func set_pos_on_the_grid(pos: Vector2):
	position_on_the_grid= pos;
	pass;
