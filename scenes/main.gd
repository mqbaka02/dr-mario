extends Node2D;

const blockVirus= preload("res://scenes/virus.tscn");
const blockVitamin= preload("res://scenes/vitamin.tscn");

var blocks_list= [];

func _ready() -> void:
	
	var new_block= blockVirus.instantiate();
	new_block.color= Color.BLUE;
	new_block.position_on_the_grid= Vector2(4, 14);
	blocks_list.append(new_block);
	add_child(new_block);
	
	var new_block_Vitamin= blockVitamin.instantiate();
	new_block_Vitamin.color= Color.RED;
	new_block_Vitamin.position_on_the_grid= Vector2(4, 5);
	blocks_list.append(new_block_Vitamin);
	add_child(new_block_Vitamin);
	
	pass;
	
func update_everything():
	#print(blocks_list);
	for block in blocks_list:
		#print("NEW FRAME");
		if (block.type== "vitamin"):
			block.update_pos(blocks_list);
			pass;
		pass;
	pass;

var time_accumulator= 0;
const INTERVAL= .3;

func _physics_process(_delta: float) -> void:
	time_accumulator+= _delta;
	if (time_accumulator >= INTERVAL):
		time_accumulator= 0;
		update_everything();
		pass;
	pass;
