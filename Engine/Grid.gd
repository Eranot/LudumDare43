extends TileMap

var tile_size = self.cell_size;
var half_tile_size = self.cell_size / 2;

var grid_size = Vector2(20,10);
var grid = [];
var gridObjects = []

var screensize;

export (PackedScene) var player;
export (PackedScene) var slime;
export (PackedScene) var obstacle;
export (PackedScene) var Arrow;

enum ENTITY_TYPES{
	PLAYER,
	SLIME,
	OBSTACLE,
	COLLECTIBLE
}

var arrow = null
var allObjects = []
var allObstacles = []
var selected = null

func _ready():
	screensize = get_viewport_rect().size;
	
	for x in range(grid_size.x):
		grid.append([]);
		gridObjects.append([])
		for y in range(grid_size.y):
			grid[x].append(null);
			gridObjects[x].append(null);
	
	arrow = Arrow.instance()
	arrow.position = Vector2(-64, -64)
	arrow.z_index = 10
	call_deferred("add_child", arrow);
	
	# add_new_object(player, 3, 5, ENTITY_TYPES.PLAYER, true); #player
	# add_new_object(slime, 1, 2, ENTITY_TYPES.SLIME, false, "one"); # slime one
	# add_new_object(slime, 2, 2, ENTITY_TYPES.SLIME, false, "cross"); #slime cross
	# add_new_object(obstacle, 3, 3, ENTITY_TYPES.OBSTACLE, null, null, true); #parede quebrada
	# add_new_object(obstacle, 3, 3, ENTITY_TYPES.OBSTACLE, null, null, false); #parede normal
	
	
	# ## SCENE ONE
	add_new_object(player, 3, 5, ENTITY_TYPES.PLAYER, true);
	add_new_object(slime, 3, 4, ENTITY_TYPES.SLIME, false, "one");
	
	#external
	draw_wall_line(1, 2, 7, false);
	draw_wall_line(6, 3, 7, false);
	
	draw_wall_column(7, 2, 6, false);
	draw_wall_column(2, 2, 6, false);
	
	#internal
	draw_wall_column(4, 3, 5, false);
	draw_wall_line(3, 5, 6, false);
	
	#broken
	draw_wall_column(5, 2, 2, true);
	
	# ## SCENE TWO
	add_new_object(slime, 13, 4, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 13, 5, ENTITY_TYPES.SLIME, false, "cross");
	
	#external
	draw_wall_line(2, 13, 17, false);
	draw_wall_line(7, 13, 17, false);
	draw_wall_line(3, 14, 15, false);
	draw_wall_column(12, 2, 7, false);
	draw_wall_column(17, 2, 6, false);
	
	#broken
	add_new_object(obstacle, 14, 4, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 15, 5, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 15, 4, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	#add_new_object(obstacle, 15, 6, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 16, 5, ENTITY_TYPES.OBSTACLE, null, null, false);
	#add_new_object(obstacle, 16, 6, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 14, 6, ENTITY_TYPES.OBSTACLE, null, null, false);
	

func draw_wall_column(x, y1, y2, broken):
	for y in range(y1, y2+1):
		add_new_object(obstacle, x, y, ENTITY_TYPES.OBSTACLE, null, null, broken);


func draw_wall_line(y, x1, x2, broken):
	for x in range(x1, x2+1):
		add_new_object(obstacle, x, y, ENTITY_TYPES.OBSTACLE, null, null, broken);

func _draw():
	for x in range(grid_size.x):
		draw_line(Vector2(0, x * tile_size.x), Vector2(screensize.x, x * tile_size.x), Color(255,0,0));
	
	for y in range(grid_size.y):
		draw_line(Vector2(y * tile_size.y, 0), Vector2(y * tile_size.y, screensize.y), Color(255,0,0))
		

func _process(delta):
	if(Input.is_action_just_pressed("ui_mouse_left") and MoveControl.canMove):
		for obj in allObjects:
			var r = weakref(obj)
			if(r.get_ref()):
				if obj.isHovered():
					selectObject(obj)
			else:
				allObjects.erase(obj)
	elif(Input.is_action_just_pressed("ui_mouse_left") and !MoveControl.canMove):
		print("n deu")
		
	for obj in allObstacles:
		if(weakref(obj[0]).get_ref()):
			obj[0].set_sprite(grid[obj[1].x][obj[1].y+1] == ENTITY_TYPES.OBSTACLE)
		else:
			allObstacles.erase(obj)
	
	setup_arrow()

func setup_arrow():
	if(selected != null):
		var r = weakref(selected)
		if(r.get_ref()):
			arrow.position = Vector2(r.get_ref().position.x, r.get_ref().position.y - tile_size.y + 10)
		else:
			selected = null
			arrow.position = Vector2(-64, -64)

func add_new_object(new_object, pos_x, pos_y, type, startAsSelected = false, slime_explosion_type = "one", destructible = false):
	if(cell_exists(pos_x,pos_y)):
		if(cell_is_empty(pos_x,pos_y)):
			var new_instance = new_object.instance()
			new_instance.position = Vector2(pos_x * tile_size.x + half_tile_size.x, pos_y * tile_size.y + half_tile_size.y);
			grid[pos_x][pos_y] = type;
			gridObjects[pos_x][pos_y] = new_instance;
			call_deferred("add_child", new_instance);
			new_instance.grid_pos_x = pos_x;
			new_instance.grid_pos_y = pos_y;
			if(type == ENTITY_TYPES.PLAYER or type == ENTITY_TYPES.SLIME):
				allObjects.append(new_instance)
			elif(type == ENTITY_TYPES.OBSTACLE):
				allObstacles.append([new_instance, Vector2(pos_x, pos_y)])
				new_instance.destructible = destructible;
			if(type == ENTITY_TYPES.SLIME):
				new_instance.explosion_type = slime_explosion_type
				
			if(startAsSelected):
				selectObject(new_instance)

func selectObject(object):
	for obj in allObjects:
		if(weakref(obj).get_ref()):
			obj.SELECTED = object == obj
			if(obj.SELECTED):
				selected = obj
				
		else:
			allObjects.erase(obj)

func cell_is_empty(pos_x, pos_y):
	if(grid[pos_x][pos_y] == null):
		return true;
	else:
		return false;

func cell_exists(pos_x, pos_y):
	if(pos_x >= 0 && pos_x < grid_size.x && pos_y >= 0 && pos_y < grid_size.y):
		return true;
	else:
		return false;
		
func destroy(x, y):
	if(gridObjects[x][y] != null):
		var o = weakref(gridObjects[x][y])
		if(o.get_ref()):
			if(gridObjects[x][y].has_method("self_destroy")):
				if(gridObjects[x][y].OBJ_TYPE == "OBSTACLE" && gridObjects[x][y].destructible == false):
					pass
				else:
					gridObjects[x][y].self_destroy()
		else:
			gridObjects[x][y] = null