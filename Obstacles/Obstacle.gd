extends Area2D

var grid_pos_x;
var grid_pos_y;

const OBJ_TYPE = "OBSTACLE";

export (bool) var destructible = true;
var node_grid;

var wall_up = preload("res://Obstacles/wall_up_crackedv2.png")
var wall_side = preload("res://Obstacles/wall_side_crackedv2.png")

func _ready():
	node_grid = $"/root/Main/Grid";

func _on_Obstacle_area_entered(area):
	node_grid.grid[grid_pos_x][grid_pos_y] = null;
	queue_free();

func set_sprite(isUp):
	if(isUp):
		get_node("Sprite").set_texture(wall_up)
	else:
		get_node("Sprite").set_texture(wall_side)