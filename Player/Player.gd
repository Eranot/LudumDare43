extends KinematicBody2D

var direction = Vector2();

const OBJ_TYPE = "PLAYER";

var SELECTED = false;
var HOVERED = false;

var tile_size;

var grid_pos_x;
var grid_pos_y;

func _ready():
	tile_size = get_parent().tile_size;
	$AnimatedSprite.play("default");

func _physics_process(delta):
	
	if(Input.is_action_just_pressed("ui_mouse_left")):
		if(HOVERED):
			SELECTED = true;
		else:
			SELECTED = false;
	
	direction = dir.CENTER;
	if(SELECTED):
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
	
	if(get_parent().cell_exists(new_grid_pos_x,new_grid_pos_y)):
		if(get_parent().cell_is_empty(new_grid_pos_x, new_grid_pos_y)):
			
			get_parent().grid[grid_pos_x][grid_pos_y] = null;
			
			grid_pos_x = new_grid_pos_x;
			grid_pos_y = new_grid_pos_y;
			
			get_parent().grid[grid_pos_x][grid_pos_y] = get_parent().ENTITY_TYPES.PLAYER;
			
			position.x += direction.x * tile_size.x;
			position.y += direction.y * tile_size.y;


func _on_Player_mouse_entered():
	HOVERED = true;


func _on_Player_mouse_exited():
	HOVERED = false;
