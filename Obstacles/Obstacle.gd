extends Area2D

var grid_pos_x;
var grid_pos_y;

const OBJ_TYPE = "OBSTACLE";

var destructible;
var node_grid;

var wall_up_cracked = preload("res://Obstacles/wall_up_crackedv2.png")
var wall_side_cracked = preload("res://Obstacles/wall_side_crackedv2.png")


var wall_up = preload("res://Obstacles/wall_upv2.png")
var wall_side = preload("res://Obstacles/wall_sidev2.png")

func _ready():
	node_grid = $"/root/Main/Grid";

func _on_Obstacle_area_entered(area):
	#node_grid.grid[grid_pos_x][grid_pos_y] = null;
	#queue_free();
	pass

func self_destroy():
	if(destructible):
		node_grid.grid[grid_pos_x][grid_pos_y] = null;
		node_grid.gridObjects[grid_pos_x][grid_pos_y] = null;
		queue_free();

func set_sprite(isUp):
	if(isUp):
		if(destructible):
			get_node("Sprite").set_texture(wall_up_cracked)
		else:
			get_node("Sprite").set_texture(wall_up)
	else:
		if(destructible):
			get_node("Sprite").set_texture(wall_side_cracked)
		else:
			get_node("Sprite").set_texture(wall_side)