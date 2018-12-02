extends Area2D

var OBJ_TYPE = "KEY";

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Key_area_entered(area):
	if(area.OBJ_TYPE == "PLAYER"):
		area.hold_key = true;
		queue_free();
