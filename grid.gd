extends Node2D;

func _draw() -> void:
	for i in range(1, 9):
		draw_line(Vector2(i * 32, 0), Vector2(i * 32, 32 * 16), Color.BLACK);
		pass;
	for i in range(1, 16):
		draw_line(Vector2(0, i * 32), Vector2(32 * 9, i * 32), Color.BLACK);
		pass;
	pass;
