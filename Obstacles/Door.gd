extends Area2D

export (int) var new_pos_x;
export (int) var new_pos_y;
export (bool) var destroy_slime;
export (bool) var need_key;

const OBJ_TYPE = "DOOR";

func _ready():
	z_index = 0;
	if(new_pos_x == null):
		new_pos_x = -1;
	if(new_pos_y == null):
		new_pos_y = -1;
	if(destroy_slime == null):
		destroy_slime = true;

func _on_Door_area_entered(area):
	var node_grid = $"/root/Main/Grid";
	if(area.OBJ_TYPE == "PLAYER"):
		if(area.hold_key == true || need_key == false):
			if(node_grid.cell_exists(new_pos_x,new_pos_y)):
				if(node_grid.cell_is_empty(new_pos_x,new_pos_y)):
					node_grid.grid[area.grid_pos_x][area.grid_pos_y] = null;
					area.grid_pos_x = new_pos_x;
					area.grid_pos_y = new_pos_y;
					area.position.x = new_pos_x * node_grid.tile_size.x + node_grid.half_tile_size.x;
					area.position.y = new_pos_y * node_grid.tile_size.y + node_grid.half_tile_size.y;
					node_grid.grid[new_pos_x][new_pos_y] = node_grid.ENTITY_TYPES.PLAYER;
					if(need_key):
						area.hold_key = false;
	elif(area.OBJ_TYPE == "SLIME"):
		if(destroy_slime):
			node_grid.grid[area.grid_pos_x][area.grid_pos_y] = null;
			area.queue_free();
		else:
			if(node_grid.cell_exists(new_pos_x,new_pos_y)):
				if(node_grid.cell_is_empty(new_pos_x,new_pos_y)):
					node_grid.grid[area.grid_pos_x][area.grid_pos_y] = null;
					area.grid_pos_x = new_pos_x;
					area.grid_pos_y = new_pos_y;
					area.position.x = new_pos_x * node_grid.tile_size.x + node_grid.half_tile_size.x;
					area.position.y = new_pos_y * node_grid.tile_size.y + node_grid.half_tile_size.y;
					node_grid.grid[new_pos_x][new_pos_y] = node_grid.ENTITY_TYPES.SLIME;