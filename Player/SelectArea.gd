extends Area2D

var grid_pos_x;
var grid_pos_y;
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var mouse_over = false

func _ready():
	z_index = 5;
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print("apareci")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if(event is InputEventMouseButton and event.is_pressed() && mouse_over):
		get_parent().clear_one_explosion()



func _on_Area2D_mouse_entered():
	mouse_over = true


func _on_Area2D_mouse_exited():
	mouse_over = false
