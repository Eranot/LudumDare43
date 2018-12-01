extends Node2D

var explosion_obj = preload("res://Player/Explosion.tscn");

func explode(type):
	if(type == "cross"):
		cross_explosion();

func cross_explosion():
	print("entered here")
	var new_instance = explosion_obj.instance();
	new_instance.position = Vector2(300,300)
	self.add_child(new_instance);
	