extends Area2D

var grid_pos_x;
var grid_pos_y;
var explosion_obj = preload("res://Player/Explosion.tscn");

var mouse_over = false

func _ready():
	z_index = 5;
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print("apareci")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if(event is InputEventMouseButton and event.is_pressed() && mouse_over):
		var node_grid = $"/root/Main/Grid";
		#node_grid.destroy(grid_pos_x, grid_pos_y)
		var tile_size = Vector2(64, 64)
		var half_tile_size = Vector2(32, 32)
		
		var new_instance = explosion_obj.instance();
		new_instance.position = Vector2((grid_pos_x) * tile_size.x + half_tile_size.x, grid_pos_y * tile_size.y + half_tile_size.y);
		new_instance.grid_pos_x = grid_pos_x;
		new_instance.grid_pos_y = grid_pos_y;
		add_child(new_instance);
		
		get_parent().clear_one_explosion()



func _on_Area2D_mouse_entered():
	mouse_over = true


func _on_Area2D_mouse_exited():
	mouse_over = false
