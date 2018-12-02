extends Camera2D

func _ready():
	pass

func _process(delta):
	if($"/root/Main/Grid/Player"):
		var pos_x = floor($"/root/Main/Grid/Player".grid_pos_x / 10 * 640);
		var pos_y = floor($"/root/Main/Grid/Player".grid_pos_y / 10 * 640);
		
		global_position = Vector2(pos_x,pos_y);
	else:
		global_position = Vector2(0, 0);