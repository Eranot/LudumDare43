extends Node

var size;
var pos_x;
var pos_y;

func explode(size, pos_x, pos_y, type):
	size = size;
	pos_x = pos_x;
	pos_y = pos_y;
	
	if(type == "cross"):
		cross_explosion();

func cross_explosion():
	