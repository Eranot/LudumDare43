extends KinematicBody2D

var direction = Vector2();

var tile_size = 64;

var grid_pos_x;
var grid_pos_y;

func _ready():
	pass

func _physics_process(delta):
	direction = dir.CENTER;
	
	if(Input.is_action_just_pressed("ui_up")):
		direction = dir.UP;
	if(Input.is_action_just_pressed("ui_down")):
		direction = dir.DOWN;
	if(Input.is_action_just_pressed("ui_right")):
		direction = dir.RIGHT;
	if(Input.is_action_just_pressed("ui_left")):
		direction = dir.LEFT;
	
	if(direction != dir.CENTER):
		move_player();

func move_player():
	var new_grid_pos_x = grid_pos_x;
	var new_grid_pos_y = grid_pos_y;
	
	if(direction == dir.UP):
		new_grid_pos_y -= 1;
	if(direction == dir.DOWN):
		new_grid_pos_y += 1;
	if(direction == dir.RIGHT):
		new_grid_pos_x += 1;
	if(direction == dir.LEFT):
		new_grid_pos_x -= 1;
	
	print(get_parent().cell_is_empty(3, 3))
	print(new_grid_pos_x)
	print(new_grid_pos_y)
	if(get_parent().cell_is_empty(new_grid_pos_x, new_grid_pos_y)):
		grid_pos_x = new_grid_pos_x;
		grid_pos_y = new_grid_pos_y;
		
		position.x += direction.x * tile_size;
		position.y += direction.y * tile_size;

