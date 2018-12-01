	for x in range(grid_size.x):
		grid.append([]);
		for y in range(grid_size.y):
			grid[x].append(null);
			
	var positions = [];
	for n in range(5):
		var grid_pos = Vector2(randi() % int(grid_size.x), randi() % int(grid_size.y));
		print(grid_pos)
		if(not grid_pos in positions):
			positions.append(grid_pos);
	
	for pos in positions:
		var new_obstacle = obstacle.instance();
		new_obstacle.set_position(map_to_world(pos));
		
		grid[pos.x][pos.y] = ENTITY_TYPES.OBSTACLE;
		
		add_child(new_obstacle);