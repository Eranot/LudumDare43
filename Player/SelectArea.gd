extends Area2D

var grid_pos_x;
var grid_pos_y;
var explosion_obj = preload("res://Player/Explosion.tscn");

var mouse_over = false

var OBJ_TYPE = "SELECTAREA"

var explosion_type = "one"

func _ready():
	z_index = 5;
	# Called when the node is added to the scene for the first time.
	# Initialization here

func _process(delta):
	if(Input.is_action_just_pressed("ui_mouse_left") and mouse_over):
		if(explosion_type == "cross"):
			get_parent().explode_all()
		else:
			explode()
		get_parent().clear_one_explosion()

func explode():
	var node_grid = $"/root/Main/Grid";
	#node_grid.destroy(grid_pos_x, grid_pos_y)
	var tile_size = Vector2(64, 64)
	var half_tile_size = Vector2(32, 32)
	
	var new_instance = explosion_obj.instance();
	new_instance.position = Vector2((grid_pos_x) * tile_size.x + half_tile_size.x, grid_pos_y * tile_size.y + half_tile_size.y);
	new_instance.grid_pos_x = grid_pos_x;
	new_instance.grid_pos_y = grid_pos_y;
	get_parent().add_child(new_instance);
	
	MoveControl.canMove = true

func _on_Area2D_mouse_entered():
	mouse_over = true
	set_selected(true)
	if(explosion_type == "cross"):
		get_parent().select_all(true)

func _on_Area2D_mouse_exited():
	mouse_over = false
	set_selected(false)
	if(explosion_type == "cross"):
		get_parent().select_all(false)

func set_selected(selected):
	if(selected):
		$Sprite.modulate.a = 0.8
	else:
		$Sprite.modulate.a = 0.4
