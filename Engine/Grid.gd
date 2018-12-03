extends TileMap

var tile_size = self.cell_size;
var half_tile_size = self.cell_size / 2;

var grid_size = Vector2(60,60);
var grid = [];
var gridObjects = []

var screensize;

export (PackedScene) var player;
export (PackedScene) var slime;
export (PackedScene) var obstacle;
export (PackedScene) var Arrow;
export (PackedScene) var Lady;

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
	
	#add_new_object(Lady, 3, 2, ENTITY_TYPES.PLAYER);
	
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
	
	
	# ## SCENE THREE
	add_new_object(slime, 3, 16, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 3, 13, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 3, 14, ENTITY_TYPES.SLIME, false, "cross");
	
	#external
	draw_wall_line(12, 2, 7, false);
	draw_wall_line(17, 2, 7, false);
	draw_wall_column(2, 13, 16, false);
	draw_wall_column(7, 13, 16, false);
	
	#broken
	add_new_object(obstacle, 4, 15, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 5, 16, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 4, 13, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 4, 14, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 5, 15, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 6, 15, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	# ## SCENE FOUR
	add_new_object(slime, 13, 12, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 14, 12, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 14, 13, ENTITY_TYPES.SLIME, false, "cross");
	
	#external
	draw_wall_line(11, 11, 17, false);
	draw_wall_line(17, 11, 17, false);
	draw_wall_column(11, 12, 16, false);
	draw_wall_column(17, 12, 16, false);
	
	#broken
	add_new_object(obstacle, 12, 12, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 12, 13, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 12, 15, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 13, 14, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 15, 12, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 15, 13, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 16, 13, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 16, 14, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 16, 15, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 13, 13, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 13, 15, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 14, 15, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 15, 15, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 15, 14, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	# ## SCENE FIVE
	add_new_object(slime, 24, 5, ENTITY_TYPES.SLIME, false, "one");
	
	#external
	draw_wall_line(2, 23, 27, false);
	draw_wall_line(6, 23, 27, false);
	draw_wall_column(22, 2, 6, false);
	draw_wall_column(27, 2, 6, false);
	
	#broken
	add_new_object(obstacle, 25, 4, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 23, 4, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 24, 4, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 24, 3, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 26, 3, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 26, 4, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	# ## SCENE SIX
	add_new_object(slime, 25, 15, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 24, 15, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(Lady, 25, 13, ENTITY_TYPES.PLAYER);
	
	#external
	draw_wall_line(12, 23, 27, false);
	draw_wall_line(17, 23, 27, false);
	draw_wall_column(22, 12, 17, false);
	draw_wall_column(28, 12, 17, false);
	
	#broken
	add_new_object(obstacle, 26, 14, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 23, 16, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 24, 16, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 25, 16, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 23, 14, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 24, 14, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 26, 15, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 26, 13, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 27, 15, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	# ## SCENE SEVEN
	add_new_object(slime, 1, 25, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(slime, 5, 27, ENTITY_TYPES.SLIME, false, "one");
	
	#external
	draw_wall_line(22, 1, 8, false);
	draw_wall_line(28, 1, 8, false);
	draw_wall_column(0, 22, 28, false);
	draw_wall_column(9, 22, 28, false);
	
	#broken
	add_new_object(obstacle, 5, 26, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 5, 24, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 6, 25, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 7, 25, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 1, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 2, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 3, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 4, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 6, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 7, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 8, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	#
	add_new_object(obstacle, 1, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 2, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 4, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 6, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 7, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 8, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	#
	add_new_object(obstacle, 3, 23, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 4, 23, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 6, 23, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	
	# ## SCENE EIGHT
	add_new_object(slime, 33, 3, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 33, 4, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 33, 6, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(slime, 34, 5, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(slime, 35, 6, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(Lady, 34, 4, ENTITY_TYPES.PLAYER);
	add_new_object(Lady, 36, 3, ENTITY_TYPES.PLAYER);
	
	#external
	draw_wall_line(2, 33, 37, false);
	draw_wall_line(7, 33, 37, false);
	draw_wall_column(32, 2, 7, false);
	draw_wall_column(38, 2, 7, false);
	
	#broken
	add_new_object(obstacle, 34, 3, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 35, 5, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 36, 6, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 33, 5, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 36, 4, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 36, 5, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 37, 3, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	# ## SCENE NINE
	add_new_object(slime, 11, 27, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(slime, 16, 23, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(slime, 12, 27, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(Lady, 16, 24, ENTITY_TYPES.PLAYER);
	
	#external
	draw_wall_line(22, 11, 18, false);
	draw_wall_line(28, 11, 18, false);
	draw_wall_column(10, 22, 28, false);
	draw_wall_column(19, 22, 28, false);
	
	#broken
	add_new_object(obstacle, 12, 23, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 13, 27, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 13, 24, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 14, 26, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 17, 23, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 11, 23, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 11, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 11, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 12, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 12, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 13, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 14, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 14, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	#
	add_new_object(obstacle, 16, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 16, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 16, 27, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 17, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 17, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	# ## SCENE TEN
	add_new_object(slime, 25, 28, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(slime, 16, 23, ENTITY_TYPES.SLIME, false, "cross");
	add_new_object(slime, 23, 22, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(slime, 23, 28, ENTITY_TYPES.SLIME, false, "one");
	add_new_object(Lady, 27, 25, ENTITY_TYPES.PLAYER);
	
	#external
	draw_wall_line(21, 21, 29, false);
	draw_wall_line(29, 21, 29, false);
	draw_wall_column(20, 21, 29, false);
	draw_wall_column(30, 21, 29, false);
	
	#broken
	add_new_object(obstacle, 23, 23, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 24, 24, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 27, 26, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 27, 28, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	add_new_object(obstacle, 28, 26, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 28, 28, ENTITY_TYPES.OBSTACLE, null, null, true);
	add_new_object(obstacle, 29, 28, ENTITY_TYPES.OBSTACLE, null, null, true);
	
	#
	add_new_object(obstacle, 21, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 21, 27, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	add_new_object(obstacle, 22, 22, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 22, 23, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 22, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 22, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 22, 27, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 22, 28, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	add_new_object(obstacle, 24, 22, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 24, 23, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 24, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 24, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 24, 27, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	add_new_object(obstacle, 25, 23, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 25, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 25, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	add_new_object(obstacle, 26, 24, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 26, 26, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 26, 28, ENTITY_TYPES.OBSTACLE, null, null, false);
	
	add_new_object(obstacle, 28, 25, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 28, 27, ENTITY_TYPES.OBSTACLE, null, null, false);
	add_new_object(obstacle, 29, 25, ENTITY_TYPES.OBSTACLE, null, null, false);


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