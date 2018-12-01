extends Node2D

var grid_pos_x;
var grid_pos_y;

var timer_destroy = 0;

func _ready():
	print(grid_pos_x);
	print(grid_pos_y);
	
	print(get_node("Grid").grid);

func _physics_process(delta):
	if(timer_destroy >= 60):
		queue_free();
	
	timer_destroy += 1;
