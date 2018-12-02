extends Camera2D

func _ready():
	#$area.connect("body_entered", self, "body_entered");
	#$area.connect("body_exited", self, "body_exited");
	pass

func _process(delta):
	#print($"/root/Main/Grid/Player")
	#var pos = get_node("../Player").global_position - Vector2(0,16);
	var pos_x = floor($"/root/Main/Grid/Player".grid_pos_x / 10 * 640);
	var pos_y = floor($"/root/Main/Grid/Player".grid_pos_y / 10 * 640);
	#var x = floor(pos.x / 640) * 640;
	#var y = floor(pos.y / 640) * 640;
	
	#print(pos_x)
	#print(pos_y)
	print(position)
	
	global_position = Vector2(pos_x,pos_y);

func body_entered(body):
	if(body.get("TYPE") == "ENEMY"):
		body.set_physics_process(true);

func body_exited(body):
	if(body.get("TYPE") == "ENEMY"):
		body.set_physics_process(false);