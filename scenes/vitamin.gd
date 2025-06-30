extends Block_Abstract;

class_name Vitamin;

var is_orphan: bool; #this would be true if this vitamin bock is parented to a capsule.

func _ready() -> void:
	pass;

func initialize(orphan: bool= true):
	is_orphan= orphan;
	outColor= Color.html("007900");
	type= "vitamin";
	super.initialize(orphan);
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
