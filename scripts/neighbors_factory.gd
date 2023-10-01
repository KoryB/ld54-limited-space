class_name NeighborsFactory


static func create(target, guests_at_table: Array) -> Neighbors:
	var target_index = -1
	var neighbors = Neighbors.new()
	var num_guests = guests_at_table.size()
	
	for i in range(num_guests):
		if target == guests_at_table[i]:
			target_index = i
			
	if target_index == -1:
		return null
		
	for i in range(1, num_guests):
		neighbors.all.append(guests_at_table[(target_index + i) % num_guests])
		
	return neighbors
