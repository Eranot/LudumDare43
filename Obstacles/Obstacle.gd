extends Area2D

var grid_pos_x;
var grid_pos_y;

const OBJ_TYPE = "OBSTACLE";

export (bool) var destructible = false;

func _ready():
	pass

func _on_Obstacle_area_entered(area):
	queue_free();
