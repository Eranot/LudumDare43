extends KinematicBody2D;

var direction = Vector2();

var tile_size;

var grid_pos_x;
var grid_pos_y;

#var explosions = load("res://Player/Explosions.gd").new();

var explosion_type = "cross";

func _ready():
	tile_size = get_parent().tile_size;
	$AnimatedSprite.play("default");

func _physics_process(delta):
	direction = dir.CENTER;
	
	if(Input.is_action_just_pressed("ui_select")):
		self_destroy();
	
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
			grid_pos_x = new_grid_pos_x;
			grid_pos_y = new_grid_pos_y;
			
			position.x += direction.x * tile_size.x;
			position.y += direction.y * tile_size.y;

func self_destroy():
	Explosions.explode(explosion_type, grid_pos_x, grid_pos_y, tile_size);
	#queue_free();
	