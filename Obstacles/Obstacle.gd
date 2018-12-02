extends Area2D

var grid_pos_x;
var grid_pos_y;

const OBJ_TYPE = "OBSTACLE";

export (bool) var destructible = true;
var node_grid;

func _ready():
	node_grid = $"/root/Main/Grid";

func _on_Obstacle_area_entered(area):
	node_grid.grid[grid_pos_x][grid_pos_y] = null;
	queue_free();
