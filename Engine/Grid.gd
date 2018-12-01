extends TileMap

var tile_size = self.cell_size;
var half_tile_size = self.cell_size / 2;

var grid_size = Vector2(10,10);
var grid = [];

var screensize;

export (PackedScene) var player;
export (PackedScene) var obstacle;

enum ENTITY_TYPES{
	PLAYER,
	OBSTACLE,
	COLLECTIBLE
}


func _ready():
	screensize = get_viewport_rect().size;
	
	for x in range(grid_size.x):
		grid.append([]);
		for y in range(grid_size.y):
			grid[x].append(null);
	
	add_new_object(player, 1, 1, ENTITY_TYPES.PLAYER);
	add_new_object(obstacle, 3, 3, ENTITY_TYPES.OBSTACLE);


func _draw():
	for x in range(grid_size.x):
		draw_line(Vector2(0, x * tile_size.x), Vector2(screensize.x, x * tile_size.x), Color(255,0,0));
	
	for y in range(grid_size.y):
		draw_line(Vector2(y * tile_size.y, 0), Vector2(y * tile_size.y, screensize.y), Color(255,0,0))


func add_new_object(new_object, pos_x, pos_y, type):
	if(cell_exists(pos_x,pos_y)):
		if(cell_is_empty(pos_x,pos_y)):
			var new_instance = new_object.instance();
			new_instance.position = Vector2(pos_x * tile_size.x + half_tile_size.x, pos_y * tile_size.y + half_tile_size.y);
			grid[pos_x][pos_y] = type;
			call_deferred("add_child", new_instance);
			new_instance.grid_pos_x = pos_x;
			new_instance.grid_pos_y = pos_y;

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