extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	visible = false;

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_ButtonConfirm_pressed():
	get_tree().change_scene("res://Engine/Main.tscn")


func _on_ButtonCancel_pressed():
	visible = false;
