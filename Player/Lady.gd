extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var SELECTED = false;
var HOVERED = false;

var grid_pos_x;
var grid_pos_y;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func isHovered():
	return HOVERED

func _on_Lady_area_entered(area):
	if(area.OBJ_TYPE == "EXPLOSION"):
		get_parent().grid[grid_pos_x][grid_pos_y] = null;
		$"/root/Main/HUD/PanelRestart".visible = true;
		queue_free();
