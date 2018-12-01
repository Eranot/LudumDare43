extends Node

var explosion_obj = preload("res://Player/Explosion.tscn");

#var pos_x;
#var pos_y;
#var tile_size;
var half_tile_size;

var new_instance;

func explode(type, grid_pos_x, grid_pos_y, tile_size):
	
	#pos_x = grid_pos_x;
	#pos_y = grid_pos_y;
	#tile_size = Vector2(tile_size.x, tile_size.y);
	#print(tile_size)
	half_tile_size = tile_size / 2;
	
	if(type == "cross"):
		cross_explosion(grid_pos_x, grid_pos_y, tile_size, half_tile_size);

func cross_explosion(pos_x, pos_y, tile_size, half_tile_size):
	new_instance = explosion_obj.instance();
	new_instance.position = Vector2((pos_x + 1) * tile_size.x + half_tile_size.x, pos_y * tile_size.y + half_tile_size.y);
	new_instance.grid_pos_x = pos_x;
	new_instance.grid_pos_y = pos_y;
	add_child(new_instance);
	
	new_instance = explosion_obj.instance();
	new_instance.position = Vector2((pos_x - 1) * tile_size.x + half_tile_size.x, pos_y * tile_size.y + half_tile_size.y);
	new_instance.grid_pos_x = pos_x;
	new_instance.grid_pos_y = pos_y;
	add_child(new_instance);
	
	new_instance = explosion_obj.instance();
	new_instance.position = Vector2(pos_x * tile_size.x + half_tile_size.x, (pos_y + 1) * tile_size.y + half_tile_size.y);
	new_instance.grid_pos_x = pos_x;
	new_instance.grid_pos_y = pos_y;
	add_child(new_instance);
	
	new_instance = explosion_obj.instance();
	new_instance.position = Vector2(pos_x * tile_size.x + half_tile_size.x, (pos_y - 1) * tile_size.y + half_tile_size.y);
	new_instance.grid_pos_x = pos_x;
	new_instance.grid_pos_y = pos_y;
	add_child(new_instance);
	