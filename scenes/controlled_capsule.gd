extends Capsule;

const long_press_delay= .3;
var pressed_left_for= 0;
var pressed_right_for= 0;
var press_tick= 0;
const tick_speed= .05;

func _physics_process(_delta: float) -> void:
	if (Input.is_action_just_pressed("ui_left")):
		position_on_the_grid.x = position_on_the_grid.x - 1;
		position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
		pass;

	if (Input.is_action_just_pressed("ui_right")):
		position_on_the_grid.x = position_on_the_grid.x + 1;
		position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
		pass;
	
	if (Input.is_action_pressed("ui_left")):
		pressed_left_for+= _delta;
		press_tick+= _delta;

		if pressed_left_for>= long_press_delay:
			pressed_left_for= long_press_delay;
			pass;

		pass;

	if (Input.is_action_pressed("ui_right")):
		pressed_right_for+= _delta;
		press_tick+= _delta;

		if pressed_right_for>= long_press_delay:
			pressed_right_for= long_press_delay;
			pass;

		pass;
	
	if (Input.is_action_just_released("ui_left")):
		pressed_left_for= 0;
		press_tick= 0;
		pass;
	if (Input.is_action_just_released("ui_right")):
		pressed_right_for= 0;
		press_tick= 0;
		pass;

	if (pressed_left_for>= long_press_delay):
		if (press_tick>= tick_speed):
			position_on_the_grid.x = position_on_the_grid.x - 1;
			position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
			press_tick= 0;
			pass;
		pass;
	if (pressed_right_for>= long_press_delay):
		if (press_tick>= tick_speed):
			position_on_the_grid.x = position_on_the_grid.x + 1;
			position= Vector2(position_on_the_grid.x * 32, position_on_the_grid.y * 32);
			press_tick= 0;
			pass;
		pass;

	pass;
