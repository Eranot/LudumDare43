extends Area2D

var grid_pos_x;
var grid_pos_y;

var timer_destroy = 0;
var node_grid;

const OBJ_TYPE = "EXPLOSION";

func _ready():
	z_index = 5;
	node_grid = $"/root/Main/Grid";
	
	if(node_grid.cell_exists(grid_pos_x, grid_pos_y)):
		if(!node_grid.cell_is_empty(grid_pos_x, grid_pos_y)):
			if(node_grid.grid[grid_pos_x][grid_pos_y] == node_grid.ENTITY_TYPES.OBSTACLE):
				node_grid.grid[grid_pos_x][grid_pos_y] = null;

func _physics_process(delta):
	if(timer_destroy >= 20):
		queue_free();
	
	timer_destroy += 1;

