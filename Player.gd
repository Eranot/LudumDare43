extends KinematicBody2D

var direction = Vector2();

var tile_size = 64;

var grid_pos_x;
var grid_pos_y;

func _ready():
	print(grid_pos_x);
	pass

func _physics_process(delta):
	move_player();

func move_player():
	direction = dir.CENTER;
	
	if(Input.is_action_just_pressed("ui_up")):
		direction = dir.UP;
	if(Input.is_action_just_pressed("ui_down")):
		direction = dir.DOWN;
	if(Input.is_action_just_pressed("ui_right")):
		direction = dir.RIGHT;
	if(Input.is_action_just_pressed("ui_left")):
		direction = dir.LEFT;
	
	position.x += direction.x * tile_size;
	position.y += direction.y * tile_size;
	
func print_test():
	print("teste");