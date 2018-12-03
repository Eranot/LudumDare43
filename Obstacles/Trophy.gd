extends Area2D

var victory_screen = preload("res://Engine/Victory.tscn");
var OBJ_TYPE = "TROPHY"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _on_Trophy_area_entered(area):
	if(area.OBJ_TYPE == "PLAYER"):
		var victory_instance = victory_screen.instance();
		get_parent().add_child(victory_instance);
		area.queue_free();
