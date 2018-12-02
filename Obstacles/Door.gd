extends Area2D

export (int) var new_pos_x = 0;
export (int) var new_pos_y = 0;
export (bool) var destroy_slime = false;

const OBJ_TYPE = "DOOR";

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _on_Door_area_entered(area):
	if(area.OBJ_TYPE == "PLAYER"):
		area.position.x = new_pos_x;
		area.position.y = new_pos_y;
	elif(area.OBJ_TYPE == "SLIME"):
		if(destroy_slime):
			$"/root/Main/Grid".grid[area.grid_pos_x][area.grid_pos_y] = null;
			area.queue_free();
		else:
			area.position.x = new_pos_x;
			area.position.y = new_pos_y;