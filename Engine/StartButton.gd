extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _on_StartButton_pressed():
	get_tree().change_scene("res://Engine/Main.tscn")
