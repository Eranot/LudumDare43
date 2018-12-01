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
	
	add_new_object(player, 64, 64, ENTITY_TYPES.PLAYER);


func _draw():
	for x in range(grid_size.x):
		draw_line(Vector2(0, x * tile_size.x), Vector2(screensize.x, x * tile_size.x), Color(255,0,0));
	
	for y in range(grid_size.y):
		draw_line(Vector2(y * tile_size.y, 0), Vector2(y * tile_size.y, screensize.y), Color(255,0,0))


func add_new_object(new_object, pos_x, pos_y, type):
	var new_instance = new_object.instance();
	new_instance.position.x = pos_x - half_tile_size.x;
	new_instance.position.y = pos_y - half_tile_size.y;
	add_child(new_instance);


