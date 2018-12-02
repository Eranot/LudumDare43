extends Node

var explosion_obj = preload("res://Player/Explosion.tscn");
var choose_obj = preload("res://Player/SelectArea.tscn")

var half_tile_size;

var new_instance;

var one_explosion_list = []

var current_slime

func _process(delta):
	if(one_explosion_list.size() > 0):
		if(Input.is_action_just_pressed("ui_mouse_right")):
			clear_one_explosion(false)
			MoveControl.canMove = true

func explode(type, grid_pos_x, grid_pos_y, tile_size, slime = null):
	half_tile_size = tile_size / 2;
	current_slime = slime
	
	if(type == "cross"):
		cross_explosion(grid_pos_x, grid_pos_y, tile_size, half_tile_size);
	elif(type == "one"):
		one_explosion(grid_pos_x, grid_pos_y, tile_size, half_tile_size)

func cross_explosion(pos_x, pos_y, tile_size, half_tile_size):
	add_choosing_obj(pos_x+1, pos_y, tile_size, half_tile_size, "cross")
	add_choosing_obj(pos_x-1, pos_y, tile_size, half_tile_size, "cross")
	add_choosing_obj(pos_x, pos_y+1, tile_size, half_tile_size, "cross")
	add_choosing_obj(pos_x, pos_y-1, tile_size, half_tile_size, "cross")

func add_choosing_obj(pos_x, pos_y, tile_size, half_tile_size, type = "one"):
	var new_instance = choose_obj.instance();
	new_instance.explosion_type = type
	new_instance.position = Vector2((pos_x) * tile_size.x + half_tile_size.x, pos_y * tile_size.y + half_tile_size.y);
	new_instance.grid_pos_x = pos_x;
	new_instance.grid_pos_y = pos_y;
	add_child(new_instance);
	
	one_explosion_list.append(new_instance)

func one_explosion(pos_x, pos_y, tile_size, half_tile_size):
	
	add_choosing_obj(pos_x+1, pos_y, tile_size, half_tile_size)
	add_choosing_obj(pos_x-1, pos_y, tile_size, half_tile_size)
	add_choosing_obj(pos_x, pos_y+1, tile_size, half_tile_size)
	add_choosing_obj(pos_x, pos_y-1, tile_size, half_tile_size)
	
	
func clear_one_explosion(shouldDie = true):
	for obj in one_explosion_list:
		obj.queue_free()
	one_explosion_list.clear()
	if(shouldDie):
		current_slime.die()

func explode_all():
	for obj in one_explosion_list:
		obj.explode()
	#one_explosion_list.clear()
	
func select_all(selected):
	for obj in one_explosion_list:
		obj.set_selected(selected)

