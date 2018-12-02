extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	visible = false;
	global_position = Vector2(32,32)

func _process(delta):
	if(get_parent().get_parent().hold_key):
		visible = true;
	else:
		visible = false;