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
	add_new_object(obstacle, 5, 5, ENTITY_TYPES.PLAYER);


func _draw():
	for x in range(grid_size.x):
		draw_line(Vector2(0, x * tile_size.x), Vector2(screensize.x, x * tile_size.x), Color(255,0,0));
	
	for y in range(grid_size.y):
		draw_line(Vector2(y * tile_size.y, 0), Vector2(y * tile_size.y, screensize.y), Color(255,0,0))


func add_new_object(new_object, pos_x, pos_y, type):
	if(grid[pos_x][pos_y] == null):
		var new_instance = new_object.instance();
		new_instance.position = Vector2(pos_x * tile_size.x + half_tile_size.x, pos_y * tile_size.y + half_tile_size.y);
		grid[pos_x][pos_y] = type;
		add_child(new_instance);
		new_instance.call("print_test");
		#print(new_instance);
		#get_children()[get_child_count()-1].print_test();

