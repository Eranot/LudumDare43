extends Area2D;

var direction = Vector2();

const OBJ_TYPE = "SLIME";

var SELECTED = false;
var HOVERED = false;

var tile_size;

var grid_pos_x;
var grid_pos_y;



var explosion_type = "cross";

func _ready():
	tile_size = get_parent().tile_size;
	if(explosion_type == "cross"):
		$AnimatedSprite.play("pink");
	elif(explosion_type == "one"):
		$AnimatedSprite.play("green");

func _physics_process(delta):
	
	direction = dir.CENTER;
	if(SELECTED && MoveControl.canMove):
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
			
			get_parent().grid[grid_pos_x][grid_pos_y] = null;
			
			grid_pos_x = new_grid_pos_x;
			grid_pos_y = new_grid_pos_y;
			
			get_parent().grid[grid_pos_x][grid_pos_y] = get_parent().ENTITY_TYPES.PLAYER;
			
			position.x += direction.x * tile_size.x;
			position.y += direction.y * tile_size.y;

func self_destroy():
	if(explosion_type == "cross"):
		MoveControl.canMove = false
		Explosions.explode(explosion_type, grid_pos_x, grid_pos_y, tile_size, self);
	elif(explosion_type == "one"):
		MoveControl.canMove = false
		Explosions.explode(explosion_type, grid_pos_x, grid_pos_y, tile_size, self);
		

func die():
	get_parent().grid[grid_pos_x][grid_pos_y] = null;
	var explosion_obj = load("res://Player/Explosion.tscn").instance();
	explosion_obj.position.x = position.x;
	explosion_obj.position.y = position.y;
	explosion_obj.grid_pos_x = grid_pos_x;
	explosion_obj.grid_pos_y = grid_pos_y;
	
	get_parent().add_child(explosion_obj);
	queue_free();


func _on_Slime_mouse_entered():
	HOVERED = true;

func _on_Slime_mouse_exited():
	HOVERED = false;

func isHovered():
	return HOVERED

func _on_Slime_area_entered(area):
	if(area.OBJ_TYPE == "EXPLOSION"):
		die();
