extends YSort


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var collision_pos = []
	
func _process(delta):
	var cpos = $TileMap3.world_to_map($player.position)
	print(cpos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



